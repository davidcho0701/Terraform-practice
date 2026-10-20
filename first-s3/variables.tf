variable "aws_region" {
  description = "리소스를 만들 AWS 리전"
  type        = string
  default     = "ap-northeast-2" # 서울
}

variable "aws_profile" {
  description = "사용할 AWS CLI 프로필 이름 (Step 4에서 만든 것)"
  type        = string
  default     = "terraform-lab"
}

variable "project_name" {
  description = "리소스 이름의 접두사 (소문자, 숫자, 하이픈만)"
  type        = string
  default     = "tf-lab"
}
