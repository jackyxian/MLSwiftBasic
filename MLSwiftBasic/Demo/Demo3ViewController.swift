//
//  Demo3ViewController.swift
//  MLSwiftBasic
//
//  Created by 张磊 on 15/7/6.
//  Copyright (c) 2015年 MakeZL. All rights reserved.
//

import UIKit

class Demo3ViewController: MBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavBarViewBackgroundColor(UIColor.blueColor())
    }
    
    override func titleImg() -> String {
        return "makezl.jpeg"
    }
    
    override func rightTitles() -> NSArray {
        return ["M", "L"]
    }
    
    override func rightClickAtIndexBtn(button: UIButton) {
        println("点击了btn")
        println(button)
    }
    
}
