# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "debian/contrib-stretch64"

  config.vm.network "private_network", ip: "192.168.56.5"
  config.vm.network "forwarded_port", guest:4848, host:4848

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update

    apt-get install -y unzip
    apt-get install -y apache2

    # java
      apt-get install -y openjdk-8-jdk-headless

    # configurando apache para ser usado como proxy
      a2dissite 000-default
      a2enmod proxy_http
      cp /vagrant/reenvio-8080.conf /etc/apache2/sites-available
      a2ensite reenvio-8080
      systemctl restart apache2

    # glassfish
      glassfishdir=/opt/glassfish4
      wget https://download.oracle.com/glassfish/4.1.1/release/glassfish-4.1.1-web.zip -O glassfish-4.1.1-web.zip 2>/dev/null
      unzip glassfish-4.1.1-web.zip -d /opt >/dev/null
      useradd glassfish -m
      chown -R glassfish:glassfish $glassfishdir
      su - glassfish
      cd $glassfishdir/glassfish/bin
      cp /vagrant/glassfish_set_password_file /home/vagrant/glassfishpwd
      ./asadmin --user=admin --passwordfile=/home/vagrant/glassfishpwd change-admin-password --domain_name domain1
      ./asadmin start-domain
      cp /vagrant/glassfish_password_file /home/vagrant/glassfishpwd
      ./asadmin --user=admin --passwordfile=/home/vagrant/glassfishpwd enable-secure-admin
      ./asadmin stop-domain
      ./asadmin start-domain
      chown -R glassfish:glassfish $glassfishdir
      ./asadmin create-service --serviceuser glassfish domain1
      ./asadmin stop-domain
      /etc/init.d/GlassFish_domain1 start

    # variables del sistema
      sleep 8
      sh /vagrant/crear_variables.sh
  SHELL
end

