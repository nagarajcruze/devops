{{- /* Teams Template: Firing & Resolved Alerts */ -}}

{{ define "teams.title" -}}
[{{ .Status | toUpper }}] Alerts Summary
{{- end }}

{{ define "teams.text" -}}
{{- if gt (len .Alerts.Firing) 0 }}

🔴 Firing Alerts:
Severity: {{ (index .Alerts.Firing 0).Labels.severity }}
Summary: {{ (index .Alerts.Firing 0).Annotations.summary }}
Description: {{ (index .Alerts.Firing 0).Annotations.description }}

Affected:
{{- range .Alerts.Firing }}
  - {{ if .Labels.image }}{{ .Labels.name }} ({{ .Labels.image }}){{ else }}{{ .Labels.instance }}{{ end }}
{{- end }}

{{- end }}

{{- if gt (len .Alerts.Resolved) 0 }}

✅ *Resolved Alerts:*
Severity: {{ (index .Alerts.Resolved 0).Labels.severity }}
Summary: {{ (index .Alerts.Resolved 0).Annotations.summary }}
Description: {{ (index .Alerts.Resolved 0).Annotations.description }}

Resolved:
{{- range .Alerts.Resolved }}
  - {{ if .Labels.image }}{{ .Labels.name }} ({{ .Labels.image }}){{ else }}{{ .Labels.instance }}{{ end }}
{{- end }}

{{- end }}
{{- end }}