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
                                                                   
function entropy_von_neumann(psi::MPS, b::Int)
  orthogonalize!(psi, b)
  _,S = svd(psi[b], (linkind(psi, b-1), siteind(psi,b)))
  SvN = 0.0
  for n = 1:dim(S, 1)
    p = S[n,n]^2
    SvN -= p * log(p)
  end
  return SvN
end

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
	
    ent = zeros(Float64,1,N-1) # array for entropy
	
    for i = 1:(N-1)
	ent[i] = entropy_von_neumann(psi, 16*i)
    end
	
    ############# save to csv file ############
    writedlm("entropy-$N-$G.csv",ent)
    return
end
