//
//  CategoryTableViewController.swift
//  PoqCategoryBrowser
//
//  Created by Zoran Plesko on 14/12/14.
//  Copyright (c) 2014 Masinerija. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController, APIManagerDelegate {
    
    var apiManager: APIManager?
    
    var tableData: [PoqCategoryModel]?
    
    var categoryId: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if apiManager==nil {
            apiManager = APIManager(delegate: self)
        }
        
        if categoryId == nil {
            apiManager!.getCategories(nil)
        }else{
            apiManager!.getCategories(categoryId!)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: APIManagerDelegate
    
    func fetchingCategoriesFailedWith(error: NSError) {
        //OOOPS!
    }
    
    func fetchingCategoriesSuccededWith(result: [PoqCategoryModel]?) {
        tableData = result;
        if let tableViewValue = tableView {
            tableViewValue.reloadData()
        }
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
        if let tableDataValue = tableData {
            return tableDataValue.count
        }else{
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 320.0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as MyTableViewCell

        // Configure the cell...
        if let tableDataValue = tableData {
            let categoryModel: PoqCategoryModel = tableDataValue[indexPath.row]
            cell.containerView!.setImageWith(categoryModel.thumbnailUrl, placeholderImage: nil)
            
            var center = cell.containerView!.center
            var frame = cell.containerView!.frame
            
            frame.size.width = categoryModel.thumbnailWidth
            frame.size.height = categoryModel.thumbnailHeight
            
            cell.containerView!.frame = frame
            cell.containerView!.center = center
            
            cell.myTextLabel!.text = categoryModel.title
            
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let tableDataValue = tableData {
            let categoryModel: PoqCategoryModel = tableDataValue[indexPath.row]
            let categoryId = categoryModel.categoryId
            
            if let subcategories = categoryModel.subCategories {
                
                if subcategories.count > 0 {
                
                    var nextViewController: CategoryTableViewController = self.storyboard!
                        .instantiateViewControllerWithIdentifier("CategoryTableViewController") as CategoryTableViewController
                    
                    nextViewController.categoryId = tableDataValue[indexPath.row].categoryId
                    
                    self.navigationController!.pushViewController(nextViewController, animated: true);
                }
                
            }
        }
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

}
