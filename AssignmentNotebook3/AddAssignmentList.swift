//
//  AddAssignmentList.swift
//  AssignmentNotebook3
//
//  Created by James on 3/17/23.
//

import SwiftUI

struct AddAssignmentView: View {
    @ObservedObject var assignmentList: AssignmentList
    @State private var course = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode
    static let courses =  ["Pre Calc", "Mobile Apps", "English", "French", "Physics"]
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Subjects", selection: $course) {
                    ForEach(Self.courses, id: \.self) { course in
                        Text(course)
                    }
                }
                TextField("Type Here", text: $description)
                DatePicker("Due Date", selection: $dueDate,
                           displayedComponents: .date)
            }
            .navigationBarTitle("Homework or Summatives", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save") {
                if course.count > 0 && description.count > 0 {
                    let item = AssignmentItem(id: UUID(), course: course,
                                              description: description, dueDate: dueDate)
                    assignmentList.items.append(item)
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}
    
    
    
    
    
    
    
    struct AddAssignmentView_Previews: PreviewProvider {
        static var previews: some View {
            AddAssignmentView(assignmentList: AssignmentList())
        }
    }

