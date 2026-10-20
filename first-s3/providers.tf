provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile

  # 이 Provider로 만드는 모든 리소스에 자동으로 붙는 태그
  default_tags {
    tags = {
      Project   = var.project_name
      ManagedBy = "terraform"
    }
  }
}
