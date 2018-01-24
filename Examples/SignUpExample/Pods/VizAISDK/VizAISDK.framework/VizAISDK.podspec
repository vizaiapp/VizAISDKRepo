Pod::Spec.new do |s|  
    s.name              = 'VizAISDK'
    s.version           = '1.0.16'
    s.summary           = 'An SDK for classifying emotion from the front-facing camera and uploading data for the vizAI service.'
    s.homepage          = 'http://vizaiapp.github.io/'

    s.author            = { 'Ethan Petersen' => 'ethanopetersen@gmail.com' }
    s.license           = { :type => 'Apache-2.0', :file => 'LICENSE' }

    s.platform          = :ios
    s.source            = { :http => 'https://cdn.rawgit.com/vizaiapp/VizAISDKRepo/v1.0.16/VizAISDK.zip' }

    s.ios.deployment_target = '11.2'
    s.ios.vendored_frameworks = 'VizAISDK.framework'
    s.cocoapods_version = '>= 1.4.beta.2'
    s.static_framework = true

    s.dependency 'Firebase/Auth'
    s.dependency 'Firebase/Core'
    s.dependency 'Firebase/Database'
    s.dependency 'Firebase/Storage'
end
