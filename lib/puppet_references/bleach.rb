class PuppetReferences
  class Bleach
    def self.run_dirty_command(command)
      result = Bundler.with_clean_env do
        # Bundler replaces the entire environment once this block is finished.
        ENV.delete('RUBYLIB')
        %x( #{command} )
      end
      result
    end

    PUPPET_OPTIONS = '--environmentpath /dev/null --vardir /dev/null --modulepath /dev/null'
  end
end