CREATE SCHEMA IF NOT EXISTS healthcare_ops;
CREATE TABLE IF NOT EXISTS healthcare_ops.appeals_raw (
  appeal_id STRING,
  received_date DATE,
  resolved_date DATE,
  issue_type STRING,
  priority STRING,
  plan_type STRING,
  region STRING,
  assigned_team STRING,
  status STRING,
  turnaround_days INT,
  sla_target_days INT,
  member_escalation_flag INT
);
