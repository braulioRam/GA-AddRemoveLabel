FROM alpine:3.10.3

LABEL "com.github.actions.name"="GA-AddRemoveLabel"
LABEL "com.github.actions.description"="Manage labels on pull requests"
LABEL "com.github.actions.icon"="aperture"
LABEL "com.github.actions.color"="blue"

LABEL version="0.0.1"
LABEL repository="http://github.com/braulioRam/GA-AddRemoveLabel"
LABEL homepage="http://github.com/braulioRam/GA-AddRemoveLabel"
LABEL maintainer="Braulio Ramirez <braulio.ramirez@justia.com>"

RUN apk add --no-cache bash curl jq

COPY "entrypoint.sh" "/entrypoint.sh"
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
