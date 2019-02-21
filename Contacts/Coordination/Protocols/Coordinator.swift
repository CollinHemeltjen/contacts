//
//  Coordinator.swift
//  Contacts
//
//  Created by Collin Hemeltjen on 21/02/2019.
//  Copyright © 2019 Collin Hemeltjen. All rights reserved.
//

import UIKit

protocol Coordinator {
	var childCoordinators: [Coordinator] { get set }
	var navigationController: UINavigationController { get set }
	
	func start()
}
