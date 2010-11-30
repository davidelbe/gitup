class Gitup
  
  def gitup!
    puts "Inside gitup."
    puts current_branch
    unless everything_commited?
      system "git status"
      raise "Hold your horses! You must commit your changes first."
    end
    
  end
  
  def current_branch
    branch = `git branch`
    puts "Branch: #{branch}"
  end

  # Do we have anything uncommitted in this repository?
  def everything_commited?
    `git ls-files --deleted --modified --others --exclude-standard` == ""
  end
end