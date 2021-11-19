//
//  MenuDetailView.swift
//  SwiftUI_SampleProjcet
//
//  Created by 최서연 on 2021/11/19.
//

import SwiftUI

struct MenuDetailView: View {
  
  var title: String?
  
  var body: some View {
    VStack {
      GeneralTopBar(title: title)
      Spacer()
    }
  }
}

struct MenuDetailView_Previews: PreviewProvider {
  static var previews: some View {
    MenuDetailView(title: "테스트")
  }
}

struct GeneralTopBar: View {
  
  init(title: String?) {
    self.title = title
  }
  
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  var title: String?
  
  var body: some View {
    ZStack {
      Text(title ?? "" )
      HStack() {
        Button {
          self.presentationMode.wrappedValue.dismiss()
        } label: {
          Image(systemName: "chevron.left")
        }
        .padding()
        .tint(.black)
        Spacer()
      }
    }
    .frame(height: 50)
    .background(Color(UIColor(hex: "EBEBEB")))
    .navigationBarHidden(true)
    .navigationBarBackButtonHidden(true)
  }
}
