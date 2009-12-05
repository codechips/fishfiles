function current_git_branch
  sh -c 'git branch --no-color 2> /dev/null' |   sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
end
 
function git_dirty
  not git diff HEAD --quiet ^/dev/null
end
 
function parse_svn_revision
  sh -c 'svn info 2> /dev/null' | sed -n '/^Revision/p' | sed -e 's/^Revision: \(.*\)/\1/'
end
 
set fish_color_git_branch green
 
function fish_prompt --description 'Write out the prompt'
 
  # Write the process working directory
  if test -w "."
    printf '%s%s ' (set_color -o cyan) (basename $PWD)
  else
    printf '%s%s ' (set_color -o $fish_color_uneditable_cwd) (prompt_pwd)
  end
 
  printf '%s%s ' (set_color $fish_color_git_branch) (current_git_branch)
 
  if git_dirty
    printf '%s' (set_color red)
  end
 
  printf '%s' (set_color -o $fish_color_cwd) 
 
  printf '%s➜ %s' (set_color red) (set_color normal)
end

