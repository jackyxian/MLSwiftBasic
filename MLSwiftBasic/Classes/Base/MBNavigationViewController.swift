//  github: https://github.com/MakeZL/MLSwiftBasic
//  author: @email <120886865@qq.com>
//
//  MBNavigationViewController.swift
//  MakeBolo
//
//  Created by 张磊 on 15/6/22.
//  Copyright (c) 2015年 MakeZL. All rights reserved.
//

import UIKit

class MBNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        viewController.navigationController?.navigationBar.removeFromSuperview()
        super.pushViewController(viewController, animated: animated)
        self.setupRightBackAction(viewController)
        
        if self.tabBarController?.tabBar != nil{
            var childs = self.childViewControllers as NSArray
            self.tabBarController!.tabBar.hidden = (childs.indexOfObject(viewController) > 0)
        }
    }
    
    override func presentViewController(viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
        super.presentViewController(viewControllerToPresent, animated: flag, completion: nil)
        self.setupRightBackAction(viewControllerToPresent)
    }
    
    override func popViewControllerAnimated(animated: Bool) -> UIViewController? {
        
        let vc = super.popViewControllerAnimated(animated)
        
        var childs = self.childViewControllers as NSArray
        
        if self.tabBarController != nil{
            self.tabBarController!.tabBar.hidden = (childs.indexOfObject(vc!) > 0)
        }
        
//        if vc != nil{
//            if (self.view.subviews.last?.isKindOfClass(MBNavigationBarView.self) != nil) {
//                self.view.subviews.last?.removeFromSuperview()
//            }
//        }
        
        if self.tabBarController?.tabBar != nil{
            self.tabBarController!.tabBar.hidden = (childs.count > 0)
        }
        
        return vc;
    }
    
    func setupRightBackAction(viewController: UIViewController){

        if viewController.isKindOfClass(MBBaseViewController.self) && viewController.navigationController?.childViewControllers.count > 1 {
        
            var vc:MBBaseViewController = viewController as! MBBaseViewController
            
            vc.isBack = true
            vc = viewController as! MBBaseViewController
        }
    }
}
