# AWS Secured Static Website Terraform Module
Terraform module that creates everything you need to run secured static site.

## Usage
```
module "website" {
    source = "./module"

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

## Examples

## Authors
Module managed by [Alexander McNeill](https://github.com/AlexanderRMcNeill)

## License
MIT License. See [LICENSE](/LICENSE) for full details.
