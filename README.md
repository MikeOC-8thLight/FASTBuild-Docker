# FASTBuild Docker example 

This is intended as a helper to run FASTBuild in a docker container for CI/CD integration

# Invocation

Adjust build-and-run.sh as needed. Adjust docker-composer.yml to invoke the build process, currently configured for access to the bash environment. 

# Compilers

Currently only configured for Linux, the Docker image will need to be extended and adjusted for Windows builds. 

# Note

Repository includes FASTBuild 1.07 - see https://fastbuild.org for newer versions