//
//  ContentView.swift
//  SwiftUI_SampleProjcet
//
//  Created by 최서연 on 2021/11/16.
//

import SwiftUI
import UIKit

struct ContentView: View {
  var body: some View {
    HomeView()
  }
}


struct HomeView: View {
  var body: some View {
    NavigationView {
      VStack {
        HomeHeader()
        HomeBody()
      }
    }
    .navigationBarHidden(true)
    .navigationBarBackButtonHidden(true)
  }
}


struct MyView: View {
  var body: some View {
    Text("a")
    Text("a")
    Spacer()
  }
}


struct HomeHeader: View {
  var body: some View {
    ZStack {
      Text("SafeToGo")
        .fontWeight(.bold)
        .frame(maxWidth: .infinity, alignment: .center)
        .frame(height: 50)
        .background(Color(UIColor(hex: "EBEBEB")))
    

        NavigationLink {
          MenuView()
        } label: {
          Image(systemName: "list.bullet")
            .tint(.black)
            .padding(ㅠ)
        }
    }
    .navigationBarHidden(true)
    .navigationBarBackButtonHidden(true)
  }
}


struct HomeBody: View {
  var body: some View {
    VStack(spacing: 10) {
      Spacer()
      Text("간소화한 Safe2Go Pass ^3^")
        .fontWeight(.semibold)
      Spacer()
      HomeButton(text: "회원가입")
      HomeButton(text: "여행 등록")
      HomeButton(text: "검사 예약")
    }
    .padding()
  }
}


struct HomeButton: View {
  var text: String? = "테스트 버튼"
  
    init(text: String?) {
      self.text = text
    }
  
  var body: some View {
    Button {
      print("== Home 하단 버튼 액션 됨: \(self.text ?? "")")
    } label: {
      Text(text ?? "텍스트")
        .fontWeight(.medium)
        .foregroundColor(.black)
    }
    .modifier(SGButtonStyle())
    
  }
}

struct SGButtonStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding(12) // 뷰 가장자리부터 뷰 내부 아이템까지의 최소 거리
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 36, alignment: .center)
      .background(Color(UIColor(hex: "EBEBEB")))
      .cornerRadius(40)
      .overlay(RoundedRectangle(cornerRadius: 100)
                .stroke(Color.black, lineWidth: 1.3))
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}


struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}

struct HomeHeader_Previews: PreviewProvider {
  static var previews: some View {
    HomeHeader()
  }
}

struct HomeBody_Previews: PreviewProvider {
  static var previews: some View {
    HomeBody()
  }
}

struct HomeButton_Previews: PreviewProvider {
  static var previews: some View {
    HomeButton(text: "버튼 제목")
  }
}

extension UIColor {
  convenience init(hex:String, alpha: CGFloat = 1.0) {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    var rgbValue:UInt32 = 10066329 //color #999999 if string has wrong format
    
    if (cString.hasPrefix("#")) {
      cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) == 6) {
      Scanner(string: cString).scanHexInt32(&rgbValue)
    }
    
    self.init(
      red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
      alpha: alpha
    )
  }
}
