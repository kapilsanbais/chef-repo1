#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


#if  node['platform_family'] == "rhel"
#	
#	packagename = "httpd"
#
#elsif node['platform_family'] == "debian"
#	packagename = "apache2"
#end


package 'apache' do 
	package_name packagename
end

service 'httpd' do
	action [:enable, :start]
end

include_recipe 'apache::website'
