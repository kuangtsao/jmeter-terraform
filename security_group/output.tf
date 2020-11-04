output "jmeter_master_sg_id" {
    value = aws_security_group.jmeter_master.id
    description = "security_group id for jmeter_master"
}

output "jmeter_slave_sg_id" {
    value = aws_security_group.jmeter_slave.id
    description = "security_group id for jmeter_slave"
}