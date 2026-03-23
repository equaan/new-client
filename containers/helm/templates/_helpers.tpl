{{/*
Expand the name of the chart.
*/}}
{{- define "NewClient1.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "NewClient1.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "NewClient1.labels" -}}
helm.sh/chart: {{ include "NewClient1.name" . }}-{{ .Chart.Version }}
{{ include "NewClient1.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
managed-by: opt-it-backstage
{{- end }}

{{/*
Selector labels
*/}}
{{- define "NewClient1.selectorLabels" -}}
app.kubernetes.io/name: {{ include "NewClient1.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
