//
//  ListItemsTableViewController.swift
//  ToDoVer2
//
//  Created by robinsos on 26/01/2015.
//  Copyright (c) 2015 robinsos. All rights reserved.
//

import UIKit

class ListItemsTableViewController: UITableViewController, UITableViewDelegate {
    
    var listItems = [ListItem]()
    
    var currentList : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var myNewList = currentList!
        
        //viewController.title = "some title"(myNewList)
        self.title = myNewList
        
        var newListItem1 = ListItem(title: "My first list item", timestamp: NSDate(), listID: "tempIDList1")
        listItems.append(newListItem1)
        
        var newListItem2 = ListItem(title: "My second list item", timestamp: NSDate(), listID: "tempIDList1")
        listItems.append(newListItem2)
        
        
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
        return listItems.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("listItemCell", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        cell.textLabel?.text = listItems[indexPath.row].title
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    // Delegate funcitons - selection
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if(cell?.accessoryType == UITableViewCellAccessoryType.Checkmark) {
            //deselect
            cell?.accessoryType = UITableViewCellAccessoryType.None
            cell?.backgroundColor = UIColor.whiteColor()
            cell?.textLabel?.textColor = UIColor.blackColor()
            
        } else {
            //select
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            cell?.backgroundColor = UIColor(red:0.769, green:0.859, blue:0.941, alpha:1) /*#c4dbf0*/
            cell?.textLabel?.textColor = UIColor.grayColor()
           
        }
        
    }

}
