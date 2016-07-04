#
# Be sure to run `pod lib lint WXYFlux-OC.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "WXYFlux-OC"
  s.version          = "0.0.1"
  s.summary          = " "

  s.description      = " "

  s.homepage         = "https://github.com/wuxulome/WXYFlux-OC.git"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "wuxu" => "wuxulome@gmail.com" }
  s.source           = { :git => "https://github.com/wuxulome/WXYFlux-OC.git", :tag => s.version.to_s }

  s.platform     = :ios, '6.0'
  s.ios.deployment_target = "6.0"
  s.requires_arc = true

  s.source_files = 'WXYFlux-OC/*.{h,m}'

  s.frameworks = 'Foundation'
  
end
