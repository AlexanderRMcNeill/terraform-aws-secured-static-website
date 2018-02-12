resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {}

resource "aws_cloudfront_distribution" "website_distribution" {
    origin = {
        domain_name = "${aws_s3_bucket.website_bucket.bucket_domain_name}"
        origin_id   = "websiteS3Origin"

        s3_origin_config {
            origin_access_identity = "${aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path}"
        }
    }

    enabled             = true
    is_ipv6_enabled     = true
    default_root_object = "${var.default_root_object}"

    aliases = "${var.domain_names}"

    price_class = "${var.distribution_price_class}"

    default_cache_behavior = {
        viewer_protocol_policy = "redirect-to-https"
        allowed_methods        = [ "GET", "HEAD" ]
        cached_methods         = [ "GET", "HEAD" ]
        target_origin_id       = "websiteS3Origin"

        min_ttl     = 0
        default_ttl = 3600
        max_ttl     = 86400

        forwarded_values = {
            query_string = false

            cookies = {
                forward = "none"
            }
        }
    }

    custom_error_response = "${var.custom_error_response_objects}"

    restrictions = {
        geo_restriction = {
            restriction_type = "none"
        }
    }

    viewer_certificate = {
        acm_certificate_arn = "${var.acm_certificate_arn}"
        minimum_protocol_version = "TLSv1.1_2016"
        ssl_support_method = "sni-only"
    }
}