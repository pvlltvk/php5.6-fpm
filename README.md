# pvlltvk/ubuntu-trusty-php-fpm-5.6

This is a Ubuntu-based image with PHP-FPM version 5.6 installed.

It's pre-configured to listen on port 9000.

## Usage

This is really meant to be used for building new docker images with
your PHP app.

It uses php-fpm as the entrypoint.

### Build

```
$ docker build -t <repo name>.
```

###Run

#### Run in foreground

```
$ docker run pvlltvk/ubuntu-trusty-php-fpm-5.6
```

#### Run in background

```
$ docker run -d pvlltvk/ubuntu-trusty-php-fpm-5.6
```

#### Run in background with some options

Run with name, mount host directory as a container data volume and map network ports inside our container to our host. You can put PHP application in this host directory.

```
$ docker run -d -P --name example_name -v /example_host_directory:/example_container_volume pvlltvk/ubuntu-trusty-php-fpm-5.6
```

## Exposed ports

* 9000
