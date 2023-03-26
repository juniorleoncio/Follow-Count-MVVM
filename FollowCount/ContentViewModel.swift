//
//  ContentViewModel.swift
//  FollowCount
//
//  Created by Junior Leoncio on 10/12/22.
//

import Foundation

// MARK: - VIEWMODEL
class ContentViewModel: ObservableObject{
    
    @Published var isFollowing = false
    @Published var userFollowers = String()
    
    var user = User(picture: "luca",
                    name: "Luca Junior",
                    nick: "@luca",
                    followers: 536)
    
    init(){
        
        loadFollowers()
    }
    
    func loadFollowers(){
        
        userFollowers = customizeNumber(value: user.followers)
        
    }
    
    func customizeNumber(value: Double) -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "pt_BR")
        let shorten = formatter.string(for: value) ?? "0"
        return "\(shorten)M"
        
    }
    
    func followToggle(){
        
        isFollowing.toggle()
        isFollowing ? (user.followers += 1) : (user.followers -= 1)
        loadFollowers()
    }
    
    
}
