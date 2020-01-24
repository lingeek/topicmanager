# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include topicmanager::setup
class topicmanager::setup (
  $file_present            =  $topicmanager::params::file_present,
  $tomcat_server_file_path = $topicmanager::params::tomcat_server_file_path,


) inherits topicmanager::params {
  file { "$tomcat_server_file_path":
    ensure  => $file_present,
    content => template('topicmanager/server_config.erb'),
    require => Class['topicmanager::install'],
    notify => Class['topicmanager::service'],
  }

}
