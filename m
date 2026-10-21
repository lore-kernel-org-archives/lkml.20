Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569453;
	b=rsckL2lawcY2Gah/kkDKwn5Ri2qB3uH79i4sVVe8ZLw85B548Ctukr1lARZM/GvNP9p1
	 Eczkzuv9Im62X9F2+xOr8Cme6i/OFBalnm0YWy6fPR3OpE0CZeUUuKlTCFV+kMvKFk+gG
	 M+n5Cusir8pTTPiD7KOglJG7ur3+ux7X1ibM0IB6yjOH/soNjoS5u4CorRC1cSpC6dAvX
	 Oyy4Ysc6/iYH+6zZ8TvFf6BKPDOS7E0rwwar9VmL89LU2tr+l35sO2RnXraBXF0i9hz0t
	 rblb8gsNJKd3Le1UZdgb0jTFdiEbnS5MdijnumZ2X17SKISMwW0CkNur1RUfHDl0LRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=s7OIxnjVnGRZmr1LgfXzEIcyEF1Urq62srWXFTWymcQ=;
	b=AyKzNwCUn9G8A5Sb+Swgmx03ySkQDnd2HmKF1Ypf/VOL/JI4kx6J1w35fs2zUWh6LVNa
	 vbKw4LEWV5zoDr97ayiILA/ipC+T3k7erEj/5AqnpRD/HjzsF3OqgiaZpgsLtrt1Acl2p
	 tSoBjhmkz+scLuMCnBwRP77+fw7B+XjPw2YOc8cAw4uiVMVysrIrTqSTG1iSSZB33oC7q
	 mHcvY+K3Qn9VJ5eyl4XXl5SJBuXNtrjNFoeYOp/0vpP/2bN6EH4Rx54khluL5Bi2KBJiD
	 fCUbkEayKTTk4o4VVrZWBqukF/C5L5eRDFLkotpLfnAh9RMCs2+Xaw3z4rKcJ6Z82LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K6lvj+lv;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54E1606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A54E1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K6lvj+lv
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e985106c0cso3400745ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792569452; x=1793174252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s7OIxnjVnGRZmr1LgfXzEIcyEF1Urq62srWXFTWymcQ=;
        b=K6lvj+lvZtKXzjvSRbsU+FaCzYBN2NYhJK+HUebHt9pABX0/rmG8wTenVUl0cSXM7a
         LHI8cJcZ2HPzePscY93875cum/9i7b4teuhjXFaV4AU1xRMYyUiJ4uN4vnCBVD1GyMrI
         dRboQPVmpBlkff7uJGjD9RU5uanu/8LlL72hj8Ii1/0sV5O2y2RI31Hbhr0WWbu4vn4O
         Gk3BPHcxszOKAa+CpUNBm/l+kXfk4WqXJaAOXBxnMAZsTNxc+hR+VwMCh3PnQ/WURBok
         /UBO73sWCjcP8GvtizUrEhmtR7S/GNaBFoQ0WLcu8Vy/autt+/7cBHsiZTm2DQaT6nOj
         NkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569452; x=1793174252;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s7OIxnjVnGRZmr1LgfXzEIcyEF1Urq62srWXFTWymcQ=;
        b=rU996KjjhDGwlvAc7XxdCHNXsd2y32MrQU3DesfB2uJYnCwVBXYTVraIlNR/uqhMk7
         S7CR8f+Xv7m19nb0OkZvixt+4edHSwMwbY4rjVN5U3YAGWjnR9CK8n4caU87WUeuBXaU
         kIE79Isu5TmhPWCtwk+jKKInRerqlc+a1hl01NOzNkpWinDNrPUxitYuCKXj3xV6a2YI
         9vCkRm3E1fBCxN4ho2eC2QyS3Svy9NN7ifiAQ+S9In+FAHXD0vLUqgfPUSLXUqk70ehi
         54zGfn1hsKpJwuM70SBIkZJ/HO5YWgSReUmvQEaeuuozcZQT3OUdXqsisrS+GL9CJ82u
         LXpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHCnJhP6gcG/29lbZySK8uIeublfI3jPuPKvyE+SCcyY83QKyhSXLw4WgmZLarEMeaCsWgr9bN0mOKb3A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLY9ESsJOpX1LM5q32T3xEzE2EqSYCB82GBzwz7+GpY6w/nKoPj
	dvysG0P6epbU2CqCGlXkBcyL5XKBE5AnkkmRhUlgUqliwPgqebLieaye
X-Gm-Gg: AYBFou3bOrN2S74ajDTEv7g177zb/lxyYv7KjacV+rX5rF2+MGMl9tD/PK8zYUxXOcv
	yg6OWNLUCUnD/AkjT3YDmlgbzNBGyxAVRMG8AEGnTGTKLtOTpm2LVyDczyVyqnjqxA10sXqjTlR
	qhbN+D/AcfqkFV6P+D3JjvLk6hIbuG5Ae3AiEm8k+tGUkWgxdel/524G2ADsoNSRonH3BLoqNMX
	yapWK/XTpzlgrY0dHWU6cjEog4iLfOkS/5562H5J0BJAwJwQmtnKpNmOZd0K3tH6glOYTFAKMib
	rVGhpYuSo55Tc/e1JzN9rhDi2PAbKp5iaCbMz0iQvv6Jsnmw1obZri1d7UGkGLvbffqPYEMCXO9
	D/Y9guSERgyhwHIUjE657J3urPiUZVkKEQJPvLEwZ+jEnB2FAceLw6cU+uymgTCwM0pwmJJg5al
	zkILy4JPsq8hzjvW25+W2B5AXY4+jE0voIy6+CKtyi9yjPO8vWtgF8KoohYPGXolcJtmP5BSKsq
	+E3CVmi+HNsMhcmj3Chb1p05gsIWtFWEJF3sNiwfgKFKi5E0UV4pA==
X-Received: by 2002:a17:902:f70c:b0:2e9:53c2:760 with SMTP id d9443c01a7336-2ea43c79efbmr10549995ad.30.1792569451953;
        Wed, 21 Oct 2026 00:57:31 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b48866bsm8021975ad.65.2026.10.21.00.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:57:31 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:56:52 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Frank Li <Frank.Li@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Niklas Cassel <cassel@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Randolph Lin <randolph@andestech.com>, Xincheng Zhang <zhangxincheng@ultrarisc.com>, 
	Alex Elder <elder@riscstar.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Vidya Sagar <vidyas@nvidia.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v7 6/6] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
Message-ID: <athvDzJHs7WQmBnx@inochi.infowork>
References: <20260929083755.458238-1-inochiama@gmail.com>
 <20260929083755.458238-7-inochiama@gmail.com>
 <179232693939.2114.10956498814503201256.b4-reply@b4>
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
In-Reply-To: <179232693939.2114.10956498814503201256.b4-reply@b4>

On Sun, Oct 18, 2026 at 06:05:39PM +0530, Manivannan Sadhasivam wrote:
> On 2026-09-29 16:37 +0800, Inochi Amaoto wrote:
> > The PCIe controller on Spacemit K3 is almost a standard Synopsys
> > DesignWare PCIe IP with extra link and reset control. Unlike
> > the PCIe controller on K1, this controller supports external MSI
> > interrupt controller and can use multiple PHYs at the same time.
> > 
> > Add driver to support PCIe controller on Spacemit K3 PCIe.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/pci/controller/dwc/Kconfig            |   4 +-
> >  drivers/pci/controller/dwc/pcie-spacemit-k1.c | 139 ++++++++++++++++++
> >  2 files changed, 141 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> > index dcfbe7e229fd..f9c27165260e 100644
> > --- a/drivers/pci/controller/dwc/Kconfig
> > +++ b/drivers/pci/controller/dwc/Kconfig
> > @@ -443,7 +443,7 @@ config PCIE_SOPHGO_DW
> >  	  Sophgo SoCs.
> >  
> >  config PCIE_SPACEMIT_K1
> > -	tristate "SpacemiT K1 PCIe controller (host mode)"
> > +	tristate "SpacemiT PCIe controller (host mode)"
> >  	depends on ARCH_SPACEMIT || COMPILE_TEST
> >  	depends on HAS_IOMEM
> >  	select PCIE_DW_HOST
> > @@ -451,7 +451,7 @@ config PCIE_SPACEMIT_K1
> >  	default ARCH_SPACEMIT
> >  	help
> >  	  Enables support for the DesignWare based PCIe controller in
> > -	  the SpacemiT K1 SoC operating in host mode.  Three controllers
> > +	  the SpacemiT SoC operating in host mode. Three controllers
> >  	  are available on the K1 SoC; the first of these shares a PHY
> >  	  with a USB 3.0 host controller (one or the other can be used).
> >  
> > diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > index ec59ccb710ec..61b430f2294a 100644
> > --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > @@ -28,8 +28,18 @@
> >  #define SMLH_LINK_UP			BIT(1)
> >  #define RDLH_LINK_UP			BIT(12)
> >  
> > +#define INTR_STATUS				0x0010
> > +
> >  #define INTR_ENABLE				0x0014
> >  #define MSI_CTRL_INT			BIT(11)
> > +#define RDLH_LINK_UP_INT		BIT(20)
> > +
> > +#define K3_PHY_AHB_IRQSTATUS_INTX		0x0008
> > +
> > +#define K3_ADDR_INTR_STATUS1			0x0018
> > +
> > +#define K3_CACHE_MSTR_AWCACHE_MODE	GENMASK(14, 11)
> > +#define K3_CACHE_MSTR_AWCACHE_BEHAVIOR	0xf
> >  
> >  /* Some controls require APMU regmap access */
> >  #define SYSCON_APMU			"spacemit,apmu"
> > @@ -44,6 +54,9 @@
> >  
> >  #define PCIE_CONTROL_LOGIC			0x0004
> >  #define PCIE_SOFT_RESET			BIT(0)
> > +#define PCIE_PERSTN_OE			BIT(24)
> > +#define PCIE_PERSTN_OUT			BIT(25)
> > +#define PCIE_IGNORE_PERSTN		BIT(31)
> >  
> >  struct k1_pcie;
> >  
> > @@ -315,6 +328,123 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
> >  	return ret;
> >  }
> >  
> > +static int k3_pcie_init(struct dw_pcie_rp *pp)
> > +{
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	struct k1_pcie *k1 = to_k1_pcie(pci);
> > +	u32 reset_ctrl = k1->pmu_off + PCIE_CLK_RESET_CONTROL;
> > +	u32 val;
> > +	int ret;
> > +
> > +	regmap_clear_bits(k1->pmu, reset_ctrl, LTSSM_EN);
> > +
> > +	k1_pcie_toggle_soft_reset(k1);
> > +
> > +	/* K3: Set IGNORE_PERSTN and drive PERSTN_OE high (assert reset) */
> > +	regmap_update_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> > +			   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE | PCIE_PERSTN_OUT,
> > +			   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE);
> > +
> > +	ret = k1_pcie_enable_resources(k1);
> > +	if (ret)
> > +		goto failed_resources;
> > +
> > +	regmap_set_bits(k1->pmu, reset_ctrl, PCIE_AUX_PWR_DET);
> > +	regmap_clear_bits(k1->pmu, reset_ctrl, APP_HOLD_PHY_RST);
> > +
> > +	ret = phy_bulk_init(k1->phy_count, k1->phys);
> > +	if (ret)
> > +		goto failed_phy_init;
> 
> You got me confused with this PHY bulk API for a moment. I think you are trying
> to control all the PHYs of the multi-port RC setup at once. But I believe
> that's not what we want mostly. Each port is an independent entity with its own
> PHY, PERST# etc... So the RC driver controlling all the PHYs at once, doesn't
> seem logical.
> 

In fact this thing is different. Accoring to statement from spacemit, 
for software, it does not need to care about how the phy topology, 
and which phy/phys is/are attached to the RC. It just needs to enable
all the phy and configure the APMU, which is the one that give some
control on PERST# and others. The phy itself does nothing on this.

Regards,
Inochi


