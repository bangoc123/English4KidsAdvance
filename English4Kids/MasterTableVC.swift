//
//  MasterTableVC.swift
//  English4Kids
//
//  Created by Ngoc on 8/25/16.
//  Copyright © 2016 GDG. All rights reserved.
//

import UIKit

class MasterTableVC: UITableViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    
    var dicList = ["Fruits":"fruits.png", "Birthday":"birthdays", "Home":"homes.png", "Transportation": "transportation.png", "Book":"books.png"]

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dicList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        var arrayKey = Array(dicList.keys)
        
        cell.textLabel?.text = arrayKey[indexPath.row]
        
        cell.imageView?.image = UIImage(named: dicList["\(arrayKey[indexPath.row])"]!)

        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "ShowDetail"){
            
            let detailVC = segue.destinationViewController as! DetailViewController
            
            let selectedRowIndex: NSIndexPath = self.tableView.indexPathForSelectedRow!
            
            let selectedCell: UITableViewCell = self.tableView.cellForRowAtIndexPath(selectedRowIndex)!
            
            detailVC.stringTitle = selectedCell.textLabel?.text
            
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
 
}
