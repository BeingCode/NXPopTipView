Pod::Spec.new do |spec|
  spec.name         = "NXPopTipView"
  spec.version      = "0.0.1"
  spec.summary      = "一个灵活的、高度自定义的TipView"
  spec.homepage     = "https://github.com/BeingCode/NXPopTipView"
  spec.license      = "MIT"
  spec.author       = { "angel" => "zx57885161@outlook.com" }
  spec.platform     = :ios, "9.0"
  spec.swift_version = "5.0"
  spec.source       = { :git => "https://github.com/BeingCode/NXPopTipView.git", :tag => "#{spec.version}" }
  spec.framework    = "UIKit"
  spec.source_files  = "NXPopTipView/*.{h,m}"
  spec.requires_arc = true
end