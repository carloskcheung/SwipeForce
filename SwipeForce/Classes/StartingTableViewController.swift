//
//  StartingTableViewController.swift
//  TestForce
//
//  Created by Carlos Cheung on 6/20/15.
//  Copyright (c) 2015 TestForce. All rights reserved.
//


import UIKit

class StartingTableViewController: UITableViewController, SFRestDelegate {
    
    // MARK: - Properties
    var rowData: [AccountModel]?
    
//    var dataRows = NSArray()
    
    // MARK: - UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let restAPI = SFRestAPI.sharedInstance()
        // let request = restAPI.requestForQuery("SELECT Id, Name FROM Account ORDER BY Name LIMIT 10")
        let request2 = restAPI.requestForQuery("SELECT Id, Name FROM Lead ORDER BY Name LIMIT 40")
//        SELECT Id, Name FROM Account ORDER BY Name LIMIT 10
//        SELECT Name From User LIMIT 10
        // SendClass.doThatThing(request, withDelegate: self)
        SendClass.doThatThing(request2, withDelegate: self)
        
//        SFRestAPI.sharedInstance().send(request, delegate: self)
        
        //Important Swift- Make sure to register table cell for a non storyboard apps like this one
//        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//
        
        
    }
    
    
    // MARK: - UITableViewDatasource Methods
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (rowData == nil) ? 0 : rowData!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BasicCell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = rowData?[indexPath.row].name
        
        return cell
    }
    
    
    // MARK: - SFRestDelegate Methods
    func request(request: SFRestRequest!, didLoadResponse dataResponse: AnyObject!) {
        
        //parse the JSON data response
        if let records = dataResponse.objectForKey("records") as? NSArray {
            println("request:didLoadResponse: number records = \(records.count)")
            
            var answerArray = [AccountModel]()
            for record in records {
                var sfdcid = record.objectForKey("Id") as? String
                var name = record.objectForKey("Name") as? String
//                var email = record.objectForKey("Email") as? String
                
                if ((sfdcid != nil) && (name != nil)) {
                    answerArray.append(AccountModel(sfdcid: sfdcid!, name: name!))
                    
                }
                
//                if ((sfdcid != nil) && (name != nil)) {
//                    answerArray.append(AccountModel(sfdcid: sfdcid!, name: name!, email: email!))
//                }
                
                
            }
            
            //if we got any records out of the JSON returned
            //set the list of them to the rowData for the table view
            if answerArray.count > 0 {
                rowData = answerArray
            }
        }
        
        //reload the table
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
        })
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
    
    
    // MARK: - IBAction Methods
    
    @IBAction func logoutButtonPressed(sender: AnyObject) {
        SFAuthenticationManager.sharedManager().logoutAllUsers()
    }
    
}














//import UIKit
//
//class StartingTableViewController: UITableViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//
//        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    // MARK: - Table view data source
//
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Potentially incomplete method implementation.
//        // Return the number of sections.
//        return 0
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete method implementation.
//        // Return the number of rows in the section.
//        return 0
//    }
//
//    /*
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell
//
//        // Configure the cell...
//
//        return cell
//    }
//    */
//
//    /*
//    // Override to support conditional editing of the table view.
//    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        // Return NO if you do not want the specified item to be editable.
//        return true
//    }
//    */
//
//    /*
//    // Override to support editing the table view.
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete {
//            // Delete the row from the data source
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//        } else if editingStyle == .Insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
//    }
//    */
//
//    /*
//    // Override to support rearranging the table view.
//    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
//
//    }
//    */
//
//    /*
//    // Override to support conditional rearranging of the table view.
//    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        // Return NO if you do not want the item to be re-orderable.
//        return true
//    }
//    */
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using [segue destinationViewController].
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
