//
//  SwiftUIView.swift
//  SugaryAI
//
//  Created by Raghad Mohammed Almarri on 10/09/1446 AH.
//

import SwiftUI




import SwiftUI

struct MainTabView: View {
    init() {
        // إزالة الخلفية الرمادية من `List`
        UITableView.appearance().backgroundColor = UIColor.clear
        // جعل شريط التبويبات رمادي
        UITabBar.appearance().backgroundColor = UIColor.systemGray5
    }

    var body: some View {
        TabView {
            SettingsView()
                .tabItem {
                    Image("setting") // أيقونة مخصصة
                        .renderingMode(.original)
                       // .renderingMode(.template)
                        .scaledToFit()
                        .frame(width: 24, height: 24) // ضبط الحجم الصحيح
                   // Text("Settings")
                }

            Text("Scan")
                .tabItem {
                    Image("scan") // أيقونة مخصصة
                        .renderingMode(.original)
                       // .renderingMode(.template)
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                  //  Text("Scan")
                }

            Text("Library")
                .tabItem {
                    Image("library") // أيقونة مخصصة
                        .renderingMode(.original)
                      //  .renderingMode(.template)
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    Text("Library")
                }
        }
        .accentColor(.blue) // جعل الأيقونة النشطة زرقاء
    }
}

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()

    var body: some View {
        VStack {
            VStack {
                Text("Settings")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Image("box1") // استبدله بالصورة الفعلية
                    .resizable()
                    .frame(width: 402, height: 200)
                    .padding(.bottom, -20)
            }
            .padding()
            
            List {
                Section(header: Text("MORE").font(.caption).foregroundColor(.gray)) {
                    ForEach(viewModel.options) { option in
                        Button(action: {
                            viewModel.handleAction(option.actionType)
                        }) {
                            SettingsRow(icon: option.iconName, text: option.title)
                                .listRowBackground(Color(.systemGray5)) // جعل الخلفية رمادية فاتحة
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .background(Color.white) // جعل الخلفية بيضاء بالكامل
        }
    }
}

// مكون لكل عنصر في القائمة
struct SettingsRow: View {
    let icon: String
    let text: String

    var body: some View {
        HStack {
            Text(text)
                .foregroundColor(.primary)
            Spacer()
            Image(systemName: icon)
                .foregroundColor(.blue)
        }
        .padding(.vertical, 8)
    }
}

// معاينة SwiftUI
struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
