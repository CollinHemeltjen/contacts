//
//  MainCoordinator.swift
//  Contacts
//
//  Created by Collin Hemeltjen on 21/02/2019.
//  Copyright © 2019 Collin Hemeltjen. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
	var childCoordinators = [Coordinator]()
	var navigationController: UINavigationController
	
	init(navigationController: UINavigationController){
		self.navigationController = navigationController
		navigationController.navigationBar.prefersLargeTitles = true
	}
	
	func start() {
		let vc = TableViewController.instantiate()
		vc.coordinator = self
		navigationController.pushViewController(vc, animated: false)
	}

	func showDetail(item: String) {
		let vc = DetailViewController.instantiate()
		vc.coordinator = self
		vc.item = item
		navigationController.pushViewController(vc, animated: true)
	}
}
