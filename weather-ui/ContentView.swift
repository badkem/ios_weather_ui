//
//  ContentView.swift
//  hello-word
//
//  Created by Rio Cheng on 03/05/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack{
                CityViewText(cityName: "TP.Huế")
                ScrollView(.vertical, showsIndicators: false) {
                    MainWeatherStatusView(imgName: isNight ? "moon.fill" : "cloud.sun.fill", temp: isNight ? 22 : 30)
                    VStack(spacing: 20){
                        Divider().background(Color.white)
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(){
                                WeatherDayView(dayOfWeek: "Bây giờ", imgName: "cloud.sun.fill", temp: 30)
                                WeatherDayView(dayOfWeek: "Thứ tư", imgName: "cloud.sun.fill", temp: 30)
                                WeatherDayView(dayOfWeek: "Thứ năm", imgName: "wind.snow", temp: 30)
                                WeatherDayView(dayOfWeek: "Thứ sáu", imgName: "sunset.fill", temp: 30)
                                WeatherDayView(dayOfWeek: "Thứ bảy", imgName: "sunset.fill", temp: 30)
                                WeatherDayView(dayOfWeek: "Chủ nhật", imgName: "sunset.fill", temp: 30)
                            }
                        }.padding(10).frame(height: 100)
                        Divider().background(Color.white)
                    }
                    VStack {
                        Text("Hôm nay: Điều kiện thời tiết có mây vài nơi với chỉ số cảm nhiệt là 34°. Nhiệt độ cao nhất sẽ là 38°. Đêm nay có mây vài nơi với nhiệt độ thấp là 22°")
                            .font(.system(size: 20, weight: .light, design: .default))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .padding(10)
                        Divider().background(Color.white)
                    }
                    VStack(alignment: .leading) {
                        HStack() {
                            VStack() {
                                Text("Mặt trời mọc").font(.system(size: 15, weight: .light, design: .default))
                                    .foregroundColor(.white)
                                Text("05:22").font(.system(size: 20, weight: .bold, design: .default))
                                    .foregroundColor(.white)
                            }.padding(10)
                            Spacer().frame(width: 70)
                            VStack {
                                Text("Mặt trời lặn").font(.system(size: 15, weight: .light, design: .default))
                                    .foregroundColor(.white)
                                Text("18:09").font(.system(size: 20, weight: .bold, design: .default))
                                    .foregroundColor(.white)
                            }
                        }
                        Divider().background(Color.white)
                    }
                    VStack(alignment: .leading) {
                        HStack() {
                            VStack() {
                                Text("Khả năng mưa").font(.system(size: 15, weight: .light, design: .default))
                                    .foregroundColor(.white)
                                Text("10%").font(.system(size: 20, weight: .bold, design: .default))
                                    .foregroundColor(.white)
                            }.padding(10)
                            Spacer().frame(width: 70)
                            VStack {
                                Text("Độ ẩm").font(.system(size: 15, weight: .light, design: .default))
                                    .foregroundColor(.white)
                                Text("62%").font(.system(size: 20, weight: .bold, design: .default))
                                    .foregroundColor(.white)
                            }
                        }
                        Divider().background(Color.white)
                    }
                    VStack(alignment: .leading) {
                        HStack() {
                            VStack() {
                                Text("Tầm nhìn xa").font(.system(size: 15, weight: .light, design: .default))
                                    .foregroundColor(.white)
                                Text("9,7 km" ).font(.system(size: 20, weight: .bold, design: .default))
                                    .foregroundColor(.white)
                            }.padding(10)
                            Spacer().frame(width: 70)
                            VStack {
                                Text("Chỉ số UV").font(.system(size: 15, weight: .light, design: .default))
                                    .foregroundColor(.white)
                                Text("1").font(.system(size: 20, weight: .bold, design: .default))
                                    .foregroundColor(.white)
                            }
                        }
                        Divider().background(Color.white)
                    }
                }
                Spacer()
                Button {
                    isNight.toggle()
                    print("tapped")
                } label: {
                    WeatherButtonView(title: "Change daytime")
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imgName: String
    var temp: Int
    var body: some View {
        VStack{
            Text(dayOfWeek).font(.system(size: 20, weight: .semibold, design: .default))
                .foregroundColor(.white)
            Image(systemName: imgName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("\(temp)°").font(.system(size: 20, weight: .semibold, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight : Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(
                        colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityViewText: View {
    var cityName: String
    var body: some View{
        Text(cityName).font(.system(size: 28, weight: .medium, design: .default))
            .foregroundColor(.white)
        Text("Có mây vài nơi").font(.system(size: 15, weight: .light, design: .default))
            .foregroundColor(.white)
    }
}

struct MainWeatherStatusView: View {
    var imgName: String
    var temp: Int
    var body: some View{
        
        Image(systemName: imgName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
        Text("\(temp)°").font(.system(size: 50, weight: .medium, design: .default))
            .foregroundColor(.white)
    }
}

