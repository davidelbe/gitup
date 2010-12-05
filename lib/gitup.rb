class Gitup
  
  def self.gitdown!
    
    if on_master?
      puts "You are on the master branch. Gitdown is intended to be used in local branches."
      puts "git checkout -b yournewbranch to create a new local branch"
      puts "or git checkout yourexistingbranch to checkout an existing one."
      system "git pull origin master"
      exit
    end
    
    unless everything_commited?
      system "git status"
      puts "You have uncommitted changes in #{current_branch}. Do you want to try gitdown anyway? (y/n)"
      input = gets.chomp
      
      if input.downcase == 'y'
        system "git stash"
        run_gitdown_commands(current_branch)
        system "git stash apply"
      else
        puts "Ok... coward."
        exit
      end
      
    else
      run_gitdown_commands(current_branch)
    end
    puts "Finished."
    exit
  end
  
  def self.gitup!
    
    unless everything_commited?
      system "git status"
      puts "Warning: You have uncommitted changes. Continue? (y/n)"
      input = gets.chomp
      
      if input.downcase == 'y'
        # Stash the changes, do the push and then apply our stash
        system "git stash"
        self.run_gitup_commands(current_branch)      
        system "git stash apply"
      else
        puts 'Good girl.'
        exit
      end
    else
      # Push it!
      self.run_gitup_commands(current_branch)      
      exit
    end
  end
  
  def self.on_master?
    current_branch == 'master'
  end
  
  def self.current_branch
   current = ''
   branches = `git branch`.split("\n")
   branches.each do |branch|
     if (branch[0, 2] == '* ')
       current = branch.gsub('* ', '').strip
     end
   end
   current
  end

  # Do we have anything uncommitted in this repository?
  def self.everything_commited?
    `git ls-files --deleted --modified --others --exclude-standard` == ""
  end
  
  def self.run_gitup_commands(branch)
    puts "Branch: #{branch}"
    unless branch == 'master'
      system "git checkout master"
      system "git merge #{branch}"
    end
    system "git push origin master"
    unless branch == 'master'
      system "git checkout #{branch}"
      system "git rebase master"
    else
      puts "You should really consider doing development locally in a branch that is not the master branch."
    end
  end
  
  def self.run_gitdown_commands(branch)
    puts "Branch: #{branch}"
    system "git checkout master"
    system "git pull origin master"
    system "git checkout #{branch}"
    system "git rebase master"
  end
  
end