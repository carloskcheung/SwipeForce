//
//  NumberViewController.swift
//  Pods
//
//  Created by Nan Chen on 6/22/15.
//
//

import UIKit

class NumberViewController: UIViewController {

    @IBOutlet weak var numberBubble: UIView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var radarImage: UIImageView!
    @IBOutlet weak var viewLeadsButton: UIButton!
    
    let blueColor = UIColor(red:0.02, green:0.51, blue:0.86, alpha:1)
    let greenColor = UIColor(red:0.16, green:0.7, blue:0.48, alpha:1)
    let orangeColor = UIColor(red:0.96, green:0.65, blue:0.14, alpha:1)
    let redColor = UIColor(red:0.76, green:0.35, blue:0.46, alpha:1)
  
    var Counter: Int = 0
    var Timer : NSTimer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberBubble.layer.masksToBounds = false
        numberBubble.layer.cornerRadius = self.numberBubble.frame.size.width / 2
        numberBubble.clipsToBounds = true

        numberLabel.text = String(Counter)
        viewLeadsButton.alpha = 0
                
        UIView.animateWithDuration(10, delay: 0, options: .Repeat, animations: { () -> Void in
            self.radarImage.transform = CGAffineTransformRotate(self.radarImage.transform, CGFloat(3.14))
        }, completion: nil)
        
        delay(0.5, { () -> () in
            self.Timer = NSTimer.scheduledTimerWithTimeInterval(0.08, target: self, selector: Selector("UpdateTimer"), userInfo: nil, repeats: true)
        })
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTapButton(sender: AnyObject) {
        UIView.animateWithDuration(0.4, delay: 0.2, options: nil, animations: { () -> Void in
            self.radarImage.alpha = 0
            }, completion: { (Bool) -> Void in
                UIView.animateWithDuration(0.4, delay: 0.4, options: nil, animations: { () -> Void in
                    self.performSegueWithIdentifier("number2CardSegue", sender: self)
                    }, completion: nil)
        })

    }
    
    func UpdateTimer() {
        numberLabel.text = String(Counter++)
        if numberLabel.text == String("36") {
            StopTimer()
            
            UIView.animateWithDuration(0.3, delay: 0, options: nil, animations: { () -> Void in
                self.numberLabel.transform = CGAffineTransformMakeScale(1.2, 1.2)
            }, completion: { (Bool) -> Void in
                self.numberLabel.transform = CGAffineTransformMakeScale(1, 1)
            })
        }
    }
    
    func StopTimer() {
        Timer.invalidate()
        viewLeadsButton.alpha = 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: (UIStoryboardSegue!), sender: AnyObject!) {
        if (segue.identifier == "number2CardSegue") {
 //           var cardVC = segue!.destinationViewController as! MainCardViewController;
//            cardVC.passNumber = numberLabel.text
//            cardVC.passBubble = numberBubble
        }
    }


}
