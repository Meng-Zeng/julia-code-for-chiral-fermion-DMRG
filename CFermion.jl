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

        sweeps = Sweeps(15)
        maxdim!(sweeps,10,100,2000,4000,5000,8000)
        cutoff!(sweeps,1e-10)
        noise!(sweeps,1E-5)
        
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

        # filling = 1/2 on the ladder
        #states = [mod(i,8)==1 ? "f3" : "Emp" for i=1:16*N]
        #states = [mod(i,16*N)==1 ? "f3" : "Emp" for i=1:16*N]
        #states = ["f3","f4","f5","f0","f3","Emp","Emp","Emp","Emp","Emp","Emp","Emp","Emp","Emp","Emp","Emp"]
        
        #### half-filling with all 4 flavors
        states = ["Emp" for i=1:16*N]
        for i=1:16*N
        	if mod(i,8)==1
        		states[i] = "f3"
        	end
        	if mod(i,8)==2
        		states[i] = "f4"
        	end
        	if mod(i,8)==3
        		states[i] = "f5"
        	end
        	if mod(i,8)==4
        		states[i] = "f0"
        	end
        end

        ampo = AutoMPO()
        
        for i = 1:N
            ########## f3 ##########################
            ## Edge A
                ampo += t1*exp(-im*pi/4), "C3d", 4*(4*i-3-1)+1, "C3", 4*(4*i-1-1)+1
                ampo += t1*exp(im*pi/4),  "C3d", 4*(4*i-1-1)+1, "C3", 4*(4*i-3-1)+1
                if i < N
                        ampo += t1*exp(im*pi/4),  "C3d", 4*(4*i-1-1)+1, "C3", 4*(mod(4*i+1,4*N)-1)+1
                        ampo += t1*exp(-im*pi/4), "C3d", 4*(mod(4*i+1,4*N)-1)+1, "C3", 4*(4*i-1-1)+1
                end
            ## Edge B
                ampo += t1*exp(im*pi/4),  "C3d", 4*(4*i-2-1)+1, "C3", 4*(4*i-1)+1
                ampo += t1*exp(-im*pi/4), "C3d", 4*(4*i-1)+1,   "C3", 4*(4*i-2-1)+1
                if i < N
                        ampo += t1*exp(-im*pi/4), "C3d", 4*(4*i-1)+1,   "C3", 4*(mod(4*i+2,4*N)-1)+1
                        ampo += t1*exp(im*pi/4),  "C3d", 4*(mod(4*i+2,4*N)-1)+1, "C3", 4*(4*i-1)+1
                end
            ## inter-edge hopping
                ampo += -t2, "C3d", 4*(4*i-3-1)+1, "C3", 4*(4*i-1)+1
                ampo += -t2, "C3d", 4*(4*i-2-1)+1, "C3", 4*(4*i-1-1)+1
                ampo += t1*exp(im*pi/4),  "C3d", 4*(4*i-3-1)+1, "C3", 4*(4*i-2-1)+1
                ampo += t1*exp(-im*pi/4), "C3d", 4*(4*i-1-1)+1, "C3", 4*(4*i-1)+1

                ampo += -t2, "C3d", 4*(4*i-1)+1,   "C3", 4*(4*i-3-1)+1
                ampo += -t2, "C3d", 4*(4*i-1-1)+1, "C3", 4*(4*i-2-1)+1
                ampo += t1*exp(-im*pi/4), "C3d", 4*(4*i-2-1)+1, "C3", 4*(4*i-3-1)+1
                ampo += t1*exp(+im*pi/4), "C3d", 4*(4*i-1)+1,   "C3", 4*(4*i-1-1)+1
                if i < N
                        ampo += t2,  "C3d", 4*(4*i-1-1)+1, "C3", 4*(mod(4*i+2,4*N)-1)+1
                        ampo += t2,  "C3d", 4*(4*i-1)+1,   "C3", 4*(mod(4*i+1,4*N)-1)+1
                        ampo += t2,  "C3d", 4*(mod(4*i+2,4*N)-1)+1, "C3", 4*(4*i-1-1)+1
                        ampo += t2,  "C3d", 4*(mod(4*i+1,4*N)-1)+1, "C3", 4*(4*i-1)+1
                end
                
            ########## f4 ##########################
            ## Edge A
                ampo += t1*exp(-im*pi/4), "C4d", 4*(4*i-3-1)+2, "C4", 4*(4*i-1-1)+2
                ampo += t1*exp(im*pi/4),  "C4d", 4*(4*i-1-1)+2, "C4", 4*(4*i-3-1)+2
                if i < N
                        ampo += t1*exp(im*pi/4),  "C4d", 4*(4*i-1-1)+2, "C4", 4*(mod(4*i+1,4*N)-1)+2
                        ampo += t1*exp(-im*pi/4), "C4d", 4*(mod(4*i+1,4*N)-1)+2, "C4", 4*(4*i-1-1)+2
                end
            ## Edge B
                ampo += t1*exp(im*pi/4),  "C4d", 4*(4*i-2-1)+2, "C4", 4*(4*i-1)+2
                ampo += t1*exp(-im*pi/4), "C4d", 4*(4*i-1)+2,   "C4", 4*(4*i-2-1)+2
                if i < N
                        ampo += t1*exp(-im*pi/4), "C4d", 4*(4*i-1)+2,   "C4", 4*(mod(4*i+2,4*N)-1)+2
                        ampo += t1*exp(im*pi/4),  "C4d", 4*(mod(4*i+2,4*N)-1)+2, "C4", 4*(4*i-1)+2
                end
            ## inter-edge hopping
                ampo += -t2, "C4d", 4*(4*i-3-1)+2, "C4", 4*(4*i-1)+2
                ampo += -t2, "C4d", 4*(4*i-2-1)+2, "C4", 4*(4*i-1-1)+2
                ampo += t1*exp(im*pi/4),  "C4d", 4*(4*i-3-1)+2, "C4", 4*(4*i-2-1)+2
                ampo += t1*exp(-im*pi/4), "C4d", 4*(4*i-1-1)+2, "C4", 4*(4*i-1)+2

                ampo += -t2, "C4d", 4*(4*i-1)+2,   "C4", 4*(4*i-3-1)+2
                ampo += -t2, "C4d", 4*(4*i-1-1)+2, "C4", 4*(4*i-2-1)+2
                ampo += t1*exp(-im*pi/4), "C4d", 4*(4*i-2-1)+2, "C4", 4*(4*i-3-1)+2
                ampo += t1*exp(+im*pi/4), "C4d", 4*(4*i-1)+2,   "C4", 4*(4*i-1-1)+2
                if i < N
                        ampo += t2,  "C4d", 4*(4*i-1-1)+2, "C4", 4*(mod(4*i+2,4*N)-1)+2
                        ampo += t2,  "C4d", 4*(4*i-1)+2,   "C4", 4*(mod(4*i+1,4*N)-1)+2
                        ampo += t2,  "C4d", 4*(mod(4*i+2,4*N)-1)+2, "C4", 4*(4*i-1-1)+2
                        ampo += t2,  "C4d", 4*(mod(4*i+1,4*N)-1)+2, "C4", 4*(4*i-1)+2
                end
           
            ########## f5 ##########################
            ## Edge A
                ampo += t1*exp(im*pi/4), "C5d", 4*(4*i-3-1)+3, "C5", 4*(4*i-1-1)+3
                ampo += t1*exp(-im*pi/4),  "C5d", 4*(4*i-1-1)+3, "C5", 4*(4*i-3-1)+3
                if i < N
                        ampo += t1*exp(-im*pi/4),  "C5d", 4*(4*i-1-1)+3, "C5", 4*(mod(4*i+1,4*N)-1)+3
                        ampo += t1*exp(im*pi/4), "C5d", 4*(mod(4*i+1,4*N)-1)+3, "C5", 4*(4*i-1-1)+3
                end
            ## Edge B
                ampo += t1*exp(-im*pi/4),  "C5d", 4*(4*i-2-1)+3, "C5", 4*(4*i-1)+3
                ampo += t1*exp(im*pi/4), "C5d", 4*(4*i-1)+3,   "C5", 4*(4*i-2-1)+3
                if i < N
                        ampo += t1*exp(im*pi/4), "C5d", 4*(4*i-1)+3,   "C5", 4*(mod(4*i+2,4*N)-1)+3
                        ampo += t1*exp(-im*pi/4),  "C5d", 4*(mod(4*i+2,4*N)-1)+3, "C5", 4*(4*i-1)+3
                end
            ## inter-edge hopping
                ampo += -t2, "C5d", 4*(4*i-3-1)+3, "C5", 4*(4*i-1)+3
                ampo += -t2, "C5d", 4*(4*i-2-1)+3, "C5", 4*(4*i-1-1)+3
                ampo += t1*exp(-im*pi/4),  "C5d", 4*(4*i-3-1)+3, "C5", 4*(4*i-2-1)+3
                ampo += t1*exp(im*pi/4), "C5d", 4*(4*i-1-1)+3, "C5", 4*(4*i-1)+3

                ampo += -t2, "C5d", 4*(4*i-1)+3,   "C5", 4*(4*i-3-1)+3
                ampo += -t2, "C5d", 4*(4*i-1-1)+3, "C5", 4*(4*i-2-1)+3
                ampo += t1*exp(im*pi/4), "C5d", 4*(4*i-2-1)+3, "C5", 4*(4*i-3-1)+3
                ampo += t1*exp(-im*pi/4), "C5d", 4*(4*i-1)+3,   "C5", 4*(4*i-1-1)+3
                if i < N
                        ampo += t2,  "C5d", 4*(4*i-1-1)+3, "C5", 4*(mod(4*i+2,4*N)-1)+3
                        ampo += t2,  "C5d", 4*(4*i-1)+3,   "C5", 4*(mod(4*i+1,4*N)-1)+3
                        ampo += t2,  "C5d", 4*(mod(4*i+2,4*N)-1)+3, "C5", 4*(4*i-1-1)+3
                        ampo += t2,  "C5d", 4*(mod(4*i+1,4*N)-1)+3, "C5", 4*(4*i-1)+3
                end
    
            ########## f0 ##########################
            ## Edge A
                ampo += t1*exp(im*pi/4), "C0d", 4*(4*i-3-1)+4, "C0", 4*(4*i-1-1)+4
                ampo += t1*exp(-im*pi/4),  "C0d", 4*(4*i-1-1)+4, "C0", 4*(4*i-3-1)+4
                if i < N
                        ampo += t1*exp(-im*pi/4),  "C0d", 4*(4*i-1-1)+4, "C0", 4*(mod(4*i+1,4*N)-1)+4
                        ampo += t1*exp(im*pi/4), "C0d", 4*(mod(4*i+1,4*N)-1)+4, "C0", 4*(4*i-1-1)+4
                end
            ## Edge B
                ampo += t1*exp(-im*pi/4),  "C0d", 4*(4*i-2-1)+4, "C0", 4*(4*i-1)+4
                ampo += t1*exp(im*pi/4), "C0d", 4*(4*i-1)+4,   "C0", 4*(4*i-2-1)+4
                if i < N
                        ampo += t1*exp(im*pi/4), "C0d", 4*(4*i-1)+4,   "C0", 4*(mod(4*i+2,4*N)-1)+4
                        ampo += t1*exp(-im*pi/4),  "C0d", 4*(mod(4*i+2,4*N)-1)+4, "C0", 4*(4*i-1)+4
                end
            ## inter-edge hopping
                ampo += -t2, "C0d", 4*(4*i-3-1)+4, "C0", 4*(4*i-1)+4
                ampo += -t2, "C0d", 4*(4*i-2-1)+4, "C0", 4*(4*i-1-1)+4
                ampo += t1*exp(-im*pi/4),  "C0d", 4*(4*i-3-1)+4, "C0", 4*(4*i-2-1)+4
                ampo += t1*exp(im*pi/4), "C0d", 4*(4*i-1-1)+4, "C0", 4*(4*i-1)+4

                ampo += -t2, "C0d", 4*(4*i-1)+4,   "C0", 4*(4*i-3-1)+4
                ampo += -t2, "C0d", 4*(4*i-1-1)+4, "C0", 4*(4*i-2-1)+4
                ampo += t1*exp(im*pi/4), "C0d", 4*(4*i-2-1)+4, "C0", 4*(4*i-3-1)+4
                ampo += t1*exp(-im*pi/4), "C0d", 4*(4*i-1)+4,   "C0", 4*(4*i-1-1)+4
                if i < N
                        ampo += t2,  "C0d", 4*(4*i-1-1)+4, "C0", 4*(mod(4*i+2,4*N)-1)+4
                        ampo += t2,  "C0d", 4*(4*i-1)+4,   "C0", 4*(mod(4*i+1,4*N)-1)+4
                        ampo += t2,  "C0d", 4*(mod(4*i+2,4*N)-1)+4, "C0", 4*(4*i-1-1)+4
                        ampo += t2,  "C0d", 4*(mod(4*i+1,4*N)-1)+4, "C0", 4*(4*i-1)+4
                end           
        end
        
        for i = 1:(2*N-1)
        	## interactions on edge B
        	ampo +=	G1, "C3", 4*(2*i-1)+1, "C5",4*(2*i-1)+3, "C4d",4*(2*i-1)+2, "C4d",4*(2*i+1)+2, "C0",4*(2*i-1)+4, "C0",4*(2*i+1)+4
            ampo += G1, "C0d",4*(2*i+1)+4, "C0d",4*(2*i-1)+4, "C4",4*(2*i+1)+2, "C4",4*(2*i-1)+2, "C5d", 4*(2*i-1)+3, "C3d",4*(2*i-1)+1	
            ampo += G2, "C3",4*(2*i-1)+1, "C3",4*(2*i+1)+1, "C5d",4*(2*i-1)+3, "C5d",4*(2*i+1)+3, "C4",4*(2*i-1)+2, "C0",4*(2*i-1)+4
        	ampo += G2, "C0d",4*(2*i-1)+4, "C4d",4*(2*i-1)+2, "C5",4*(2*i+1)+3, "C5",4*(2*i-1)+3, "C3d",4*(2*i+1)+1, "C3d",4*(2*i-1)+1
        end

        H = MPO(ampo,sites)
      
        using HDF5,JLD,DelimitedFiles

        psi0 = productMPS(sites,states)

        energy0,psi = dmrg(H,psi0,sweeps)
        
        f = h5open("mps-$N-$G.h5","w")
        write(f,"mps-$N-$G",psi)
        close(f)

        return
end        
        
        
        
        
        
        
        
        
        
        
        
        
