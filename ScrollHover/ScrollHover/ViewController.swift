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
    @IBOutlet weak var hoverBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var hiddenConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        let topViewHeight = topView.frame.height
        let offsetY = scrollView.contentOffset.y
        var hoverFrame = hoverView.frame
        
        if offsetY >= topViewHeight {
            hoverTopConstraint.active = false
            hoverBottomConstraint.active = false
            hiddenConstraint.active = true
            
            hoverFrame.origin.y = 0
            hoverView.frame = hoverFrame
            view.addSubview(hoverView)
        } else {
            hoverFrame.origin.y = topViewHeight
            hoverView.frame = hoverFrame
            scrollView.addSubview(hoverView)
            
            hiddenConstraint.active = false
            hoverTopConstraint.active = true
            hoverBottomConstraint.active = true
        }
    }
}

