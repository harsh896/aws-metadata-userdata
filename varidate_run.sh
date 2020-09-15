while getopts m: option
do
case "${option}"
in
m) METHOD=${OPTARG};;
esac
done
if [[ ("$METHOD" == "create") || ("$METHOD" == "update")]];
then
    echo $METHOD
else
    echo "Please Specify a valid METHOD 'create' or 'update'."
    exit 1 
fi

file_name=main.yaml
STACK_NAME=Ec2Instance-stack
PROFILE=upwork
TEMPLATES=($file_name)
stack_path=$PWD

for template in "${TEMPLATES[@]}"
do
echo "Validating $template"
if aws cloudformation validate-template --template-body file://$stack_path/$template --profile ${PROFILE} >> /dev/null
then
    echo "---- $template is valid"
    aws cloudformation ${METHOD}-stack --template-body file://$stack_path/$file_name \
    --parameters file://$stack_path/parameters.json --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --stack-name ${STACK_NAME} --profile ${PROFILE}
    echo "Script Ended"
else
    echo "---- $template is invalid" 
fi
done
