//
//  Constants.swift
//  Movie_App
//
//  Created by VAIBHAV JOSHI on 19/04/24.
//

import Foundation
import SnackBar_swift


struct Constants {
    static let API_URL = "https://jsonplaceholder.typicode.com/"
    static let Detail_Page_Identifier = "PostDetailsVC"
    static let no_image = "no_image"
    static let media_type_video = "video"
    static let media_type_image = "image"
    static let play = "play"
    static let invalid_video_url = "Invalid video url"
}


func showSnackBar(message: String, view: UIView) {
    SnackBar.make(in: view, message: message, duration: .lengthShort).show()
}

