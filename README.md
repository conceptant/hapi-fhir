# Q&A

<dl>

<dt>What is FHIR?</dt>
<dd>FHIR (Fast Healthcare Interoperability Resources) is a standard for exchanging healthcare information electronically. You can find more about it here: https://www.hl7.org/fhir/overview.html</dd>

<dt>What is HAPI?</dt>
<dd>A: HAPI is an open-source implementation of the FHIR specification in Java. You can read about it here: http://hapifhir.io/</dd>

<dt>What is Conceptant, Inc?</dt>
<dd>A: Conceptant, Inc. is a business specializing on healthcare solutions. You can read about it here: http://conceptant.com/</dd>

<dt>What is HAPI FHIR all-in-one (this repository)</dt>
<dd>A: This docker image is probably your fastest and simplest way to get your own implementation of FHIR server and client running in 10 minutes or less. It is largly based</dd>
</dl>

# Quick start
`docker run -p 8080:8080 conceptant/hapi-fhir`

The image will take a minute to spin up and then you can go to http://localhost:8080 to access the FHIR client.

# If you need to customize the docker file

`git clone https://github.com/conceptant/docker-hapi-fhir.git`

Now make you custominzations and built as usual.

# Thanks!
Big thanks to
- HL7 (Health Level Seven International) for coming up with the FHIR
- HAPI for coming up with an opensource implementation of HL7
