//
//  Demo5ViewController.swift
//  MLSwiftBasic
//
//  Created by 张磊 on 15/7/19.
//  Copyright (c) 2015年 MakeZL. All rights reserved.
//

import UIKit

class Demo5ViewController: MBBaseVisualViewController,UITableViewDataSource,UITableViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavBarViewBackgroundColor(UIColor.clearColor())
        self.setupTableView()
    }
    
    func setupTableView(){
        var tableView = UITableView(frame: self.view.frame, style: .Plain)
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        self.view.insertSubview(tableView, atIndex: 0)
        self.tableView = tableView
        
        // MBBaseVisualHeaderView()
        var headerView = MBBaseVisualHeaderView.headerView(imageName: "pic", visualImageHeight: 200)
        tableView.tableHeaderView = headerView

        var mainImgView = UIImageView(frame: tableView.tableHeaderView!.frame)
        tableView.tableHeaderView!.addSubview(mainImgView)
        
        var authorImgView = UIImageView(frame: CGRectMake((self.view.frame.width - 80) * 0.5, 30, 80, 80))
        authorImgView.clipsToBounds = true
        authorImgView.image = UIImage(named: "makezl.jpeg")!
        authorImgView.layer.cornerRadius = 3.0
        authorImgView.layer.borderWidth = 1
        authorImgView.layer.borderColor = UIColor.whiteColor().CGColor
        mainImgView.addSubview(authorImgView)
        
        var authorLbl = UILabel(frame: CGRectMake(0, CGRectGetMaxY(authorImgView.frame) + MARGIN_8, self.view.frame.width, 20))
        authorLbl.textAlignment = .Center
        authorLbl.text = "MakeZL"
        authorLbl.shadowColor = UIColor.blackColor()
        authorLbl.shadowOffset = CGSizeMake(1, 1)
        authorLbl.font = UIFont.systemFontOfSize(15)
        authorLbl.textColor = UIColor.whiteColor()
        mainImgView.addSubview(authorLbl)
        
        authorLbl.sizeToFit()
        authorLbl.center = CGPointMake(self.view.frame.width * 0.5, authorLbl.center.y);
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "cell"
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = "Test - \(indexPath.row)"
        return cell
    }

}
