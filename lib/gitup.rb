
class Gitup
  
  attr_accessor :stashing
  
  def self.gitdown!
    
    unless everything_commited?
      system "git status"
      puts "You have uncommitted changes in #{current_branch}. Do you want to try gitdown anyway? (y/n)"
      input = gets.chomp
      if input.downcase == 'y'
        system "git stash"
        self.run_gitdown_commands(current_branch)
        system "git stash apply"
      else
        puts "Ok... coward."
      end
    else
      self.run_gitdown_commands(current_branch)
    end
  end
  
  def self.gitup!
    
    unless everything_commited?
      system "git status"
      raise "Hold your horses! You must commit your changes first."
    end
    
    # Push it!
    self.run_gitup_commands
    
    puts "Finished."
    
  end
  
  def self.current_branch
    return `git branch`.chomp.gsub('* ', '').gsub("\n", '')
  end

  # Do we have anything uncommitted in this repository?
  def self.everything_commited?
    `git ls-files --deleted --modified --others --exclude-standard` == ""
  end
  
  def run_gitup_commands(branch)
    system "git checkout master"
    system "git merge #{branch}"
    system "git push origin master"
    system "git checkout #{branch}"
    system "git rebase master"
  end
  
  def run_gitdown_commands(branch)
    system "git checkout master"
    system "git pull origin master"
    system "git checkout #{branch}"
    system "git rebase master"
  end
  
end