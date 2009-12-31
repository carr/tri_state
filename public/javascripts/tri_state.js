var TriState = {
  toggle : function(id){
    cycle = ["1", "0", ""];
    value = $F(id);
    
    if(value.blank()){
      newState = "1";
    }else{
      if(value == '1'){
        newState = "0";
      }else{
        newState = '';
      }
    }
    
    // TODO Izbaciti collection i staviti hidden field
    Select.setByValue(id, newState);
    
    images = {'1': 'accept', '0': 'cancel', '': 'question_mark'}
    
    link = $(id + "_tri_state")
    link.src = '/images/icons/' + images[newState] + ".png"
  }
}
