//
//  NameDataSource.swift
//  Contacts
//
//  Created by Collin Hemeltjen on 19/02/2019.
//  Copyright © 2019 Collin Hemeltjen. All rights reserved.
//

import Foundation

struct Section<T> {
	let letter : String
	let items : [T]
}

protocol DataSource {
	associatedtype T
	
	var sections: [Section<T>]! { get }

	func getItem(at item: Int, in section: Int) -> T
	func getSection(_ section: Int) -> [T]

	func numberOfSections() -> Int
	func rowsInSection(_ section: Int) -> Int

	func sectionTitles() -> [T]
	func titleForSection(_ section: Int) -> T
}

class NameDataSource: DataSource{
	typealias T = String
	
	internal var sections: [Section<String>]!
	
	init() {
		let data = _getData()
		
		let groupedDictionary = Dictionary(grouping: data, by: {String($0.prefix(1))})
		let keys = groupedDictionary.keys.sorted()

		sections = keys.map{ Section(letter: $0, items: groupedDictionary[$0]!.sorted()) }
	}
	
	func getItem(at item: Int, in section: Int) -> String {
		return sections[section].items[item]
	}
	
	func numberOfSections() -> Int {
		return sections.count
	}
	
	func sectionTitles() -> [String] {
		return sections.map{$0.letter}
	}
	
	func titleForSection(_ section: Int) -> String {
		return sections[section].letter
	}
	
	func getSection(_ section: Int) -> [String] {
		return sections[section].items
	}
	
	func rowsInSection(_ section: Int) -> Int {
		return sections[section].items.count
	}
	
	private func _getData() -> [String] {
		let path = Bundle.main.path(forResource: "NamesList", ofType: "txt")
		guard let text = try? String(contentsOfFile: path!, encoding: .utf8) else {
			return [String]()
		}
		
		return text.components(separatedBy: ",")
	}
	

}
