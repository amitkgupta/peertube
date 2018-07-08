{{/* vim: set filetype=mustache: */}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "peertube.fullName" -}}
{{- if .Values.fullNameOverride -}}
{{- .Values.fullNameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- if contains .Chart.Name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create an SMTP secret name.
*/}}
{{- define "peertube.smtpSecretName" -}}
{{- printf "%s-smtp" (include "peertube.fullName" .) -}}
{{- end -}}

{{/*
Create a TLS Ingress secret name.
*/}}
{{- define "peertube.tlsIngressSecretName" -}}
{{- printf "%s-tls-ingress" (include "peertube.fullName" .) -}}
{{- end -}}

{{/*
Create a PostgreSQL secret name.
*/}}
{{- define "peertube.postgresqlSecretName" -}}
{{- printf "%s-postgresql" (include "peertube.fullName" .) -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "peertube.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
