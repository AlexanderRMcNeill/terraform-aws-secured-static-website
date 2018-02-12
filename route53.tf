resource "aws_route53_record" "records" {
    count = "${length(var.domain_names)}"

    zone_id = "${var.hosted_zone_id}"
    name    = "${var.domain_names[count.index]}"
    type    = "A"

    alias {
        name                   = "${aws_cloudfront_distribution.website_distribution.domain_name}"
        zone_id                = "${aws_cloudfront_distribution.website_distribution.hosted_zone_id}"
        evaluate_target_health = false
    }
}