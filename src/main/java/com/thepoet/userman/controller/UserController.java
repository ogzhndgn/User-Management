package com.thepoet.userman.controller;

import com.thepoet.userman.model.User;
import com.thepoet.userman.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * User: thePoet
 * Date: 10.11.2013
 * Time: 16:17
 */

@Controller
public class UserController {

    @Autowired
    UserService userService;

    private void addUserList(ModelMap modelMap) {
        List<User> userList = userService.listUsers();
        modelMap.addAttribute("userList", userList);
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView usersMain(ModelMap modelMap) {
        addUserList(modelMap);
        modelMap.addAttribute("userMainPageMessage", "This is users main page! Please click the link below to add user");
        return new ModelAndView("user", "command", new User());
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public void addUser(@RequestBody User user) {
        userService.addUser(user);
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE,
            produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public void deleteUser(@PathVariable String id) {
        userService.deleteUserById(id);
    }

    @RequestMapping(value = "/updateForm/{id}", method = RequestMethod.GET)
    public ModelAndView updateForm(@PathVariable(value = "id") String id, ModelMap modelMap) {
        User user = userService.getUserById(id);
        return new ModelAndView("updateForm", "command", user);
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public ModelAndView updateUser(@ModelAttribute("SpringWeb") User user, ModelMap modelMap) {
        System.out.println(user.toString());
        userService.updateUser(user);
        addUserList(modelMap);
        return new ModelAndView("user", "command", new User());
    }
}