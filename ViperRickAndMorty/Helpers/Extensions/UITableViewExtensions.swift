//
//  UITableViewExtensions.swift
//  ViperRickAndMorty
//
//  Created by Oğuzhan Kabul on 4.04.2022.
//

import UIKit

public extension UITableView {
    
    // swiftlint:disable fatal_error unavailable_function
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: Reuse {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func dequeueReusableCell<T: UITableViewCell>() -> T where T: Reuse {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    // swiftlint:enable fatal_error unavailable_function

}
