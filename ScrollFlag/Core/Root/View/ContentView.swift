//
//  ContentView.swift
//  ScrollFlag
//
//  Created by Anton Gerasimov on 28.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel = ContentViewModel()
    
    var body: some View {
        ScrollViewReader { scrollProxy in
            Spacer()
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(viewModel.countries) { item in
                        Image(item.imageName)
                            .resizable()
                            .frame(width: 90, height: 80)
                            .id(item.id)
                    }
                }
                .padding()
                .frame(width: 110,height: 110)
                .onReceive(viewModel.timer) { _ in
                    viewModel.receive()
                }
                .onChange(of: viewModel.currentIndex, { withAnimation(.spring(duration: 0.5)) {
                    scrollProxy.scrollTo(viewModel.countries[viewModel.currentIndex].id, anchor: .top)
                }
                })
                .onAppear() {
                    viewModel.stopTimer()
                }
            }
            .background(.black.opacity(0.1))
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.black, lineWidth: 5)
            )
            
            Spacer()
            Button("Press to scroll", action: viewModel.startScroll)
                .frame(maxWidth: .infinity, minHeight: 42)
                .cornerRadius(10)
                .background(.blue)
                .foregroundColor(.white)
                .padding()
            
        }
    }
    

    
}
    

#Preview {
    ContentView()
}
