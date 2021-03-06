# encoding: UTF-8
#
# Cookbook Name:: openstack-common
# recipe:: python
#
# Copyright 2017 Workday Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# install system packages for Ubuntu/Debian
case node['platform_family']
when 'debian'
  python_runtime '3.5' do
    provider :system
    # Align with eg. OpenStack-Ansible (https://git.openstack.org/cgit/openstack/openstack-ansible/tree/global-requirement-pins.txt)
    pip_version '18.0'
    setuptools_version '40.0.0'
    wheel_version '0.31.1'
  end
# use Software Collections for CentOS/RHEL
when 'rhel'
  python_runtime '3.5' do
    provider :scl
    pip_version '18.0'
    setuptools_version '40.0.0'
    wheel_version '0.31.1'
  end
end
