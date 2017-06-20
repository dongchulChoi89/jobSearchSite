package javarajob.vo;

public class Career {
	private int careerid;
	private String task;
	private String requirements;
	private String preference;
	private String workingcondition;
	private String companytype;
	private String field;
	private String location;
	private String industry;
	private String employmenttype;
	private int companyid;
	private String title;
	private String salary;

	public Career() {
	}

	public Career(int careerid, String task, String requirements, String preference, String workingcondition,
			String companytype, String field, String location, String industry, String employmenttype, int companyid,
			String title, String salary) {
		this.careerid = careerid;
		this.task = task;
		this.requirements = requirements;
		this.preference = preference;
		this.workingcondition = workingcondition;
		this.companytype = companytype;
		this.field = field;
		this.location = location;
		this.industry = industry;
		this.employmenttype = employmenttype;
		this.companyid = companyid;
		this.title = title;
		this.salary = salary;
	}

	public int getCareerid() {
		return careerid;
	}

	public void setCareerid(int careerid) {
		this.careerid = careerid;
	}

	public String getTask() {
		return task;
	}

	public void setTask(String task) {
		this.task = task;
	}

	public String getRequirements() {
		return requirements;
	}

	public void setRequirements(String requirements) {
		this.requirements = requirements;
	}

	public String getPreference() {
		return preference;
	}

	public void setPreference(String preference) {
		this.preference = preference;
	}

	public String getWorkingcondition() {
		return workingcondition;
	}

	public void setWorkingcondition(String workingcondition) {
		this.workingcondition = workingcondition;
	}

	public String getCompanytype() {
		return companytype;
	}

	public void setCompanytype(String companytype) {
		this.companytype = companytype;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getEmploymenttype() {
		return employmenttype;
	}

	public void setEmploymenttype(String employmenttype) {
		this.employmenttype = employmenttype;
	}

	public int getCompanyid() {
		return companyid;
	}

	public void setCompanyid(int companyid) {
		this.companyid = companyid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

}