#!/bin/bash
./asadmin --interactive=false --user=admin --passwordfile=/home/vagrant/glassfishpwd --port 4848 create-system-properties userbd=userbd
./asadmin --interactive=false --user=admin --passwordfile=/home/vagrant/glassfishpwd --port 4848 create-system-properties passwordbd=password
./asadmin --interactive=false --user=admin --passwordfile=/home/vagrant/glassfishpwd --port 4848 create-system-properties urlbd=jdbc\\:postgresql\\://localhost\\:5432/mydatabase
