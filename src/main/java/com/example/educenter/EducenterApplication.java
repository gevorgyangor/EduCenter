package com.example.educenter;

import com.example.educenter.model.User;
import com.example.educenter.model.UserType;
import com.example.educenter.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@SpringBootApplication
public class EducenterApplication implements CommandLineRunner {
    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    UserRepository userRepository;

    public static void main(String[] args) {
        SpringApplication.run(EducenterApplication.class, args);
    }

    @Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setViewClass(JstlView.class);
        viewResolver.setPrefix("/WEB-INF/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }

    @Override
    public void run(String... strings){
        User user = userRepository.findUserByEmail("manager@mail.com");
        if (user == null) {
            User manager = User.builder()
                    .email("manager@mail.com")
                    .name("manager")
                    .surname("manager")
                    .age(24)
                    .phone("234567")
                    .password(passwordEncoder.encode("12345"))
                    .type(UserType.MANAGER)
                    .build();
            userRepository.save(manager);
        }
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

}

