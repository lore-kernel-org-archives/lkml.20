Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794221275;
	b=ibIjpeygFVZk5H6oDxVJeHA4cIxtnMzttWnBqy+OP3NHW9xvi+ENjC5/uc2st0MAuVmG
	 U+06yGdowIbEkJIn1tGTpJLGtKvHPQ1AiaMx1atif2ql2Snx+rzBIoZ6ByeIXM2IsfqUV
	 G3/qWImHy7Wy+JfkD4SidP0yM7fUSqZ9CvAB7CgwovUbbmaQesxuJ/tVy2VyGSXT3tOll
	 qOVIL+HJjV+vJjEMd8kkc98fN34AoKpD23D+Tr1tqeH6DDIiR7cLCoK6lfYkderTnGEv/
	 BbPjVggMw61tAAw+1+lUM3qMEsD8IKM2Rykf8Z8WqezGJ+3epPwFbeHLQLXJoXd/V+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794221275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Wzi6KrhT88vehfKY7qgpQ1+JN6+5jlpjxZmv28MWhTQ=;
	b=cEOF8eAW2bnH45qMJWvTXHXLS9NBk+oDB4AKiXbBArNVzuaMfwsgstYliwiOeXJDhu8A
	 YT8ysytX+VX8jYDDmhRBKL5Kr+jAEnTSuasFHdXyJjBYhVhXE8LEHRnt/TAFMkfirCkR2
	 cB1MEJOHX7krh6+rzL1pGFDHwMqqY7pcWwrOqMIJk5Yg5I44IY2uem9HEyJNJyL9v1+KR
	 bnRFvp3rVCyTTg0FMwJFAWGKfuIfa46RcoTuaEHAuZlbAAmy7l+NojzVs4ust8k3lRQPU
	 pgzTk0QAOtrUXEGIK+hrkHIVMb2EaIFESjNYLYdF0sLP01fWbEFPOuBeIFrQP9RhWmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nalwOnS0;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0EC606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A0EC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nalwOnS0
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a018493d57so23145e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794221273; x=1794826073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wzi6KrhT88vehfKY7qgpQ1+JN6+5jlpjxZmv28MWhTQ=;
        b=nalwOnS0LauOz30LTsAavn7eGleTmzeBlHvE1pYHqktXtBchnrmJMTp1BHSkvoPrBw
         qaN5r1UFcY2uM1/a7tofc6UmB6uizWD2rN8g/RbdwZKzt+uuDbKzWPTiIG6AltutxdAg
         vlq0ksDvksoRmrpqJxNlKf7sp0R4waJMJVeYkxOLthrdbtE1kNTsnHtnB5Yxw75QeSyM
         UPHFnJuKypieSCxjmqOdeEsUsUA1Jm1JwxDemii6yO5ApLYyDKgru/x98yehsd2aWfTb
         FSMe4kD68RBs0kV/pdXL2E7k6S38tsmK309Ckzkhj7+SX/ZynaVBpCelDIDbXIiWKe8a
         kszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794221273; x=1794826073;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wzi6KrhT88vehfKY7qgpQ1+JN6+5jlpjxZmv28MWhTQ=;
        b=23qoa2SDF4JZSE7UGG7slleuAO6VgSNwCRc9IgzepvTNkncOG+hnqsJ2VMZBNX5qTb
         assur5DKklnwbNhFEmo30MTySjBkK55CotNS990B9HI9IJanS8RC8+tZnYa8kGudNLd+
         COS9z9Nl5VEwolCPN5JA6sBypVD2Si0SqsUVEAjrU0zqbo2cwZ7Z36F+n8N1D8kn2Jlc
         6omyXtsM7W5BdLfdLQnnZrVAkYaDw6jw1tQEpkuUaAEdtArFD2XwIplKBQHMj1F1nI2J
         8B1fNHrOnk+tOp4u5btW3eC6wptQunnn3ibZP8vGhnOR6lTPgyLorD5OrzyTLj1CN9Yo
         TDgg==
X-Forwarded-Encrypted: i=1; AL+hErH5LbBQEvkiMLCR/WG3Yi4Bk1Y3MJc8dQo3hzdZdxfJThYJ/BIV+e0TeVkeDUKApTAddkz6ORFbOhWh8B0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DIfkRV8j9vpIXZWC1CU1AFr4kAnSdEGg/F/4XBmQ5dSXlY/s4
	T5ZCO91VHG2lfSuzf7CCGhDdR7rYUoTTzp2T2dfRXh5J8JjYados/gPHe2yHrkYCUw==
X-Gm-Gg: AYBFou3ucCJQLA3NJgS18P1lSh1kuzPztKlglFGAok8WNbCugm8b1Ov5MjYZAbeuAmo
	+9NpJUb4EmBh05YkZr+aSVs71R9vsuHbaXam5WP81OYCIeNpKG5jvmnxGcOXkKE2pYXiWzITZBy
	sOGnB68ut7c6ITlRgjNhZdyd9r0SZj41k9Ng1PCMcnLO01kYZwUzT4I1P+48sqU57JCWuZVCoT7
	OloHcR4Sk1ATk+1e9IH2VrDvKtRw8dlQFtxOdPu8fqJgw3/B7T/FnO6H2HvI+khqdNR0GMOrW6V
	LJrj4CezSWOfthZ7GbVrkwM9th5H+l/N06jmFX8MuFRIiWTOilfQp62qzSiBbEbmXX7mxyThB/m
	B1vWrIIBOm2TDu0sENyk1IZ+iIsoHck5yL6vklIrVJiA4uGbuJZ4Gh/omMIJZ9Fg/SMzkc/Gtbx
	AqTpTvTTCo40M1gCGEZS+0r18No17nQABjLlwDjBITq6f162pXnh2lzjVzHaEZyNzgVHkM3rryM
	vsiy2T8TsuLhVHp/4+6K9am2ynFu5i+ZUmLBOcXoqzVeghyZiFa103xX2d/avTxhlp6Ky2nlQos
	eHS2LZxTsoysnQipF2L7k036KTiM7atSEtVaBLkqbqUn79veuoL08lvjuXqyHjYfeqBkYg==
X-Received: by 2002:a05:600c:2d91:b0:4a1:d373:5759 with SMTP id 5b1f17b1804b1-4b8b04d3e52mr1256155e9.8.1794221272587;
        Mon, 09 Nov 2026 02:47:52 -0800 (PST)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f1117fasm149512245e9.13.2026.11.09.02.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:47:51 -0800 (PST)
Date: Mon, 9 Nov 2026 10:47:46 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com
Subject: Re: [PATCH v9 11/25] iommu/arm-smmu-v3-kvm: Add the kernel driver
Message-ID: <avGk0ilyJh3obmKx@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-12-smostafa@google.com>
 <auzvygiGRTWgJXzF@nvidia.com>
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
In-Reply-To: <auzvygiGRTWgJXzF@nvidia.com>

On Thu, Nov 05, 2026 at 01:06:18PM -0800, Nicolin Chen wrote:
> On Thu, Oct 15, 2026 at 08:08:42PM +0000, Mostafa Saleh wrote:
> > +static struct platform_driver smmuv3_nesting_driver;
> > +static int __init smmuv3_nesting_probe(struct platform_device *pdev)
> 
> Could it use a different naming than "nesting"?
> 
> "Nesting" is widely used in iommufd path for nested translation.
> 
> Here, it could be smmuv3_pkvm_driver?

Sure, pkvm/hyp works.

> 
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > +#ifdef CONFIG_ARM_SMMU_V3_PKVM
> > +/*
> > + * Two devices are involved: the aux device bound to this driver, and the
> > + * physical platform device bound to the pKVM init driver, which only uses it
> > + * for discovery. This driver keeps using the platform device, as it carries
> > + * the fwnode the IOMMU core and consumers link to, the DMA configuration and
> > + * the IRQs.
> 
> It would be nicer to have a diagram or so to show the co-relationship
> among different devices and drivers.
> 
> I assume the regular arm-smmu-v3 driver is a part of the picture too,
> when the pkvm driver binding fails?
> 

I can add some ASCII diagram.
If pKVM driver fails, no aux devices are created and the main driver
probes the platform SMMUv3 devices as usual.

> > +static struct auxiliary_driver arm_smmu_driver_emu = {
> > +	.driver = {
> > +		.suppress_bind_attrs = true,
> > +	},
> > +	.name = "arm-smmu-v3-emu",
> > +	.id_table = arm_smmu_aux_table,
> > +	.probe = arm_smmu_device_probe_emu,
> > +	.remove = arm_smmu_device_remove_emu,
> > +	.shutdown = arm_smmu_device_shutdown_emu,
> > +};
> > +
> > +module_auxiliary_driver(arm_smmu_driver_emu);
> > +#endif
> 
> Nit:
> #endif /* CONFIG_ARM_SMMU_V3_PKVM */

Will fix it.

Thanks,
Mostafa

> 
> Nicolin
