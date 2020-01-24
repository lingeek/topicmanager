# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include topicmanager::service
class topicmanager::service (
  $service_name       = $topicmanager::params::service_name,
  $service_ensure     = $topicmanager::params::service_ensure,
  $service_status     = $topicmanager::params::service_status,


) inherits topicmanager::params {

  service { $service_name:
    ensure    => $service_ensure,
    enable    => $service_status,
    name      => $service_name,
    hasstatus => true,
    require   => Class['topicmanager::install'],
  }

}
