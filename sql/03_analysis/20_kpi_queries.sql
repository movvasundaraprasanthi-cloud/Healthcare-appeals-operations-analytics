SELECT COUNT(*) AS total_appeals FROM healthcare_ops.v_appeals_reporting;

SELECT
  SUM(CASE WHEN status LIKE 'Resolved%' THEN 1 ELSE 0 END) AS resolved_cases,
  SUM(CASE WHEN status IN ('Open','In Review','Pending Clinical Review') THEN 1 ELSE 0 END) AS open_backlog,
  ROUND(AVG(turnaround_days),2) AS avg_turnaround_days,
  SUM(sla_breach_flag) AS sla_breaches
FROM healthcare_ops.v_appeals_reporting;

SELECT issue_type, COUNT(*) AS appeal_volume
FROM healthcare_ops.v_appeals_reporting
GROUP BY issue_type
ORDER BY appeal_volume DESC;

SELECT assigned_team,
       COUNT(*) AS total_cases,
       SUM(sla_breach_flag) AS sla_breaches,
       ROUND(AVG(turnaround_days),2) AS avg_turnaround
FROM healthcare_ops.v_appeals_reporting
GROUP BY assigned_team
ORDER BY total_cases DESC;
