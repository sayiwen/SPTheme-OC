#
# Be sure to run `pod lib lint SPTheme.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SPTheme'
  s.version          = '0.1.1'
  s.summary          = 'A theme helper for app'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Provide SPColor,SPSize
                       DESC

  s.homepage         = 'https://github.com/sayiwen/SPTheme-OC'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sayiwen' => 'sayiwen@163.com' }
  s.source           = { :git => 'https://github.com/sayiwen/SPTheme-OC.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'SPTheme/Classes/**/*'
  
   s.resource_bundles = {
     'SPTheme' => ['SPTheme/Assets/*.plist','SPTheme/Assets/*.ttf']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
