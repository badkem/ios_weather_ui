//
//  WeatherButton.swift
//  hello-word
//
//  Created by Rio Cheng on 04/05/2021.
//

import SwiftUI;

struct WeatherButtonView: View {
    var title: String
    var body: some View {
        Text(title).font(.system(size: 20, weight: .semibold, design: .default))
            .frame(width: 280, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.white)
            .foregroundColor(.black)
            .cornerRadius(12)
    }
}
