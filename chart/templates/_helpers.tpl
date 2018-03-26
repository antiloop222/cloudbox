{{/*
Create a fully qualified server name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "{{ .Chart.Name }}.fullname" -}}
{{- $releaseName := .Release.Name | replace "_" "-" -}}
{{- if ne .Chart.Name  .Release.Name -}}
{{- printf "%s-%s" $releaseName .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/* Generate basic labels */}}
{{- define "{{ .Chart.Name }}.labels" -}}
labels:
  app: {{ .Chart.Name }}
  version: {{ .Chart.Version }}
  chart: {{ .Chart.Name }}-{{ .Chart.Version }}
  release: {{ .Release.Name }}
  heritage: {{ .Release.Service }}
{{- end -}}
