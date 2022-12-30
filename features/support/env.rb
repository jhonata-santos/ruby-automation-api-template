require 'colorize'
require 'cucumber'
require 'cuke_modeler'
require 'rspec'
require 'httparty'
require 'parallel_tests'
require 'pry'
require 'rake'
require 'report_builder'
require 'yaml'

Dir[File.join(File.dirname(__FILE__), 'helper/*.rb')].sort.each { |file| require file }

URL ||= YAML.load_file("#{File.dirname(__FILE__)}/config/urls.yml")
ENDPOINT ||= YAML.load_file("#{File.dirname(__FILE__)}/config/endpoints.yml")

ENVIRONMENT ||= ENV['ENVIRONMENT']
PARALLEL ||= ENV['PARALLEL']
