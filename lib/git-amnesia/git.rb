require 'git-amnesia/string'

class Git
    @amnesia_count_default = 20

    def self.workspace
        `git config dir.workspace | envsubst`.trim
    end

    def self.other_dirs
        `git config dir.others | envsubst`.split_dirs.explode
    end

    def self.amnesia_max
        count = `git config amnesia.count`.trim.to_i
        if $?.exitstatus == 0
            count
        else
            @amnesia_count_default
        end
    end

    def self.author_name
        `git config user.name`.trim
    end

    def self.repos
        workspace = Git.workspace
        repos = Git.other_dirs
        if !workspace.empty?
            repos += `ls #{workspace}`.explode.map do |r|
                r.prepend("#{workspace}/")
            end
        end
        repos
    end

    def self.logs(repos)
        logs = []
        repos.each do |repo|
        cmd = "cd '#{repo}' 2>/dev/null" +
            " && git log --max-count=#{Git.amnesia_max} --author='#{Git.author_name}'" +
            " --all --pretty=format:'%at::#{repo.basename}::%s' 2>/dev/null"
            log = `#{cmd}`
            if $?.exitstatus == 0
                logs += log.explode.map { |l| Log.new(l) }
            end
        end
        logs
    end
end
