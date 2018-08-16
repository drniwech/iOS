//
//  StringUtils.swift
//  zakool
//
//  Created by Niwech Harnkham on 6/3/16.
//  Copyright © 2016 EKSPERTSOFT, LLC. All rights reserved.
//

import Foundation

class ZakoolUtils: NSObject {
    
    static let HELPER = ZakoolUtils()
    
    //Institutional category (HD2014)
    func getCategoryDescription(category: String) -> String{
        switch category {
        case "1" :
            return "Degree-granting, graduate with no undergraduate degrees"
        case "2" :
            return "Degree-granting, primarily baccalaureate or above"
        case "3" :
            return "Degree-granting, not primarily baccalaureate or above"
        case "4" :
            return "Degree-granting, associate's and certificates"
        case "5" :
            return "Nondegree-granting, above the baccalaureate"
        case "6" :
            return "Nondegree-granting, sub-baccalaureate"

        default:
            return "Not Applicable"
        }
    }
    
    //Control of institution (HD2014)"
    func getTypeDescription(type: String) -> String{
        switch type {
        case "1" :
            return "Public"
        case "2" :
            return "Private not-for-profit"
        case "3" :
            return "Private for-profit"
            
        default:
            return "Not Applicable"
        }
    }
    
    //"Institution size category (HD2014)"
    func getSizeDescription(size: String) -> String{
        switch size {
        case "1" :
            return "Under 1,000"
        case "2" :
            return "1,000 - 4,999"
        case "3" :
            return "5,000 - 9,999"
        case "4" :
            return "10,000 - 19,999"
        case "5" :
            return "20,000 and above"
            
        default:
            return "Not Applicable"
        }
    }
    
    //"Level of institution (HD2014)"
    func getLevelDescription(level: String) -> String {
        switch level {
        case "1" :
            return "Four or more years"
        case "2" :
            return "At least 2 but less than 4 years"
        case "3" :
            return "Less than 2 years (below associate)"
            
        default:
            return "Not Applicable"
        }
    }
    

}