package com.nuce.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nuce.model.Person;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = {"/","/home"})
public class AjaxController {
    private List<Person> personList=new ArrayList<>();
    @GetMapping
    public String home(){
        return "home";
    }
    @GetMapping("/addnew")
    @ResponseBody
    public String addNew(HttpServletRequest request){
        String name=request.getParameter("name");
        String age=request.getParameter("age");
        Person person=new Person(name,Integer.parseInt(age));
        personList.add(person);

        ObjectMapper mapper=new ObjectMapper();
        String ajaxResponse="";
        try {
            ajaxResponse=mapper.writeValueAsString(person);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        System.out.println(ajaxResponse);
        return ajaxResponse;
    }
    @GetMapping("/search")
    @ResponseBody
    public String searchPerson(HttpServletRequest request){
        String query=request.getParameter("query");
        Person person=searchPersonByName(query);

        ObjectMapper mapper=new ObjectMapper();
        String ajaxResponse="";
        try {
            ajaxResponse=mapper.writeValueAsString(person);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        System.out.println(ajaxResponse);
        return ajaxResponse;
    }
    public Person searchPersonByName(String query){
        for(Person person:personList){
            if(person.getName().equals(query)){
                return person;
            }
        }
        return null;
    }
}
