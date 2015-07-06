//
//  Demo1ViewController.swift
//  MLSwiftBasic
//
//  Created by 张磊 on 15/7/6.
//  Copyright (c) 2015年 MakeZL. All rights reserved.
//

import UIKit

class Demo1ViewController: MBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func titleStr() -> String {
        return "Demo1"
    }
    
    override func rightStr() -> String {
        return "右边按钮"
    }
    
    override func rightItemWidth() -> CGFloat {
        return 100
    }
    
}
