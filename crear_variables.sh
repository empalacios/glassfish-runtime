#!/bin/bash
./asadmin --user=admin --passwordfile=/home/vagrant/glassfishpwd --port 4848 create-system-properties userbd=userbd
./asadmin --user=admin --passwordfile=/home/vagrant/glassfishpwd --port 4848 create-system-properties passwordbd=password
./asadmin --user=admin --passwordfile=/home/vagrant/glassfishpwd --port 4848 create-system-properties bd_ingenieria2_url=jdbc\\:postgresql\\://localhost\\:5432/mydatabase
