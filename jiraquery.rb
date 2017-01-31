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

client.Issue.jql('project=OPS and type in ("Change Request - High Risk", "Change Request - Low Risk") and created >= "2017-01-01" and created <= "2017-12-31" order by created asc').each do |issue|
  puts "#{issue.id} - #{issue.fields['summary']} - #{issue.fields['resolution']}"
end