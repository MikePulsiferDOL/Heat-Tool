//
//  MoreInfoController.swift
//  Heat Tool
//
//  Created by E J Kalafarski on 1/23/15.
//  Copyright (c) 2015 OSHA. All rights reserved.
//

import UIKit

class MoreInfoController: UITableViewController {
    
    let moreInfoItems = ["Signs and Symptoms","First Aid","More Detail","Contact OSHA","About This App"];
    let moreInfoImages = ["moreinfo_signs","moreinfo_firstAid","moreinfo_more","moreinfo_contact","moreinfo_about"];
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moreInfoItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("infoCell") as UITableViewCell
        
        cell.textLabel!.text = moreInfoItems[indexPath.row]
        
        var imageName = UIImage(named: moreInfoImages[indexPath.row])
        cell.imageView!.layer.masksToBounds = true
        cell.imageView!.layer.cornerRadius = 7.0
        cell.imageView!.image = imageName
        
        return cell
    }
    
    @IBAction func dismissMoreInfo(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "webViewSegue" {
            if let indexPath = tableView.indexPathForSelectedRow() {
                let destinationViewController = segue.destinationViewController as WebViewController
                destinationViewController.infoContent = moreInfoItems[indexPath.row]
            }
        }
    }
    
}
