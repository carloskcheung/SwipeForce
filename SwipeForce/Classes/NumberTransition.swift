//
//  NumberTransition.swift
//  SwipeForce
//
//  Created by Nan Chen on 6/24/15.
//  Copyright (c) 2015 SwipeForce. All rights reserved.
//

import UIKit

class NumberTransition: BaseTransition {
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        var numberVC = fromViewController as! NumberViewController
        var cardVC = toViewController as! MainCardViewController
        
        toViewController.view.alpha = 0
        
        UIView.animateWithDuration(duration, animations: {
            toViewController.view.alpha = 1
       //     numberVC.numberBubble.center = cardVC.passBubble.center
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        fromViewController.view.alpha = 1
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }

}
