Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569122;
	b=YahWyWQlRakCRwTMS6j8atvn+NyVJ8+HKjSCgbeHVR9hgvKGfBp3LlB/uGHC1p3fYETF
	 p8mBYxfhpgXwEPMdRaH+O6LZW2UfxM/HTmP7roSo+5Mfm4Gc+VP1ksPIMUJeK3pK5niPk
	 45fP0m1Zi6sbfdFWN0vrCE2KSA8CJjrde1/uEKQtDzGWQHkbTFGatH/rAYFvBcw/Kfo69
	 Iv+ce3Sqkxf6X01HvjrlIoRPPdCHUVM3waKA4zgEwc6hKmZqBkrGnGvmMThdLDgFsHu91
	 GveLTCoAUzk0xugFHAr4fY6gE40fTBTNT/8gxHKlq10OiO2S2hg1vkE2Ox8LNJO47QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wqrxv5Q2RTtnjt7+05qzteet1T1PNZiaTDIMGMTA4x4=;
	b=1XnPNllrxobvoleYjW+gALvDnP2R7FSGKOIyPZUSKpbk5DBOyV0Q8dnaZG5brTOXHxIb
	 +FRFT9rhqFa154H8dW5h2rHFxo7UPCujm8Wj7ud5J0vOC9b3zP5up4RGnLmXGOURhBulL
	 CZThvRzqYyljX4+u2mgTIP7qzyK74JG+ZOAFE+rxnjOXOpTB1fqfeLmEboubyyQo1k8Ik
	 TnxzEXKyAlz5rODBIpIxPSdp9Joc/OaOMre/GXZFrD6VzpbkJOXb4sP9PDaqfPigOCl4l
	 U98yodNVqDqvyGv594W/RY6cmp+/TEkH1X6CpJsTlO5fQ58+kK8uV7w2NK2NKVTGjAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dl3cWGbt;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E53606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57E53606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dl3cWGbt
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a070b3f44aso138333b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792569122; x=1793173922; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wqrxv5Q2RTtnjt7+05qzteet1T1PNZiaTDIMGMTA4x4=;
        b=Dl3cWGbt7PByiH5Gy0or91Cs6az0Q8L4qaP0166Uwyz/aYwOiCPXvcE5eyamjstWGK
         7Bd4EkdEcbDheUu6IS6Q4f5AU9DIU12ejarYY4dRgWhOiR74si8DNPypEtUPIbFsuLS7
         qFE5JwOiKZRhK7wDOBdLrpnRJLccQo7gH1iLpgqFheu0JkbfchtOYNvAYYKSSb+UZm3S
         rf1X1gWbqS21bE0WvpKHlZTi5kOTU8ZCULACoEb0SD+NFklhvI9mGh4KGNKki9+yuSPR
         RbE533gedaAhbYCNvbNVIsAxOMZIaQqNXM7//SELGHqtHk9eyhwMxi2VZ0SVW0lQ+kHu
         Pnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569122; x=1793173922;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wqrxv5Q2RTtnjt7+05qzteet1T1PNZiaTDIMGMTA4x4=;
        b=tB8QWTETT/E0ti8K/xtAfujDRQv2qltBspy9hfHtxqa72JrcJTiwRV/RJ4Tj+nVeGi
         gChsY2zb4ig3uxrGEkxqLH3hBDKApR1ZmM5A+XkRb7e+qH6tY9JLQCVfGqB4DtQQwNv9
         Yfcr87VYTX0ZLyHpkRjYLGunWvmkzEYREm/pA1d+ZcIHsY1RneMBbOt2j+AGNp47DwrK
         yw1ACsLYQmmrS0nTI+0UYjAEVI1xScIt4J67brNlIFoif29k0Cbyf7ZxY+UZsswDcjA9
         /8UbiKga46baFw9zdWAwGspt5BbhJjUidGhzVKJAM7ELFV3M5Rfv1S+0ZAvdGUC3hebS
         spYA==
X-Forwarded-Encrypted: i=1; AKwUvBy07WyUHyPsYUqYA4rdnOmQe4c4rVw4IV8G7QsLLpDBsrufPxavltDwO+gx9x/Lm/K/cb2BcBUuhdebrQM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIM42YoI423e0q6W3yCx0Emxxn2lVGkeiYAi2c2jo7dfkX9AeRl
	WIswC13bjmMZBK34EoPPYuOL6pFMLeOTyichHXRiqMHFUzIsejFS2ezF7aX1IMBK
X-Gm-Gg: AYBFou13ETzcipAFrFvaOu63Vfp23BgYGpbduTRFVseSO9sJWs4b8WQzuOfl030Ows7
	oG79X04Ux8kycjFHddG3iteILo9zhkPTUtGsOEQ8+FuMqVJ2ib0bMR/NWM+J8rLUmuYhyJ8irZ0
	HDLhP3oo7TV2acwDxHccUrpxFr1GI8JJuvw0in0pZV9WS1yzr8D+O3mfmSJHA58nz0BrBpImGWf
	mIBlT7KIn5t8rEk2H5RVPYqMQ5fmpMtZcA2kkpfaj4+e0l8XlB86YSnKhk5lT67VpDbZBLuzFlQ
	/lAB56z+kd7QtdLtAgW2ZVdpYa6lll+nGuTZmbHjMWqaPMTOEiX9iai9xiQAfv8bmB4MgQ8sZPt
	FtobmZx1Nd/rzzuCOR9lVb88P2zrQZxTjHegG7VJcoQ6g3QOtPhiTWXH/JsGK0P99DOcwS4FZim
	H62ieoHn1uuxDH5nwLzaGelVc185VHGz4+r9Roz2n7OQAwhT0y73vPjnja9ZFD+55p4E2rWtI7g
	MFYJlHuPVqi9h5/jQbWlGhOfWzQT5ozhi+aGANgQG5tgWlLL0tpEA==
X-Received: by 2002:a05:6a00:a90b:b0:89e:a122:fa28 with SMTP id d2e1a72fcca58-8a089e1f48dmr1074589b3a.12.1792569121569;
        Wed, 21 Oct 2026 00:52:01 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895fb005sm548529b3a.49.2026.10.21.00.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:52:01 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:51:20 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, 
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
Subject: Re: [PATCH v7 1/6] PCI: spacemit-k1: Add device data support
Message-ID: <athuYJjPMkrecGm3@inochi.infowork>
References: <20260929083755.458238-2-inochiama@gmail.com>
 <20261019164108.GA2177470@bhelgaas>
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
In-Reply-To: <20261019164108.GA2177470@bhelgaas>

On Mon, Oct 19, 2026 at 11:41:08AM -0500, Bjorn Helgaas wrote:
> On Tue, Sep 29, 2026 at 04:37:47PM +0800, Inochi Amaoto wrote:
> > To reuse the K1 PCIe driver logic for K3 PCIe controller, add device
> > data to handle the K1 specific logic and make room for the incoming
> > logic for K3.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/pci/controller/dwc/pcie-spacemit-k1.c | 30 ++++++++++++++++---
> >  1 file changed, 26 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > index 0564c46e2f48..ab2953ad8f56 100644
> > --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > @@ -45,8 +45,17 @@
> >  #define PCIE_CONTROL_LOGIC			0x0004
> >  #define PCIE_SOFT_RESET			BIT(0)
> >  
> > +struct k1_pcie;
> > +
> > +struct k1_pcie_device_data {
> > +	const struct dw_pcie_host_ops *host_ops;
> > +	const struct dw_pcie_ops *ops;
> > +	int (*parse_port)(struct k1_pcie *k1);
> > +};
> 
> Does the "const" here add anything useful?  This patch suggests maybe
> not:
> 
>   https://lore.kernel.org/all/20260911233541.1650895-2-james.quinlan@broadcom.com/
> 

I am not sure whether the compiler can make use it.
And I have not seen any explaination for why no reason
for that. It is good to have a clarification.

Regards,
Inochi


> > +
> >  struct k1_pcie {
> >  	struct dw_pcie pci;
> > +	const struct k1_pcie_device_data *data;
> >  	struct phy *phy;
> >  	void __iomem *link;
> >  	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
> > @@ -274,14 +283,21 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
> >  
> >  static int k1_pcie_probe(struct platform_device *pdev)
> >  {
> > +	const struct k1_pcie_device_data *data;
> >  	struct device *dev = &pdev->dev;
> >  	struct k1_pcie *k1;
> >  	int ret;
> >  
> > +	data = device_get_match_data(dev);
> > +	if (!data)
> > +		return -ENODATA;
> > +
> >  	k1 = devm_kzalloc(dev, sizeof(*k1), GFP_KERNEL);
> >  	if (!k1)
> >  		return -ENOMEM;
> >  
> > +	k1->data = data;
> > +
> >  	k1->pmu = syscon_regmap_lookup_by_phandle_args(dev_of_node(dev),
> >  						       SYSCON_APMU, 1,
> >  						       &k1->pmu_off);
> > @@ -295,11 +311,11 @@ static int k1_pcie_probe(struct platform_device *pdev)
> >  				     "failed to map \"link\" registers\n");
> >  
> >  	k1->pci.dev = dev;
> > -	k1->pci.ops = &k1_pcie_ops;
> > +	k1->pci.ops = data->ops;
> >  	k1->pci.pp.num_vectors = MAX_MSI_IRQS;
> >  	dw_pcie_cap_set(&k1->pci, REQ_RES);
> >  
> > -	k1->pci.pp.ops = &k1_pcie_host_ops;
> > +	k1->pci.pp.ops = data->host_ops;
> >  
> >  	/* Hold the PHY in reset until we start the link */
> >  	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
> > @@ -316,7 +332,7 @@ static int k1_pcie_probe(struct platform_device *pdev)
> >  
> >  	platform_set_drvdata(pdev, k1);
> >  
> > -	ret = k1_pcie_parse_port(k1);
> > +	ret = data->parse_port(k1);
> >  	if (ret)
> >  		return dev_err_probe(dev, ret, "failed to parse root port\n");
> >  
> > @@ -334,8 +350,14 @@ static void k1_pcie_remove(struct platform_device *pdev)
> >  	dw_pcie_host_deinit(&k1->pci.pp);
> >  }
> >  
> > +static const struct k1_pcie_device_data k1_pcie_device_data = {
> > +	.host_ops	= &k1_pcie_host_ops,
> > +	.ops		= &k1_pcie_ops,
> > +	.parse_port	= k1_pcie_parse_port,
> > +};
> > +
> >  static const struct of_device_id k1_pcie_of_match_table[] = {
> > -	{ .compatible = "spacemit,k1-pcie", },
> > +	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data },
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(of, k1_pcie_of_match_table);
> > -- 
> > 2.55.0
> > 
