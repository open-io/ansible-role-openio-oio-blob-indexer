#! /usr/bin/env bats

# Variable SUT_IP should be set outside this script and should contain the IP
# address of the System Under Test.

# Tests

@test 'Test configuration file paths' {
    run bash -c "docker exec -ti ${SUT_ID} stat /etc/oio/sds/TRAVIS/oio-blob-indexer-5"
    echo "status: "$status
    [[ "${status}" -eq "0" ]]

    run bash -c "docker exec -ti ${SUT_ID} stat /etc/gridinit.d/TRAVIS-oio-blob-indexer-5.conf"
    echo "status: "$status
    [[ "${status}" -eq "0" ]]

    run bash -c "docker exec -ti ${SUT_ID} stat /etc/gridinit.d/TRAVIS-oio-blob-indexer-3.conf"
    echo "status: "$status
    [[ "${status}" -eq "0" ]]

}

@test 'Test gridinit services' {
    run bash -c "docker exec -ti ${SUT_ID} gridinit_cmd status TRAVIS-oio-blob-indexer-5 | grep UP"
    echo "status: "$status
    [[ "${status}" -eq "0" ]]

    run bash -c "docker exec -ti ${SUT_ID} gridinit_cmd status TRAVIS-oio-blob-indexer-3 | grep DISABLED"
    echo "status: "$status
    [[ "${status}" -eq "0" ]]
}
