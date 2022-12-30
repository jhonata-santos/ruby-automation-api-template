desc 'Run sequential tests'
task :sequential_tests, [:env, :tag] do |_task, args|
  run_sequential(args[:env], args[:tag])
end

desc 'Run parallel tests'
task :parallel_tests, [:env, :threads, :tag] do |_task, args|
  run_parallel(args[:env], args[:threads], args[:tag])
end

desc 'Run rubocop project'
task :rubocop do
  run_rubocop
end

def run_sequential(env, tag)
  puts '================= START ================='
  clean_project
  run_rubocop
  puts '>>>>>>>>> Running tests <<<<<<<<<<<'
  system "cucumber -t \"#{tag}\" -p #{env} -p report_sequential"
  puts '================== END =================='
end

def run_parallel(env, threads, tag)
  puts '================= START ================='
  clean_project
  run_rubocop
  puts '>>>>>>>>> Running tests <<<<<<<<<<<'
  system "parallel_cucumber features/ -o '-t \"#{tag}\" -p #{env} -p report_parallel' -n #{threads} --group-by scenarios"
  puts '================== END =================='
end

def clean_project
  return unless File.directory?('reports/')

  puts '>>>>>>>>> Cleaning up old evidence <<<<<<<<<<<'
  FileUtils.rm_rf('reports/')

  return unless File.directory?('code_analyzer/')

  puts '>>>>>>>>> Cleaning up old code_analyzer <<<<<<<<<<<'
  FileUtils.rm_rf('code_analyzer/')
end

def run_rubocop
  puts '>>>>>>>>> Running rubocop <<<<<<<<<<<'
  checklist = '-r rubocop/formatter/checkstyle_formatter'
  config = '-c .rubocop.yml'
  formatter = '-f RuboCop::Formatter::CheckstyleFormatter'
  output = '-o code_analyzer/checkstyle-result.xml -f html -o code_analyzer/index.html'
  system "rubocop #{checklist} #{config} #{formatter} #{output} -P"
end
