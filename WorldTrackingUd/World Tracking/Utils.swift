//
//  Utils.swift
//  World Tracking
//
//  Created by Wilson Campusano Jorge on 12/14/18.
//  Copyright © 2018 Wilson Campusano Jorge. All rights reserved.
//

import Foundation
import UIKit

class Util{
    static func randomNumbers(firstNum:CGFloat, secondNum:CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) +
        min(firstNum, secondNum)
    }
}

extension Int {
    var radians:Double {
        return Double(self) * .pi/180
    }
}
