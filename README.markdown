# Gitup

We want our team members to be working in their own branches locally and
push to origin/master every once in a while. Gitup is a tool to make that
easier and avoid a lot of unnecessary conflicts during that time.

This gem is developed for use on Mac OS X, but should work on any *nix type system.
There is a port for Windows using Python developed by [eriik](https://github.com/eriik/gitup-py)

## Installation

	sudo gem install gitup

in your console should do it. You need git installed locally 
and added to your path (which you probably already have).


## Usage

The gem has two basic functions, 'gitup' and 'gitdown'. Both should be added automatically to your path
when you install the gem.

Let's say you clone a new project in Git:

	git clone git@example.com:repository.git

Then you check out your local branch, since working directly in the
master branch usually gives you a lot of conflicts if you are
more than one working on the project:

	git checkout -b new_feature

Now whenever you need to update your branch from the origin/master repository
you could just run the following command:

	gitdown

Or when you want to push your changes to the server:

	gitup

Easy enough?

## Copyright

This was developed by David Svensson of [Standout solutions](http://standout.se/ "Ruby on Rails developers in Växjö, Sweden") and
you could use it in any way you wish. A link to our webpage or a reference to who created it would be appreciated, though. 
Happy gitup-ing! :)

