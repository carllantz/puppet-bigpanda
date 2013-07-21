## BigPanda / Puppet Events Integration

`NOTE` At this time, BigPanda can consume Puppet events representing application deployments. We're working on support for infrastructure changes, which should be coming out soon.

### Integration Methods

* If you have a home-grown Puppet module for application deployments, you'll probably want to use [BigPanda's Ruby client library](https://github.com/bigpandaio/bigpanda-rb).

* If you are using a third-party Puppet module for deployments, we provide a Puppet type you can use within your manifests to publish deployments to BigPanda:
```
bigpanda_deployment { '<application_name>':
      version       => '<app version (optional)>',
      owner         => '<owner-name (optional)>',
      access_token  => '<bigpanda-token>',
}
```


### Puppet-Type Installation Instructions 

#### Step 1
On your Puppet master host, install the BigPanda gem:
```
gem install bigpanda
```

#### Step 2
Install the BigPanda Pupet module.
```
puppet module install bigpanda/bigpanda
```
Or download it from the [module page on Puppet Forge](http://forge.puppetlabs.com/bigpanda/bigpanda).

#### Step 3
Use the type in you Puppet manfests:
```
bigpanda_deployment { '<application_name>':
      version       => '<app version (optional)>',
      owner         => '<owner-name (optional)>',
      access_token  => '<bigpanda-token>',
}
```
You might want to use [puppet's ordering operators](http://docs.puppetlabs.com/learning/ordering.html) to guarantee that deployments are only published to BigPanda when changes occur.
