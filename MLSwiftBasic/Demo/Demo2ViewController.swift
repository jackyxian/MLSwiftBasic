//
//  Demo2ViewController.swift
//  MLSwiftBasic
//
//  Created by 张磊 on 15/7/6.
//  Copyright (c) 2015年 MakeZL. All rights reserved.
//

import UIKit

class Demo2ViewController: MBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavBarViewBackgroundColor(UIColor.clearColor())
        self.setupBgView()
    }
    
    func setupBgView(){
        var imageView = UIImageView(frame: self.view.bounds)
        imageView.image = UIImage(named : "di-tu")!
        imageView.blurImage()
        self.view.insertSubview(imageView, atIndex: 0)
    }
    
    
    

}
