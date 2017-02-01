require 'pp'
require 'jira-ruby'
require './config.rb'

options = {
    :username => JIRAUSER,
    :password => JIRAPASS,
    :site => JIRAURL,
    :context_path => '',
    :auth_type => :basic
}

client = JIRA::Client.new(options)

#issue = client.Issue.find("OPS-15449")
#pp issue.issuelinks

#projects = client.Project.all

#projects.each do |project|
#  puts "Project -> key: #{project.key}"
#end

client.Issue.jql(JIRAJQL).each do |issue|
  puts "#{issue.id} - #{issue.fields['summary']} - #{issue.fields['resolution']}"
end
