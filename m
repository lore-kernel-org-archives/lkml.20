Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090632;
	b=Db0g5D5W/2zAvTwouh7j4xCcUIh7KJzmLO2nripVI3OtrePmGqcxEMoB2lcWZpqmqjoz
	 677ryxKhdWcQrZokLDYvD8oQvo6VzZ2flmiX6D4QTNazuOjYnbElCQ6Gc3ZuBCLsiFDGs
	 pd5mdvDFH/DJThiAiu8F+6Qnf5i8afVfsOyKvBCctWqXMfI0ITKJnl9tKPpJzRqumFe6G
	 LMsIG1kslGd6q9138XhrOsxCcHRKD+Xt51VJHuSVl+U0oG/UXnAyhvoQrhxyn3X2h8c2M
	 FGSukkZ4u7cgJtnJaEBPbsy3OZlUQe8wdbcyDjt7IOfDqTEZpFnSmhhqaRnu8mKJDfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=WdGWi2lCPsVOQrfWu4TCiPig1JxwAx4MQlsKT53PN3c=;
	b=XeDj1BKgZr/P32BUM00d52JeZg4j/3LZwboZMDKYH4d5iiCGWcmVQZ11gcH83HKO4TKs
	 9c34SKD1LnXDPNFda3XnLcgejxor+O3CSg3RPKnMBPPa0JwTX0JglY3+J2LDtZOXZADhc
	 0ERyBulj7Fb/psUidUyllLChMAA6VFs5xPyh+e554Gc1BW64ioFfOJi7qgWUPTkW+T9hC
	 5ebLr0L0cNPoziRh2H9xo+WXHPZMTw/54FMtZ/DZmxT2bTbbG4UsTtb10pfAVTdwqMtKD
	 cRRJu11Fefw0CL0b4roWkBw456wI/8o7gt9UbwjqmUr0T83/qFCgB3JojoKzBeCFgVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X6h3MaKU;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B50A606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:43:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B50A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X6h3MaKU
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e60f9af6e6so33184425ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793090631; x=1793695431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WdGWi2lCPsVOQrfWu4TCiPig1JxwAx4MQlsKT53PN3c=;
        b=X6h3MaKU/WaA/MnP0JtjHmvUoxo8La1Gi2rFdudPKo5jMX4Pg4Q1MAgw8PLeqeF0Qb
         KPt/u3uRBlseZ+5gw3ZikC6qiss0fDsz/WtBZwv3nHEGmGtpxEmcM2sE9EFH6fG4c5BA
         kx5j+7PLiQl8WBXroU8rS5DxbDa4TLqr7mJWdfcBu8yYXu8Dot79vSTVU1aiUtvVwMSx
         55BSa9oYtiKKuOzVzqL5/RPRWAVP9C+Il8GFhbstTvLRxa7DvUDUCsXlqatLpZqqQYuI
         CnBk51RdhO41gakhMBWpHtm5Vp8DoY/F4fq19tZ3melf0NZZoXoMEKBazIhCeKuRThws
         Ed9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090631; x=1793695431;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WdGWi2lCPsVOQrfWu4TCiPig1JxwAx4MQlsKT53PN3c=;
        b=wJ010BTyW4jv3bzUnL/t9E4s4LiMKMO9Y8H4Q7XTmoDwZswjqOYh+RlkZe+ybXlwTA
         /mtZCZxORF+/YnzJ0YXcSHpzZeVXQe01dTqt2LgTHE+mSTwmqzzvpc6iBXQZSLtmhmYK
         wQxFdTa37YobXm23H/rqhkq7DJ2WGhqP3hzj9pW15xtQRbBvtpqn4we5A7/b8f0nWqeL
         wkSjqIcBMznNaQaEWrJQXW4PDdFAI7ZgZqAFoxtAo+m15JV1x4FW0su8m06sXI1MgvXJ
         z+EFrvpBbi6VojobyQQ6IUSdCi3HxjW2y/SYxFflB0q+qP+dTiQqB/KNHr8LlEifyNA4
         179A==
X-Forwarded-Encrypted: i=1; AKwUvBx6PbG0unRUNr8fjFXgd/GkbBUSF/NZ+pG6UK6kGSOvlINkCQDXg7sk773N9VVstr9L5ixmivRnZaa26J4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHHwkCCRMHkHQxTGGj/yDzShcdR/MsClTgKqLgF7MyD8Y/1w/Y
	lofa4DJoMCPI7MbwvOHYXOyb+WKOe06cO3IGoQUBbk9qcDYa59s0JApM
X-Gm-Gg: AYBFou3XGs1mXLz9nxssrob4TUJMVZtV0eFZlRU0MSB6njDwmbKa1OV45+vzJALQg1W
	EQMSwzFGJPQ3N72/lpYPwWpb8DpT0Qerm1GDNri+j+tXH78wcnnjuorkNzzMrBTk9ChqH+Gc8JG
	CIQ1UcLMaUbLrEIFPqCUjarKM8AXF0VbJpCLOD4t6UZUMLEtvC3tRIyjlxnCzWwXTSbwGRLbNYK
	iouGkb5lG5An765fQncQrcxP0hPb47vOUKKmnHF9PB16vJ2IraZw+kTHD3YXi9EZvWynAn+mAf/
	/oyhbqx+I9c/UbZk0/+FGVpKaUafQlLfsUOKtxuULc8gCvIk9TyX5tbddrzVtxP1marZTdFDqk3
	DesSWvqWQe9L8g7Gbe2A84VT6GDhtPe628X4IRhrXc1b6lMkB9dil+wHVL5RV4cb1I0frZaIKbJ
	3Kmz4cHwMyC2d7wzQK6scAupnI+X2l5FI6RSrB3WrksnBHknz7EAt1EbKhMvtutnI7Us6rkDUwa
	urHn2ZZmb96xvJpr0AMFDf2S24uM33yV1PS/ltJlqjBTxmkCmm0xA==
X-Received: by 2002:a17:903:2389:b0:2e9:6788:9379 with SMTP id d9443c01a7336-2ea9c821072mr73512925ad.32.1793090630759;
        Tue, 27 Oct 2026 01:43:50 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm5640215ad.35.2026.10.27.01.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:43:50 -0700 (PDT)
Date: Tue, 27 Oct 2026 16:43:04 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Frank Li <Frank.Li@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Niklas Cassel <cassel@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Randolph Lin <randolph@andestech.com>, Xincheng Zhang <zhangxincheng@ultrarisc.com>, 
	Alex Elder <elder@riscstar.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, Vidya Sagar <vidyas@nvidia.com>, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v7 6/6] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
Message-ID: <auBkBSr5N_FlCPxD@inochi.infowork>
References: <20260929083755.458238-1-inochiama@gmail.com>
 <20260929083755.458238-7-inochiama@gmail.com>
 <179232693939.2114.10956498814503201256.b4-reply@b4>
 <athvDzJHs7WQmBnx@inochi.infowork>
 <bddc44d0-5446-40a9-b211-28d0b03f89ad@ti.com>
 <179308804504.2479.5374380919602671853.b4-reply@b4>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179308804504.2479.5374380919602671853.b4-reply@b4>

On Tue, Oct 27, 2026 at 01:30:45PM +0530, Manivannan Sadhasivam wrote:
> On 2026-10-21 13:56 +0530, Siddharth Vadapalli wrote:
> > On 10/21/26 1:26 PM, Inochi Amaoto wrote:
> > > On Sun, Oct 18, 2026 at 06:05:39PM +0530, Manivannan Sadhasivam wrote:
> > >> On 2026-09-29 16:37 +0800, Inochi Amaoto wrote:
> > >>> The PCIe controller on Spacemit K3 is almost a standard Synopsys
> > >>> DesignWare PCIe IP with extra link and reset control. Unlike
> > >>> the PCIe controller on K1, this controller supports external MSI
> > >>> interrupt controller and can use multiple PHYs at the same time.
> > >>>
> > >>> Add driver to support PCIe controller on Spacemit K3 PCIe.
> > >>>
> > >>> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > >>> ---
> > >>>   drivers/pci/controller/dwc/Kconfig            |   4 +-
> > >>>   drivers/pci/controller/dwc/pcie-spacemit-k1.c | 139 ++++++++++++++++++
> > >>>   2 files changed, 141 insertions(+), 2 deletions(-)
> > >>>
> > >>> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> > >>> index dcfbe7e229fd..f9c27165260e 100644
> > >>> --- a/drivers/pci/controller/dwc/Kconfig
> > >>> +++ b/drivers/pci/controller/dwc/Kconfig
> > >>> @@ -443,7 +443,7 @@ config PCIE_SOPHGO_DW
> > >>>   	  Sophgo SoCs.
> > >>>   
> > >>>   config PCIE_SPACEMIT_K1
> > >>> -	tristate "SpacemiT K1 PCIe controller (host mode)"
> > >>> +	tristate "SpacemiT PCIe controller (host mode)"
> > >>>   	depends on ARCH_SPACEMIT || COMPILE_TEST
> > >>>   	depends on HAS_IOMEM
> > >>>   	select PCIE_DW_HOST
> > >>> @@ -451,7 +451,7 @@ config PCIE_SPACEMIT_K1
> > >>>   	default ARCH_SPACEMIT
> > >>>   	help
> > >>>   	  Enables support for the DesignWare based PCIe controller in
> > >>> -	  the SpacemiT K1 SoC operating in host mode.  Three controllers
> > >>> +	  the SpacemiT SoC operating in host mode. Three controllers
> > >>>   	  are available on the K1 SoC; the first of these shares a PHY
> > >>>   	  with a USB 3.0 host controller (one or the other can be used).
> > >>>   
> > >>> diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > >>> index ec59ccb710ec..61b430f2294a 100644
> > >>> --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > >>> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > >>> @@ -28,8 +28,18 @@
> > >>>   #define SMLH_LINK_UP			BIT(1)
> > >>>   #define RDLH_LINK_UP			BIT(12)
> > >>>   
> > >>> +#define INTR_STATUS				0x0010
> > >>> +
> > >>>   #define INTR_ENABLE				0x0014
> > >>>   #define MSI_CTRL_INT			BIT(11)
> > >>> +#define RDLH_LINK_UP_INT		BIT(20)
> > >>> +
> > >>> +#define K3_PHY_AHB_IRQSTATUS_INTX		0x0008
> > >>> +
> > >>> +#define K3_ADDR_INTR_STATUS1			0x0018
> > >>> +
> > >>> +#define K3_CACHE_MSTR_AWCACHE_MODE	GENMASK(14, 11)
> > >>> +#define K3_CACHE_MSTR_AWCACHE_BEHAVIOR	0xf
> > >>>   
> > >>>   /* Some controls require APMU regmap access */
> > >>>   #define SYSCON_APMU			"spacemit,apmu"
> > >>> @@ -44,6 +54,9 @@
> > >>>   
> > >>>   #define PCIE_CONTROL_LOGIC			0x0004
> > >>>   #define PCIE_SOFT_RESET			BIT(0)
> > >>> +#define PCIE_PERSTN_OE			BIT(24)
> > >>> +#define PCIE_PERSTN_OUT			BIT(25)
> > >>> +#define PCIE_IGNORE_PERSTN		BIT(31)
> > >>>   
> > >>>   struct k1_pcie;
> > >>>   
> > >>> @@ -315,6 +328,123 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
> > >>>   	return ret;
> > >>>   }
> > >>>   
> > >>> +static int k3_pcie_init(struct dw_pcie_rp *pp)
> > >>> +{
> > >>> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > >>> +	struct k1_pcie *k1 = to_k1_pcie(pci);
> > >>> +	u32 reset_ctrl = k1->pmu_off + PCIE_CLK_RESET_CONTROL;
> > >>> +	u32 val;
> > >>> +	int ret;
> > >>> +
> > >>> +	regmap_clear_bits(k1->pmu, reset_ctrl, LTSSM_EN);
> > >>> +
> > >>> +	k1_pcie_toggle_soft_reset(k1);
> > >>> +
> > >>> +	/* K3: Set IGNORE_PERSTN and drive PERSTN_OE high (assert reset) */
> > >>> +	regmap_update_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> > >>> +			   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE | PCIE_PERSTN_OUT,
> > >>> +			   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE);
> > >>> +
> > >>> +	ret = k1_pcie_enable_resources(k1);
> > >>> +	if (ret)
> > >>> +		goto failed_resources;
> > >>> +
> > >>> +	regmap_set_bits(k1->pmu, reset_ctrl, PCIE_AUX_PWR_DET);
> > >>> +	regmap_clear_bits(k1->pmu, reset_ctrl, APP_HOLD_PHY_RST);
> > >>> +
> > >>> +	ret = phy_bulk_init(k1->phy_count, k1->phys);
> > >>> +	if (ret)
> > >>> +		goto failed_phy_init;
> > >>
> > >> You got me confused with this PHY bulk API for a moment. I think you are trying
> > >> to control all the PHYs of the multi-port RC setup at once. But I believe
> > >> that's not what we want mostly. Each port is an independent entity with its own
> > >> PHY, PERST# etc... So the RC driver controlling all the PHYs at once, doesn't
> > >> seem logical.
> > >>
> > > 
> > > In fact this thing is different. Accoring to statement from spacemit,
> > > for software, it does not need to care about how the phy topology,
> > > and which phy/phys is/are attached to the RC. It just needs to enable
> > > all the phy and configure the APMU, which is the one that give some
> > > control on PERST# and others. The phy itself does nothing on this.
> > According to section "14.1.4 PHY Configuration Block Diagram" in the User 
> > Manual for the Spacemit K3 SoC [0],the x8 Lane PCIe Controller namely 'PCIe 
> > A' requires multiple PHYs (ranging from PHY0 to PHY5) to be 
> > initialized/enabled simultaneously for a single Root-Port configuration. So 
> > the phy_bulk_init() API here seems to be used in that sense. Mani's concern 
> > is that the PHYs for all PCIe Controller instances are being configured in 
> > a single invocation to phy_bulk_init() rather than the potentially multiple 
> > PHY instances of a single PCIe Controller instance. Since k3_pcie_init is 
> > invoked per Root-Port instance (i.e. per PCIe Controller instance), the 
> > phy_bulk_init() API should configure 'all' PHY instances _strictly_ 
> > associated with the corresponding PCIe instance. This might already be the 
> > case.
> > 
> > [0]: 
> > https://spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k3/k3_docs/k3_usermanual/14_connectivity/pcie.md
> > 
> 
> Thanks for sharing the link to the doc. I didn't know this SoC allows muxing
> multiple PHYs for a single RP. Now the bulk API makes sense!
> 
> For the next iteration, please include a link to this page.
> 
> - Mani
> 

OK, I will include that, thanks.

Regards,
Inochi
