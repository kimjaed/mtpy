#!/bin/bash

#----------------------------------------------
# setting MTPYPATH ( mtpy packahe directory ) 
#----------------------------------------------

echo "==================================================================="
echo ""
echo "Change MTPYPATH if package installation in a different directory ! "
echo ""
echo "==================================================================="

export MTPYPATH="${HOME}/mtpy"

if ! [  -d "${MTPYPATH}" ]; then
    echo "Set mtpy package directory ! "
fi

if [ -d "${MTPYPYTHON}/temp" ]; then
    rm -f "${MTPYPYTHON}/temp/*"
    echo "Cleaned the tmp directory .... " 
fi

#----------------------------------------------
# Testing plot_edsi
#----------------------------------------------
echo "edi files plotting   ........ "
python ${MTPYPATH}/examples/scripts/plot_edis.py -d ${MTPYPATH}/examples/data/edi_files

#----------------------------------------------
# Testing edi_collection
#----------------------------------------------
echo "edi_collection       ........ "
python ${MTPYPATH}/mtpy/core/edi_collection.py -i ${MTPYPATH}/examples/data/edi_files

#----------------------------------------------
# Testing modem_data_to_phase_tensor
#----------------------------------------------
echo "modem_data_to_phase_tensor Testig ........ "
python ${MTPYPATH}/examples/scripts/modem_data_to_phase_tensor.py -i ${MTPYPATH}/examples/data/ModEM_files/Modular_MPI_NLCG_028.dat


#----------------------------------------------
# Testing penetration depth 1d
#----------------------------------------------
echo "penetration depth testing 1d ........ "
python ${MTPYPATH}/mtpy/imaging/penetration_depth1d.py -i ${MTPYPATH}/examples/data/edi_files 


#----------------------------------------------
# Testing penetration depth 2d
#----------------------------------------------
echo "penetration depth testing 1d ........ "
python ${MTPYPATH}/mtpy/imaging/penetration_depth2d.py -i ${MTPYPATH}/examples/data/edi_files 


#----------------------------------------------
# Testing plot response
#----------------------------------------------
echo "plot response ........ "
python ${MTPYPATH}/mtpy/imaging/plot_response.py -d ${MTPYPATH}/examples/model_files/ModEM_2

#----------------------------------------------
# Testing shape files generation
#----------------------------------------------
echo "Shape files genetation  ........ "
python ${MTPYPATH}/mtpy/utils/shapefiles.py -i ${MTPYPATH}/examples/data/edi_files


#----------------------------------------------
# Testing shape files creator
#----------------------------------------------
echo "shaope files creator  ........ "
python ${MTPYPATH}/mtpy/utils/shapefiles_creator.py -i ${MTPYPATH}/examples/data/edi_files

#----------------------------------------------
# Testing Creating Modem Input
#----------------------------------------------
echo "Modem Input           ........ "
python ${MTPYPATH}/examples/scripts/create_modem_input.py -i ${MTPYPATH}/examples/data/edi_files

