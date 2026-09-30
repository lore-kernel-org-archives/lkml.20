Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A863377A9C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761477; cv=none; b=b75A6CzYcBDlUdYNaWNuyKmtZLRkP0Bsyib57Mfeg1caPTeHmyWlpm8O28DbMtwV8fATb8NEmovqRcskCN4nKVjfRIBCpiDlJBXjP8i/L3IqvhYvfkrsTn9Aag9YIc0Did+0zsQenEyjCYT1RTrA4zcZv5FVUNdCXhIMadXiT5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761477; c=relaxed/simple;
	bh=LGpeqoKrvd8KQjxxdaWkOE5kB0xUNiCVAhOEfxcWWEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJgz0n/QNtgeQk3jTBFUPpCKTxyDpd26cljVkuLiYow23rEZ2NfbVdFcGQv6+qvCVHmL6QJof9YbnCa6lqespTFMs7MwTixiG7xFwFAGXSSh/JciJiRUdFMhYbsa2hwN23rxJ45tvlhla9G7JVHa7//cicTi1lze+JSy76i758U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BlH85NJl; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BlH85NJl"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d2fe2056so1968115a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790761475; x=1791366275; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LJ7pv3JvMpjktv8pMXQeW+L1mKgAG5YebBgrxPcoffs=;
        b=BlH85NJlNWQbed808WwlUaQtTgQP9hoBVp0MRb5Jmz3BEUHUgFgy1xDBY0KoiCEIBY
         DDcphsgJdHcWar9ds/HKoTzmJiROdkt7kFO+7scKZbGfMgjtyJ1uuLgqJMK7yqk8XoVj
         3rE33r4qbXLFaDjFEDImfUYvs7immst/ojroCs9uhqK9rCDUltH1zDj5fApwU27oENBn
         QmMtya0GeizgXbbfCl/LV9N7FySKZhl2cmJySsf/orUnEz5V0LU062nyxFjzkE/iyi18
         JGA1GxOwuCEt41zsv9YGOHxxS+t9VpwRDAlg+D4/1H5lGZyZF5lxxZy6orKvOmiU93gO
         SREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790761475; x=1791366275;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LJ7pv3JvMpjktv8pMXQeW+L1mKgAG5YebBgrxPcoffs=;
        b=VywpYNmdd6V6Sl8C3N65XuotFF+ZHTsacNJbY7BXLzOxrIgHAgchy0SRIzhQSWeKY/
         7aGVcLy/zTTJVe415vKbMV5kHcLCaXhLdb3PhgNGiCiJc+tNRZU97XB5g0gbvNaWiSqK
         KcnoORqJHhtQW7iqN86Q+7PegkgHUh01R8A97iOLKnq2N13c56R8NaaaNEfT82SuQvWU
         1b7cskGRV0HCbK7H3c+d713G7JiO4Np/D+5267eGlYAB7I3/f/QBwSy7Hnz0rIaA4BVY
         lSJYVMDkY6Ep/kGTw9JjxWlW/uODqzzq+VOZHW40frMHps4fdLVbG5EGd7tpQqs/1fgn
         tZuw==
X-Forwarded-Encrypted: i=1; AKwUvByPnSU0FhcH0BG/kaodh1cOERGmNMzJosHPvZb1lBnwwwq5E0tFUWRKohBqygDTDQSEnJoq51lMawdCSvA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrgteuhAvtsGzOXLecsFFwFCzS+zZnC9Kr5Dh/3sKTkNYle5NJ
	5FHeLSe2pvJt7Rz4KwRWeKpgAS2Pq7zcqNSS5dOYKq9N3rQjfeI39sS1
X-Gm-Gg: AYBFou20fmDO4RDiQK4VuwAXTzL/kNfnBhGWRnr3H0veMmcXjAxwzLwGkrEL4Y4mB9m
	YZP6D7YnLKQx375+/cKNWkk2AwPZ4cPM2tmC1YntuFwmEQENBAnz81wkiS5LGKd4i29nQw1wgb8
	UcljEGn6jdIVN3DY4AdFbFReQgsuCT6cP8KrmksmT4SjNTMGOZxQAmSITf8EpAs/INunz+8rc0n
	3s+gloUW50EaYe9QpsH7kfKY3+UZTzkN2JHMh77TdkZCrzV4+K1JZ9yn5coFHIRGGw54b6wGAba
	igDo/9c3vLBEvvKRuoNOOC5YBvnOu9EAYFHf0xTCSWY81m+w+r42PViYoJZefv/jWOje4MT4iws
	FGCHuwFFCbleQx/6R9DBwvEa+wJsM3UL5UD/KCERbJvarXBH8BgQhHPOkPWc3vBONBl0XaDq5Qa
	IWxHC2Axl+ggAuXD96DHhhkBzKJErX11/XAdsbijtoNCjL0sG5stVz+Li7keZYp7yHJ+v8
X-Received: by 2002:a17:90a:ec8f:b0:3a0:97ba:cc05 with SMTP id 98e67ed59e1d1-3a4d1509b4bmr792148a91.22.1790761474707;
        Wed, 30 Sep 2026 02:44:34 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4c75bd93fsm1219229a91.3.2026.09.30.02.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:44:34 -0700 (PDT)
Date: Wed, 30 Sep 2026 17:44:25 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
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
	Marek Vasut <marek.vasut+renesas@mailbox.org>, Vidya Sagar <vidyas@nvidia.com>, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v7 6/6] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
Message-ID: <arzYt1svE0HtZPSB@inochi.infowork>
References: <20260929083755.458238-1-inochiama@gmail.com>
 <20260929083755.458238-7-inochiama@gmail.com>
 <arzAGOKLOustEW7F@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arzAGOKLOustEW7F@ashevche-desk.local>

On Wed, Sep 30, 2026 at 10:54:00AM +0300, Andy Shevchenko wrote:
> On Tue, Sep 29, 2026 at 04:37:52PM +0800, Inochi Amaoto wrote:
> > The PCIe controller on Spacemit K3 is almost a standard Synopsys
> > DesignWare PCIe IP with extra link and reset control. Unlike
> > the PCIe controller on K1, this controller supports external MSI
> > interrupt controller and can use multiple PHYs at the same time.
> > 
> > Add driver to support PCIe controller on Spacemit K3 PCIe.
> 
> ...
> 
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
> 
> Would it make sense to define permutations
> 
>   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE
> 
> for here...
> 

I think it does not make sense, they are two separate fields.
A combine does not make the thing easier.

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
> > +
> > +	ret = phy_bulk_power_on(k1->phy_count, k1->phys);
> > +	if (ret)
> > +		goto failed_phy_power_on;
> > +
> > +	msleep(PCIE_T_PVPERL_MS);
> > +
> > +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> > +			PCIE_PERSTN_OUT | PCIE_PERSTN_OE);
> 
> ...and
> 
>   PCIE_PERSTN_OUT | PCIE_PERSTN_OE
> 
> for here and elsewhere?
> 
> > +	val = dw_pcie_readl_dbi(pci, GEN3_EQ_CONTROL_OFF);
> 
> > +	val = u32_replace_bits(val, BIT(7),
> > +			       GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC);
> 
> It's perfectly a single line. Check your editor settings (I believe I have
> commented on a such in one of the previous rounds).
> 

Yes, but it is too hard for me as the intellisense plugin will show
the argument name so I am toot hard to keep that for a line that near
80 chars....

> > +	dw_pcie_writel_dbi(pci, GEN3_EQ_CONTROL_OFF, val);
> > +
> > +	k1_pcie_set_device_id(k1);
> > +
> > +	/* Finally, as a workaround, disable ASPM L1 */
> > +	k1_pcie_disable_aspm_l1(k1);
> > +
> > +	return 0;
> > +
> > +failed_phy_power_on:
> > +	phy_bulk_exit(k1->phy_count, k1->phys);
> > +failed_phy_init:
> > +	k1_pcie_disable_resources(k1);
> > +failed_resources:
> > +	regmap_update_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> > +			   PCIE_PERSTN_OUT | PCIE_PERSTN_OE,
> > +			   PCIE_PERSTN_OE);
> > +
> > +	return ret;
> > +}
> 
> ...
> 
> You checked everything but regmap IO. Why? Do you except it won't ever fail?
> Perhaps to add a note about this (if not yet) to the cover letter?
> 

It should not fail. IIRC the regmap will not fail for an
exclusive usage. The regmap here is just as handle for
the common device, but the device driver only use its
exclusive area so it should be safe.

Regards,
Inochi
