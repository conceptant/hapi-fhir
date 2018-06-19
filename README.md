# Q&A

**What is FHIR?**

FHIR (Fast Healthcare Interoperability Resources) is a standard for exchanging healthcare information electronically. You can find more about it here: https://www.hl7.org/fhir/overview.html

**What is HAPI?**

HAPI is an open-source implementation of the FHIR specification written in Java. You can read about it here: http://hapifhir.io/

**What is Conceptant, Inc.?**

Conceptant, Inc. is a business specializing on healthcare solutions. You can read about it here: http://conceptant.com/

**What is HAPI FHIR all-in-one (this repository)**

This docker image is probably your fastest and simplest way to get your own implementation of FHIR server and client running in 10 minutes or less.

**Is this docker image production-ready?**

This image is suitable for demos, development and  testing. It lacks quite a few features one would expect from a production-ready system:
- Scalability. This is an all-in-one image containing everything you need in one compact image.
  - In a real-world production system you definitely want to split out at least the database so you can use a database cluster.
  - Most likely you will actually want to connect to your own database server, not bbuilt-in Derby
  - You will also very likely need multiple application servers behind the load balancer.
  - For security reasons FHIR client should not bbe included into the same image as the server.
- Performance. This docker container is not tuned to work under high loads and is not suitable for anything bigger than simple prototype testing.
- And, most importantly, security. If you're going to store PHI (Protected Health Information) in a system it needs to be properly engineered and protected, which is a very complex task.
Conceptant specializes in in implementing all these features, contact us if you need help in building a secure, scalable, robust healthcare solutions.

# Quick start

```
docker run -p 8080:8080 conceptant/hapi-fhir
```

The image will take a minute to spin up and then you can go to http://localhost:8080 to access the FHIR client. Note that any data you store in the running container will be gone after you delete it.

If you want data to survive container deletion use this command instead:

```
docker run -p 8080:8080 -v <host_directory>:/var/lib/jetty/target conceptant/hapi-fhir
```

where you need to replace "<host_directory>" with either a path to an existing directory on the host file system or a name of a docker volume. You can read more about Docker volumes here: https://docs.docker.com/storage/volumes/

NOTE: that volume directory must have sufficient permissions for the docker container to write into it. Possibly the simplest way to do this is
```
> sudo chmod a+wrx <host_directory>
> # start docker container as shown above
> # ls -la <host_directory>
> # find the username and the group the folders in this <host_directory> belong to (for instance user systemd-timesync, group systemd-journal under ubuntu)
> sudo chown <username>:<group> <host_directory>
> sudo chmod og-w <host_directory>
```

# If you need to customize the docker file

```
git clone https://github.com/conceptant/hapi-fhir.git
```

Now make you customizations and build as usual.

# Thanks!
Big thanks to
- HL7 (Health Level Seven International) for coming up with the FHIR
- HAPI for building an opensource implementation of HL7 FHIR
