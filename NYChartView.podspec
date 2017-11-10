#
#  Be sure to run `pod spec lint NYChartView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|


  s.name         = "NYChartView"
  s.version      = "0.0.1"
  s.summary      = "利用collectionview封装的柱状图"

  s.homepage     = "https://github.com/JanyGee/NYChartView"

  s.license             = { :type => "MIT", :file => 'LICENSE' }

  s.author             = { "Jany" => "1321899953@qq.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/JanyGee/NYChartView.git", :tag => "#{s.version}" }

  s.source_files  = "NYChartView", "NYChartView/**/*.{h,m}"
  s.requires_arc = true


end
