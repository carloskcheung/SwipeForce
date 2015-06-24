//
//  AccountViewController.swift
//  swipeforce
//
//  Created by Nan Chen on 6/20/15.
//  Copyright (c) 2015 carloscheung. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController, SFRestDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        dismissViewControllerAnimated(false, completion: nil)
    }

    // CARLOS MARK: - IBAction Methods -- LOGOUT
    
    @IBAction func logoutButtonPressed(sender: AnyObject) {
        SFAuthenticationManager.sharedManager().logoutAllUsers()
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
