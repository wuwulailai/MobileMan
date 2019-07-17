//
//  ViewController.swift
//  MobileMan
//
//  Created by wubaolai on 2019/7/17.
//  Copyright © 2019 wubaolai. All rights reserved.
//

import UIKit
import SystemServices

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // 设备信息
        let share = SystemServices.shared()
        
        print("用户名 : \(UIDevice.current.name)") // 设备名称
        print("设备型号 : \(share.systemDeviceTypeNotFormatted ?? "")")
        print("设备类型 : \(UIDevice.current.model)")
        print("系统版本 : \(UIDevice.current.systemVersion)")
        print("UUID : \(String(describing: UIDevice.current.identifierForVendor!))")
        print("物理分辨率 : \(UIScreen.main.currentMode?.size.width ?? 0) * \(UIScreen.main.currentMode?.size.height ?? 0)")
        print("设计分辨率 : \(UIScreen.main.bounds.size.width) * \(UIScreen.main.bounds.size.height)")
        
        
//        print("设备尺寸 : \(device.screenRatio)")
//        print("设备重量 : \(device.screenRatio)")
        let systemUptime = ViewController.getFormatPlayTime(secounds: ProcessInfo.processInfo.systemUptime)
        print("设备已开机 : \(systemUptime)")
        
        print("==============================")
        // CPU信息
        print("CPU名称 : \(share.totalMemory/1024.0)G")
        print("CPU型号 : \(share.purgableMemoryinRaw/1024)G")
        print("CPU架构 : \(share.activeMemoryinRaw/1024.0)G")
        print("CPU核心数 : \(share.inactiveMemoryinRaw/1024)G")
        print("GPU架构 : \(share.freeMemoryinRaw/1024)G")
        print("GPU核心数 : \(share.totalMemory/1024.0)G")
        print("当前CPU主频 : \(share.purgableMemoryinRaw/1024)G")
        print("最大CPU主频 : \(share.activeMemoryinRaw/1024.0)G")
        print("CPU使用百分比 : \(share.inactiveMemoryinRaw/1024)G")
        print("CPU空闲百分比 : \(share.freeMemoryinRaw/1024)G")
        
        print("缓存单元 : \(share.activeMemoryinRaw/1024.0)G")
        print("一级指令缓存 : \(share.inactiveMemoryinRaw/1024)G")
        print("一级数据缓存 : \(share.freeMemoryinRaw/1024)G")
        print("二级缓存 : \(share.activeMemoryinRaw/1024.0)G")
        print("页大小 : \(share.inactiveMemoryinRaw/1024)G")
        print("对齐方式 : \(share.freeMemoryinRaw/1024)G")
        
        // 内存信息
        print("==============================")
        print("内存大小 : \(share.totalMemory/1024.0)G")
        print("联动内存 : \(share.purgableMemoryinRaw/1024)G")
        print("活跃内存 : \(share.activeMemoryinRaw/1024.0)G")
        print("不活跃内存 : \(share.inactiveMemoryinRaw/1024)G")
        print("空闲内存 : \(share.freeMemoryinRaw/1024)G")
        
        // 电池信息
        print("==============================")
        print("电池容量 : \(share.totalMemory/1024.0)G")
        print("电池电压 : \(share.purgableMemoryinRaw/1024)G")
        print("电池电量 : \(share.activeMemoryinRaw/1024.0)G")
        print("低电模式 : \(share.inactiveMemoryinRaw/1024)G")
        
        print("===============================")
        print("实际容量 : \(share.freeMemoryinRaw/1024)G")
        print("电池健康值 : \(share.freeMemoryinRaw/1024)G")
        
        print("===============================")
        print("预计可用 : \(share.totalMemory/1024.0)G")
        print("可通电话 : \(share.purgableMemoryinRaw/1024)G")
        print("可蜂窝上网 : \(share.activeMemoryinRaw/1024.0)G")
        print("可WiFi上网 : \(share.inactiveMemoryinRaw/1024)G")
        print("可拍照片 : \(share.totalMemory/1024.0)G")
        print("可听音乐 : \(share.purgableMemoryinRaw/1024)G")
        print("可看电影 : \(share.activeMemoryinRaw/1024.0)G")
        print("可玩游戏 : \(share.inactiveMemoryinRaw/1024)G")
        
        // 存储信息
        print("存储大小 : \(share.totalMemory/1024.0)G")
        print("可使用存储 : \(share.purgableMemoryinRaw/1024)G")
        print("空闲存储 : \(share.activeMemoryinRaw/1024.0)G")
        
        // 网络信息
        
    }


}

extension ViewController {
    class func getFormatPlayTime(secounds:TimeInterval)->String{
        if secounds.isNaN{
            return "00:00"
        }
        var Min = Int(secounds / 60)
        let Sec = Int(secounds.truncatingRemainder(dividingBy: 60))
        var Hour = 0
        if Min>=60 {
            Hour = Int(Min / 60)
            Min = Min - Hour*60
            return String(format: "%02d:%02d:%02d", Hour, Min, Sec)
        }
        return String(format: "00:%02d:%02d", Min, Sec)
    }
    
}
