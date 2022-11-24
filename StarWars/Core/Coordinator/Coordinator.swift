//
//  Coordinator.swift
//  StarWars
//
//  Created by Wandeep Basra on 23/11/2022.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
