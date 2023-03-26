//
//  ContentView.swift
//  FollowCount
//
//  Created by Junior Leoncio on 10/12/22.
//

import SwiftUI

// MARK: - VIEW
struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        
        VStack {
            
            ProfileDataView()
            ActionView()
            
        }
        .environmentObject(viewModel)
        .animation(.easeInOut, value: viewModel.isFollowing)
       
    }
}

struct ActionView: View {
    
    @EnvironmentObject var viewModel: ContentViewModel
    
    var body: some View {
        VStack {
            
            // Seguir ----
            Button{ viewModel.followToggle() } label: {
                Label(!viewModel.isFollowing ? "follow" : "unfollow", systemImage: "heart.circle.fill")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(!viewModel.isFollowing ? .blue : .black)
            
            // Enviar Mensagem
            Button{} label: {
                Label("submit message", systemImage: "paperplane.fill")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .disabled(!viewModel.isFollowing)
        }
        .padding(20)
    }
}

struct ProfileDataView: View{
    
    @EnvironmentObject var viewModel: ContentViewModel
    
    var body: some View {
        // View ----
        Image(viewModel.user.picture)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 250, height: 250)
            .clipped()
            .clipShape(Circle())
            .padding(.bottom, 10)
        
        Text(viewModel.user.name)
            .font(.system(size: 25, weight: .bold))
        
        Text(viewModel.user.nick)
            .foregroundColor(.gray)
            .font(.system(size: 20, weight: .regular))
        
        Text(viewModel.userFollowers)
            .font(.system(size: 80, weight: .light))
            .padding(viewModel.isFollowing ? 40 : 25)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
