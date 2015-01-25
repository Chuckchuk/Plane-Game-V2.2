require 'rubygems'
require 'bundler'
require 'releasy'

Releasy::Project.new do
  name "Plane Game"
  version "2.2"

  executable "lib/Main.rb"
  files "lib/**/*.rb", "resources/**/*.png"
  add_link "https://github.com/Chuckchuk/Plane-Game-V2.2"

  add_build :osx_app do
    url "com.github.Plane-Game-V2.2"
    wrapper "wrappers/gosu-mac-wrapper-0.7.41.tar.gz"
  end

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
