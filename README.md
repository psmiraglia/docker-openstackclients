# docker-openstackclients

Alpine based Docker image to run OpenStack clients.

## Build the image

Run the following command

    $ docker build --tag psmiraglia/openstackclients .

## Run a container

Simple example

    $ docker run --rm -ti psmiraglia/openstackclients /bin/sh
    / # openstack --version
    openstack 3.9.0

Load the credential script obtained from Horizon

    $ docker run --rm -ti -v ~/creds.sh:/creds.sh psmiraglia/openstackclients /bin/sh
    / # openstack image list
    Missing value auth-url required for auth plugin password
    / # . /creds.sh
    / # openstack image list
    +--------------------------------------+--------------+--------+
    | ID                                   | Name         | Status |
    +--------------------------------------+--------------+--------+
    | ...                                  | ...          | active |

## Refererences

*   [Docker](https://www.docker.com)
*   [Alpine Linux](https://alpinelinux.org)
*   [OpenStack Clients](https://wiki.openstack.org/wiki/OpenStackClients)
