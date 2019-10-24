# docker-openstackclients

Alpine based Docker image to run OpenStack clients.

## Build the image

Run the following command

    $ docker build --tag psmiraglia/openstackclients .

## Run a container

Simple example

    $ docker run --rm -ti psmiraglia/openstackclients openstack --version
    openstack 4.0.0

Load the credentials from environment file (see `openstack.env.example`)

    $ docker run --rm -ti --env-file openstack.env \
        psmiraglia/openstackclients openstack image list
    +--------------------------------------+--------------+--------+
    | ID                                   | Name         | Status |
    +--------------------------------------+--------------+--------+
    | ...                                  | ...          | active |

If `OS_AUTH_URL` uses the `HTTPS` protocol, you have to mount under
`/etc/ssl/cacerts.pem` the file with the certificates used for the TLS
validation.

    $ docker run --rm -ti --env-file openstack.env \
        -v "/path/to/cacerts.pem:/etc/ssl/cacerts.pem:ro" \
        psmiraglia/openstackclients openstack image list
    +--------------------------------------+--------------+--------+
    | ID                                   | Name         | Status |
    +--------------------------------------+--------------+--------+
    | ...                                  | ...          | active |

## Refererences

*   [Docker](https://www.docker.com)
*   [Alpine Linux](https://alpinelinux.org)
*   [OpenStack Clients](https://wiki.openstack.org/wiki/OpenStackClients)
