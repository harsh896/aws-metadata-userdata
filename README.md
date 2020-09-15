# aws configure in your local machine with profile name
mention region ap-southeast-2(sydney)/us-west-2(N.California) as the instance image id is from that region
You can choose your own region and you have to change the ImageId parameter vaule as mentioned 
> Run: `aws configure --profile PROFILE_NAME`

# In valiadte and run shell sctipt file
This script will validate the template file and create/update the cloudformation stack through aws cli command. This script runs with an argument -m (create/update).

1. Before running the script, change the following value:
  - STACK_NAME, name of the cloudformation stack as you need
  - PROFILE, mention the PROFILE_NAME

2. To create the cloudformation template for first time, run:
   `./validate_run.sh -m create`
3. To update the cloudformation template, run:
   `./validate_run.sh -m update`


# Prameters in template (parameters.json)
By default all values are set, but if you want to change the values then you can change

### 1. ImageId
It will be automatically choosen by region you have added in aws configure above

### 2. InstanceType
You have to choose between following values:
   - t1.micro
   - t2.medium
   - t2.micro
   - t3.medium
   - t3.micro

### 3. KeyName
You have to create a key pair from AWS GUI

### 4. EC2Name
Name of the EC2 Instance
