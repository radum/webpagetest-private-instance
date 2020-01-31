# Local instance WebPageTest

# Docker

## How to run

### On Linux Server

Run the following commands, and access to http://localhost:4000

```shell
sudo modprobe ifb numifbs=1
docker-compose up
```

This will run the `wpt_server` and `wpt_agent` instances.

### On Mac OS / PC

**Mac OS does not support network shaping.**

Run the following command, and access to http://localhost:4000

```shell
docker-compose -f docker-compose.yml -f docker-compose-macos.yml up
```

Native Connection (No Traffic Shaping) will have to be used in order to work as there is no traffic shaping enabled.

### Test test results

Test results are saved in wpt_data directory.

## How to test localhost

Because everything runs into docker localhost is different. To access the localhost from your machine use:

```
http://host.docker.internal:{PORT}/
```

Another way is to add EXTRA_HOST to `wpt.env`:

```
EXTRA_HOST=local.dev:10.8.10.11
```

***The IP address is your local machine IP address.***

## How to stop

```shell
docker-compose down
```

## Running a local HTTPS server

This will cause WPT to crash with `(Test Error: net::ERR_CERT_AUTHORITY_INVALID)` error, because the local browser instance doesn't know your SSL files.

To overcome this check `Ignore SSL Certificate Errors` under settings and run the test again.

## Network latency / speed simulation

At the moment as far as I know this doesn't work inside Docker. But you can use [throttle](https://github.com/sitespeedio/throttle) to simulate slow network connections on Linux and Mac OS X.

# Vagrant

**NOT WORKING at the moment.**

## Initial setup

```
vagrant up

vagrant ssh

chmod +x /vagrant/bootstrap.sh

/vagrant/bootstrap.sh

# It may take long time to install a lot if software, please wait patiently!

localhost
Test_loc

exit

vagrant reload

Open http://localhost:8080/
```

