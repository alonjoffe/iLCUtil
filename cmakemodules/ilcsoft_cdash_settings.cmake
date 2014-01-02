##############################################################################
# settings for uploading test results to cdash server
#
# author: Jan Engels, Desy - IT
# date:   2011-07-01
##############################################################################

execute_process( COMMAND hostname -f OUTPUT_VARIABLE hostname OUTPUT_STRIP_TRAILING_WHITESPACE )

if( "${hostname}" MATCHES "desy.de" )
    message( STATUS "running inside desy network" )

    # this server is only visible inside the desy network
    set( cdash_server_url "http://aidasoft.desy.de/CDash/generateCTestConfig.php" )

    set( download_cmd wget -O )
    if( APPLE )
        set( download_cmd curl -o )
    endif()

    list( APPEND marlin_ep_args             PATCH_COMMAND ${download_cmd} CTestConfig.cmake "${cdash_server_url}?projectid=1" )
    list( APPEND lcio_ep_args               PATCH_COMMAND ${download_cmd} CTestConfig.cmake "${cdash_server_url}?projectid=6" )
    list( APPEND ced_ep_args                PATCH_COMMAND ${download_cmd} CTestConfig.cmake "${cdash_server_url}?projectid=7" )
    list( APPEND gear_ep_args               PATCH_COMMAND ${download_cmd} CTestConfig.cmake "${cdash_server_url}?projectid=8" )
    list( APPEND lccd_ep_args               PATCH_COMMAND ${download_cmd} CTestConfig.cmake "${cdash_server_url}?projectid=9" )
    list( APPEND raida_ep_args              PATCH_COMMAND ${download_cmd} CTestConfig.cmake "${cdash_server_url}?projectid=10" )
    list( APPEND kaltest_ep_args            PATCH_COMMAND ${download_cmd} CTestConfig.cmake "${cdash_server_url}?projectid=11" )
    list( APPEND kaldet_ep_args             PATCH_COMMAND ${download_cmd} CTestConfig.cmake "${cdash_server_url}?projectid=12" )
    list( APPEND marlinutil_ep_args         PATCH_COMMAND ${download_cmd} CTestConfig.cmake "${cdash_server_url}?projectid=13" )
    list( APPEND marlintrk_ep_args          PATCH_COMMAND ${download_cmd} CTestConfig.cmake "${cdash_server_url}?projectid=14" )
    list( APPEND marlinreco_ep_args         PATCH_COMMAND ${download_cmd} CTestConfig.cmake "${cdash_server_url}?projectid=15" )
    list( APPEND marlintpc_ep_args          PATCH_COMMAND ${download_cmd} CTestConfig.cmake "${cdash_server_url}?projectid=16" )
    list( APPEND cedviewer_ep_args          PATCH_COMMAND ${download_cmd} CTestConfig.cmake "${cdash_server_url}?projectid=17" )
    list( APPEND overlay_ep_args            PATCH_COMMAND ${download_cmd} CTestConfig.cmake "${cdash_server_url}?projectid=18" )
    list( APPEND forwardtracking_ep_args    PATCH_COMMAND ${download_cmd} CTestConfig.cmake "${cdash_server_url}?projectid=19" )


    list( APPEND lcio_ep_args               TEST_AFTER_INSTALL 1 TEST_COMMAND make Nightly ) 
    list( APPEND ced_ep_args                TEST_AFTER_INSTALL 1 TEST_COMMAND make Nightly )
    list( APPEND gear_ep_args               TEST_AFTER_INSTALL 1 TEST_COMMAND make Nightly )
    list( APPEND lccd_ep_args               TEST_AFTER_INSTALL 1 TEST_COMMAND make Nightly )
    list( APPEND raida_ep_args              TEST_AFTER_INSTALL 1 TEST_COMMAND make Nightly )
    list( APPEND kaltest_ep_args            TEST_AFTER_INSTALL 1 TEST_COMMAND make Nightly )
    list( APPEND kaldet_ep_args             TEST_AFTER_INSTALL 1 TEST_COMMAND make Nightly )
    list( APPEND marlin_ep_args             TEST_AFTER_INSTALL 1 TEST_COMMAND make Nightly )
    list( APPEND marlinutil_ep_args         TEST_AFTER_INSTALL 1 TEST_COMMAND make Nightly )
    list( APPEND marlinreco_ep_args         TEST_AFTER_INSTALL 1 TEST_COMMAND make Nightly )
    list( APPEND marlintpc_ep_args          TEST_AFTER_INSTALL 1 TEST_COMMAND make Nightly )
    list( APPEND marlintrk_ep_args          TEST_AFTER_INSTALL 1 TEST_COMMAND make Nightly )
    list( APPEND cedviewer_ep_args          TEST_AFTER_INSTALL 1 TEST_COMMAND make Nightly )
    list( APPEND overlay_ep_args            TEST_AFTER_INSTALL 1 TEST_COMMAND make Nightly )
    list( APPEND forwardtracking_ep_args    TEST_AFTER_INSTALL 1 TEST_COMMAND make Nightly )

endif()
