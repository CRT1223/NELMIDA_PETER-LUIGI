import java.util.*;
interface StudentInfo {
    void inputInfo();
    void displayInfo();
}
class Student implements StudentInfo {
    private String firstName;
    private String middleName;
    private String lastName;
    private String suffix;
    public Student(String firstName, String middleName, String lastName, String suffix) {
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.suffix = suffix;
    }
    public String getFirstName() {
        return firstName;
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getMiddleName() {
        return middleName;
    }
    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }
    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getSuffix() {
        return suffix;
    }

    public void setSuffix(String suffix) {
        this.suffix = suffix;
    }
    public String getFullName() {
        String fullName = firstName;
        if (!middleName.isEmpty()) {
            fullName += " " + middleName;
        }
        fullName += " " + lastName;
        if (!suffix.isEmpty()) {
            fullName += " " + suffix;
        }
        return fullName;
    }
    @Override
    public void inputInfo() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter First Name: ");
        firstName = scanner.nextLine();
        System.out.print("Enter Middle Name: ");
        middleName = scanner.nextLine();
        System.out.print("Enter Last Name: ");
        lastName = scanner.nextLine();
        System.out.print("Enter Suffix: ");
        suffix = scanner.nextLine();
    }
    public void displayInfo() {
        System.out.println("");
        System.out.println("First Name: " + firstName);
        System.out.println("Middle Name: " + middleName);
        System.out.println("Last Name: " + lastName);
        System.out.println("Suffix: " + suffix);
        System.out.println("Full Name: " + getFullName());
    }
}
public class Main {
    public static void main(String[] args) {
        Student student = new Student("", "", "", "");
        student.inputInfo();
        student.displayInfo();
    }
}

