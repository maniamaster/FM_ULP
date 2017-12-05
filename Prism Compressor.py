
# coding: utf-8

# In[2]:

import numpy as np
import scipy as scp
import sympy as sp
import matplotlib.pyplot as plt

c0=299792458.


# In[3]:

#Brechungsindex für Nlak21
lambda_ = sp.Symbol('lambda')

n_ = sp.sqrt(1+(1.22718116*lambda_**2)/(lambda_**2-0.00602075682)
                   +(0.420783743*lambda_**2)/(lambda_**2-0.0196862889)
                   +(1.01284843*lambda_**2)/(lambda_**2-88.4370099))

dn_ = sp.diff(n_,lambda_)
ddn_ = sp.diff(dn_,lambda_)

#numpy funktionen erstellen
n_prism = sp.lambdify(lambda_, n_, modules='numpy')
dn_prism = sp.lambdify(lambda_, dn_, modules='numpy')
ddn_prism = sp.lambdify(lambda_, ddn_, modules='numpy')


# In[4]:

#prism gdd Formel
def prism_gdd(lambdal,n,dn,ddn,L,insertion=2.5e-3):
    Lg=2*insertion*1/np.sqrt(1+n**2)
    result = 2*lambdal**3*(2*np.pi*c0**2)**(-1)*(Lg*ddn-(4*L+Lg*n**(-3))*(dn)**2)
    return result


# In[5]:

lambdal_mikro=0.8
lambdal_si=800e-9 #carrier wavelength
L=432.0e-3 #Prism separation (measured)

print prism_gdd(lambdal_si,n_prism(lambdal_mikro),dn_prism(lambdal_mikro)*1e6,ddn_prism(lambdal_mikro)*1e12,L,2.5e-3)



# In[6]:

# prism compr auswertung (gdd in abhängigkeit von insertion:)
insarr=np.array([2.84e-3,2.5e-3,2.04e-3,1.75e-3,1.3e-3,0.7e-3,0])

gddarr=prism_gdd(lambdal_si,n_prism(lambdal_mikro),dn_prism(lambdal_mikro)*1e6,ddn_prism(lambdal_mikro)*1e12,L,insarr)

print gddarr

result_pc=np.column_stack((insarr,gddarr))
np.savetxt('pc.txt',result_pc)
plt.plot(insarr,gddarr)
plt.show()


# In[54]:

#pc hwhm:
pcarr = np.loadtxt('pc_fwhm.dat')

apparent_bw=55e-9*2*np.pi*c0*lambdal_si**(-2)
t0_apparent=25e-15

secret_factor = 0.441**(1)

#ausgangspulslänge vom laser:

def timewidth(t0,gdd,bandwidth):
    return np.sqrt(t0**2+gdd**2*(secret_factor*bandwidth)**2) #Faktor ????
def timewidth0(t,gdd,bandwidth):
    #return np.sqrt(np.absolute(t**2-gdd**2*bandwidth**2)) #Faktor ????
    return np.sqrt(secret_factor*t**2-gdd**2*bandwidth**2) #Faktor ????

t0arr = pcarr[:,1] #temp. gemessen (FWHM)
#bandwidtharr = pcarr[:,2]*2*np.pi*c0*lambdal_si**(-2)
bandwidtharr = pcarr[:,2]*2*np.pi*c0*lambdal_si**(-2) #Bandbreite in lambda

gdd_opt = gddarr[0] #gdd bei opt. einstellung (berechnet mit pc formel)


#timewidth_opt = timewidth(t0arr[0],gddarr[0],bandwidtharr[0]) #was aus dem laser rauskommen sollte.
timewidth_apparent = timewidth(t0_apparent,gddarr,apparent_bw)

#timewidth_opt = timewidth(t0arr[0],gddarr[0],apparent_bw)

#timewidth_theory_arr = timewidth0(timewidth_opt,gddarr,apparent_bw)

plt.plot(gddarr,timewidth_apparent,'o')
plt.plot(gddarr,pcarr[:,1],'b*')
plt.show()


# In[52]:

print timewidth_theory_arr


# In[51]:

print pcarr[:,1]


# In[53]:

timewidth_apparent


# In[26]:

plt.plot(gddarr**2,timewidth_apparent**2,'o')
plt.plot(gddarr**2,pcarr[:,1]**2,'b*')
plt.show()


# In[ ]:




# In[ ]:



