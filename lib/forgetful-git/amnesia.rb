require 'forgetful-git/common/git'
require 'forgetful-git/common/log'

class Amnesia
    def self.run
        repos = Git.repos
        if repos.empty?
            error_no_repos
        end
        Log.pretty_print(Git.logs(repos))
    end

    private
    def self.error_no_repos
        puts "error: no git repositories found. please configure your repositories."
        puts " git config dir.workspace /path/to/your/workspace"
        puts " git config dir.others /repo:/other/repo"
        exit 1
    end
end
