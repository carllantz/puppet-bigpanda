# ensures 'bigpanda' gem is installed

class bigpanda {

  package { 'bigpanda':
    ensure   => 'present'
    provider => gem,
  }
}