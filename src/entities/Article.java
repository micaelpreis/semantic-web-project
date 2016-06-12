package entities;

import java.util.ArrayList;

public class Article {

	private int id;
	private String section;
	private String subsection;
	private String title;
	private String abstract_;
	private String url;
	private String author;
	private String published_date;
	private String image;
	private String image_small;
	private ArrayList<String> subjects_description;
	private ArrayList<String> organizations;
	private ArrayList<String> persons;
	private ArrayList<String> locations;

	public Article(){

	}

	public Article(int id, String section, String subsection, String title, String abstract_, String url, String author,
			String published_date, String image, String image_small, ArrayList<String> subjects_description,
			ArrayList<String> organizations, ArrayList<String> persons, ArrayList<String> locations) {
		this.id = id;
		this.section = section;
		this.subsection = subsection;
		this.title = title;
		this.abstract_ = abstract_;
		this.url = url;
		this.author = author;
		this.published_date = published_date;
		this.image = image;
		this.image_small = image_small;
		this.subjects_description = subjects_description;
		this.organizations = organizations;
		this.persons = persons;
		this.locations = locations;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public String getSubsection() {
		return subsection;
	}

	public void setSubsection(String subsection) {
		this.subsection = subsection;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAbstract_() {
		return abstract_;
	}

	public void setAbstract_(String abstract_) {
		this.abstract_ = abstract_;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublished_date() {
		return published_date;
	}

	public void setPublished_date(String published_date) {
		this.published_date = published_date;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getImageSmall() {
		return image_small;
	}

	public void setImageSmall(String image_small) {
		this.image_small = image_small;
	}

	public ArrayList<String> getSubjects_description() {
		return subjects_description;
	}

	public void setSubjects_description(ArrayList<String> subjects_description) {
		this.subjects_description = subjects_description;
	}

	public ArrayList<String> getOrganizations() {
		return organizations;
	}

	public void setOrganizations(ArrayList<String> organizations) {
		this.organizations = organizations;
	}

	public ArrayList<String> getPersons() {
		return persons;
	}

	public void setPersons(ArrayList<String> persons) {
		this.persons = persons;
	}

	public ArrayList<String> getLocations() {
		return locations;
	}

	public void setLocations(ArrayList<String> locations) {
		this.locations = locations;
	}
}
