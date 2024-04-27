//
//  UITableView+Extension.swift
//  My_Posts
//
//  Created by VAIBHAV JOSHI on 26/04/24.
//

import Foundation
import UIKit

extension UITableView {
    func register(identifier: String) {
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
}
