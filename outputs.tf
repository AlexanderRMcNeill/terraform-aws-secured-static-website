output "bucket_id" {
  description = "The name of the created bucket."
  value       = "${aws_s3_bucket.website_bucket.id}"
}

output "bucket_arn" {
  description = "The ARN (Amazon Resource Name) of the created bucket. Will be of format arn:aws:s3:::bucketname."
  value       = "${aws_s3_bucket.website_bucket.arn}"
}

output "bucket_domain_name" {
  description = "The global domain name of the created bucket. Will be of format bucketname.s3.amazonaws.com."
  value       = "${aws_s3_bucket.website_bucket.bucket_domain_name}"
}

output "distribution_id" {
  description = "The identifier for the created distribution. For example: EDFDVBD632BHDS5."
  value       = "${aws_cloudfront_distribution.website_distribution.id}"
}

output "distribution_arn" {
  description = "The ARN (Amazon Resource Name) for the created distribution. For example: arn:aws:cloudfront::123456789012:distribution/EDFDVBD632BHDS5, where 123456789012 is your AWS account ID."
  value       = "${aws_cloudfront_distribution.website_distribution.arn}"
}

output "distribution_domain_name" {
  description = "The domain name corresponding to the created distribution. For example: d604721fxaaqy9.cloudfront.net."
  value       = "${aws_cloudfront_distribution.website_distribution.domain_name}"
}
