# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include topicmanager::config
class topicmanager::config (
  $tomcat_path      = $topicmanager::params::tomcat_path,
  $tomcat_target    = $topicmanager::params::tomcat_target,
  $service_unit     = $topicmanager::params::service_unit,
  $file_present     = $topicmanager::params::file_present,
) inherits topicmanager::params  {

    #Building systemctl UNIT
    file {"$service_unit":
      ensure    => $file_present,
      mode      =>'0644',
      content   => template('topicmanager/tomcat_service.erb'),
      notify    => [
        Exec["systemd_reload"],
        Class['topicmanager::service']
      ],
    }


    exec { "systemd_reload":
      path        => '/usr/bin/:/bin/:/sbin/',
      command     => "systemctl daemon-reload",
      refreshonly => true,
    }


  }
