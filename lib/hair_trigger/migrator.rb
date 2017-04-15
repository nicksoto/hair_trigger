module HairTrigger
  module Migrator
    module ProperTableNameExt
      def proper_table_name(*args)
        name = args.first
        return name if name.is_a?(Hash)
        super(*args)
      end
    end

    def self.extended(base)
      base.class_eval do
        prepend ProperTableNameExt
      end
    end

    def self.included(base)
      base.instance_eval do
        prepend ProperTableNameExt
      end
    end
  end
end
