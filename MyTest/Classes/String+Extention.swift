//
//  String+Extention.swift
//  MyTest_Example
//
//  Created by edy on 2024/7/16.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import UIKit


extension  String {
    var intValue: Int {
        return (self as NSString).integerValue
    }

    var floateValue: CFloat  {
        return CFloat(Double(self) ?? 0)
    }
}
