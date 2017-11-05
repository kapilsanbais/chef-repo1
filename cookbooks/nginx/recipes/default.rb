#
# Cookbook:: nginx
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#


package "epel-release" do
	action :install
	end 

package "nginx" do
	action  :install
	end

service "nginx-service" do
	action   [:start, :enable]
	service_name  "nginx"
	end 


cookbook_file "/etc/nginx/conf.d/sanbais.conf" do
	source "sanbais.conf"
	mode "644"
	end 

cookbook_file "/var/www/html/index.html" do
	source "index.html"
	end 

bash "install httpd package" do
	code <<-EOH
	yum install httpd -y
	systemctl restart httpd
	systemctl enable httpd
	EOH
	end  


directory "/tmp/hello" do
	action :create
	end 

package "git"

git "tmp/hello" do
	repository "https://github.com/kapilsanbais/http-sample-project.git"
	revision 'master'
        action :sync
end
	
remote_file '/tmp/sleuthkit-4.2.0.tar.gz' do
	source "https://sourceforge.net/projects/sleuthkit/files/sleuthkit/4.2.0/sleuthkit-4.2.0.tar.gz"
	action :create
	owner 'root'
 	group 'root'
  	mode 0755
	end 

