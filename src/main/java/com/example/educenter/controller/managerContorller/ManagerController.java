package com.example.educenter.controller.managerContorller;

import com.example.educenter.mail.EmailServiceImpl;
import com.example.educenter.model.Subject;
import com.example.educenter.model.User;
import com.example.educenter.model.UserType;
import com.example.educenter.repository.SubjectRepository;
import com.example.educenter.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.UUID;


@Controller
public class ManagerController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SubjectRepository subjectRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private EmailServiceImpl emailService;

    @RequestMapping(value = "/manager", method = RequestMethod.GET)
    public String managerPage(ModelMap map) {
        map.addAttribute("user", new User());
        map.addAttribute("subject", new Subject());
        map.addAttribute("subjects", subjectRepository.findAll());
        map.addAttribute("users", userRepository.findAll());
        return "manager";
    }

    @RequestMapping(value = "/addStudent", method = RequestMethod.POST)
    public String addStudent(@ModelAttribute("user") User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setType(UserType.STUDENT);
        user.setToken(UUID.randomUUID().toString());
        userRepository.save(user);
        String url = String.format("http://localhost:8080/verify?token= %s & email = %s", user.getToken(), user.getEmail());
        String text = String.format("Dear %s student, you are registered %s", user.getName(), url);
        emailService.sendSimpleMessage(user.getEmail(), "Welcome", text);
        return "redirect:/manager";
    }

    @RequestMapping(value = "/addSubject", method = RequestMethod.POST)
    public String addSubject(@ModelAttribute("subject") Subject subject) {
        subjectRepository.save(subject);
        return "redirect:/manager";
    }

    @RequestMapping(value = "/changeStudent", method = RequestMethod.GET)
    public String changeStudent(@RequestParam("id") int id, ModelMap map) {
        User user = userRepository.findOneById(id);
        map.addAttribute("user", user);
        return "changeStudent";
    }

    @RequestMapping(value = "/changeStudentData", method = RequestMethod.POST)
    public String changeStudentData(@RequestParam("id") int id,
                                    @RequestParam("name") String name
            , @RequestParam("surname") String surname
            , @RequestParam("phone") String phone
            , @RequestParam("age") int age) {
        User user = userRepository.findOneById(id);
        user.setName(name);
        user.setSurname(surname);
        user.setPhone(phone);
        user.setAge(age);
        userRepository.save(user);
        return "redirect:/changeStudent";
    }

    @RequestMapping(value = "/deleteStudent", method = RequestMethod.GET)
    public String deleteStudent(@RequestParam("id") int id) {
        User user = userRepository.findOneById(id);
        userRepository.delete(user);
        return "redirect:/manager";
    }
}
