#
# Be sure to run `pod lib lint YJDLNA.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YJDLNA'
  s.version          = '0.1.1'
  s.summary          = 'DLNA投屏'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  DLNA投屏,支持各大主流盒子互联网电视.
                       DESC

  s.homepage         = 'https://github.com/YongTaiSin/YJDLNA'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yangjian' => '971175049@qq.com' }
  s.source           = { :git => 'https://github.com/YongTaiSin/YJDLNA.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'
  s.static_framework = true
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  
  s.source_files = 'YJDLNA/Classes/**/*'
  
  s.libraries = 'icucore', 'c++', 'z', 'xml2'
  
  s.dependency 'CocoaAsyncSocket', '7.6.3'
  
  s.xcconfig = {'ENABLE_BITCODE' => 'NO',
      'HEADER_SEARCH_PATHS' => '${SDKROOT}/usr/include/libxml2',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }
end
