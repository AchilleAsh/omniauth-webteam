# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-webteam/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'omniauth-webteam'
  s.version     = OmniAuth::Webteam::VERSION
  s.date        = '2015-10-15'
  s.summary     = "Webteam ENSEA OAuth2 Client"
  s.description = "Omniauth OAuth2 client for Webteam ENSEA"
  s.authors     = ["Timothé Perez"]
  s.email       = 'webteam@ensea.fr'
  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
  s.homepage    = 'https://webteam.ensea.fr'
  s.license       = 'MIT'
end