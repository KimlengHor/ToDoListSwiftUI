//
//  NoItemsView.swift
//  ToDoList
//
//  Created by Kimleng Hor on 3/30/23.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animated: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack {
                Text("No tasks")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add button and a bunch of items to your to do list!")
                    .padding(.bottom, 20)
                NavigationLink(destination: AddView()) {
                    Text("Add task")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animated ? secondaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animated ? 30 : 50)
                .shadow(
                    color: animated ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: animated ? 30 : 10,
                    x: 0,
                    y: animated ? 50 : 10)
                .scaleEffect(animated ? 1.1 : 1.0)
                .offset(y: animated ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animated else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeOut(duration: 2.0)
                    .repeatForever()
            ) {
                animated.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("Title")
        }
    }
}
