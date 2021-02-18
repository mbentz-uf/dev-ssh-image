function mysql() {
    host=$1
    shift
    user=$2
    pw=$3
    #docker run -it --network rc1051_redcap_network --rm mysql:5.7.32 mysql $host $user $pw
    docker run -it --network rc1051_redcap_network --rm cts-it/redcap-cypress-dev-env mysql $host $user $pw
    #docker run -it --network rc1051_redcap_network --rm mysql mysql -h rc1051_db -u redcap -p
}

function help {
    echo "Options available:"
}

function hi {
    echo "hello world"
}

function initSSH {
    eval $(ssh-agent)
    expect ~/.ssh/ssh-init.sh
}

function buildVM {
    cp settings/vagrant.ini.example settings/vagrant.ini
    fab vagrant server_setup
    fab vagrant coldfusion_setup
    fab vagrant add_datasources
    fab vagrant package
    PACKAGED_FILE=`ls -tr1 | tail -n 1`
    fab vagrant deploy:$PACKAGED_FILE
}
   
function startup {
    # build https://github.com/ctsit/webcamp_deployment/blob/master/README-developer.md
    if [ "$1" == "buildVM" ]; then
        echo $1
        initSSH
        buildVM                                                                                               
    elif [ "$1" == "hi" ]; then
        hi
    else
        echo "Positional parameter 1 is empty"
    fi
    # upgrade
    # cold fusion update
}
