var TriState = {
  images: {
    '1': '/images/icons/accept.png', 
    '0': '/images/icons/cancel.png', 
    '': '/images/icons/question_mark.png'
  },
  
  transitions: {
    "1": "0",
    "0": "",
    "": "1"
  },
  
  init : function(id){
    var element = $(id);
    var link_id = id + "_link";
    
    Element.replace(id, '<input type="hidden" id="' + id + '" name="' + element.name + '" value="' + element.value + '"/>');
    Element.insert(id, {after : 
                    '<img id="' + link_id + '" src="' + this.images[element.value] + '" class="tri_state" />'
                   });
    
    $(id).onclick = function(){
      TriState.toggle(id, link_id);
    }
    $(link_id).onclick = $(id).onclick;
  },
  
  toggle : function(id, link_id){
    var newState = this.transitions[$(id).value];
    $(id).value = newState;    
    $(link_id).src = this.images[newState];
  }
}
