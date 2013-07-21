## BigPanda / Puppet Events Integration

`NOTE` At this time, BigPanda can consume puppet events representing application deployments. We're working on support for infrastructure changes.

### Integration Methods

* If you have a home-grown puppet module for application deployments, you'll probably want to use the [bigpanda's ruby client library](https://github.com/bigpandaio/bigpanda-rb).

* If you are using a third-party puppet module for deployments, we provide a puppet type you can use within your manifests to publish deployments to BigPanda:
```
bigpanda_deployment { '<application_name>':
      version       => '<app version (optional)>',
      owner         => '<owner-name (optional)>',
      access_token  => '<bigpanda-token>',
}
```


### Puppet-Type Installation Instructions 

#### Step 1
On your puppet master host, install the bigpanda gem:
```
gem install bigpanda
```

#### Step 2
Install the bigpanda puppet module.
```
puppet module install bigpandaio/puppet-bigpanda
```
Or download it from the [module page on Puppet Forge](http://forge.puppetlabs.com/).

#### Step 3
Use the type in you puppet manfests:
```
bigpanda_deployment { '<application_name>':
      version       => '<app version (optional)>',
      owner         => '<owner-name (optional)>',
      access_token  => '<bigpanda-token>',
}
```
You might want to use [puppet's ordering operators](http://docs.puppetlabs.com/learning/ordering.html) to publish the deployments to BigPanda only after changes.
