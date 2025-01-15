package vo;

public class MemberVO {
	private int people_no; 
	private String name; 
	private String id; 
	private String pw; 
	private int age; 
	private String phone; 
	private int authority;
	public MemberVO() {
		// TODO Auto-generated constructor stub
	}

	public MemberVO(int people_no, String name, String id, String pw, int age, String phone, int authority) {
		this.people_no = people_no;
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.age = age;
		this.phone = phone;
		this.authority = authority;
	}

	public int getPeople_no() {
		return people_no;
	}

	public void setPeople_no(int people_no) { 
		this.people_no = people_no;
	}

	public String getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getAuthority() {
		return authority;
	}

	public void setAuthority(int authority) {
		this.authority = authority;
	}
}
