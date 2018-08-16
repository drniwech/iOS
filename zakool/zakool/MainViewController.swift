//
//  MainViewController.swift
//  zakool
//
//  Created by Niwech Harnkham on 5/26/16.
//  Copyright © 2016 EKSPERTSOFT, LLC. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate  {

    @IBOutlet weak var minTextField: UITextField!
    @IBOutlet weak var maxTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var items = [School]()
    
    @IBAction func minSlider(sender: UISlider) {
        minTextField.text = Int(sender.value).description
    }
    
    @IBAction func maxSlider(sender: UISlider) {
        maxTextField.text = Int(sender.value).description
    }
    
    @IBAction func search() {
        activityIndicator.startAnimating()
        self.items.removeAll()
        self.loadData()
    }
    
    override func viewDidLoad() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        //automatic resize table view row
        self.tableView!.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        //set UITextFieldDelegate
        self.minTextField.delegate = self
        self.maxTextField.delegate = self
    }
    
    //Dismiss keyboard when press done
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func loadData() {
        RestApiFactory.FACTORY.search(minTextField.text!, max: maxTextField.text!) { (json: JSON) in
            if let results = json.array {
                for entry in results {
                    self.items.append(School(json: entry))
                }
                dispatch_async(dispatch_get_main_queue(),{
                    self.tableView.reloadData()
                    self.activityIndicator.stopAnimating()
                })
            }
        }

    }
    
    private struct Storyboard{
        static let CellReuseIdentifier = "CELL"
        static let showDetailSegueIdentifier = "showDetailSegue"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        //CELL is the TableViewCell identifier. This string tell iOS which prototype to copy or reuse.
        var cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.CellReuseIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: Storyboard.CellReuseIdentifier)
        }
        let school = self.items[indexPath.row]
        //Title
        cell!.textLabel?.text = "\(school.name)"
        //Subtitle
        //cell!.detailTextLabel?.text = "$\(school.totalPriceInStateOnCampus)/year. \(ZakoolUtils.HELPER.getCategoryDescription(school.category)). State: \(school.state)"
        cell!.detailTextLabel?.text = "$\(school.totalPriceInStateOnCampus)/year. \(ZakoolUtils.HELPER.getLevelDescription(school.level)). State: \(school.state)"

        return cell!
    }
    
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Storyboard.showDetailSegueIdentifier{
            if let showDetailViewController = segue.destinationViewController as? ShowDetailViewController{
                if let schoolIndex = tableView.indexPathForSelectedRow?.row{
                    showDetailViewController.school = self.items[schoolIndex]
                }
            }
        }

    }


}

