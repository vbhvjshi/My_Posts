//
//  CommonFunctions.swift
//  Nasa_Images
//
//  Created by VAIBHAV JOSHI on 20/04/24.
//

import Foundation


func getURL(page: Int) -> String {
    return Constants.API_URL + "posts?_page=\(page))&_limit=10"
}
