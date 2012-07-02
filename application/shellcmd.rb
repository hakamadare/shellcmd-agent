class MCollective::Application::Package<MCollective::Application
  description "Run remote shell commands"
    usage <<-END_OF_USAGE
mco shellcmd <COMMAND>"
    END_OF_USAGE

  def post_option_parser(configuration)
    if ARGV.length == 1
      configuration[:cmd] = ARGV.shift

    else
      puts("Please specify a command.")
      exit 1
    end
  end

  def main
    pkg = rpcclient("package", :options => options)

    versions = {}

    pkg.runcmd(:cmd => command).each do |resp|
      printf("%s exitcode: %d, output:\n", resp[:senderid], resp[:body][:data][:exitcode])
      puts resp[:body][:data][:output]
      puts "===============================================================\n"
    end
  end
end
# vi:tabstop=2:expandtab:ai
