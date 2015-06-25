
//
//  DetailViewController.swift
//  swipeforce
//
//  Created by Carlos Cheung on 6/13/15.
//  Copyright (c) 2015 carloscheung. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var passName: String!
    var passPhoto: UIImage!
    var passColor: UIColor!
    var passBackgroundImage: UIImage!
    var passBackgroundImageOverlay: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var cardBackgroundView: UIView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var backgroundImageOverlay: UIView!
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var actionBar: UIView!
    @IBOutlet weak var mailButton: UIView!
    @IBOutlet weak var phoneButton: UIImageView!
    @IBOutlet weak var noteButton: UIImageView!
    
    @IBOutlet weak var personalInfoCard: UIView!
    @IBOutlet weak var personalInfoPanel: UIView!
    @IBOutlet weak var leadInfoCard: UIView!
    @IBOutlet weak var leadInfoPanel: UIView!
    @IBOutlet weak var contactInfoCard: UIView!
    @IBOutlet weak var contactInfoPanel: UIView!
    
    @IBOutlet weak var actionButtonsView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    weak var mainCardViewController: MainCardViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.photoImage.alpha = 0
        self.nameLabel.alpha = 0
        self.personalInfoPanel.alpha = 0
        self.leadInfoPanel.alpha = 0
        self.phoneButton.alpha = 0
        self.mailButton.alpha = 0
        self.noteButton.alpha = 0
        //self.actionBar.alpha = 0
        
        scrollView.contentSize = CGSizeMake(320, 700)
        
        var darkBlur = UIBlurEffect(style: UIBlurEffectStyle.Light)
        var blurView = UIVisualEffectView(effect: darkBlur)
        blurView.frame = backgroundView.bounds
        backgroundView.addSubview(blurView)
        
        nameLabel.text = passName
        photoImage.image = passPhoto
        cardBackgroundView.backgroundColor = passColor
        
        photoImage.layer.borderWidth = 3.0
        photoImage.layer.masksToBounds = false
        photoImage.layer.borderColor = UIColor.whiteColor().CGColor
        photoImage.layer.cornerRadius = self.photoImage.frame.size.width / 2
        photoImage.clipsToBounds = true
        
        backgroundImage.image = self.photoImage.image
        backgroundImage.transform = CGAffineTransformMakeScale(2, 2)
        backgroundImageOverlay.backgroundColor = cardBackgroundView.backgroundColor
        backgroundImageOverlay.alpha = 0.3
        
        createGradient(view: actionButtonsView)
        
        personalInfoCard.layer.cornerRadius  = 10.0
        leadInfoCard.layer.cornerRadius  = 10.0
        contactInfoCard.layer.cornerRadius  = 10.0
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.4, delay: 0, options: nil, animations: { () -> Void in
            self.photoImage.center.y = self.photoImage.center.y - 5
            self.photoImage.alpha = 1
            self.nameLabel.center.y = self.nameLabel.center.y - 5
            self.nameLabel.alpha = 1
            self.personalInfoPanel.center.y = self.personalInfoPanel.center.y - 5
            self.personalInfoPanel.alpha = 1
            self.leadInfoPanel.center.y = self.leadInfoPanel.center.y - 5
            self.leadInfoPanel.alpha = 1
            self.contactInfoPanel.center.y = self.contactInfoPanel.center.y - 5
            self.contactInfoPanel.alpha = 1
            self.mailButton.center.y = self.mailButton.center.y - 5
            self.mailButton.alpha = 1
            self.phoneButton.center.y = self.phoneButton.center.y - 5
            self.phoneButton.alpha = 1
            self.noteButton.center.y = self.noteButton.center.y - 5
            self.noteButton.alpha = 1
            
            }, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createGradient(view aView: UIView) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = CGRectMake(0.0, 0.0, aView.frame.size.width, aView.frame.size.height)
        gradient.colors = [UIColor(red: 0.0/255.0, green: 0.0/255.0, blue:   0.0/255.0, alpha: 0.0).CGColor, UIColor(red: 0.0/255.0, green: 0.0/255.0,   blue: 0.0/255.0, alpha: 0.5).CGColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        aView.layer.insertSublayer(gradient, atIndex:0)
    }
    
    @IBAction func onTapDone(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onTapAccept(sender: UITapGestureRecognizer) {
        dismissViewControllerAnimated(true, completion: { () -> Void in
            self.mainCardViewController.onTapAccept(sender)
        })
    }
    
    @IBAction func onTapReject(sender: UITapGestureRecognizer) {
        dismissViewControllerAnimated(true, completion: { () -> Void in
            self.mainCardViewController.onTapRejected(sender)
        })
    }
    
    @IBAction func onTapLater(sender: UITapGestureRecognizer) {
        dismissViewControllerAnimated(true, completion: { () -> Void in
            self.mainCardViewController.onTapLater(sender)
        })
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