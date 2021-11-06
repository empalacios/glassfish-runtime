#!/bin/bash
bash /opt/glassfish4/glassfish/bin/asadmin --interactive=false --user=admin --passwordfile=/home/vagrant/glassfishpwd --port 4848 create-system-properties userbd=userbd
bash /opt/glassfish4/glassfish/bin/asadmin --interactive=false --user=admin --passwordfile=/home/vagrant/glassfishpwd --port 4848 create-system-properties passwordbd=password
bash /opt/glassfish4/glassfish/bin/asadmin --interactive=false --user=admin --passwordfile=/home/vagrant/glassfishpwd --port 4848 create-system-properties urlbd=jdbc\\:postgresql\\://localhost\\:5432/mydatabase
