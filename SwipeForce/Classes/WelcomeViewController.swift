//
//  WelcomeViewController.swift
//  Dropbox Prototype
//
//  Created by Nan Chen on 5/10/15.
//  Copyright (c) 2015 Nan Chen. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {

    let blueColor = UIColor(red:0.02, green:0.51, blue:0.86, alpha:1)
    let greenColor = UIColor(red:0.16, green:0.7, blue:0.48, alpha:1)
    let orangeColor = UIColor(red:0.96, green:0.65, blue:0.14, alpha:1)
    let redColor = UIColor(red:0.76, green:0.35, blue:0.46, alpha:1)
    
    @IBOutlet weak var text1Label: UILabel!
    @IBOutlet weak var text2Label: UILabel!
    @IBOutlet weak var text3Label: UILabel!
    
    @IBOutlet weak var textView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var moon1Image: UIImageView!
    @IBOutlet weak var moon2Image: UIImageView!
    @IBOutlet weak var moon3Image: UIImageView!
    @IBOutlet weak var moon4Image: UIImageView!
    
    @IBOutlet weak var sun2Image: UIImageView!
    @IBOutlet weak var sun1Image: UIImageView!
    @IBOutlet weak var cloudImage: UIImageView!
    
    @IBOutlet weak var smartPhoneImage: UIImageView!
    @IBOutlet weak var appIcon: UIImageView!
    @IBOutlet weak var salesForceLogo: UIImageView!
    
    @IBOutlet weak var card4Image: UIImageView!
    @IBOutlet weak var card3Image: UIImageView!
    @IBOutlet weak var card2Image: UIImageView!
    @IBOutlet weak var card1Image: UIImageView!
    
    @IBOutlet weak var rejectStatusImage: UIImageView!
    @IBOutlet weak var laterStatusImage: UIImageView!
    @IBOutlet weak var acceptStatusImage: UIImageView!
    
    @IBOutlet weak var getStartedButton: UIButton!
    
    var phoneInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 960, height: 568)
        textView.backgroundColor = UIColor.whiteColor()
        scrollView.delegate = self
        
        moon1Image.alpha = 0
        moon2Image.alpha = 0
        moon3Image.alpha = 0
        moon4Image.alpha = 0
        text1Label.alpha = 1
        text2Label.alpha = 0
        text3Label.alpha = 0
        appIcon.alpha = 0
        salesForceLogo.alpha = 0
        card1Image.alpha = 0
        card2Image.alpha = 0
        card3Image.alpha = 0
        card4Image.alpha = 0
        acceptStatusImage.alpha = 0
        rejectStatusImage.alpha = 0
        laterStatusImage.alpha = 0
        getStartedButton.alpha = 0


        phoneInitialCenter = smartPhoneImage.center

        UIView.animateWithDuration(0.4, delay: 0.1, options: .CurveEaseOut, animations: {
            self.moon1Image.alpha = 1.0
            self.text1Label.alpha = 1
            self.text2Label.alpha = 0
            self.text3Label.alpha = 0
            
            self.smartPhoneImage.center = self.phoneInitialCenter

            }, completion: {_ in
                UIView.animateWithDuration(0.4, delay: 0.1, options: .CurveEaseOut, animations: {
                    self.moon2Image.alpha = 1.0
                    }, completion: {_ in
                        UIView.animateWithDuration(0.4, delay: 0.1, options: .CurveEaseOut, animations: {
                            self.moon3Image.alpha = 1.0
                            }, completion: {_ in
                                UIView.animateWithDuration(0.4, delay: 0.1, options: .CurveEaseOut, animations: {
                                    self.moon4Image.alpha = 1.0
                                    }, completion: {_ in
                                })
                        })
                })
        })
        
        sun2Image.alpha = 0
        sun1Image.alpha = 0


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        if pageControl.currentPage == 0 {
            UIView.animateWithDuration(0.4, delay: 0.1, options: .CurveEaseOut, animations: {
                self.moon1Image.alpha = 1.0
                self.text1Label.alpha = 1
                self.text2Label.alpha = 0
                self.text3Label.alpha = 0
                }, completion: {_ in
                    UIView.animateWithDuration(0.4, delay: 0.1, options: .CurveEaseOut, animations: {
                        self.moon2Image.alpha = 1.0
                        }, completion: {_ in
                            UIView.animateWithDuration(0.4, delay: 0.1, options: .CurveEaseOut, animations: {
                                self.moon3Image.alpha = 1.0
                                }, completion: {_ in
                                    UIView.animateWithDuration(0.4, delay: 0.1, options: .CurveEaseOut, animations: {
                                        self.moon4Image.alpha = 1.0
                                        }, completion: {_ in
                                    })
                            })
                    })
            })
            
            sun2Image.alpha = 0
            sun1Image.alpha = 0
            
        }
        
        else if pageControl.currentPage == 1 {
            UIView.animateWithDuration(20, delay: 0, options: .Repeat, animations: {
                self.cloudImage.center.x += self.view.bounds.width + 20
                }, completion: {_ in
            })
            
            UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: .CurveEaseOut, animations: {
                self.smartPhoneImage.center = CGPoint(x: 70, y: 380)
                self.smartPhoneImage.transform = CGAffineTransformMakeDegreeRotation(360)
                self.smartPhoneImage.transform = CGAffineTransformMakeScale(3, 3)
                }, completion: {_ in
                    UIView.animateWithDuration(0.5, delay: 0, options: nil, animations: {
                        self.appIcon.alpha = 1
                        self.appIcon.center = self.smartPhoneImage.center
                        }, completion: {_ in})
            })
            
            UIView.animateWithDuration(0.4, delay: 0.1, usingSpringWithDamping: 0.4, initialSpringVelocity: 1, options: .CurveEaseOut, animations: {
                self.sun1Image.alpha = 1.0
                self.sun1Image.center.y = 50
                self.sun2Image.center.y = 50
                
                self.text1Label.alpha = 0
                self.text2Label.alpha = 1
                self.text3Label.alpha = 0

                }, completion: {_ in
                    UIView.animateWithDuration(0.4, delay: 0.1, options: .CurveEaseOut, animations: {
                        self.sun2Image.alpha = 1.0
                        }, completion: {_ in
                    })
                    UIView.animateWithDuration(5, delay: 0, options: UIViewAnimationOptions.Repeat, animations: {
                        self.sun2Image.transform = CGAffineTransformMakeDegreeRotation(45)
                        }, completion: {_ in
                    })
            })
            
            moon1Image.alpha = 0
            moon2Image.alpha = 0
            moon3Image.alpha = 0
            moon4Image.alpha = 0
        }
        
        else if pageControl.currentPage == 2 {
            UIView.animateWithDuration(1, delay: 0, options: nil, animations: {
                self.salesForceLogo.center.x = 100
                self.salesForceLogo.alpha = 1
                }, completion: {_ in
            })
            
            UIView.animateWithDuration(0.4, delay: 0, options: nil, animations: {
                self.smartPhoneImage.center = CGPoint(x: 160, y: 380)
                self.smartPhoneImage.transform = CGAffineTransformMakeDegreeRotation(360)
                self.smartPhoneImage.transform = CGAffineTransformMakeScale(5, 5)
                    
                self.text1Label.alpha = 0
                self.text2Label.alpha = 0
                self.text3Label.alpha = 1
                self.getStartedButton.alpha = 1
                }, completion: {_ in
            
                    UIView.animateWithDuration(0.4, delay: 0, options: nil, animations: {
                        self.card1Image.alpha = 1
                        self.card2Image.alpha = 1
                        self.card3Image.alpha = 1
                        self.card4Image.alpha = 1

                        }, completion: {_ in
                    
                            UIView.animateWithDuration(0.2, delay: 0.2, options: nil, animations: {
                                self.acceptStatusImage.alpha = 1
                                }, completion: {_ in
                                    UIView.animateWithDuration(0.3, delay: 0.5, options: nil, animations: { () -> Void in
                                        self.card4Image.center.x += self.view.bounds.width * 1.3
                                        self.acceptStatusImage.center.x += self.view.bounds.width * 1.3
                                    }, completion: { (Bool) -> Void in
                                        
                                        UIView.animateWithDuration(0.2, delay: 0.1, options: nil, animations: {
                                            self.rejectStatusImage.alpha = 1
                                            }, completion: {_ in
                                                UIView.animateWithDuration(0.3, delay: 0.5, options: nil, animations: { () -> Void in
                                                    self.card3Image.center.x -= self.view.bounds.width * 1.3
                                                    self.rejectStatusImage.center.x -= self.view.bounds.width * 1.3
                                                    }, completion: { (Bool) -> Void in
                                                        
                                                        UIView.animateWithDuration(0.2, delay: 0.1, options: nil, animations: {
                                                            self.laterStatusImage.alpha = 1
                                                            }, completion: {_ in
                                                                UIView.animateWithDuration(0.3, delay: 0.5, options: nil, animations: { () -> Void in
                                                                    self.card2Image.center.y += self.view.bounds.height * 1.3
                                                                    self.laterStatusImage.center.y += self.view.bounds.height * 1.3
                                                                    }, completion: { (Bool) -> Void in
                                                                        
                                                                        
                                                                })
                                                        })

                                                        
                                                })
                                        })

                                    
                                    })
                            })
                            
                    })

            })
            
            moon1Image.alpha = 0
            moon2Image.alpha = 0
            moon3Image.alpha = 0
            moon4Image.alpha = 0
            sun2Image.alpha = 0
            sun1Image.alpha = 0
            cloudImage.alpha = 0
            appIcon.alpha = 0

            
        }

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
