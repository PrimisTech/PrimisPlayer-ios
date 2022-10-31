Pod::Spec.new do |s|
    s.name = 'PrimisPlayer'
    s.version = '1.7.0'
    s.summary = 'Primis Player for iOS'
    s.description = <<-DESC
    Primis is a global Video Discovery platform that increases revenue for publishers by helping users discover high-quality video content.
                         DESC

    s.homepage = 'https://github.com/PrimisTech/PrimisPlayer-ios'
    s.license = { :type => 'MIT', :file => 'LICENSE.txt' }
    s.author = { 'Primis' => 'mobile@primis.tech' }
    s.source = { :http => 'https://github.com/PrimisTech/PrimisPlayer-ios/releases/download/1.7.0/PrimisPlayer.xcframework.zip', :type => "zip" }

    s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'}
    s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'}
    s.ios.deployment_target = '10.0'
    s.frameworks = 'WebKit', 'UIKit'

    s.vendored_frameworks = 'PrimisPlayer.xcframework'
end
