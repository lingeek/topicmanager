# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include topicmanager::params
class topicmanager::params (
  $jdk_path                       = hiera('common::path::jdk::path'),
  $tomcat_path                    = hiera('common::path:tomcat::path'),
  $topicmanager_path              = hiera('node::topicmanager::path'),
  $topicmanager_symlink_path      = hiera('node::topicmanager::symlink'),
  $topicmanager_current_path      = hiera('node::topicmanager::current_path'),
  $tomcat_server_file_path        = hiera('node::tomcat::file::path'),
  $tomcat_target                  = hiera('node::tomcat::target'),
  $user                           = hiera('common::tomcat::user'),
  $group                          = hiera('common::tomcat::group'),
  $service_unit                   = hiera('node::topicmanager::service::unit::path'),
  $file_present                   = hiera('common::file::ensure'),
  $tomcat_port                    = hiera('node::tomcat::port'),
  $service_name                   = hiera('node::tomcat::service::name'),
  $service_status                 = hiera('node::tomcat::service::status'),
  $service_ensure                 = hiera('node::topicmanager::service::enable'),
  $java_opts                      = hiera('node::topicmanager::java_opts'),
  $topicmanager_service_path      = hiera('node::topicmanager::service::path'),

){
}
