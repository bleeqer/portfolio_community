package com.portfolio.service;

import com.portfolio.domain.UserDetailsVO;
import com.portfolio.domain.UserVO;
import com.portfolio.security.CustomUserDetails;
import org.springframework.security.core.userdetails.UserDetails;

public interface UserService {
    void create(UserVO userVO);
    CustomUserDetails read(String userId);
    void update(UserVO userVO);
    void delete(String userId);

}
