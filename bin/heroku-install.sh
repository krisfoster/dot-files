#!/bin/bash
apt-add-repository 'deb http://toolbelt.herokuapp.com/ubuntu ./'
curl http://toolbelt.herokuapp.com/apt/release.key | apt-key add -
apt-get update
apt-get install heroku-toolbelt
