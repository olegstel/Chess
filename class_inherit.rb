class Employee
    attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end

  def add_boss(boss)
    @boss = boss
  end
end

class Manager < Employee

  def initialize(name, title, salary, boss)
    super#(name, title, salary, boss)
     @employees = []
  end

  def bonus(multiplier)
    subords_salary = self.calculate_sub_employees_salary
    multiplier * subords_salary
  end

  def calculate_sub_employees_salary
    subords_salary = 0
    @employees.each do |employee|
      if employee.class == Manager
        subords_salary += employee.calculate_sub_employees_salary
      end
      subords_salary += employee.salary
    end
    subords_salary
  end

  def add_employee(employee)
    @employees << employee
  end
end
