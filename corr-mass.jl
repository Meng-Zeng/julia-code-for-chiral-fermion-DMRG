using ITensors, HDF5, JLD, DelimitedFiles

function ITensors.space(
  ::SiteType"CF3";
  conserve_qns=false,
  conserve_Q1=conserve_qns,
  conserve_Q2=conserve_qns,
  conserve_nfparity=conserve_qns,
  qnname_Q1="Q1",
  qnname_Q2="Q2",
  qnname_nfparity="NfParity",
 ) 
  
  if conserve_Q1 && conserve_Q2 && conserve_nfparity
    return [
      # 0 particle
      QN((qnname_Q1, 0),(qnname_Q2, 0),(qnname_nfparity,0,-2)) => 1,
      # 1 particle
      QN((qnname_Q1, +3),(qnname_Q2, 0),(qnname_nfparity,1,-2)) => 1,
    ]
  end
  return 2
end

ITensors.space(::SiteType"CF4") = 2
function ITensors.space(
  ::SiteType"CF4";
  conserve_qns=false,
  conserve_Q1=conserve_qns,
  conserve_Q2=conserve_qns,
  conserve_nfparity=conserve_qns,
  qnname_Q1="Q1",
  qnname_Q2="Q2",
  qnname_nfparity="NfParity",
 ) 
  
  if conserve_Q1 && conserve_Q2 && conserve_nfparity
    return [
      # 0 particle
      QN((qnname_Q1, 0),(qnname_Q2, 0),(qnname_nfparity,0,-2)) => 1,
      # 1 particle
      QN((qnname_Q1, +4),(qnname_Q2, +5),(qnname_nfparity,1,-2)) => 1,
    ]
  end
  return 2
end

ITensors.space(::SiteType"CF5") = 2
function ITensors.space(
  ::SiteType"CF5";
  conserve_qns=false,
  conserve_Q1=conserve_qns,
  conserve_Q2=conserve_qns,
  conserve_nfparity=conserve_qns,
  qnname_Q1="Q1",
  qnname_Q2="Q2",
  qnname_nfparity="NfParity",
 ) 
  
  if conserve_Q1 && conserve_Q2 && conserve_nfparity
    return [
      # 0 particle
      QN((qnname_Q1, 0),(qnname_Q2, 0),(qnname_nfparity,0,-2)) => 1,
      # 1 particle
      QN((qnname_Q1, +5),(qnname_Q2, +4),(qnname_nfparity,1,-2)) => 1,
    ]
  end
  return 2
end

ITensors.space(::SiteType"CF0") = 2
function ITensors.space(
  ::SiteType"CF0";
  conserve_qns=false,
  conserve_Q1=conserve_qns,
  conserve_Q2=conserve_qns,
  conserve_nfparity=conserve_qns,
  qnname_Q1="Q1",
  qnname_Q2="Q2",
  qnname_nfparity="NfParity",
 ) 
  
  if conserve_Q1 && conserve_Q2 && conserve_nfparity
    return [
      # 0 particle
      QN((qnname_Q1, 0),(qnname_Q2, 0),(qnname_nfparity,0,-2)) => 1,
      # 1 particle
      QN((qnname_Q1, 0),(qnname_Q2, +3),(qnname_nfparity,1,-2)) => 1,
    ]
  end
  return 2
end

ITensors.val(::StateName"Emp",::SiteType"CF3" ) = 1
ITensors.val(::StateName"f3",::SiteType"CF3" ) = 2
ITensors.val(::StateName"Emp",::SiteType"CF4" ) = 1
ITensors.val(::StateName"f4",::SiteType"CF4" ) = 2
ITensors.val(::StateName"Emp",::SiteType"CF5" ) = 1
ITensors.val(::StateName"f5",::SiteType"CF5" ) = 2
ITensors.val(::StateName"Emp",::SiteType"CF0" ) = 1
ITensors.val(::StateName"f0",::SiteType"CF0" ) = 2

ITensors.state(::StateName"Emp",::SiteType"CF3" ) = [1.0 0.0]
ITensors.state(::StateName"f3",::SiteType"CF3" )  = [0.0 1.0]
ITensors.state(::StateName"Emp",::SiteType"CF4" ) = [1.0 0.0]
ITensors.state(::StateName"f4",::SiteType"CF4" )  = [0.0 1.0]
ITensors.state(::StateName"Emp",::SiteType"CF5" ) = [1.0 0.0]
ITensors.state(::StateName"f5",::SiteType"CF5" )  = [0.0 1.0]
ITensors.state(::StateName"Emp",::SiteType"CF0" ) = [1.0 0.0]
ITensors.state(::StateName"f0",::SiteType"CF0" )  = [0.0 1.0]

function ITensors.op!(Op::ITensor, ::OpName"C3", ::SiteType"CF3", s::Index)
  return Op[s' => 1, s => 2] = 1.0
end

function ITensors.op!(Op::ITensor, ::OpName"C3d", ::SiteType"CF3", s::Index)
  return Op[s' => 2, s => 1] = 1.0
end

function ITensors.op!(Op::ITensor, ::OpName"C4", ::SiteType"CF4", s::Index)
  return Op[s' => 1, s => 2] = 1.0
end

function ITensors.op!(Op::ITensor, ::OpName"C4d", ::SiteType"CF4", s::Index)
  return Op[s' => 2, s => 1] = 1.0
end

function ITensors.op!(Op::ITensor, ::OpName"C5", ::SiteType"CF5", s::Index)
  return Op[s' => 1, s => 2] = 1.0
end

function ITensors.op!(Op::ITensor, ::OpName"C5d", ::SiteType"CF5", s::Index)
  return Op[s' => 2, s => 1] = 1.0
end

function ITensors.op!(Op::ITensor, ::OpName"C0", ::SiteType"CF0", s::Index)
  return Op[s' => 1, s => 2] = 1.0
end

function ITensors.op!(Op::ITensor, ::OpName"C0d", ::SiteType"CF0", s::Index)
  return Op[s' => 2, s => 1] = 1.0
end

function ITensors.op!(Op::ITensor, ::OpName"N3", ::SiteType"CF3", s::Index)
  return Op[s' => 2, s => 2] = 1.0
end

function ITensors.op!(Op::ITensor, ::OpName"N4", ::SiteType"CF4", s::Index)
  return Op[s' => 2, s => 2] = 1.0
end

function ITensors.op!(Op::ITensor, ::OpName"N5", ::SiteType"CF5", s::Index)
  return Op[s' => 2, s => 2] = 1.0
end

function ITensors.op!(Op::ITensor, ::OpName"N0", ::SiteType"CF0", s::Index)
  return Op[s' => 2, s => 2] = 1.0
end

function ITensors.op!(Op::ITensor, ::OpName"F", ::SiteType"CF3", s::Index)
  Op[s'=>1,s=>1] = +1.0
  Op[s'=>2,s=>2] = -1.0
end

function ITensors.op!(Op::ITensor, ::OpName"F", ::SiteType"CF4", s::Index)
  Op[s'=>1,s=>1] = +1.0
  Op[s'=>2,s=>2] = -1.0
end

function ITensors.op!(Op::ITensor, ::OpName"F", ::SiteType"CF5", s::Index)
  Op[s'=>1,s=>1] = +1.0
  Op[s'=>2,s=>2] = -1.0
end

function ITensors.op!(Op::ITensor, ::OpName"F", ::SiteType"CF0", s::Index)
  Op[s'=>1,s=>1] = +1.0
  Op[s'=>2,s=>2] = -1.0
end


ITensors.has_fermion_string(::OpName"C3", ::SiteType"CF3") = true
ITensors.has_fermion_string(::OpName"C3d", ::SiteType"CF3") = true
ITensors.has_fermion_string(::OpName"C4", ::SiteType"CF4") = true
ITensors.has_fermion_string(::OpName"C4d", ::SiteType"CF4") = true
ITensors.has_fermion_string(::OpName"C5", ::SiteType"CF5") = true
ITensors.has_fermion_string(::OpName"C5d", ::SiteType"CF5") = true
ITensors.has_fermion_string(::OpName"C0", ::SiteType"CF0") = true
ITensors.has_fermion_string(::OpName"C0d", ::SiteType"CF0") = true

let
        N = 20    
        G = parse(Float64,ARGS[1])         
	function site_type(n::Int)
       		if mod(n,4)==1
         		return "CF3"
         	end
         	if mod(n,4)==2
         		return "CF4"
         	end
         	if mod(n,4)==3
         		return "CF5"
         	end
         	if mod(n,4)==0
         		return "CF0"
         	end       		
	end
	sites = siteinds(n -> site_type(n), 16*N; conserve_qns=true)
		
	f = h5open("mps-$N-$G.h5","r")  
	psi = read(f,"mps-$N-$G",MPS)
        psi = replace_siteinds(psi,sites)
        close(f)   

        #################### correlations for the four fermions #########################
        correlation_Dirac35_A = zeros(ComplexF64,1,N-1)
	correlation_Dirac30_A = zeros(ComplexF64,1,N-1)
	correlation_Dirac45_A = zeros(ComplexF64,1,N-1)
	correlation_Dirac40_A = zeros(ComplexF64,1,N-1)
        correlation_Dirac35_B = zeros(ComplexF64,1,N-1)
        correlation_Dirac30_B = zeros(ComplexF64,1,N-1)
        correlation_Dirac45_B = zeros(ComplexF64,1,N-1)
        correlation_Dirac40_B = zeros(ComplexF64,1,N-1)

        correlation_Maj35_A = zeros(ComplexF64,1,N-1)
        correlation_Maj30_A = zeros(ComplexF64,1,N-1)
        correlation_Maj45_A = zeros(ComplexF64,1,N-1)
        correlation_Maj40_A = zeros(ComplexF64,1,N-1)
        correlation_Maj35_B = zeros(ComplexF64,1,N-1)
        correlation_Maj30_B = zeros(ComplexF64,1,N-1)
        correlation_Maj45_B = zeros(ComplexF64,1,N-1)
        correlation_Maj40_B = zeros(ComplexF64,1,N-1)

        for d = 1:(N-1)             
                i = floor(Int8,N/2) - floor(Int8,d/2)
                corr_Dirac35_A = AutoMPO()
                corr_Dirac35_B = AutoMPO() 
                corr_Dirac35_A += "C3d",4*(4*(i-1)+1-1)+1,"C5",4*(4*(i-1)+1-1)+3,"C5d",4*(4*(i+d-1)+1-1)+3, "C3",4*(4*(i+d-1)+1-1)+1
                corr_Dirac35_B += "C3d",4*(4*(i-1)+2-1)+1,"C5",4*(4*(i-1)+2-1)+3,"C5d",4*(4*(i+d-1)+2-1)+3, "C3",4*(4*(i+d-1)+2-1)+1
                Corr_Dirac35_A = MPO(corr_Dirac35_A,sites)
                Corr_Dirac35_B = MPO(corr_Dirac35_B,sites)
                correlation_Dirac35_A[d] = inner(psi,Corr_Dirac35_A,psi)
                correlation_Dirac35_B[d] = inner(psi,Corr_Dirac35_B,psi)

		corr_Dirac40_A = AutoMPO()
                corr_Dirac40_B = AutoMPO()
                corr_Dirac40_A += "C4d",4*(4*(i-1)+1-1)+2,"C0",4*(4*(i-1)+1-1)+4,"C0d",4*(4*(i+d-1)+1-1)+4, "C4",4*(4*(i+d-1)+1-1)+2
                corr_Dirac40_B += "C4d",4*(4*(i-1)+2-1)+2,"C0",4*(4*(i-1)+2-1)+4,"C0d",4*(4*(i+d-1)+2-1)+4, "C4",4*(4*(i+d-1)+2-1)+2
                Corr_Dirac40_A = MPO(corr_Dirac40_A,sites)
                Corr_Dirac40_B = MPO(corr_Dirac40_B,sites)
                correlation_Dirac40_A[d] = inner(psi,Corr_Dirac40_A,psi)
                correlation_Dirac40_B[d] = inner(psi,Corr_Dirac40_B,psi)
        
                corr_Dirac30_A = AutoMPO()
                corr_Dirac30_B = AutoMPO()
                corr_Dirac30_A += "C3d",4*(4*(i-1)+1-1)+1,"C0",4*(4*(i-1)+1-1)+4,"C0d",4*(4*(i+d-1)+1-1)+4, "C3",4*(4*(i+d-1)+1-1)+1
                corr_Dirac30_B += "C3d",4*(4*(i-1)+2-1)+1,"C0",4*(4*(i-1)+2-1)+4,"C0d",4*(4*(i+d-1)+2-1)+4, "C3",4*(4*(i+d-1)+2-1)+1
                Corr_Dirac30_A = MPO(corr_Dirac30_A,sites)
                Corr_Dirac30_B = MPO(corr_Dirac30_B,sites)
                correlation_Dirac30_A[d] = inner(psi,Corr_Dirac30_A,psi)
                correlation_Dirac30_B[d] = inner(psi,Corr_Dirac30_B,psi)

                corr_Dirac45_A = AutoMPO()
                corr_Dirac45_B = AutoMPO()
                corr_Dirac45_A += "C4d",4*(4*(i-1)+1-1)+2,"C5",4*(4*(i-1)+1-1)+3,"C5d",4*(4*(i+d-1)+1-1)+3, "C4",4*(4*(i+d-1)+1-1)+2
                corr_Dirac45_B += "C4d",4*(4*(i-1)+2-1)+2,"C5",4*(4*(i-1)+2-1)+3,"C5d",4*(4*(i+d-1)+2-1)+3, "C4",4*(4*(i+d-1)+2-1)+2
                Corr_Dirac45_A = MPO(corr_Dirac45_A,sites)
                Corr_Dirac45_B = MPO(corr_Dirac45_B,sites)
                correlation_Dirac45_A[d] = inner(psi,Corr_Dirac45_A,psi)
                correlation_Dirac45_B[d] = inner(psi,Corr_Dirac45_B,psi)

              	corr_Maj35_A = AutoMPO()
                corr_Maj35_B = AutoMPO()
                corr_Maj35_A += "C3",4*(4*(i-1)+1-1)+1,"C5",4*(4*(i-1)+1-1)+3,"C5d",4*(4*(i+d-1)+1-1)+3, "C3d",4*(4*(i+d-1)+1-1)+1
                corr_Maj35_B += "C3",4*(4*(i-1)+2-1)+1,"C5",4*(4*(i-1)+2-1)+3,"C5d",4*(4*(i+d-1)+2-1)+3, "C3d",4*(4*(i+d-1)+2-1)+1
                Corr_Maj35_A = MPO(corr_Maj35_A,sites)
                Corr_Maj35_B = MPO(corr_Maj35_B,sites)
                correlation_Maj35_A[d] = inner(psi,Corr_Maj35_A,psi)
                correlation_Maj35_B[d] = inner(psi,Corr_Maj35_B,psi)

                corr_Maj40_A = AutoMPO()
                corr_Maj40_B = AutoMPO()
                corr_Maj40_A += "C4",4*(4*(i-1)+1-1)+2,"C0",4*(4*(i-1)+1-1)+4,"C0d",4*(4*(i+d-1)+1-1)+4, "C4d",4*(4*(i+d-1)+1-1)+2
                corr_Maj40_B += "C4",4*(4*(i-1)+2-1)+2,"C0",4*(4*(i-1)+2-1)+4,"C0d",4*(4*(i+d-1)+2-1)+4, "C4d",4*(4*(i+d-1)+2-1)+2
                Corr_Maj40_A = MPO(corr_Maj40_A,sites)
                Corr_Maj40_B = MPO(corr_Maj40_B,sites)
                correlation_Maj40_A[d] = inner(psi,Corr_Maj40_A,psi)
                correlation_Maj40_B[d] = inner(psi,Corr_Maj40_B,psi)

                corr_Maj30_A = AutoMPO()
                corr_Maj30_B = AutoMPO()
                corr_Maj30_A += "C3",4*(4*(i-1)+1-1)+1,"C0",4*(4*(i-1)+1-1)+4,"C0d",4*(4*(i+d-1)+1-1)+4, "C3d",4*(4*(i+d-1)+1-1)+1
                corr_Maj30_B += "C3",4*(4*(i-1)+2-1)+1,"C0",4*(4*(i-1)+2-1)+4,"C0d",4*(4*(i+d-1)+2-1)+4, "C3d",4*(4*(i+d-1)+2-1)+1
                Corr_Maj30_A = MPO(corr_Maj30_A,sites)
                Corr_Maj30_B = MPO(corr_Maj30_B,sites)
                correlation_Maj30_A[d] = inner(psi,Corr_Maj30_A,psi)
                correlation_Maj30_B[d] = inner(psi,Corr_Maj30_B,psi)

                corr_Maj45_A = AutoMPO()
                corr_Maj45_B = AutoMPO()
                corr_Maj45_A += "C4",4*(4*(i-1)+1-1)+2,"C5",4*(4*(i-1)+1-1)+3,"C5d",4*(4*(i+d-1)+1-1)+3, "C4d",4*(4*(i+d-1)+1-1)+2
                corr_Maj45_B += "C4",4*(4*(i-1)+2-1)+2,"C5",4*(4*(i-1)+2-1)+3,"C5d",4*(4*(i+d-1)+2-1)+3, "C4d",4*(4*(i+d-1)+2-1)+2
                Corr_Maj45_A = MPO(corr_Maj45_A,sites)
                Corr_Maj45_B = MPO(corr_Maj45_B,sites)
                correlation_Maj45_A[d] = inner(psi,Corr_Maj45_A,psi)
                correlation_Maj45_B[d] = inner(psi,Corr_Maj45_B,psi)
	end

        ############# save to csv file ############
        writedlm("corr-Dirac35-A-$N-D8000-$G.csv",correlation_Dirac35_A)
        writedlm("corr-Dirac35-B-$N-D8000-$G.csv",correlation_Dirac35_B)
        writedlm("corr-Dirac40-A-$N-D8000-$G.csv",correlation_Dirac40_A)
        writedlm("corr-Dirac40-B-$N-D8000-$G.csv",correlation_Dirac40_B)
        writedlm("corr-Dirac30-A-$N-D8000-$G.csv",correlation_Dirac30_A)
        writedlm("corr-Dirac30-B-$N-D8000-$G.csv",correlation_Dirac30_B)
        writedlm("corr-Dirac45-A-$N-D8000-$G.csv",correlation_Dirac45_A)
        writedlm("corr-Dirac45-B-$N-D8000-$G.csv",correlation_Dirac45_B)

        writedlm("corr-Maj35-A-$N-D8000-$G.csv",correlation_Maj35_A)
        writedlm("corr-Maj35-B-$N-D8000-$G.csv",correlation_Maj35_B)
        writedlm("corr-Maj40-A-$N-D8000-$G.csv",correlation_Maj40_A)
        writedlm("corr-Maj40-B-$N-D8000-$G.csv",correlation_Maj40_B)
        writedlm("corr-Maj30-A-$N-D8000-$G.csv",correlation_Maj30_A)
        writedlm("corr-Maj30-B-$N-D8000-$G.csv",correlation_Maj30_B)
        writedlm("corr-Maj45-A-$N-D8000-$G.csv",correlation_Maj45_A)
        writedlm("corr-Maj45-B-$N-D8000-$G.csv",correlation_Maj45_B)
end
