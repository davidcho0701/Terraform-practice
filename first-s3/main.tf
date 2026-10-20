# S3 버킷 이름은 전 세계에서 유일해야 하므로 랜덤 접미사를 붙입니다.
resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "lab" {
  bucket = "${var.project_name}-${random_id.suffix.hex}"

  # 실습용: 객체가 들어 있어도 destroy 시 버킷을 지울 수 있게 함
  # (운영 환경에서는 false 유지 권장)
  force_destroy = true
}

# 버전 관리 켜기
resource "aws_s3_bucket_versioning" "lab" {
  bucket = aws_s3_bucket.lab.id

  versioning_configuration {
    status = "Enabled"
  }
}

# 퍼블릭 접근 전면 차단 (보안 기본값)
resource "aws_s3_bucket_public_access_block" "lab" {
  bucket = aws_s3_bucket.lab.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}