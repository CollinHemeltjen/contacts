//
//  DetailViewController.swift
//  Contacts
//
//  Created by Collin Hemeltjen on 21/02/2019.
//  Copyright © 2019 Collin Hemeltjen. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController, Storyboarded {
	weak var coordinator: MainCoordinator?
	var item: String?
	
	@IBOutlet weak var detailLabel: UILabel!
	
	override func viewDidLoad() {
		detailLabel.text = item
	}
}
