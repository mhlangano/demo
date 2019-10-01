({
    doInit : function(component, event) {
        var recordId = component.get("v.recordId");
        if(recordId !== undefined || recordId !== null){
            var action = component.get("c.findById");
            action.setParams({
              "recordId": recordId
            });        
            action.setCallback(this, function(a) {
                component.set("v.contact", a.getReturnValue());
                component.set("v.selectedLookUpRecord", a.getReturnValue()); 
                var test = "";
            });
            $A.enqueueAction(action); 
        }
    } ,
	test : function(component, event) {
        var selectedLookUpRecord = component.get("v.selectedLookUpRecord");

            alert(selectedLookUpRecord.Name);
     
    },
})