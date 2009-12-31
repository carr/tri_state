namespace :tri_state do
  desc "Update tristate javascript, css and image files" 
  task :update_assets do |t| 
    tristate_dir = File.join(File.expand_path(File.dirname(__FILE__)), '..')
    root_dir = File.join(tristate_dir, '..', '..', '..')
    
    puts "Copying tri_state.js"
    FileUtils.copy File.join(tristate_dir, 'public', 'javascripts', 'tri_state.js'), 
              File.join(root_dir, 'public', 'javascripts', 'tri_state.js')
              
    puts "Copying tri_state.css"              
    FileUtils.copy File.join(tristate_dir, 'public', 'stylesheets', 'tri_state.css'), 
              File.join(root_dir, 'public', 'stylesheets', 'tri_state.css')
    
    puts "Copying images/icons"    
    FileUtils.mkdir_p File.join(root_dir, 'public', 'images', 'icons')
    
    for image in %w(accept cancel question_mark)
      FileUtils.cp File.join(tristate_dir, 'public', 'images', 'icons', 'accept.png'), 
                   File.join(root_dir, 'public', 'images', 'icons')
    end

    puts "Updated tri_state assets." 
  end  
end
