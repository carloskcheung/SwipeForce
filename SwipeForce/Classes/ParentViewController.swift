//
//  ParentViewController.swift
//  TestForce
//
//  Created by Carlos Cheung on 6/22/15.
//  Copyright (c) 2015 TestForce. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController, SFRestDelegate {
    
    var allCardData : [LeadModel] = []
    //var allCardData: [LeadModel]?
    
    var index : Int = 0;
    // everytime swipe index : int x+4?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let restAPI = SFRestAPI.sharedInstance()
        let request = restAPI.requestForQuery("SELECT Id, Name, Email, Status, Company, Phone, Fax, MobilePhone, Title, LeadSource, CreatedDate, City, State, LastActivityDate FROM Lead ORDER BY Name LIMIT 20")
        // OFFSET 20 --> SQL nth query look it up -- when you finish 20 you get more

        SendClass.doThatThing(request, withDelegate: self)
    }

    
    
    // MARK: - SFRestDelegate Methods
    func request(request: SFRestRequest!, didLoadResponse dataResponse: AnyObject!) {
        
        //parse the JSON data response
        if let records = dataResponse.objectForKey("records") as? NSArray {
            println("request:didLoadResponse: number records = \(records.count)")
            
//            var answerArray = [LeadModel]()
            for record in records {
                var sfdcid = record.objectForKey("Id") as? String
                var name = record.objectForKey("Name") as? String
                var email = record.objectForKey("Email") as? String
                var company = record.objectForKey("Company") as? String
                var phone = record.objectForKey("Phone") as? String
                var fax = record.objectForKey("Fax") as? String
                var mobilephone = record.objectForKey("MobilePhone") as? String
                var title = record.objectForKey("Title") as? String
                var leadsource = record.objectForKey("LeadSource") as? String
                var createddate = record.objectForKey("CreatedDate") as? String
                var status = record.objectForKey("Status") as? String
                var city = record.objectForKey("City") as? String
                var state = record.objectForKey("State") as? String
                var lastactivitydate = record.objectForKey("LastActivityDate") as? String
                
                
                var lead = LeadModel(sfdcid: sfdcid, name: name, email: email, company: company, phone: phone, fax: fax, mobilephone: mobilephone, title: title, leadsource: leadsource, createddate: createddate, status: status, city: city, state: state, lastactivitydate: lastactivitydate)
                allCardData.append(lead)
                
                
                println("Card data \(record) !")
                
            }
        }
    }
    
    
    
    
    
    func request(request: SFRestRequest!, didFailLoadWithError error: NSError!) {
        println("request:didFailLoadWithError:")
    }
    
    func requestDidCancelLoad(request: SFRestRequest!) {
        println("requestDidCancelLoad:")
    }
    
    func requestDidTimeout(request: SFRestRequest!) {
        println("requestDidTimeout:")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onLogin(sender: AnyObject) {
            performSegueWithIdentifier("load2MainCardSegue", sender: nil)
        
    }
    
    
    @IBAction func logoutButtonPressed(sender: AnyObject) {
        SFAuthenticationManager.sharedManager().logoutAllUsers()
    }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
           if (segue.identifier == "load2MainCardSegue") {
            var cardVC = segue.destinationViewController as! MainCardViewController
            cardVC.parent = self
            
            }
    }

}
