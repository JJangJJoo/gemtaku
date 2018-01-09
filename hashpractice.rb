student = {
  name: "john",
  age:  19,
  gender:  "male",
  school: {
    highschool: ["BHHS", "Math"],
    college: ["korea", "Chemi-Engineering"],
    graduate: ["KISt", "Chemi-Engineering"]
    }
}

puts student [:school][:graduate][0]
