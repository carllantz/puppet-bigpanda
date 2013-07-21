# BigPanda / Puppet Events Integration


## Description

`NOTE` At this time, BigPanda can consume puppet events re[resenting application deployments. We're working on support for infrastructure changes.

There are two methods to push your application deployments to BigPanda if you use puppet:

* If you have a home-grown puppet module for application deployments, you'll probably want to use the [bigpanda's ruby client library](ttps://github.com/bigpandaio/bigpanda-rb).

* If you are using a third-party puppet module for deployments, we provide a puppet type that you can use to report deployments:
```bigpanda_deployment { '<application_name>':
      version       => '<app version>',
      owner         => '<owner-name>',
      access_token  => '<bigpanda-token>',
}```


You might want to use [puppet's ordering operators](http://docs.puppetlabs.com/learning/ordering.html) to publish the deployments to BigPanda only after changes.


## Installation Instructions for BigPanda's Puppet Type
