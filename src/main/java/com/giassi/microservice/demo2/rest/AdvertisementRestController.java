package com.giassi.microservice.demo2.rest;

import com.giassi.microservice.demo2.rest.users.dtos.UploadFileResponse;
import com.giassi.microservice.demo2.rest.users.services.StorageService;
import com.giassi.microservice.demo2.rest.users.services.VideoStreamService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@RestController
@RequestMapping(value = "/advertisement")
@Slf4j
public class AdvertisementRestController {

    @Autowired
    private StorageService storageService;

    @Autowired
    VideoStreamService vid;

    private String bucket = "<ENTER YOUR BUCKET NAME";

    @PostMapping
    public UploadFileResponse login(@RequestParam("file") MultipartFile file, @RequestParam String description) {
        try {
            byte[] bytes = file.getBytes();
            String name = file.getOriginalFilename() ;
            String desc2 = description ;

            // Put the MP4 file into an Amazon S3 bucket.
            vid.putVideo(bytes, bucket, name, desc2);

            return new UploadFileResponse(name, "","",0l);
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("Could not upload");
        }
    }

}
