//
//  ListRowView.swift
//  TodoList1
//
//  Created by Ujjwal Arora on 21/08/24.
//

import SwiftUI

struct ListRowView: View {
    let item : ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ?  "checkmark.circle.fill" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()

        }
    }
}
struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListRowView(item: ItemModel(title: "1st row", isCompleted: false))
            ListRowView(item: ItemModel(title: "2nd row", isCompleted: true))
        }
    }
}

