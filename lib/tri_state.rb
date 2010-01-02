module TriState
  def tri_state(method, options = {})    
    id = "#{self.object_name}_#{method}"
    options.merge!({:include_blank => true})
    
    arr = select(method, {:true => 1, :false => 0}, options, {:id => id})
    
    arr << @template.javascript_tag("TriState.init('#{id}')")
  end
end
