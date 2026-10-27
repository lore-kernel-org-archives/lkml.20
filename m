Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090534;
	b=dWMeb4Q+F/Vkz/Y9b6NxEJNU4GTV+XoSpzJDRNw21COkiPJyyxR1EiT7XIkz7A59v/cm
	 LAKEBjCfxmwrB/+Ksg/wRtxW/RKXsB3e5JMLA8M2gld/bl0W33T8fNTRxWaGELSwyqcLt
	 CMw49RZnbIBgKif3iNWPSgWpuhMXv/wF5ROiO6PPqUiFzEugCzlLaejGmvjzcqAQfjOWc
	 WFkwugci2FFKkIj7Rn4wmp5P+KdbxcKNqTLEUrdibdQkiFMXLiOG6z8yW95RZSt0cC4Mt
	 DSdT00yhGerh50ruT4v+dc2q9fpNF/KqTi7XLrRwNUrjimwQQiRa1LxEEDrVNvYCApQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=HO3eUNo6YHl/86Pkx4f7zdxkSoZXsSxNeQ0MlXL2Mv4=;
	b=35lOhQLiTomm6kUs4AHBcjifXCNoBo4n+EBnaHVyxAR0JcJI1mWZw5ngm7ildUdbrzXn
	 APYznsMKarfnzoMymX3GQptZA06QCcdaMbuuJP1vVgHOwJMqdqX3+sZqSM8n5FmZmAEqV
	 IKtLnVMW4Rm+aqCPUYwu3+BUj0gOQ81ifV46sRPPc+js3WO7tZ/pOTr6u7QBGOo29vHM7
	 3x8kN4mh1vC2CNcLMAX42k+FpRhyjkzMbzgziKd2DzGcdrpzybVvFqJr4/ntodA1M+vhc
	 m9mxXOaoN2nxLBsTM1z8LoilgUQWFAqNbi24dP/clMD8W5SyH2XNigENF8WgjrfOYLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kbLKbXcT;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60615606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60615606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kbLKbXcT
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so2037342a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793090534; x=1793695334; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HO3eUNo6YHl/86Pkx4f7zdxkSoZXsSxNeQ0MlXL2Mv4=;
        b=kbLKbXcTXY4lbkQf0cQz0moLcTATOuZVNofYBgKq6tPkjWg5NOHG7SZ8oIUap98YN9
         NToX0hK0jwRemF/XRhEAEIc1fJeKvmoeusTWHdMS1Py1WQbPyLLFmhIXPv6DKy8ATqU5
         o4xqNFm25HiGyAYcnsNDMcRpbpjopsCS/Lnlhwv7Gj7t8YRsgBCrKhEirLcGGh8XPX6x
         uocoYlEVzFEnb4NL/vCXQzhhmhBtfsGYbBAjq/09kAUetJOLi58rUkvWSX5hFqZymjAq
         Frns760Ur4/TWlRDN5/WCyfwjafEuXNEZqeT+cp5gU6UJwA0svvD99AOP6xR0bxJSCJr
         6SIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090534; x=1793695334;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HO3eUNo6YHl/86Pkx4f7zdxkSoZXsSxNeQ0MlXL2Mv4=;
        b=dIVJ1VjziRuIv0QW/IpTncbYgxrRVvLRJdAMzW3pkJAyJ1EU4OzOgLLQj8Ea7hsCby
         J1TlzjhXOrx2sf7HbTA8qyI9D26iCNJWXovNJ3MU4v8De05Fi4lZUc9kREqyHLaXV1s+
         TLvAVigsWwdYf1zD6locCPQ3hN6V4JE06k6OHt7vsQFRcF/2oyUYmb/PcHU5NsqLc7nN
         zixrKJixYolTfc9WhOqXvxJDXAJxZZ/cuVzbO4zeWD4s63wBl0hVoRm+mv9EByQw4ASZ
         TdMYLSk0xm9DFXGibR0ormCLhEWW1Xjk7en3n3iBbsrHUqT5eDyyIgz5BMiR2YP7wNa1
         /ttw==
X-Forwarded-Encrypted: i=1; AKwUvByLfda67ftc2NnQxtx0e4+XinjhnjwhCllVZhtjmrn/ny22Y6hs2C/tnJ1oyiFkfrBdYqR7sFWFD6aynW0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcarsnMYjGgXku/PoV7LWIsP1+KlxEqicihpGg1IkPAXzNvFS8
	VcrbXpAbQmZOaGyj3s/fBwG6zdY+M2EBV2hqnO3dXdpE0nId8yM5VcHs
X-Gm-Gg: AYBFou1VMIxVM63dNARBCjAcbQQqy+J5HwCWRT/9I/5Jo2par/IiPGjQD0anXBhwsUB
	Zw5FUeuNucFnywsLkReL5c84XRyrhAg8DYzuAZUccTOWq3FTav5gJpvcyy41dpbafUnOL8wGtBh
	Sc73mRl6KMQ/MZGAeBq+KsQ6ItartTvF/BbXrFc3oIRgciwBgh8DSuXDo2mOedEvi1jZtMwKof2
	M//2Am/KwSkgS4SBFXUnTh/GMTjydhUyEGgyHfaZNq+KXZMChs3juNhdmJVBIUaGVmpLTzoFfaQ
	uAQT+HBOq+DFvAq1wVYW3p1sGYUMq+rHh2zChQxQWcLOXt+qEbE/LYAXFR3gYYL/YgD4bUDVgRf
	ArN5XTdnT5mGrZBo8l5iAhsOE7ByzNPNSLhicS/WQS+374+yDYCVcBDopyL03xPxI8oVmDb3H0f
	OVPMVZI/ZZIkyVKm/V4dAELBY0TLS2DmIY9Bdx1yrVZ8hRxE0Rcsf96owIkJn5HowHTMVYgdN1w
	BUOu6AzlSd4xeh9nVlit95hIPPMu8Bn2xW3zl66OsoAI6jIsOaOQg==
X-Received: by 2002:a17:90b:548e:b0:3ac:8741:e2e4 with SMTP id 98e67ed59e1d1-3adeafad105mr7635070a91.52.1793090533442;
        Tue, 27 Oct 2026 01:42:13 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae64549dfsm5844425ad.4.2026.10.27.01.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:42:12 -0700 (PDT)
Date: Tue, 27 Oct 2026 16:41:26 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rhys Tumelty <rhys@tumelty.co.uk>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 3/5] phy: core: Add phy bulk data helper functions
Message-ID: <auBi722rs5BvaExx@inochi.infowork>
References: <20260929085235.469515-1-inochiama@gmail.com>
 <20260929085235.469515-4-inochiama@gmail.com>
 <asN4I1cpVb5HLNu7@parshuram>
 <asOMP3uJJmdpfvtt@inochi.infowork>
 <atS9fkULEWfCbVVm@debian>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atS9fkULEWfCbVVm@debian>

On Sun, Oct 18, 2026 at 06:09:49PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Oct 05, 2026 at 07:41:52PM +0800, Inochi Amaoto wrote:
> > On Mon, Oct 05, 2026 at 12:12:51PM +0200, Vinod Koul wrote:
> > > On 29-09-26, 16:52, Inochi Amaoto wrote:
> > > > Add several helper functions that allow drivers to get several phy
> > > > consumers in one operation. If any of the phy cannot be acquired then
> > > > any phys that were got will be put before returning to the caller.
> > > 
> > > Do we have many such examples? Phy is not a many resource like
> > > clock/regulators... Do we really need this. How many in kernel users
> > > will benefit from this API?
> > > 
> > 
> > 
> > I guess the following driver may benefit from bulk api. Most of them
> > are PCIe drivers....
> > 
> > drivers/ata/ahci_imx.c
> > drivers/pci/controller/cadence/pcie-cadence.c
> > drivers/pci/controller/dwc/pci-dra7xx.c
> > drivers/pci/controller/dwc/pcie-tegra194.c
> > drivers/pci/controller/pcie-rockchip.c
> > drivers/pci/controller/dwc/pcie-qcom.c
> > 
> > Note: I mean the bulk api, not just the things I added. I guess many
> > may want devm_phy_bulk_get() or devm_of_phy_bulk_get() instead of
> > devm_phy_bulk_get_all().
> > 
> 
> No. I don't think the PCIe host controllers need the PHY bulk APIs. Most of the
> time they need to control each PHY independently in a multi-port setup. So
> having the bulk API doesn't seem logical to me.
> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

Sorry for missing this one. For multi-port setup, the answer is no. The bulk
API is not a good choice. But for multi-lane setup of one port, I think the
answer is yes, the driver can just control the phy together and do not need
a loop for that. At least for pcie-rockchip.c, I think it is reasonable, its
logic show it use multi-lane setup, so I think it is fine to port.

Regards,
Inochi
