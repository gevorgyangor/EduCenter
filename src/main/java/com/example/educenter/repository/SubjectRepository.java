package com.example.educenter.repository;

import com.example.educenter.model.Subject;
import com.example.educenter.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SubjectRepository extends JpaRepository<Subject, Integer> {
    Subject findOneById(int id);
}
