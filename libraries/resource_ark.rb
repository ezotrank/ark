#
# Cookbook Name:: ark
# Resource:: Ark
#
# Author:: Bryan W. Berry <bryan.berry@gmail.com>
# Copyright 2012, Bryan W. Berry
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

require 'chef/resource'

class Chef
  class Resource
    class Ark < Chef::Resource

      def initialize(name, run_context=nil)
        super
        @resource_name = :ark
        @allowed_actions.push(:install, :dump, :cherry_pick, :put, :install_with_make, :configure, :setup_py_build, :setup_py_install, :setup_py)
        @action = :install
        @provider = Chef::Provider::Ark
      end

      attr_accessor :path, :release_file, :prefix_bin, :prefix_root, :home_dir, :extension, :version

      def owner(arg=nil)
        set_or_return(
          :owner,
          arg,
          :kind_of => String,
          :default => 'root'
        )
      end

      def group(arg=nil)
        set_or_return(
          :group,
          arg,
          :kind_of => [String, Fixnum],
          :default => 0
        )
      end

      def url(arg=nil)
        set_or_return(
          :url,
          arg,
          :kind_of => String,
          :required => true
        )
      end

      def path(arg=nil)
        set_or_return(
          :path,
          arg,
          :kind_of => String,
          :default => nil
        )
      end

      def full_path(arg=nil)
        set_or_return(
          :full_path,
          arg,
          :kind_of => String,
          :default => nil
        )
      end

      def append_env_path(arg=nil)
        set_or_return(
          :append_env_path,
          arg,
          :kind_of => [TrueClass, FalseClass],
          :default => false
        )
      end

      def checksum(arg=nil)
        set_or_return(
          :checksum,
          arg,
          :regex => /^[a-zA-Z0-9]{64}$/,
          :default => nil
        )
      end

      def has_binaries(arg=nil)
         set_or_return(
          :has_binaries,
          arg,
          :kind_of => Array,
          :default => []
        )
      end

      def creates(arg=nil)
         set_or_return(
          :creates,
          arg,
          :kind_of => String,
          :default => nil
        )
      end

      def release_file(arg=nil)
         set_or_return(
          :release_file,
          arg,
          :kind_of => String,
          :default => ''
        )
      end

      def strip_leading_dir(arg=nil)
         set_or_return(
          :strip_leading_dir,
          arg,
          :kind_of => [TrueClass, FalseClass],
          :default => true
        )
      end

      def mode(arg=nil)
         set_or_return(
          :mode,
          arg,
          :kind_of => Fixnum,
          :default => 0755
        )
      end


      def prefix_root(arg=nil)
         set_or_return(
          :prefix_root,
          arg,
          :kind_of => String,
          :default => nil
        )
      end

      def prefix_home(arg=nil)
         set_or_return(
          :prefix_home,
          arg,
          :kind_of => String,
          :default => nil
        )
      end

      def prefix_bin(arg=nil)
         set_or_return(
          :prefix_bin,
          arg,
          :kind_of => String,
          :default => nil
        )
      end
      
      def version(arg=nil)
         set_or_return(
          :version,
          arg,
          :kind_of => String,
          :default => nil
        )
      end

      def home_dir(arg=nil)
         set_or_return(
          :home_dir,
          arg,
          :kind_of => String,
          :default => nil
        )
      end

      def environment(arg=nil)
         set_or_return(
          :environment,
          arg,
          :kind_of => Hash,
          :default => {}
        )
      end

      def autoconf_opts(arg=nil)
         set_or_return(
          :autoconf_opts,
          arg,
          :kind_of => Array,
          :default => []
        )
      end

      def make_opts(arg=nil)
         set_or_return(
          :make_opts,
          arg,
          :kind_of => Array,
          :default => []
        )
      end
      
      def home_dir(arg=nil)
         set_or_return(
          :home_dir,
          arg,
          :kind_of => String,
          :default => nil
        )
      end

      def extension(arg=nil)
         set_or_return(
          :extension,
          arg,
          :kind_of => String
        )
      end
      
      #attribute :autoconf_opts, :kind_of => Array, :default => []
    end
  end
end

