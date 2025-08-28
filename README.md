Autoregressive integrated moving average (ARIMA)
==============================================
This repository provides a simple R implementation of ARIMA models for analyzing and forecasting time series data.

Related publications
-------------------
Bo, Y., X. Li, K. Liu, S. Wang, H. Zhang, X. Gao, and X. Zhang (2022), Three decades of gross primary production (GPP) in China: variations, trends, attributions, and prediction inferred from multiple datasets and time series modeling, *Remote Sensing*, 14(11), 2564. <a href="https://doi.org/10.3390/rs14112564">https://doi.org/10.3390/rs14112564</a>

Li, X., K. Liu, and J. Tian (2021), Variability, predictability, and uncertainty in global aerosols inferred from gap-filled satellite observations and an econometric modeling approach, *Remote Sensing of Environment*, 261, 112501. <a href="https://doi.org/10.1016/j.rse.2021.112501">https://doi.org/10.1016/j.rse.2021.112501</a>

Liu, K., X. Li, and X. Long (2021), Trends in groundwater changes driven by precipitation and anthropogenic activities on the southeast side of the Hu Line, *Environmental Research Letters*, 16(9), 094032. <a href="https://iopscience.iop.org/article/10.1088/1748-9326/ac1ed8">DOI: 10.1088/1748-9326/ac1ed8</a>

Li, X., C. Zhang, B. Zhang, and K. Liu (2019), A comparative time series analysis and modeling of aerosols in the contiguous United States and China, *Science of The Total Environment*, 690, 799-811. <a href="https://doi.org/10.1016/j.scitotenv.2019.07.072">https://doi.org/10.1016/j.scitotenv.2019.07.072</a>

Li, X., C. Zhang, W. Li, R. O. Anyah, and J. Tian (2019), Exploring the trend, prediction and driving forces of aerosols using satellite and ground data, and implications for climate change mitigation, *Journal of Cleaner Production*, 223, 238-251. <a href="https://doi.org/10.1016/j.jclepro.2019.03.121">https://doi.org/10.1016/j.jclepro.2019.03.121</a>

Files description
-------------------
* `ARIMA.R` &rarr; Uses <a href="https://www.rdocumentation.org/packages/forecast/versions/8.24.0/topics/auto.arima"> auto.arima</a> to identify the best ARIMA model according to the BIC criterion, then applies <a href="https://cran.r-project.org/web/packages/forecast/index.html">forecast</a> tools to analyze and display the outcome.
* `GSFC.csv` &rarr; Contains monthly aerosol optical depth (AOD) data from the <a href="https://aeronet.gsfc.nasa.gov/">AERONET (AErosol RObotic NETwork)</a> GSFC site (39.0°N, 76.8°W; Greenbelt, MD), covering 2003-2016. The workflow can easily be adapted to multiple sites or other products (e.g., satellite-derived AOD, gross primary production (GPP), or CMIP-based groundwater storage change (GWSC)), as long as the data are formatted as a regular time series.    
