require 'git-amnesia/version'
require 'git-amnesia/git'
require 'git-amnesia/log'

module GitAmnesia
    def self.run(args)
        command = args.shift

        case command
        when 'help'
            usage
        when 'version'
            version
        when nil
            amnesia
        when '*'
            error_usage(command)
        end

    end

    def self.usage
        puts "usage: git amnesia [<command>]"
        puts " print git log of all git repositories combined"
        puts ""
        puts "These are the available commands:"
        puts " help     print this message"
        puts " version  print the current version"
    end

    def self.version
        puts "git-amnesia version #{GitAmnesia::VERSION}"
    end

    def self.amnesia
        repos = Git.repos
        if repos.empty?
            error_no_repos
        end
        Log.pretty_print(Git.logs(repos))
    end

    private
    def self.error_usage(command)
        puts "unknown command #{command}"
        puts ""
        usage
        exit 1
    end

    def self.error_no_repos
        puts "error: no git repositories found. please configure your repositories."
        puts " git config dir.workspace /path/to/your/workspace"
        puts " git config dir.others /repo:/other/repo"
        exit 1
    end
end
