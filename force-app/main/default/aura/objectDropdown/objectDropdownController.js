({
    myAction : function(component, event, helper) {

    },
    doInit  : function(component, event, helper) {
		var action = component.get("c.getItems");
        action.setCallback(this, function(response){
            var state = response.getState();
           
            if ( state === "SUCCESS") {
           
               
                component.set("v.options", response.getReturnValue());
                 
            }
        });
        
        $A.enqueueAction(action);
	},
    handleSelection: function(component,event,helper){
        var selectedOption=component.find("dropdown").get("v.value");
        var action=component.get("c.getObjectField");
        action.setParams({
            "objectName": selectedOption,
        });
        action.setCallback(this,function(response){
            let state=response.getState();
            if(state==="SUCCESS"){
                let allFieldsValues=response.getReturnValue();
                let fieldMap=[];
                for(let i=0;i<allFieldsValues.length;i++){
                    fieldMap.push({
                        label:allFieldsValues[i],
                        value:allFieldsValues[i]
                    });
                }
                component.set("v.dualOptions",fieldMap);
            }
        });
        $A.enqueueAction(action);
    },
    getQuery: function(component,event,helper){
        var selectedOption=component.find("dropdown").get("v.value");
        let queryText="SELECT ";
        var selectedValues=component.get("v.selectedFields");
        for(var i=0;i<selectedValues.length;i++){
            if(i==selectedValues.length-1){
                queryText+=selectedValues[i];
                break;
            }
            queryText+=selectedValues[i]+", ";
        }
        queryText+=" FROM "+selectedOption;
        component.set("v.queryBoxText",queryText);
    },
   
    // getResult: function (component,event,helper) {
      
    //     var selectedOption=component.find("dropdown").get("v.value");
    //     var fld = component.find('fieldsValue').get('v.value');
    //     var action=component.get("c.getFieldRecords");
        
    //     action.setParams({"objectName": selectedOption, "fields":fld});
    //     action.setCallback(this, function(response) {
    //         var state = response.getState();
    //         if (state === "SUCCESS") {           
    //             var allValues = response.getReturnValue();
    //             console.log(allValues);
    //             component.set("v.data", allValues);
                
    //         }                    
    //         else if (state === "ERROR") {
    //             var errors = response.getError();
    //             if (errors) {
    //                 if (errors[0] && errors[0].message) {
    //                     console.log("Error message: " + 
    //                                 errors[0].message);
    //                 }
    //             } 
    //             else {
    //                 console.log("Unknown Error");
    //             }
    //         }
    //     });
    //     $A.enqueueAction(action);     
    // },

    getResult: function (component,event,helper) {
      
        var selectedOption=component.find("dropdown").get("v.value");
        var query=component.find("queryTxt").get("v.value");
        var fld = component.find('fieldsValue').get('v.value');
        var action=component.get("c.getFieldRecords");
        
        action.setParams({"query": query, "selectedValues":fld});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {           
                var allValues = response.getReturnValue();
                console.log(allValues);
                component.set("v.data", allValues);
                
            }                    
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                    errors[0].message);
                    }
                } 
                else {
                    console.log("Unknown Error");
                }
            }
        });
        $A.enqueueAction(action);     
    },

   
   
   
})
