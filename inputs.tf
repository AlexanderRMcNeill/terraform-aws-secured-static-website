variable "bucket_name" {
    type = "string"
    description = "The name of the bucket that will host your website assets."
}
variable "default_root_object" {
    type = "string"
    default = "index.html"
    description = "The path to the object you wish to be served when the root of the website is hit."
}

variable "custom_error_response_objects" {
    type = "list"
    default = []
    description = "Custom responses for different error status codes. The variable takes a list of objects containing error_code and response_page_path."
}

variable "hosted_zone_id" {
    type = "string"
    description = "The ID of the hosted zone that you wish to create the website records under."
}
variable "domain_names" {
    type = "list"
    description = "List of domain names for the website to run on. For example ['example.com', 'www.example.com']."
}

variable "acm_certificate_arn" {
    type = "string"
    description = "The certificate you wish to secure the website with. Note: The ACM certificate must be in US-EAST-1 and be for all of the domain names you have specified in the domain_names variable."
}

variable "distribution_price_class" {
    type = "string"
    default = "PriceClass_100"
    description = "The price class of the Cloudfront distribution. This effects how many edge locations the distribution has. The value has to be PriceClass_All, PriceClass_200, or PriceClass_100."
}