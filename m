Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A8A3B3888;
	Mon,  7 Sep 2026 11:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779607; cv=none; b=CsRzuKIEONbwDnx9UsxFM3yOgUnioDfPt8QGot6lB8ZjH/P/VC1nlLsdAegET0W5yI1dXvsRTHVVSYymNYVLbmUoijWFcgQLiK49uxx0OLs06/gbJ1bRaoc8QvJiPDVk62xSXHQ1EwhXL+nHcR9iXXgtacPCs1SdbPzER8mIF8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779607; c=relaxed/simple;
	bh=qI75qB2RDQFcFSfFawxkb08yoggJt2nwnyMak+tKQKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1AIcoz0LTammn8oQV4a5K8YhHcnJDPqL+nAD0ka5h7Jl79KmMz5fmNZXe47hDVv4BW9xje0RAgxOwyaXdmBfL0TV4/JdMHY0O8WofWIyoYCmM/desB0O2McWeLDLFwJix4Kw5MgqcTLylgl6dZFJUtxsW4qHfX1dgYm6iUCKZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hXL+YJ03; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hXL+YJ03"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A5A1F00A3A;
	Mon,  7 Sep 2026 11:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788779605;
	bh=Nm211+quyCBePUA3EMvd2sfVachN6bJ9T/sKPQskomI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hXL+YJ03xe1pPx1G5xsyc+c13DhiMmWtqv7sHpMQL32KJmrkd3HqAydVonmRNZdDH
	 7pEdlDcLnZY53bU4P0DQ8UcUbMiSck2kIfpu1ShJxwgAHqZ+J/EFPudM7rslZTDqaZ
	 8nggfkVB9eh2qBjmhZW4YNGvHuho+RmwAPFQeR2Aouph+o0KnqQo7UsaQc/TNbXZIU
	 8jcamhMfRaJx51J+/IU3jCuMj8ay6iXdGxHXvJG3egskb3kD8lOn0Mif+bk6YhlHiY
	 tnOw2y//LKUU+jZmFXWv2wW7bkv/TqtbyrtI6mwmHLti81u5Ekx0cK7n5xo/r0BxCF
	 CwFKSxbBBDUlA==
Date: Mon, 7 Sep 2026 13:13:15 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: george.moussalem@outlook.com
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Praveenkumar I <praveenkumar.i@oss.qualcomm.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
	Nitheesh Sekar <quic_nsekar@quicinc.com>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 03/12] phy: qualcomm: qcom-uniphy-pcie-28lp: Convert
 to PCIe/USB3 combo PHY driver
Message-ID: <nsetwuedbippjni5t5pcoi3rxc22mmyqiitdnavgnuasctq5nn@f2wnjb2znchn>
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-3-39be0955a6aa@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260825-ipq5018-usb3-v3-3-39be0955a6aa@outlook.com>

On Tue, Aug 25, 2026 at 04:37:20PM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> This PHY found in IPQ5332 and IPQ5018 SoCs is actually a multi-purpose
> PCIe/USB3 combo PHY. The driver was initially created for PCIe PHY
> support only. As such, rename the driver and generalize function and
> struct names to reflect that it is a PCIe and USB3 combo PHY driver so
> that USB3 support can be added in subsequent patches.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  drivers/phy/qualcomm/Kconfig                       | 24 +++---
>  drivers/phy/qualcomm/Makefile                      |  2 +-
>  ...cie-28lp.c => phy-qcom-uniphy-pcie-usb3-28lp.c} | 87 +++++++++++-----------
>  3 files changed, 55 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> index d910a5d1a1ac..6872aa919cf2 100644
> --- a/drivers/phy/qualcomm/Kconfig
> +++ b/drivers/phy/qualcomm/Kconfig
> @@ -155,19 +155,6 @@ config PHY_QCOM_M31_USB
>  	  management. This driver is required even for peripheral only or
>  	  host only mode configurations.
>  
> -config PHY_QCOM_UNIPHY_PCIE_28LP
> -	bool "PCIE UNIPHY 28LP PHY driver"
> -	depends on ARCH_QCOM
> -	depends on COMMON_CLK
> -	depends on HAS_IOMEM
> -	depends on OF
> -	select GENERIC_PHY
> -	help
> -	  Enable this to support the PCIe UNIPHY 28LP phy transceiver that
> -	  is used with PCIe controllers on Qualcomm IPQ5332 chips. It
> -	  handles PHY initialization, clock management required after
> -	  resetting the hardware and power management.
> -
>  config PHY_QCOM_M31_EUSB
>  	tristate "Qualcomm M31 eUSB2 PHY driver support"
>  	depends on USB && (ARCH_QCOM || COMPILE_TEST)
> @@ -178,6 +165,17 @@ config PHY_QCOM_M31_EUSB
>  	  up of the associated USB repeater that is paired with the eUSB2
>  	  PHY.
>  
> +config PHY_QCOM_UNIPHY_PCIE_USB3_28LP
> +	bool "Qualcomm IPQ5332 UNIPHY PCIe USB3 28LP PHY driver"
> +	depends on OF && (ARCH_QCOM || COMPILE_TEST)
> +	select GENERIC_PHY
> +	select MFD_SYSCON
> +	help
> +	  Enable this to support the Qualcomm USB Super-Speed UNIPHY transceiver
> +	  that is used on Qualcomm IPQ5018 and IPQ5332 SoCs with DWC3 USB core.

This statement gives the impression that this driver is only used with DWC3 USB,
which is not the case.

> +	  It handles PHY initialization, clock management required after
> +	  resetting the hardware and power management.
> +
>  config PHY_QCOM_USB_HS
>  	tristate "Qualcomm USB HS PHY module"
>  	depends on USB_ULPI_BUS
> diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
> index 8bf887d58ee4..6e2e9737e387 100644
> --- a/drivers/phy/qualcomm/Makefile
> +++ b/drivers/phy/qualcomm/Makefile
> @@ -18,7 +18,7 @@ obj-$(CONFIG_PHY_QCOM_QMP_USB_LEGACY)	+= phy-qcom-qmp-usb-legacy.o
>  
>  obj-$(CONFIG_PHY_QCOM_QUSB2)		+= phy-qcom-qusb2.o
>  obj-$(CONFIG_PHY_QCOM_EUSB2_REPEATER)	+= phy-qcom-eusb2-repeater.o
> -obj-$(CONFIG_PHY_QCOM_UNIPHY_PCIE_28LP)	+= phy-qcom-uniphy-pcie-28lp.o
> +obj-$(CONFIG_PHY_QCOM_UNIPHY_PCIE_USB3_28LP)	+= phy-qcom-uniphy-pcie-usb3-28lp.o

Changing the module name is an ABI break. But since this driver is only used by
a couple of IPQ SoCs, breakage is not a concern I guess.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
