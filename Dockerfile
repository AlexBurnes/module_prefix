FROM registry.svc/burnes/build-gcc14:8 as builder

ENV CONAN_PATH=.conan2 

RUN mkdir build && \
    cd build && \
    conan profile detect --force && \
    conan remote add conan-local http://172.18.1.111:8081/artifactory/api/conan/conan-local && \
    conan remote add conan-proxy http://172.18.1.111:8081/artifactory/api/conan/conan-proxy && \
    conan remote update conancenter --url https://center2.conan.io

WORKDIR build
COPY . .

RUN scripts/build -v --build-type Release

################################################################################

FROM registry.svc/svyazcom/development-env:8 as runtime

LABEL org.opencontainers.image.vendor="LCC Svyazcom"
LABEL org.opencontainers.image.licence="proprietary"
LABEL org.opencontainers.image.author="Aleksey.Ozhigov<burnes@svyazcom.ru>"
LABEL org.opencontainers.image.source="https://gitsrv.svyazcom.ru/burnes/cpp_module_prefix"
LABEL org.opencontainers.image.title="module-prefix"
LABEL org.opencontainers.image.version="${VERSION}"

COPY --from=builder /root/build/lib/ /usr/local/lib/

CMD ["/usr/bin/bash"]
