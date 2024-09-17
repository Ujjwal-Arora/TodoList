//
//  AddView.swift
//  TodoList1
//
//  Created by Ujjwal Arora on 21/08/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel : ListViewModel
    @State private var textFieldText = ""
    @State private var showingAlert = false
    @State private var alertTitle = ""
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type new Item", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Button(action: saveButtonPressed) {
                    Text("SAVE")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius : 10))

                }
               
            }.padding(15)
        }.navigationTitle("Add an item 🖋️")
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("ok"){}
            }
    }
    func saveButtonPressed (){
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            dismiss()
        }
    }
    func textIsAppropriate() -> Bool{
        if textFieldText.trimmingCharacters(in: .whitespacesAndNewlines).count < 3 {
            alertTitle = "Write atleast 3 characters"
            showingAlert = true
            return false
        }
        return true
    }
}

#Preview {
    NavigationView{
        AddView()
    }.environmentObject(ListViewModel())
}
