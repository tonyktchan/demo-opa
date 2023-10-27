import json

# the list of machine_types allowed

allowed_list = ["n1-standard-1", "n2-standard-2"]
# with block to close the gce.json file automatically

with open('gce.json', 'r') as file:
    json_data = json.load(file)

print(type(json_data))
# print(json_data)

change_json = json_data['resource_changes'][0]

change = change_json["change"]["after"]["machine_type"]

machine_json = {"machine_type": change}

print(machine_json,"\n")

print("the machine_type after apply will be ", change, "\n")

if change in allowed_list:
    print(f"the required machine_type {change} is allowed!\n")
else:
    print(f"the required machine_type {change} is forbidden!\n")

print(f"For your information:\n")
for i in allowed_list:
    print(f"Available machine_type is: {i}\n")



