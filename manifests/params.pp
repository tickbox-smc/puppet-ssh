class ssh::params {
  #unless $facts['os']['family'] == 'Debian' {
  #  $package_name = 'openssh-server'
  #  $service_name = 'sshd'    
  #}
  
  #if $facts['os']['family'] == 'Debian' {  
  #  $package_name = 'openssh-server'
  #  $service_name = 'ssh'
  #}
  #elsif $facts['os']['family'] == 'Redhat' {
  #  $package_name = 'openssh-server'
  #  $service_name = 'sshd'  
  #}
  #else {
  #  fail("${facts['operatingsystem']} is not supported!")
  #}
  
  $permit_root_login = false
  $port = 22
  
  #case $facts['os']['family'] {
  case $facts['operatingsystem'] {
    'Debian', 'Ubuntu': {
      $package_name = 'openssh-server'
      $service_name = 'ssh'
    }
    /^RedHat|CentOS/: {
      $package_name = 'openssh-server'
      $service_name = 'sshd'
      notify{ "${0} is our operating system!": }
    }
    default: {
      fail("${facts['operatingsystem']} is not supported!")
    }
  }
}
