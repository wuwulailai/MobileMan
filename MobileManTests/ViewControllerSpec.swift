//
//  ViewControllerSpec.swift
//  MobileManTests
//
//  Created by wubaolai on 2019/7/22.
//  Copyright © 2019 wubaolai. All rights reserved.
//

import Quick
import Nimble
@testable import MobileMan

class ViewControllerSpec: QuickSpec {

    override func spec() {
        
        var viewController : ViewController!
        
        beforeEach { () -> Void in
            
            viewController = ViewController()
       
        }
        
        // #1
        describe(".viewDidLoad()", { () -> Void in
            
            beforeEach({ () -> () in
                
                // 方法1: 访问控制器的view,来触发控制器的 .viewDidLoad()
                let _ = viewController.view
            })
            
            it("get time", closure: { () -> () in
                let temp = ViewController.getFormatPlayTime(secounds: 238923484873)
                expect(temp).to(equal("10.0"))
            })
        })
    }

}
