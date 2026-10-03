class funname():
    def Subfields():
        list1= "Sub-fields in AI are:","Machine Learning","Neural Networks","Vision","Robotics","Speech Processing","Natural Language Processing"
        for word in list1:
            print (word)
        
    def OddEven():
        Num=int(input("Enter a number:"))
        if (Num%2==0):
            print(Num,"is Even number")
        else:
            print(Num,"is Odd number")
                      
    def Elegible():
        Gender=input("Your Gender:")
        Age=int(input("Your Age:"))
        if (Gender=="Male"):
            if (Age>=21):
                print("ELIGIBLE")
            else:
                print("NOT ELIGIBLE")
        elif (Gender=="Female"):
            if (Age>=18):
                print("ELIGIBLE")
            else:
                print("NOT ELIGIBLE")   