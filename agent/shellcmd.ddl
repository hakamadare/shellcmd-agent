metadata    :name        => "Puppet Shell Execution Agent",
            :description => "Run shell commands, report status and output",
            :author      => "Joe Miller",
            :license     => "Apache License 2.0",
            :version     => "0.0.1",
            :url         => "https://github.com/joemiller/shellcmd-agent",
            :timeout     => 60

action "exec", :description => "Execute remote command" do
    output :status,
           :description => "String indicating status",
           :display_as => "Status"
    output :output,
           :description => "String indicating command output",
           :display_as => "Output"
end
