COMMENT
    An expontially decaying pool of calcium
ENDCOMMENT


UNITS {
    (mV) = (millivolt)
    (mA) = (milliamp)
    (um) = (micrometer)
    (l) = (liter)
    (molar) = (1/liter)
    (mM) = (millimolar)
}

    
NEURON {
    SUFFIX cabuff
    USEION ca READ ica WRITE cai VALENCE 2

    RANGE cai
    RANGE rest_conc
    RANGE tau
    RANGE phi
}

ASSIGNED {

    ica (mA/cm2)
    diam (um)
    area (um)
}

INITIAL {
    cai = rest_conc
}

PARAMETER {
    total_current
    rest_conc = 3e-06 (mM)
    tau = 1(ms)
    phi = 3e-3
}

STATE {
    cai (mM)
}

BREAKPOINT {
    SOLVE conc METHOD derivimplicit
}

DERIVATIVE conc {
    cai' = - (phi * ica) - ((cai - rest_conc)/tau)
}