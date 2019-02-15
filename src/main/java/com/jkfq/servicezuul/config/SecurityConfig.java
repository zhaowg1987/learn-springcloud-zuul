package com.jkfq.servicezuul.config;

import org.springframework.boot.autoconfigure.security.SecurityProperties;
import org.springframework.boot.autoconfigure.security.oauth2.client.EnableOAuth2Sso;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

/**
 * ${DESCRIPTION}
 *
 * @Author
 * @create 2019-01-30
 **/
@Configuration
@EnableWebSecurity
@EnableOAuth2Sso
@Order(SecurityProperties.BASIC_AUTH_ORDER - 3)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    public void configure(HttpSecurity http) throws Exception {

        http
                // 使用oauth2进行授权，此处关闭即可。
                // csrf又称跨域请求伪造，攻击方通过伪造用户请求访问受信任站点。
                .csrf().disable();
    }
}
