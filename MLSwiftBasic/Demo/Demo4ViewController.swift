//  github: https://github.com/MakeZL/MLSwiftBasic
//  author: @email <120886865@qq.com>
//
//  Demo4ViewController.swift
//  MLSwiftBasic
//
//  Created by 张磊 on 15/7/6.
//  Copyright (c) 2015年 MakeZL. All rights reserved.
//

import UIKit

class Demo4ViewController: MBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTopView()
    }
    
    func setupTopView(){
        var view = UIView(frame: CGRectMake(0, TOP_Y, self.view.frame.width, 30))
        view.backgroundColor = UIColor.redColor()
        self.view.addSubview(view)
    }
    
    override func titleStr() -> String {
        return "Demo4"
    }

}
