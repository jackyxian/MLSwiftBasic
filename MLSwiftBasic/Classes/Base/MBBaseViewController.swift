//
//  MBBaseViewController.swift
//  MakeBolo
//
//  Created by 张磊 on 15/6/14.
//  Copyright (c) 2015年 MakeZL. All rights reserved.
//

import UIKit

class MBBaseViewController: UIViewController,MBNavigationBarViewDelegate {

    var isBack:Bool{
        set{
            self.navBar.back = newValue;
        }
        
        get{
            return self.navBar.back
        }
    }
    
    lazy var navBar:MBNavigationBarView = {
        if self.view.viewWithTag(10000001) == nil {
            println(self)
            var navBar = MBNavigationBarView()
            navBar.tag = 10000001
            navBar.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, TOP_Y)
            navBar.delegate = self
            navBar.backgroundColor = NAV_BG_COLOR
            navBar.title = self.titleStr()
            navBar.leftStr = self.leftStr()
            navBar.rightStr = self.rightStr()
            
            if (self.rightTitles().count > 0) {
                navBar.rightTitles = self.rightTitles()
            }
            
            if (self.rightImgs().count > 0) {
                navBar.rightImgs = self.rightImgs()
            }
            
            self.view.insertSubview(navBar, atIndex: 0)
            if self.leftImg().isEmpty == false {
                navBar.leftImage = self.leftImg()
                navBar.leftButton.setImage(UIImage(named: self.leftImg()), forState: .Normal)
            }
            
            if self.titleImg().isEmpty == false {
                navBar.titleImage = self.titleImg()
                navBar.titleButton.setImage(UIImage(named: self.titleImg()), forState: .Normal)
            }
            
            if self.rightImg().isEmpty == false {
                navBar.rightImage = self.rightImg()
                navBar.rightButton.setImage(UIImage(named: self.rightImg()), forState: .Normal)
            }
            
            return navBar
        }
        
        return self.view.viewWithTag(10000001) as! MBNavigationBarView
    }()
    
    func titleStr() -> String {
        return "";
    }
    
    func leftStr() -> String {
        return "";
    }
    
    func rightStr() -> String {
        return "";
    }
    
    func titleImg() -> String {
        return "";
    }
    
    func leftImg() -> String {
        return "";
    }
    
    func rightImg() -> String {
        return "";
    }
    
    func rightImgs() -> NSArray {
        return []
    }
    
    func rightTitles() -> NSArray {
        return []
    }
    
    func rightItemWidth() -> CGFloat {
        return NAV_ITEM_RIGHT_W
    }
    
    func leftItemWidth() -> CGFloat {
        return NAV_ITEM_LEFT_W
    }
    
    // <#navigationNavBarView Delegate>
    func goBack() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func rightClickAtIndexBtn(button:UIButton){
        
    }
    
    func titleClick() {
        
    }
    
    func leftClick(){

    }
    
    func rightClick(){
        
    }
    
    func setNavBarViewBackgroundColor(color :UIColor){
        self.navBar.backgroundColor = color
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.removeFromSuperview()
        self.view.backgroundColor = BG_COLOR
        self.setupMenuClickEvent()
        self.setupNavItemWidthOrHeight()
    }
    
    func setupMenuClickEvent(){
        self.navBar.leftButton.addTarget(self, action:"leftClick", forControlEvents: .TouchUpInside)
        self.navBar.rightButton.addTarget(self, action:"rightClick", forControlEvents: .TouchUpInside)
        self.navBar.titleButton.addTarget(self, action: "titleClick", forControlEvents: .TouchUpInside)
        
        for (var i = 0; i < self.navBar.rightTitles.count; i++){
            self.navBar.rightTitles[i].addTarget(self, action: "rightClickAtIndexBtn:", forControlEvents: .TouchUpInside)
        }
    }
    
    func setupNavItemWidthOrHeight(){
        
        self.navBar.rightItemWidth = self.rightItemWidth()
        self.navBar.leftItemWidth = self.leftItemWidth()
    }
    
    func addBottomLineView(view :UIView) -> UIView {
        let lineView = UIView(frame: CGRectMake(0, CGRectGetMaxY(view.frame) - 1, view.frame.width, 1))
        lineView.backgroundColor = UIColor(red: 230.0/256.0, green: 230.0/256.0, blue: 230.0/256.0, alpha: 1.0)
        view.addSubview(lineView)
        return lineView
    }
}
