//
//  ViewController.swift
//  Contacts
//
//  Created by Collin Hemeltjen on 19/02/2019.
//  Copyright © 2019 Collin Hemeltjen. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
	var dataSource = NameDataSource()

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dataSource.rowsInSection(section)
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
		cell.textLabel?.text = dataSource.getItem(at: indexPath.row, in: indexPath.section)
		return cell
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return dataSource.numberOfSections()
	}
	
	override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
		return dataSource.sectionTitles()
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return dataSource.titleForSection(section)
	}
}

