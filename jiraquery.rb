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
$jql_query = 'project=OPS and type in ("Change Request - High Risk", "Change Request - Low Risk") and created >= "2017-01-01" and created <= "2017-12-31" order by created asc'

def ops_change_req(jql)
  $client.Issue.jql(jql).each do |issue|
    query = []
    query << "#{issue.id} - #{issue.fields['summary']} - #{issue.fields['resolution']}"
    puts query
  end
end

def ops_change_req_count(jql)
  query_count = $client.Issue.jql(jql).count
  puts query_count
end

ops_change_req($jql_query)
ops_change_req_count($jql_query)