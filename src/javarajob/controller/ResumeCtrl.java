package javarajob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javarajob.service.FileService;
import javarajob.service.ResumeService;
import javarajob.vo.Resume;

@Controller
public class ResumeCtrl {

	@Autowired(required = false)
	private ResumeService s;
	
	@Autowired(required = false)
	private FileService fs;

	// http://localhost:6080/javarajob/resume.do
	@RequestMapping("/resume.do")
	public String resumeView(@RequestParam(value = "userId", defaultValue = "0") String id, Model d) {
		d.addAttribute("resume", s.oneResume(id));
		return "resume";
	}
	
	@RequestMapping("/resume_upt.do")
	public String uptResume(@RequestParam("pic") MultipartFile pic, Resume r, @RequestParam("picExt") String ext){
		r.setPicName(r.getUserId()+"/profile/"+r.getUserId()+"_profile."+ext);
		s.uptResume(r);
		fs.uploadPic(pic,r.getUserId(),ext);
		return "forward:/resume.do";
	}

}
