require 'rubygems'
require 'bundler'
require 'releasy'

Releasy::Project.new do
  name "Plane Game"
  version "2.2"

  executable "bin/Main.rb"
  files "lib/**/*.*"

#  add_build :osx_app do
#    wrapper "wrappers/gosu-mac-wrapper-0.7.41.tar.gz"
#  end

  add_build :source do
    add_package :zip
  end
  add_build :windows_installer do
    start_menu_group "Axel Game"
    executable_type :windows
    add_package :zip
  end
  add_deploy :local
end