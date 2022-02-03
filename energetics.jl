# put different flavors on different sites to reduce local physical dim
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
        t1 = 1
        t2 = 0.5
        G = parse(Float64,ARGS[1]) #Note that here G is positive!!!
        G1 = G
        G2 = G

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

        ampo_free = AutoMPO()
	ampo_int = AutoMPO()
        
        for i = 1:N
            ########## f3 ##########################
            ## Edge A
                ampo_free += t1*exp(-im*pi/4), "C3d", 4*(4*i-3-1)+1, "C3", 4*(4*i-1-1)+1
                ampo_free += t1*exp(im*pi/4),  "C3d", 4*(4*i-1-1)+1, "C3", 4*(4*i-3-1)+1
                if i < N
                        ampo_free += t1*exp(im*pi/4),  "C3d", 4*(4*i-1-1)+1, "C3", 4*(mod(4*i+1,4*N)-1)+1
                        ampo_free += t1*exp(-im*pi/4), "C3d", 4*(mod(4*i+1,4*N)-1)+1, "C3", 4*(4*i-1-1)+1
                end
            ## Edge B
                ampo_free += t1*exp(im*pi/4),  "C3d", 4*(4*i-2-1)+1, "C3", 4*(4*i-1)+1
                ampo_free += t1*exp(-im*pi/4), "C3d", 4*(4*i-1)+1,   "C3", 4*(4*i-2-1)+1
                if i < N
                        ampo_free += t1*exp(-im*pi/4), "C3d", 4*(4*i-1)+1,   "C3", 4*(mod(4*i+2,4*N)-1)+1
                        ampo_free += t1*exp(im*pi/4),  "C3d", 4*(mod(4*i+2,4*N)-1)+1, "C3", 4*(4*i-1)+1
                end
            ## inter-edge hopping
                ampo_free += -t2, "C3d", 4*(4*i-3-1)+1, "C3", 4*(4*i-1)+1
                ampo_free += -t2, "C3d", 4*(4*i-2-1)+1, "C3", 4*(4*i-1-1)+1
                ampo_free += t1*exp(im*pi/4),  "C3d", 4*(4*i-3-1)+1, "C3", 4*(4*i-2-1)+1
                ampo_free += t1*exp(-im*pi/4), "C3d", 4*(4*i-1-1)+1, "C3", 4*(4*i-1)+1

                ampo_free += -t2, "C3d", 4*(4*i-1)+1,   "C3", 4*(4*i-3-1)+1
                ampo_free += -t2, "C3d", 4*(4*i-1-1)+1, "C3", 4*(4*i-2-1)+1
                ampo_free += t1*exp(-im*pi/4), "C3d", 4*(4*i-2-1)+1, "C3", 4*(4*i-3-1)+1
                ampo_free += t1*exp(+im*pi/4), "C3d", 4*(4*i-1)+1,   "C3", 4*(4*i-1-1)+1
                if i < N
                        ampo_free += t2,  "C3d", 4*(4*i-1-1)+1, "C3", 4*(mod(4*i+2,4*N)-1)+1
                        ampo_free += t2,  "C3d", 4*(4*i-1)+1,   "C3", 4*(mod(4*i+1,4*N)-1)+1
                        ampo_free += t2,  "C3d", 4*(mod(4*i+2,4*N)-1)+1, "C3", 4*(4*i-1-1)+1
                        ampo_free += t2,  "C3d", 4*(mod(4*i+1,4*N)-1)+1, "C3", 4*(4*i-1)+1
                end
                
            ########## f4 ##########################
            ## Edge A
                ampo_free += t1*exp(-im*pi/4), "C4d", 4*(4*i-3-1)+2, "C4", 4*(4*i-1-1)+2
                ampo_free += t1*exp(im*pi/4),  "C4d", 4*(4*i-1-1)+2, "C4", 4*(4*i-3-1)+2
                if i < N
                        ampo_free += t1*exp(im*pi/4),  "C4d", 4*(4*i-1-1)+2, "C4", 4*(mod(4*i+1,4*N)-1)+2
                        ampo_free += t1*exp(-im*pi/4), "C4d", 4*(mod(4*i+1,4*N)-1)+2, "C4", 4*(4*i-1-1)+2
                end
            ## Edge B
                ampo_free += t1*exp(im*pi/4),  "C4d", 4*(4*i-2-1)+2, "C4", 4*(4*i-1)+2
                ampo_free += t1*exp(-im*pi/4), "C4d", 4*(4*i-1)+2,   "C4", 4*(4*i-2-1)+2
                if i < N
                        ampo_free += t1*exp(-im*pi/4), "C4d", 4*(4*i-1)+2,   "C4", 4*(mod(4*i+2,4*N)-1)+2
                        ampo_free += t1*exp(im*pi/4),  "C4d", 4*(mod(4*i+2,4*N)-1)+2, "C4", 4*(4*i-1)+2
                end
            ## inter-edge hopping
                ampo_free += -t2, "C4d", 4*(4*i-3-1)+2, "C4", 4*(4*i-1)+2
                ampo_free += -t2, "C4d", 4*(4*i-2-1)+2, "C4", 4*(4*i-1-1)+2
                ampo_free += t1*exp(im*pi/4),  "C4d", 4*(4*i-3-1)+2, "C4", 4*(4*i-2-1)+2
                ampo_free += t1*exp(-im*pi/4), "C4d", 4*(4*i-1-1)+2, "C4", 4*(4*i-1)+2

                ampo_free += -t2, "C4d", 4*(4*i-1)+2,   "C4", 4*(4*i-3-1)+2
                ampo_free += -t2, "C4d", 4*(4*i-1-1)+2, "C4", 4*(4*i-2-1)+2
                ampo_free += t1*exp(-im*pi/4), "C4d", 4*(4*i-2-1)+2, "C4", 4*(4*i-3-1)+2
                ampo_free += t1*exp(+im*pi/4), "C4d", 4*(4*i-1)+2,   "C4", 4*(4*i-1-1)+2
                if i < N
                        ampo_free += t2,  "C4d", 4*(4*i-1-1)+2, "C4", 4*(mod(4*i+2,4*N)-1)+2
                        ampo_free += t2,  "C4d", 4*(4*i-1)+2,   "C4", 4*(mod(4*i+1,4*N)-1)+2
                        ampo_free += t2,  "C4d", 4*(mod(4*i+2,4*N)-1)+2, "C4", 4*(4*i-1-1)+2
                        ampo_free += t2,  "C4d", 4*(mod(4*i+1,4*N)-1)+2, "C4", 4*(4*i-1)+2
                end
           
            ########## f5 ##########################
            ## Edge A
                ampo_free += t1*exp(im*pi/4), "C5d", 4*(4*i-3-1)+3, "C5", 4*(4*i-1-1)+3
                ampo_free += t1*exp(-im*pi/4),  "C5d", 4*(4*i-1-1)+3, "C5", 4*(4*i-3-1)+3
                if i < N
                        ampo_free += t1*exp(-im*pi/4),  "C5d", 4*(4*i-1-1)+3, "C5", 4*(mod(4*i+1,4*N)-1)+3
                        ampo_free += t1*exp(im*pi/4), "C5d", 4*(mod(4*i+1,4*N)-1)+3, "C5", 4*(4*i-1-1)+3
                end
            ## Edge B
                ampo_free += t1*exp(-im*pi/4),  "C5d", 4*(4*i-2-1)+3, "C5", 4*(4*i-1)+3
                ampo_free += t1*exp(im*pi/4), "C5d", 4*(4*i-1)+3,   "C5", 4*(4*i-2-1)+3
                if i < N
                        ampo_free += t1*exp(im*pi/4), "C5d", 4*(4*i-1)+3,   "C5", 4*(mod(4*i+2,4*N)-1)+3
                        ampo_free += t1*exp(-im*pi/4),  "C5d", 4*(mod(4*i+2,4*N)-1)+3, "C5", 4*(4*i-1)+3
                end
            ## inter-edge hopping
                ampo_free += -t2, "C5d", 4*(4*i-3-1)+3, "C5", 4*(4*i-1)+3
                ampo_free += -t2, "C5d", 4*(4*i-2-1)+3, "C5", 4*(4*i-1-1)+3
                ampo_free += t1*exp(-im*pi/4),  "C5d", 4*(4*i-3-1)+3, "C5", 4*(4*i-2-1)+3
                ampo_free += t1*exp(im*pi/4), "C5d", 4*(4*i-1-1)+3, "C5", 4*(4*i-1)+3

                ampo_free += -t2, "C5d", 4*(4*i-1)+3,   "C5", 4*(4*i-3-1)+3
                ampo_free += -t2, "C5d", 4*(4*i-1-1)+3, "C5", 4*(4*i-2-1)+3
                ampo_free += t1*exp(im*pi/4), "C5d", 4*(4*i-2-1)+3, "C5", 4*(4*i-3-1)+3
                ampo_free += t1*exp(-im*pi/4), "C5d", 4*(4*i-1)+3,   "C5", 4*(4*i-1-1)+3
                if i < N
                        ampo_free += t2,  "C5d", 4*(4*i-1-1)+3, "C5", 4*(mod(4*i+2,4*N)-1)+3
                        ampo_free += t2,  "C5d", 4*(4*i-1)+3,   "C5", 4*(mod(4*i+1,4*N)-1)+3
                        ampo_free += t2,  "C5d", 4*(mod(4*i+2,4*N)-1)+3, "C5", 4*(4*i-1-1)+3
                        ampo_free += t2,  "C5d", 4*(mod(4*i+1,4*N)-1)+3, "C5", 4*(4*i-1)+3
                end
    
            ########## f0 ##########################
            ## Edge A
                ampo_free += t1*exp(im*pi/4), "C0d", 4*(4*i-3-1)+4, "C0", 4*(4*i-1-1)+4
                ampo_free += t1*exp(-im*pi/4),  "C0d", 4*(4*i-1-1)+4, "C0", 4*(4*i-3-1)+4
                if i < N
                        ampo_free += t1*exp(-im*pi/4),  "C0d", 4*(4*i-1-1)+4, "C0", 4*(mod(4*i+1,4*N)-1)+4
                        ampo_free += t1*exp(im*pi/4), "C0d", 4*(mod(4*i+1,4*N)-1)+4, "C0", 4*(4*i-1-1)+4
                end
            ## Edge B
                ampo_free += t1*exp(-im*pi/4),  "C0d", 4*(4*i-2-1)+4, "C0", 4*(4*i-1)+4
                ampo_free += t1*exp(im*pi/4), "C0d", 4*(4*i-1)+4,   "C0", 4*(4*i-2-1)+4
                if i < N
                        ampo_free += t1*exp(im*pi/4), "C0d", 4*(4*i-1)+4,   "C0", 4*(mod(4*i+2,4*N)-1)+4
                        ampo_free += t1*exp(-im*pi/4),  "C0d", 4*(mod(4*i+2,4*N)-1)+4, "C0", 4*(4*i-1)+4
                end
            ## inter-edge hopping
                ampo_free += -t2, "C0d", 4*(4*i-3-1)+4, "C0", 4*(4*i-1)+4
                ampo_free += -t2, "C0d", 4*(4*i-2-1)+4, "C0", 4*(4*i-1-1)+4
                ampo_free += t1*exp(-im*pi/4),  "C0d", 4*(4*i-3-1)+4, "C0", 4*(4*i-2-1)+4
                ampo_free += t1*exp(im*pi/4), "C0d", 4*(4*i-1-1)+4, "C0", 4*(4*i-1)+4

                ampo_free += -t2, "C0d", 4*(4*i-1)+4,   "C0", 4*(4*i-3-1)+4
                ampo_free += -t2, "C0d", 4*(4*i-1-1)+4, "C0", 4*(4*i-2-1)+4
                ampo_free += t1*exp(im*pi/4), "C0d", 4*(4*i-2-1)+4, "C0", 4*(4*i-3-1)+4
                ampo_free += t1*exp(-im*pi/4), "C0d", 4*(4*i-1)+4,   "C0", 4*(4*i-1-1)+4
                if i < N
                        ampo_free += t2,  "C0d", 4*(4*i-1-1)+4, "C0", 4*(mod(4*i+2,4*N)-1)+4
                        ampo_free += t2,  "C0d", 4*(4*i-1)+4,   "C0", 4*(mod(4*i+1,4*N)-1)+4
                        ampo_free += t2,  "C0d", 4*(mod(4*i+2,4*N)-1)+4, "C0", 4*(4*i-1-1)+4
                        ampo_free += t2,  "C0d", 4*(mod(4*i+1,4*N)-1)+4, "C0", 4*(4*i-1)+4
                end           
        end
        
        for i = 1:(2*N-1)
        	## interactions on edge B
        	ampo_int +=	G1, "C3", 4*(2*i-1)+1, "C5",4*(2*i-1)+3, "C4d",4*(2*i-1)+2, "C4d",4*(2*i+1)+2, "C0",4*(2*i-1)+4, "C0",4*(2*i+1)+4
            	ampo_int += G1, "C0d",4*(2*i+1)+4, "C0d",4*(2*i-1)+4, "C4",4*(2*i+1)+2, "C4",4*(2*i-1)+2, "C5d", 4*(2*i-1)+3, "C3d",4*(2*i-1)+1	
            	ampo_int += G2, "C3",4*(2*i-1)+1, "C3",4*(2*i+1)+1, "C5d",4*(2*i-1)+3, "C5d",4*(2*i+1)+3, "C4",4*(2*i-1)+2, "C0",4*(2*i-1)+4
        	ampo_int += G2, "C0d",4*(2*i-1)+4, "C4d",4*(2*i-1)+2, "C5",4*(2*i+1)+3, "C5",4*(2*i-1)+3, "C3d",4*(2*i+1)+1, "C3d",4*(2*i-1)+1
        end

        H_free = MPO(ampo_free,sites)
	H_int = MPO(ampo_int,sites)

	if isfile("mps-$N-$G.h5")
                file = h5open("mps-$N-$G.h5","r")
                psi = read(file,"mps-$N-$G",MPS)
                psi = replace_siteinds(psi,sites)
                close(file)
                # here goes the energetics based on psi
                # and save to the dictionaries
		E_free = real(inner(psi,H_free,psi))/N
		E_int = real(inner(psi,H_int,psi))/N
		EG_dict = load("EG-$N-D8000.jld")["data"]
		EG_dict[G] = [E_free,E_int]    # store E_free and E_int separately 
		save("EG-$N-D8000.jld","data",EG_dict)	
        end
       
        return
end        
        
        
        
        
        
        
        
        
        
        
        
        
