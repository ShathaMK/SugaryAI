//
//  ContentView.swift
//  SugaryAI
//
//  Created by Shatha Almukhaild on 28/08/1446 AH.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView { // تغليف كل المحتوى داخل NavigationView
            ZStack {
                // الخلفية بتأثير متدرج
                LinearGradient(gradient: Gradient(colors: [
                    Color(red:0.38, green:0.41,blue:1),  // لون غامق في الأسفل
                    Color(red:0.23, green:0.25, blue:0.6) // لون فاتح في الأعلى
                ]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

                VStack {
                    // اللوجو واسم التطبيق
                    HStack {
                        Image("Logo") // استبدلها بالصورة في Assets
                            .resizable()
                            .scaledToFit()
                            .frame(width: 115.47, height: 107.04)
                            .padding(.leading,188)
                            .padding(.top, -30)

                        Text("SugaryAI")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)

                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 40)

                    Spacer()

                    // الصورة والنصوص
                    ZStack {
                        // الصورة الخلفية
                        Image("wave2") // تأكد من أن الصورة موجودة في Assets
                            .resizable()
                            .scaledToFit()
                            .frame(width: 700)
                            .padding(.bottom, 70)
                            .padding(.trailing, 100)

                        // النصوص فوق الصورة
                        VStack {
                            Text("Here For You")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.bottom, 160) // لتعديل المسافة بين النصوص

                            Text("Scan products, when ever you are.")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white.opacity(0.8))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                        .padding(.top,-60) // رفع النصوص فوق الصورة قليلاً
                    }

                    // زر Start باستخدام NavigationLink
                    NavigationLink(destination: HomeView()) { // الصفحة التالية
                        Text("Start")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 345, height: 54)
                            .background(Color(red:0.38, green:0.41,blue:1))
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                    }

                    Spacer(minLength: 30)
                }
            }
        }
    }
}

// الصفحة التالية بعد الضغط على زر Start
struct HomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to Home Page!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            Text("This is the next screen after pressing Start.")
                .font(.body)
                .padding()

            Spacer()
        }
        .navigationTitle("Home") // عنوان الصفحة في NavigationBar
    }
}

// معاينة الكود
struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
