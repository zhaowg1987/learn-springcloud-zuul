package com.jkfq.servicezuul.config;

import com.netflix.hystrix.exception.HystrixTimeoutException;
import org.springframework.cloud.netflix.zuul.filters.route.FallbackProvider;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.stereotype.Component;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;

/**
 * 自定义熔断器
 *
 * @Author
 * @create 2019-01-25
 **/
@Component
public class OneZuulFallbackProvider implements FallbackProvider {

    @Override
    public String getRoute() {
        //实现对producer-server服务的熔断
        //return "producer-server";
        // 实现对所有的路由服务的熔断
        return "*";
    }

    @Override
    public ClientHttpResponse fallbackResponse(String route, Throwable cause) {
        if (cause instanceof HystrixTimeoutException) {
            return response(route,HttpStatus.GATEWAY_TIMEOUT);
        } else {
            return response(route,HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    private ClientHttpResponse response(final String route,final HttpStatus status) {
        return new ClientHttpResponse() {
            @Override
            public HttpStatus getStatusCode() throws IOException {
                return status;
            }

            @Override
            public int getRawStatusCode() throws IOException {
                return status.value();
            }

            @Override
            public String getStatusText() throws IOException {
                return status.getReasonPhrase();
            }

            @Override
            public void close() {
            }

            @Override
            public InputStream getBody() throws IOException {

                return new ByteArrayInputStream((route + "服务不可用，请稍后再试。").getBytes());
            }

            @Override
            public HttpHeaders getHeaders() {
                // headers设定
                HttpHeaders headers = new HttpHeaders();
                MediaType mt = new MediaType("application", "json", Charset.forName("UTF-8"));
                headers.setContentType(mt);
                return headers;
            }
        };
    }
}
