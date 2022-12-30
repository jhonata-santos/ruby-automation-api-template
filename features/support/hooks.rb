include(Commons)
World(Rest)

at_exit do
  type_execution = PARALLEL.nil? ? 'sequential' : 'parallel'

  ReportBuilder.configure do |config|
    config.input_path = "reports/#{type_execution}"
    config.report_path = "reports/final_reports/#{type_execution}_report"
    config.report_types = [:json, :html]
    config.report_title = "REPORT AUTOMATION #{type_execution.upcase} - API"
    config.additional_info = { Environment: ENVIRONMENT }
    config.color = 'blue'
  end

  ReportBuilder.build_report
end
