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

$client = JIRA::Client.new(options)

def ops_change_req(jql)
  $client.Issue.jql(jql).each do |issue|
    reqs = "#{issue.id} - #{issue.fields['summary']} - #{issue.fields['resolution']}"
    puts reqs
  end
end

ops_change_req('project=OPS and type in ("Change Request - High Risk", "Change Request - Low Risk") and created >= "2017-01-01" and created <= "2017-12-31" order by created asc')
