//
//  ListsTableViewController.swift
//  ToDoVer2
//
//  Created by robinsos on 26/01/2015.
//  Copyright (c) 2015 robinsos. All rights reserved.
//

import UIKit
import CoreData

class ListsTableViewController: UITableViewController {
    var lists = [List]()
    
    @IBAction func enableTableEditing(sender: AnyObject) {
        self.tableView.setEditing(true, animated: true);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
        var newList1 = List(title: "my first list", timestamp: NSDate(), listID: "tempIDList1")
        lists.append(newList1)
        
        var newList2 = List(title: "my second list", timestamp: NSDate(), listID: "tempIDList2")
        lists.append(newList2)

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return lists.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("listCell", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        cell.textLabel?.text = lists[indexPath.row].title
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        var secondScene = segue.destinationViewController as ListItemsTableViewController
        // Pass the selected object to the new view controller.
        
        if let indexPath = self.tableView.indexPathForSelectedRow() {
            let selectedList = lists[indexPath.row]
            secondScene.currentList = selectedList.title
            
        }
        
    }
    
    
    @IBAction func showListCreator(sender: UIButton) {
        
        let addItemAlertViewTag = 0
        let addItemTextAlertViewTag = 1
        
        var stringPlaceholder = "this is placeholder"
        
        var titlePrompt = UIAlertController(title: "Enter List Title",
            message: nil,
            preferredStyle: .Alert)
        
        var titleTextField: UITextField?
        titlePrompt.addTextFieldWithConfigurationHandler {
            (textField) -> Void in
            titleTextField = textField
            textField.placeholder = "Title"
        }
        
        titlePrompt.addAction(UIAlertAction(title: "Ok",
            style: .Default,
            handler: { (action) -> Void in
                if let textField = titleTextField {
                    if(countElements(textField.text) > 0) {
                        
                        println(textField.text)
                       
                    } else {
                        // cancel item
                    }
                    
                }
        }))
        
        titlePrompt.addAction(UIAlertAction(title: "Cancel",
            style: .Cancel,
            handler: { (action) -> Void in
                // cancel item
        }))
        
        
        self.presentViewController(titlePrompt,
            animated: true,
            completion: nil)
        
    }

    
    
    
    
    
    
}
