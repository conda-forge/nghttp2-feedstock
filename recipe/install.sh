make install

if [[ "$PKG_NAME" != *static ]]; then
    rm -f "${PREFIX}"/lib/*.a
fi
