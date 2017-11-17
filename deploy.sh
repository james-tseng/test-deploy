export deploy_name="testDEV-deploy-$(date +%Y%m%d-%H%M%S)";
export log_dir="/tmp/";
export log_file="$log_dir$deploy_name.log";
export log_bucket="gs://my-testdeploy-log/";
export src_path="/app/testdeploy/";


echo "Start deployment:$deploy_name" >> "$log_file";

cd "$src_path";

git branch | tee -a "$log_file";

git fetch | tee -a "$log_file";

git pull | tee -a "$log_file";

gsutil cp $log_file "$log_bucket/$deploy_name.log";
