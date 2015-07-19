//
//  MBBaseVisualHeaderView.swift
//  MLSwiftBasic
//
//  Created by 张磊 on 15/7/19.
//  Copyright (c) 2015年 MakeZL. All rights reserved.
//

import UIKit

class MBBaseVisualHeaderView: UIView {

    /// MARK: - properties
    private var imageName:String!
    var minimumHeight:CGFloat?{
        didSet{
            self.bounds.size.height = minimumHeight!
        }
    }
    
    private var heightsConstraints:[AnyObject]?
    lazy private var imageConstraintView:UIView! = {
        return UIView()
    }()
    lazy private var imageView:UIImageView! = {
        var imageView = UIImageView()
        imageView.contentMode = .ScaleAspectFill
        imageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        return imageView
    }()
    
    /// image container's height
    var height:CGFloat?{
        didSet{
            if height < minimumHeight {height = minimumHeight}
            if let c = self.heightsConstraints {
                self.removeConstraints(c)
            }
            heightsConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-(diff)-[imageConstraintView]-0-|", options: nil, metrics: ["diff":(minimumHeight! - height! - CGFloat(self.minimumHeight!) * 0.5)], views: ["imageConstraintView":self.imageConstraintView])
            self.addConstraints(heightsConstraints!)
        }
    }
    
    func setup(){
        self.imageView.image = UIImage(named: self.imageName)
        self.imageConstraintView.clipsToBounds = true
        self.imageConstraintView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.addSubview(self.imageConstraintView)
        self.imageConstraintView.addSubview(self.imageView)
        
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(0)-[imageConstraintView]-(0)-|", options: nil, metrics: nil, views: ["imageConstraintView":imageConstraintView]))
        
        self.heightsConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[imageConstraintView]-0-|", options: nil, metrics: nil, views: ["imageConstraintView":self.imageConstraintView])
        self.addConstraints(self.heightsConstraints!)
        
        self.imageConstraintView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(0)-[imageView]-(0)-|", options: nil, metrics: nil, views: ["imageView":self.imageView]))
        self.imageConstraintView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-(0)-[imageView]-(0)-|", options: nil, metrics: nil, views: ["imageView":self.imageView]))
        
    }
    
    class func headerView(#imageName:String,visualImageHeight height: CGFloat) -> MBBaseVisualHeaderView{
        // Asset
        assert((count(imageName) > 0), "Sorry , Please send imageName avg not empty.")
        var headerView = MBBaseVisualHeaderView()
        headerView.imageName = imageName
        headerView.minimumHeight = height
        headerView.setup()
        return headerView
    }

}
