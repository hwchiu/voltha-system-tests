# Copyright 2017-present Open Networking Foundation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# robot test functions

*** Settings ***
Documentation     Library for various utilities
Library           SSHLibrary
Library           HttpLibrary.HTTP
Library           String
Library           DateTime
Library           Process
Library           Collections
Library           RequestsLibrary
Library           OperatingSystem

*** Keywords ***
Check CLI Tools Configured
    [Documentation]    Tests that use 'voltctl' and 'kubectl' should execute this keyword in suite setup
    # check voltctl and kubectl configured
    ${voltctl_rc}=    Run And Return RC    ${VOLTCTL_CONFIG}; voltctl device list
    ${kubectl_rc}=    Run And Return RC    ${KUBECTL_CONFIG}; kubectl get pods
    Run Keyword If    ${voltctl_rc} != 0 or ${kubectl_rc} != 0    FATAL ERROR    VOLTCTL and KUBECTL not configured. Please configure before executing tests.
