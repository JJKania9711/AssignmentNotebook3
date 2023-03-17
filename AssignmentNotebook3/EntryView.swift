//
//  EntryView.swift
//  AssignmentNotebook3
//
//  Created by James on 3/17/23.
//import Foundation
import Foundation
class AssignmentList: ObservableObject {
    @Published var items : [AssignmentItem] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "data")
            }
        }
    }
    init() {
        if let items = UserDefaults.standard.data(forKey: "data") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([AssignmentItem].self, from: items) {
            self.items = decoded
            return
            
        }
    }
    items = []
 }
}

