#
# Be sure to run `pod lib lint Moyaf.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Moyaf'
  s.version          = '0.8.2'
  s.summary          = 'Simple abstraction layer based on AFNetworking.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Moyaf is abstraction layer based on AFNetworking and for someone like me who sitting yet on Objective-C.
It's inspired by Moya for Alamofire.
                       DESC

  s.homepage         = 'https://github.com/skyofdwarf/Moyaf'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'skyofdwarf' => 'skyofdwarf@gmail.com' }
  s.source           = { :git => 'https://github.com/skyofdwarf/Moyaf.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Moyaf/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Moyaf' => ['Moyaf/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'AFNetworking', '~> 3.1'
end
