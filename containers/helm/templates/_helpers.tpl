{{/*
Expand the name of the chart.
*/}}
{{- define "new-client.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "new-client.fullname" -}}
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
{{- define "new-client.labels" -}}
helm.sh/chart: {{ include "new-client.name" . }}-{{ .Chart.Version }}
{{ include "new-client.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
managed-by: opt-it-backstage
{{- end }}

{{/*
Selector labels
*/}}
{{- define "new-client.selectorLabels" -}}
app.kubernetes.io/name: {{ include "new-client.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
