# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'MobileMan' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MobileMan
  pod 'RxSwift'
  pod 'RxCocoa'

  # UI
  ## toast, alert, refresh,nav
  pod 'MJRefresh'
  pod 'SVProgressHUD'
  pod 'PopupDialog'
  pod 'Toast-Swift'
  
  # UI 约束
  pod 'SnapKit'
  
  # 网络
  pod 'HandyJSON'
  pod 'Alamofire'
  
  # 系统
  pod 'SystemServices'
  
  # 数据库
 pod 'SQLite.swift'
  
  # bugly
  pod 'Bugly'
    
  # log
  pod 'XCGLogger'
  
  # 命令行
  # pod 'Swiftline'
  
  # 代码质量检测
  pod 'SwiftLint'
  
  # 单元测试
  target 'MobileManTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Quick'
    pod 'Nimble'
  end

  target 'MobileManUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

post_install do |installer_representation|
  installer_representation.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['CLANG_ENABLE_CODE_COVERAGE'] = 'NO'
      config.build_settings['COMPILER_INDEX_STORE_ENABLE'] = 'NO'
      config.build_settings['ENABLE_BITCODE'] = 'NO'
    end
  end
end

