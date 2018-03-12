package com.example.educenter.controller;

import com.example.educenter.model.Subject;
import com.example.educenter.model.User;
import com.example.educenter.model.UserType;
import com.example.educenter.repository.SubjectRepository;
import com.example.educenter.repository.UserRepository;
import com.example.educenter.security.CurrentUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {


    @Autowired
    private UserRepository userRepository;
    @Autowired
    private SubjectRepository subjectRepository;


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String mainPage() {
        return "redirect:/loginPage";
    }


    @RequestMapping(value = "/loginPage", method = RequestMethod.GET)
    public String login(ModelMap map) {
        return "index";
    }

    @RequestMapping(value = "/loginSuccess", method = RequestMethod.GET)
    public String loginUser(@AuthenticationPrincipal UserDetails userDetails, ModelMap map) {
        User user = ((CurrentUser) userDetails).getUser();
        String message = "Please confirm your Email";
        if (user.getType() == UserType.STUDENT) {
            if (user.isVerify()) {
                return "redirect:/student";
            }
            map.addAttribute("message", message);
            return "redirect:/";
        }
        return "redirect:/manager";
    }

    @RequestMapping(value = "/verify", method = RequestMethod.GET)
    public String verify(@RequestParam("token") String token, @RequestParam("email") String email) {
        User userByEmail = userRepository.findUserByEmail(email);
        if (userByEmail != null) {
            if (userByEmail.getToken() != null && userByEmail.getToken().equals(token)) {
                userByEmail.setToken(null);
                userByEmail.setVerify(true);
                userRepository.save(userByEmail);

            }
        }
        return "redirect:/";
    }
}
