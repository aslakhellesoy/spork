class Spork::TestFramework::Cucumber < Spork::TestFramework
  DEFAULT_PORT = 8990
  HELPER_FILE = File.join(Dir.pwd, "features/support/env.rb")

  def preload
    require 'cucumber'
    @step_mother = ::Cucumber::StepMother.new
    @step_mother.load_programming_language('rb')
    super
  end

  def run_tests(argv, stderr, stdout)
    ::Cucumber::Cli::Main.new(argv, stdout, stderr).execute!(@step_mother, ::Cucumber::FeatureLoader.new)
  end
end
