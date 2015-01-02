package com.thepoet.userman.service;

import com.thepoet.userman.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * User: thePoet
 * Date: 15.11.2013
 * Time: 00:04
 */
@Service
public class UserService {

    @Autowired
    private MongoTemplate mongoTemplate;

    public static final String COLLECTION_NAME = "user";

    public void addUser(User user) {
        if (!mongoTemplate.collectionExists(User.class)) {
            mongoTemplate.createCollection(User.class);
        }
        mongoTemplate.insert(user, COLLECTION_NAME);
    }

    public List<User> listUsers() {
        return mongoTemplate.findAll(User.class, COLLECTION_NAME);
    }

    public void deleteUser(User user) {
        if (this.getUserById(user.getId()) != null) {
            mongoTemplate.remove(user, COLLECTION_NAME);
        }
    }

    public void updateUser(User user) {
        if (this.getUserById(user.getId()) != null) {
            mongoTemplate.save(user, COLLECTION_NAME);
        }
    }

    public User getUserById(String id) {
        return mongoTemplate.findById(id, User.class, COLLECTION_NAME);
    }

    public void deleteUserById(String id) {
        this.deleteUser(getUserById(id));
    }
}
