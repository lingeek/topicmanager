# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include topicmanager::install
class topicmanager::install(
  $tomcat_path                 = $topicmanager::params::tomcat_path,
  $tomcat_target               = $topicmanager::params::tomcat_target,
  $topicmanager_path           = $topicmanager::params::topicmanager_path,
  $user                        = $topicmanager::params::user,
  $group                       = $topicmanager::params::group,
  $topicmanager_symlink_path   = $topicmanager::params::topicmanager_symlink_path,
  $topicmanager_current_path   = $topicmanager::params::topicmanager_current_path,


) inherits topicmanager::params {

  file {"$tomcat_path":
    ensure            => 'directory',
    owner             =>  $user,
    group             =>  $group,
  }

  file {"$topicmanager_path":
    ensure            => 'directory',
    owner             =>  $user,
    group             =>  $group,
  }

  file {"$topicmanager_path/temp":
    ensure            => 'directory',
    owner             =>  $user,
    group             =>  $group,
  }


  file { "$tomcat_path/apache-tomcat-8.5.31.tar.gz":
    ensure              => file,
    owner               =>  $user,
    group               =>  $group,
    source              => "puppet:///applications/apache-tomcat-8.5.31.tar.gz",
    require             => File["$tomcat_path"],
  }


  # preferred symlink syntax
  file { "$tomcat_path/$topicmanager_current_path":
    owner     => $user,
    group     => $group,
    ensure    => 'link',
    target    => "$topicmanager_symlink_path",
  }


  exec { "install_tomcat":
    path    => '/usr/bin/:/bin/',
    command => "tar xzf $tomcat_path/apache-tomcat-8.5.31.tar.gz -C $topicmanager_path",
    unless  => "test -f $tomcat_path/$topicmanager_path/bin/startup.sh",
    require => File["$tomcat_path/apache-tomcat-8.5.31.tar.gz"],

  }

  exec { "make_executable":
    path    => '/usr/bin/:/bin/',
    command => "chown -R java: $tomcat_path;chmod -R +x $tomcat_path/current-topicmanager-test/bin/*.sh",
    unless  => "stat $tomcat_path/$topicmanager_current_path/bin/startup.sh | grep -i 0755",
    require => File["$tomcat_path/apache-tomcat-8.5.31.tar.gz"],

  }
  exec { "remove_tomcat_archive":
    path    => '/usr/bin/:/bin/',
    command => "rm -fr $tomcat_path/apache-tomcat-8.5.31.tar.gz",
    onlyif  => "test -f $tomcat_path/apache-tomcat-8.5.31.tar.gz",
    require => Exec["install_tomcat"],

  }




}
