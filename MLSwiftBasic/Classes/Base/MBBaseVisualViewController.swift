//
//  MBBaseVisualViewController.swift
//  MLSwiftBasic
//
//  Created by 张磊 on 15/7/19.
//  Copyright (c) 2015年 MakeZL. All rights reserved.
//

import UIKit

class MBBaseVisualViewController: MBBaseViewController {

    var tableView:UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        var  scrollOffset:CGFloat = scrollView.contentOffset.y;
        let hv = tableView!.tableHeaderView as! MBBaseVisualHeaderView
        if (scrollOffset < 0) {
            hv.height = hv.minimumHeight! - scrollOffset;
        } else {
            hv.height = hv.minimumHeight!
        }
        hv.setNeedsUpdateConstraints()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
