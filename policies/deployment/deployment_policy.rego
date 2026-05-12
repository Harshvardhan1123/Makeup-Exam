package deployment

deny[msg] {
    input.kind == "Deployment"
    not input.metadata.labels.version
    msg := "Deployment must include version tagging"
}

deny[msg] {
    input.spec.template.spec.containers[_].image == "latest"
    msg := "Using latest tag is not allowed"
}
