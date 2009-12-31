# usage: include in custom form builder
#   f.tri_state :some_field
# 
# field needs to be :integer
# TODO
# * izbaciti collection i staviti hidden field 
# * probati na jedno mjesto staviti putanje do slika
module TriState
  # TODO nisam siguran da li bas ovako, nece raditi normalna verzija, bez f.tri_state
  def tri_state(method, options = {}, checked_value = "1", unchecked_value = "0")
    require 'ostruct'
    collection = [
      OpenStruct.new(:value => 1, :text => 'true'),
      OpenStruct.new(:value => 0, :text => 'false')      
    ]
    
    options.merge!({:include_blank => true})
    
    arr = ""
    arr << collection_select(method, collection, :value, :text, options, 
                              {:style => 'display: none;', :onclick => tri_state_onclick(method)})
    arr << tri_state_link(method)
  end
  
  def tri_state_link(method)
    value = self.object.send(method)
    
    state_image = 'question_mark' if value.nil?
    state_image = 'cancel' if value==0
    state_image = 'accept' if value==1
    
    @template.image_tag("/images/icons/#{state_image}.png", 
                        :onclick => tri_state_onclick(method),
                        :id => "#{self.object_name}_#{method}_tri_state", 
                        :class => 'tri_state_link')
  end
  
  def tri_state_onclick(method)
    "TriState.toggle('#{self.object_name}_#{method}')"
  end
end
