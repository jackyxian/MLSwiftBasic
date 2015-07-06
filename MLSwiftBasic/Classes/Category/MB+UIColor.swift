//
//  MB+UIColor.swift
//  MakeBolo
//
//  Created by 张磊 on 15/6/23.
//  Copyright (c) 2015年 MakeZL. All rights reserved.
//

import UIKit

extension UIColor{
    convenience init(rgba :String) {
        var scanner = NSScanner(string: rgba)
        var hexNum = 0 as UInt32
        
        if (scanner.scanHexInt(&hexNum)){
            var r = (hexNum >> 16) & 0xFF
            var g = (hexNum >> 8) & 0xFF
            var b = (hexNum) & 0xFF
            
            self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
        }else{
            self.init()
        }
    }
}