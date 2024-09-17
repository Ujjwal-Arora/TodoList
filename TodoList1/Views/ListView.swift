//
//  ListView.swift
//  TodoList1
//
//  Created by Ujjwal Arora on 21/08/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel : ListViewModel
    
    var body: some View {
        VStack{
        if listViewModel.items.isEmpty {
            NoItemsView()
                .transition(.opacity.animation(.easeIn))
        }else{
            List{
                ForEach(listViewModel.items){ item in
                    ListRowView(item: item)
                        .onTapGesture{
                            withAnimation(.linear){
                                listViewModel.updateItem(item: item)
                            }
                        }
                }.onDelete(perform: listViewModel.delete)
                    .onMove(perform: listViewModel.moveRow)
            }
        }

        }.navigationTitle("Todo List 📝")
            .listStyle(.plain)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Add", destination: AddView())
                }
            }
    }
    
}

#Preview {
    NavigationView{
        ListView()
    }.environmentObject(ListViewModel())
    
}
