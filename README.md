# docker-icecc-daemon
Docker: Ice Cream - Distributed compiler

Runs iceccd -v on alpine:3.14

No bells or whistles, this uses the default scheduler name and thus can be used to seed a icecream farm by running this image on multiple hosts.

Best way (only at the moment) to run this appears to be using --net=host ; this ensures that the iceccd uses the hosts IP address for responses. I have as of yet been unable to get this working with port exposure on the container since it appears to broadcast the internal container IP address which of course no one can connect to:

Build a image:
```
    $ docker build -t signal-slot-inc/icecc-daemon .
```
Scheduler:
```
    $ docker run -p 8765:8765/tcp -p 8765:8765/udp signal-slot-inc/icecc-daemon icecc-scheduler -vv
```
Daemon:
```
    $ docker run --net=host signal-slot-inc/icecc-daemon
```
