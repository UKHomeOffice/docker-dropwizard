# Docker Dropwizard

This is an onbuild container for Dropwizard.

## Assumptions

* Your configuration is stored in `/configuration.yml`. Where "/" is the root of your build directory.
* You are using Maven 3 to build
* A single file matching `*-with-dependencies.jar` will be in the target directory at the end of the
  build

### Getting started

Create a Dockerfile in your project and extend this one with the additional exposes you app exposes.

```docker
FROM ukhomeofficedigital:dropwizard:0.1.1

EXPOSE 8080
EXPOSE 8081
```

Then build!

You can change the CMD if you want to pass more than `server configuration.yml` to the jar.


## Contributing

Feel free to submit pull requests and issues. If it's a particularly large PR, you may wish to 
discuss it in an issue first.

Please note that this project is released with a [Contributor Code of Conduct](https://github.com/UKHomeOffice/docker-dropwizard/blob/master/code_of_conduct.md).
 By participating in this project you agree to abide by its terms.

## Versioning

We use [SemVer](http://semver.io/) for the version tags available See the tags on this repository. 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/UKHomeOffice/docker-dropwizard/graphs/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/UKHomeOffice/docker-dropwizard/blob/master/LICENSE.md) file for details
