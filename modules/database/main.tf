resource "aws_dynamodb_table" "game_score" {
  name         = "GameScores"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "Id"

  attribute {
    name = "Id"
    type = "S"
  }

  point_in_time_recovery {
    enabled = var.enable_point_in_time_recovery_dynamodb
  }
}

resource "aws_dynamodb_table" "game_ranking" {
  name         = "GameRanking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "Id"

  attribute {
    name = "Id"
    type = "S"
  }

  point_in_time_recovery {
    enabled = var.enable_point_in_time_recovery_dynamodb
  }
}
