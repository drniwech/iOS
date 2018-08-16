//
//  ShowDetailViewController.swift
//  zakool
//
//  Created by Niwech Harnkham on 6/1/16.
//  Copyright © 2016 EKSPERTSOFT, LLC. All rights reserved.
//

import UIKit
import SafariServices

class ShowDetailViewController: UIViewController {

    @IBOutlet weak var schoolLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var totalInstateOnCampusLabel: UILabel!
    @IBOutlet weak var totalInstateOffCampusLabel: UILabel!
    @IBOutlet weak var totalOffStateOnCampusLabel: UILabel!
    @IBOutlet weak var totalOffStateOffCampusLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    
    var school: School!
    
    override func viewDidLoad() {
        //self.title = "\(school.name)"
        schoolLabel.text = "\(school.name)"
        addressLabel.text = "Address: \(school.street), \(school.city), \(school.state) \(school.zipcode)"
        websiteLabel.text = "\(school.url)"
        phoneLabel.text = "Phone: \(school.phone)"
        categoryLabel.text = "Degree: \(ZakoolUtils.HELPER.getCategoryDescription(school.category))"
        typeLabel.text = "Institution Type: \(ZakoolUtils.HELPER.getTypeDescription(school.type))"
        sizeLabel.text = "Institution Size: \(ZakoolUtils.HELPER.getSizeDescription(school.size))"
        totalInstateOnCampusLabel.text = "Total In-State On Campus: $\(school.totalPriceInStateOnCampus)"
        totalInstateOffCampusLabel.text = "Total In-State Off Campus: $\(school.totalPriceInStateOffCampus)"
        totalOffStateOnCampusLabel.text = "Total Out-Of-State On Campus: $\(school.totalPriceOffStateOnCampus)"
        totalOffStateOffCampusLabel.text = "Total Out-Of-State Off Campus: $\(school.totalPriceOffStateOffCampus)"
        levelLabel.text = "Level of institution: \(ZakoolUtils.HELPER.getLevelDescription(school.level))"
    }
    
    @IBAction func openLink(sender: UIButton) {
        if let nsurl = NSURL (string: "http://\(school.url)"){
            let vc = SFSafariViewController(URL: nsurl, entersReaderIfAvailable: true)
            presentViewController(vc, animated: true, completion: nil)
        }
    }

}
