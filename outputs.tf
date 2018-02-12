output "bucket_id" {
    value = "${aws_s3_bucket.website_bucket.id}"
}

output "bucket_arn" {
    value = "${aws_s3_bucket.website_bucket.arn}"
}

output "bucket_domain_name" {
    value = "${aws_s3_bucket.website_bucket.bucket_domain_name}"
}

output "distribution_id" {
    value = "${aws_cloudfront_distribution.website_distribution.id}"
}

output "distribution_arn" {
    value = "${aws_cloudfront_distribution.website_distribution.arn}"    
}

output "distribution_domain_name" {
    value = "${aws_cloudfront_distribution.website_distribution.domain_name}"
}