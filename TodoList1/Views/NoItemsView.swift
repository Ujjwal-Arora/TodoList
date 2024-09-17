//
//  NoItemsView.swift
//  TodoList1
//
//  Created by Ujjwal Arora on 22/08/24.
//

import SwiftUI

struct NoItemsView: View {
    @State private var animate = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Become productive. Just add new stuff so that we can help you become organised 🤩")
                    .padding(.bottom)
                NavigationLink(destination: AddView(), label: {
                    Text("Add something")
                        .font(.title2)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .background(animate ? secondaryAccentColor : Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
                .padding(.horizontal, animate ? 30 : 50)
                .scaleEffect(animate ? 1.1 : 1)
                .offset(y : animate ? -5 : 0)
                .shadow(color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7), radius: animate ? 30 : 10, x: 0.0, y: animate ? 50 : 30)
            }.multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }.frame(maxWidth: 450, maxHeight: .infinity)
    }
    func addAnimation(){
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            withAnimation(
                Animation
                    .easeInOut(duration: 1)
                    .repeatForever())
            {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView{
        NoItemsView()
            .navigationTitle("Title")
    }
}
