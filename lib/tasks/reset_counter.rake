namespace :db do
    desc 'Return Counter Cache!'
    task :reset_counter => environment do
        puts "prepare to reset counter"
        Candidate.all.each do |candidate|
            Candidate.resrt_counters(candidate.id, vote_logs)
        end 
        puts "done!"
    end
end