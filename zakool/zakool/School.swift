//
//  School.swift
//  dummy
//
//  Created by Niwech Harnkham on 5/27/16.
//  Copyright © 2016 EKSPERTSOFT, LLC. All rights reserved.
//

import Foundation

class School {

    var schoolCode : String!
    var name: String!
    var street: String!
    var city: String!
    var state: String!
    var zipcode: String!
    var category: String!
    var totalPriceInStateOnCampus: String!
    var totalPriceInStateOffCampus: String!
    var totalPriceOffStateOnCampus: String!
    var totalPriceOffStateOffCampus: String!
    var url: String!
    var phone: String!
    var type: String!
    var size: String!
    var level: String!
    var accreditation: String!
    
    required init(json: JSON){
        schoolCode = json["schoolCode"].stringValue
        name = json["name"].stringValue
        street = json["street"].stringValue
        city = json["city"].stringValue
        state = json["state"].stringValue
        zipcode = json["zipcode"].stringValue
        category = json["category"].stringValue
        totalPriceInStateOnCampus = json["totalPriceInStateOnCampus"].stringValue
        totalPriceInStateOffCampus = json["totalPriceInStateOffCampus"].stringValue
        totalPriceOffStateOnCampus = json["totalPriceOffStateOnCampus"].stringValue
        totalPriceOffStateOffCampus = json["totalPriceOffStateOffCampus"].stringValue
        url = json["url"].stringValue
        phone = json["phone"].stringValue
        type = json["type"].stringValue
        size = json["size"].stringValue
        level = json["level"].stringValue
        accreditation = json["accreditation"].stringValue
    }
}