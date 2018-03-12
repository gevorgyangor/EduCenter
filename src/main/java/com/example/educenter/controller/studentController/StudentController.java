package com.example.educenter.controller.studentController;

import com.example.educenter.model.Subject;
import com.example.educenter.model.User;
import com.example.educenter.repository.SubjectRepository;
import com.example.educenter.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class StudentController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SubjectRepository subjectRepository;

    @RequestMapping(value = "/student", method = RequestMethod.GET)
    public String studentPage(ModelMap map) {
        map.addAttribute("subjects", subjectRepository.findAll());
        map.addAttribute("users", userRepository.findAll());
        return "student";
    }

    @RequestMapping(value = "/getSubjectId", method = RequestMethod.GET)
    public String allStudentsBySubject(@RequestParam("id") int id, ModelMap map) {
        Subject oneById = subjectRepository.findOneById(id);
        List<User> users = oneById.getUsers();
        map.addAttribute("users", users);
        return "allStudentsBySubject";
    }
}
