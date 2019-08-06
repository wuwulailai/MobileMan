//
//  calcAreaSpec.swift
//  MobileManTests
//
//  Created by wubaolai on 2019/7/22.
//  Copyright © 2019 wubaolai. All rights reserved.
//

import Quick
import Nimble
@testable import MobileMan

class calcAreaSpec: QuickSpec {
    override func spec() {
        
        var calcArea : CalcArea!
        
        beforeEach { () -> Void in
            calcArea = CalcArea()
        }
        
        describe("Calc", { () -> Void in
            it("first ", closure: { () -> () in
                let area = calcArea.calculateAreaOfSquare(w: 10, h: 10)
                print("area: \(area)")
                expect(area).to(equal(100.0))
            })
        })
    }
    

}
