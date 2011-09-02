# concat.rb
# concatenate the contents of arrays
module Puppet::Parser::Functions
         newfunction(:concat, :type => :statement) do |args|
                 result = args[0]
                 return unless result.is_a?(Array)
                 args[1..-1].each do |arg|
                         if arg.is_a?(Array)
                           result = result.concat(arg)
                         else
                           result << arg
                         end
                 end
         end
end
