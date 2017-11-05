hostname = node['hostname']

file '/etc/motd' do
	content  "Hostname of the server is: #{hostname}"
end
