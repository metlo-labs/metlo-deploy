if [ -z "$1" ]
  then
    echo "No arguments supplied for OS. Choose either --ubuntu, --debian";
    exit 1
fi

OS_VARIANT=0

for i in "$@"; do
    case $i in
        --ubuntu)
            OS_VARIANT=1
            shift
            ;;
        # --alpine)
        #     OS_VARIANT=2
        #     shift
        #     ;;
        --debian)
            OS_VARIANT=3
            shift
            ;;
        -*|--*)
            echo "Unknown option $i"
            exit 1
            ;;
        *)
        ;;
    esac
done

if [ $OS_VARIANT -eq 0 ]
    then
        echo "Illegal argument supplied for OS $1. Choose either --ubuntu, --debian";
        exit 1;
fi

if [ $OS_VARIANT -eq 1 ]
    then
        OS=ubuntu
fi

# if [ $OS_VARIANT -eq 2 ]
#     then
#         OS=alpine
# fi

if [ $OS_VARIANT -eq 3 ]
    then
        OS=debian
fi

S3_METLO_NGINX_BINDS_URL="https://metlo-releases.s3.us-west-2.amazonaws.com/metlo_nginx_module_amd64_"
S3_METLO_NGINX_BINDS_URL=$S3_METLO_NGINX_BINDS_URL$OS
S3_METLO_NGINX_BINDS_URL=$S3_METLO_NGINX_BINDS_URL"_latest.so"

apt-get update -y
apt-get install curl -y
curl $S3_METLO_NGINX_BINDS_URL > /etc/nginx/modules/ngx_metlo_module.so