//
//  ViewController.swift
//  ScrollHover
//
//  Created by Victor Chee on 16/4/14.
//  Copyright © 2016年 Victor Chee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var hoverView: UIView!

    @IBOutlet weak var hoverTopConstraint: NSLayoutConstraint!

    func scrollViewDidScroll(scrollView: UIScrollView) {
        let topViewHeight = topView.frame.height
        let offsetY = scrollView.contentOffset.y
        
        if offsetY >= topViewHeight {
            hoverTopConstraint.constant = offsetY
        } else {
            hoverTopConstraint.constant = topViewHeight
        }
    }
}

