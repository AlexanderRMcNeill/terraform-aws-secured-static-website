# AWS Secured Static Website Terraform Module
Terraform module that creates everything you need to run secured static site.

The module creates the following:
- S3 bucket for static website assets
- CloudFront distribution
- Route53 alias records to the CloudFront distribution 

**Note: If you create your infrastructure in a region other than us-east-1 you will get a temporary redirection response for about an hour, this is because the global s3 bucket domain is still propagating. See [here](https://docs.aws.amazon.com/AmazonS3/latest/dev/Redirects.html#TemporaryRedirection) for more details.**

## Usage
```
module "website" {
    source  = "AlexanderRMcNeill/secured-static-website/aws"
    version = "1.0.0"

    bucket_name = "my-website-bucket"

    hosted_zone_id = "Z2JNCOSL7JN"
    domain_names   = [
        "mywebsite.com",
        "www.mywebsite.com"
    ]

    acm_certificate_arn = "arn:aws:acm:us-east-1:3478392019836:certificate/7ef1f783-12b7-44bf-2a2c-18f4abaf5744"

    custom_error_response_objects = [
        {
            error_code = "404"
            response_code = "404"
            response_page_path = "/404.html"
        },
        {
            error_code = "403"
            response_code = "403"
            response_page_path = "/403.html"
        }
    ]
}
```

## Single Page Applications
To setup the distribution for a single page application set the `custom_error_response_objects` attibute to the following:

```hcl
custom_error_response_objects = [
    {
        error_code = "404"
        error_caching_min_ttl = 0
        response_code = "200"
        response_page_path = "/index.html"
    }
}
```

This configuration will catch the 404 from s3 and render `index.html` on that path with a status code of 200.

## Authors
Module managed by [Alexander McNeill](https://github.com/AlexanderRMcNeill)

## License
MIT License. See [LICENSE](/LICENSE) for full details.
