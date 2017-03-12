require 'date'
require 'git-amnesia/string'
require 'git-amnesia/git'

class Log
    include Comparable
    attr :message, :date, :repo, :timestamp

    def initialize(log)
        date, repo, message = log.split("::")
        @timestamp = date
        @date = DateTime.strptime(date,'%s').strftime("%Y-%m-%d %H:%M").to_s.yellow
        @repo = repo.green
        @message = message
    end

    def <=>(other)
        other.timestamp <=> timestamp
    end

    def self.pretty_print(logs)
        logSubset = Log.sorted_subset(logs)
        longest = Log.longest(logSubset)
        logSubset.each do |log|
            printf("%s %-#{longest}s: %s\n", log.date, log.repo, log.message)
        end
    end

    private
    def self.longest(logs)
        logs.map {|l| l.repo.length}.max
    end

    def self.sorted_subset(logs)
        logs.sort[0..Git.amnesia_max-1]
    end
end
