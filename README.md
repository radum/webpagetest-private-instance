# Local instance WebPageTest

# Docker

## How to run

```shell
docker-compose up
```

This will run the `wpt_server` and `wpt_agent` instances.

Native Connection (No Traffic Shaping) will have to be used in order to work as there is no traffic shaping enabled.

## How to test localhost

Because everything runs into docker localhost is different. To access the localhost from your machine use:

```
http://host.docker.internal:{PORT}/
```

Another way is to add

```
  extra_hosts:
    - "local.dev:10.8.10.11"
```

to wpt_agent service under docker-compose.yml. The IP address is your local machine IP address.

## How to stop

```shell
docker-compose down
```

## Running a local HTTPS server

This will cause WPT to crash with `(Test Error: net::ERR_CERT_AUTHORITY_INVALID)` error, because the local browser instance doesn't know your SSL files.

To overcome this check `Ignore SSL Certificate Errors` under settings and run the test again.

# Vagrant

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

