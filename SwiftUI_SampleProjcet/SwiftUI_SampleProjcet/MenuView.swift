//
//  MenuVieww.swift
//  SwiftUI_SampleProjcet
//
//  Created by 최서연 on 2021/11/18.
//

import SwiftUI


struct MenuModel: Hashable, Codable, Identifiable {
  var id = UUID()
  let menu: Menu
  let subMenu: [SubMenu]
  
  enum Menu: String, Codable {
    case testingCenter
    case customerService
    case additionalInfo
    
    func text() -> String {
      switch self {
      case .testingCenter: return "코로나19 검사센터"
      case .customerService: return "고객센터"
      case .additionalInfo: return "추가정보"
      }
    }
  }
  
  enum SubMenu: String, Codable, Identifiable {
    // 새로 만듦
    
    var id: Self { self }
    
    case entryRequirements
    case testingCenterAirport
    case priceOfTest
    case availableTimesForResults
    case howToUse
    
    case notice
    case faq
    case customerCenter
    
    case testinCenterLocal
    
    func text() -> String {
      switch self {
      case .entryRequirements: return "입국 조건"
      case .testingCenterAirport: return "공항검사센터안내"
      case .priceOfTest: return "검사 비용"
      case .availableTimesForResults: return "이용방법"
      case .howToUse: return "검사결과확인 가능시간"
        
      case .notice: return "공지사항"
      case .faq: return "자주 묻는 질문(FAQ)"
      case .customerCenter: return "고객센터"
        
      case .testinCenterLocal: return "지역별 검사센터 정보"
      }
    }
  }
}
  
  
  let menus: [MenuModel] = [
    MenuModel(menu: .testingCenter, subMenu: [.entryRequirements, .testingCenterAirport, .priceOfTest, .howToUse, .availableTimesForResults]),
    MenuModel(menu: .customerService, subMenu: [.notice, .faq, .customerCenter]),
    MenuModel(menu: .additionalInfo, subMenu: [.testinCenterLocal])
  ]

  
struct MenuView: View {
  var body: some View {
    VStack(spacing: 0) {
      MenuHeader()
      MenuBody()
    }
      .navigationBarHidden(true)
      .navigationBarBackButtonHidden(true)
  }
}

struct MenuHeader: View {
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  
  var body: some View {
    ZStack {
      VStack(alignment: .leading) {
        Button {
          self.presentationMode.wrappedValue.dismiss()
        } label: {
          Image(systemName: "xmark")
            .padding(.leading, 24)
            .padding(.top, 15)
            .tint(.black)
        }
        Spacer()
        Text("메뉴")
          .font(.system(size: 24))
          .fontWeight(.bold)
          .padding(.bottom, 15)
          .padding(.leading, 24)
      }
      .frame(maxWidth: .infinity,maxHeight: 100, alignment: .leading)
      .background(Color(UIColor(hex: "EBEBEB")))
      
    }
    .navigationBarHidden(true)
    .navigationBarBackButtonHidden(true)
  }
}

struct MenuBody: View {
  var body: some View {
    
    List {
      ForEach(menus) { menu in
        Section(header: MenuListHeader(text: menu.menu.text())) {
          ForEach(menu.subMenu) { submenu in
            NavigationLink(destination: MenuDetailView(title: submenu.text())) {
              MenuListRow(text: submenu.text())
            }
            .listRowSeparator(.hidden)
          }
        }
      }
    }
    .listStyle(.plain)
  }
}

//
//struct MenuBody: View {
//  var body: some View {
//
//    List {
//      Section(header: MenuListHeader(text: "헤더 1")) {
//        MenuListRow(text: "항목 1")
//        MenuListRow(text: "항목 2")
//        MenuListRow(text: "항목 3")
//        MenuListRow(text: "항목 4")
//      }
//
//      Section(header: MenuListHeader(text: "헤더 2")) {
//        MenuListRow(text: "항목 1")
//        MenuListRow(text: "항목 2")
//        MenuListRow(text: "항목 3")
//        MenuListRow(text: "항목 4")
//      }
//    }
//    .listStyle(.plain)
//  }
//}

struct MenuListHeader: View {
  
  var text: String?
  
  var body: some View {
    Text(text ?? "")
      .font(.system(size: 24))
      .fontWeight(.bold)
      .padding(.leading, 10)
      .foregroundColor(.black)
  }
}

struct MenuListRow: View {
  
  var text: String?
  
  var body: some View {
    Text(text ?? "")
      .font(.system(size: 17))
      .fontWeight(.light)
      .padding(.leading, 30)
      .foregroundColor(.black)
  }
}

struct MenuView_Previews: PreviewProvider {
  static var previews: some View {
    MenuView()
  }
}

struct MenuHeader_Previews: PreviewProvider {
  static var previews: some View {
    MenuHeader()
  }
}

struct MenuBody_Previews: PreviewProvider {
  static var previews: some View {
    MenuBody()
  }
}
