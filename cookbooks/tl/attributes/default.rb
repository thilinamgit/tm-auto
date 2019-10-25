default[:tl][:user] = 'tl'
default[:tl][:group] = 'tl'

default[:tl][:debug] = false
default[:tl][:test] = false
default[:tl][:standalone] = false

default[:tl][:hostname] = 'tlstage.com'
default[:tl][:base_path] = '/srv/tl/'
default[:tl][:deploy_path] = '/srv/tl/current'
default[:tl][:deploy][:shallow_clone] = true
default[:tl][:deploy][:keep_releases] = 5
default[:tl][:database][:host] = 'dummyrds.master.eu-west-1.rds.amazonaws.com'
default[:tl][:database][:socket] = '3306'
default[:tl][:database][:password] = 'changeme'

default[:tl][:github_api_token] = ''

default[:tl][:aws][:cloudwatch][:aws_key] = nil
default[:tl][:aws][:cloudwatch][:aws_secret] = nil
