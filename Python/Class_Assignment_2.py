class ClassAssignment2 ():
    def Subfields():
        list1= "Sub-fields in AI are:","Machine Learning","Neural Networks","Vision","Robotics","Speech Processing","Natural Language Processing"
        for word in list1:
            print (word)

    def OddEven():
        Num=int(input("Enter a number:"))
        if (Num%2==0):
            print(Num,"is Even number")
            number= (Num,"is Even number")
        else:
            print(Num,"is Odd number")
            number= (Num,"is Odd number")
            return number

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

    def percentage():
        Sub1= int (input("Subject1="))
        Sub2= int (input("Subject2="))
        Sub3= int (input("Subject3="))
        Sub4= int (input("Subject4="))
        Sub5= int (input("Subject5="))
        Total= (Sub1+Sub2+Sub3+Sub4+Sub5)
        Percentage= (Total/5)
        print ("Total :",Total)
        print(f"Percentage : {Percentage:.12f}")

    def triangle():
        H=int(input("Height:"))
        B=int(input("Breadth:"))
        AF=(H*B/2)
        print("Area formula: (Height*Breadth)/2")
        print("Area of Triangle:",AF)
        H1=int(input("Height1:"))
        H2=int(input("Height2:"))
        B1=int(input("Breadth:"))
        PF=(H1+H2+B1)
        print("Perimeter formula: Height1+Height2+Breadth")
        print("Perimeter of Triangle:",PF)