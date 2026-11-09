Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794221778;
	b=mI+gzRRKCRgVU8YXIaPSRHHiEvx4B69w9AhOU9VE2zTGpi4F9Etf4Z8aUgCOJV/FMb1y
	 TqEKHyIkkfKkQNSdDCmI7mIFrioXIUOhsah9FZzgCJ5B8Fuo8qYuFC7LLE227s7y/HNqo
	 vq3Gr+D7ysT/KeV3NBP+gs6qevNFWFh4VriRJ2mIdPZRGO+OLuOMz4n6nTx12WYE7BVRg
	 mb7gVHMPgm32rI37oDqoisxRUJ4TsYmhn3w6uaAvl2ikEI5t/KM1a1IJdOrF308YwNI63
	 CC3kVhiSRS3aE61IQuuiB9AsV1uBqr86YPfWj6QSZkKNCSsIoXcrQTXJkDuEUALWypQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794221778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9ORalyFXe7qdK/R0lBn9ynib3IYyaexwVRCwyl06+yA=;
	b=rY5tJOezML00MrJvBZ+qRTDyR5CZaVDrLmNmHd8colBOc22CJHiWsaCIFWYKQAs+SVzo
	 YYdx4fTrCOXlWJWBA3cl/ITNaeTa9fpdyQQmLSIUDF6s4D8keZruvQzX+N9BXsLk8gM0Z
	 YenYS+qzHyp1JCH6AlrgD8q5vzBoSHkMGYrsQjVqLpyS0w65ytGI29VIqWSHy6K4CXVR1
	 2khnM7GXnemhy/3GxTHSq7RIzj98MAn2JEzBUcU77VuXEV1cnig+KMvk1zJJr39I06Q4e
	 kew5i88Z9jcgOF5Boq4gN863JapRpbhR4zWimhmFqjNPEMNy45TUrQpkxxbFyc9L0ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FMgqNsgx;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3804A606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3804A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FMgqNsgx
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a018493d57so23595e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794221777; x=1794826577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9ORalyFXe7qdK/R0lBn9ynib3IYyaexwVRCwyl06+yA=;
        b=FMgqNsgxeMPgRJZblmBPQqnMfcvYuVCMlYDjhEkMt6QZ/jSPy01H0/j82wB6Uzzfie
         USjCkMdmHUhvMWQkf0Wgy1mMw1ezacEQbDFw9D2lpuMBOjzQ2tKcQu+W1lSIMAhmzrht
         yfDWna4wTgz+Bz2PdTaoEzVv+yvPNfjzCBpBUu3TQvoKlnDcbhm4w0yq3+8zoXH8vSyY
         gAQOIM7C+YOnBFA6+EUUVbpB77Z93ItDORQkFlLmEzSZa2eyKnWGQcZr5W9zidIBoIdX
         0aUBCxOVx1BZ3bP6OPlLf8ATexzbYuzSWqWrg4ZGBIXWPMFz1B6BURdYo8iURk5xOFvM
         MI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794221777; x=1794826577;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ORalyFXe7qdK/R0lBn9ynib3IYyaexwVRCwyl06+yA=;
        b=Tgz5JjaNVzx+Xq8ZGTYtPPCGM9d9WzvWu1xOKufBZFDeNNxCKsxSrqM9pJ7F//by/x
         dcDCpwZ8M35ZJ9inz5xrD5FyR+8JNu94QbFhZ6RvvgpV77Hu9wOmTTBasYfVL+IrW6C5
         ylzna5jjwl9L3TojCRLwDY6dRjLwryF4FS0u8KhrHkD/8W0SzBcnJC7GY7HPbAA/E3iq
         YMJKeShkw0riZQsKMPLEvj8IUMyj9otwsH4oIgSe/OmuXsMLKAwlAuA8p68M0cFxyP8x
         YbJNB93KoHwXUFO45rPgw8WPJrJEctlISn5grDa18HFVvBicBODpuWB4svMOVpsRQ7zT
         nt4w==
X-Forwarded-Encrypted: i=1; AL+hErFMetD8/qLdt+U3zp0w+wrcXd9EFyc3leee9/mHGZcCIQdzaD5vy2lgQX46vlD2Uue8so4Zcw7QXJFV5+I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zV2XaBfAQZNyJNXC5mxOjiJvLx6clVxO9CokzQ73L42empfXN
	BkCb0K4tB1Zpv5qs1MhegeKwZQ46/coRAzU7muC7Gobt0/nnqw8X/CRjKRQZREYaGA==
X-Gm-Gg: AYBFou03KhVUiKMyI00dCDL1IoL8heZ1GBOtwvErlHLCaaWAXqYnOVCJfJsINkyLRMl
	lDZKuT3fzkjAu/fXRbJg92SoarJ5fT5mVqLEnuCfOX18XekmQVUFdoB8fk4atNxxH7gOkYanSmk
	kwnVms7/mEurRRqL9I8IDfO6wiNbKFKjfEmRYfgPkTgkkJI9h/XNorrLdkm6WgofejAoM4178JW
	58s8SUTz262+Di2nAbTw3K8q2g0CwnagcbVXagykf1+QDT4GE9/cf0BFU4iSoFQl7XU0f32Bsze
	FBicvxDJkYQUyA7m2pGdFELIhv/dga+Awtgl2MRbDKJMS053s/I3b4zwB9Eer91WrieZ37eWcBc
	PJKDLWtNNK2MXUgCHsydPwIxtte66JQpGhdVvVKjGtvn/6cQvXAcjFKxcNv8bYS/KA2g2Eiioru
	hDs6PUGfQM4IUJgVyLWhTL0WzqKWfkXl/MS/l8GEKZwWQGEZMv+tNHsHg56DuY0k+CksRq4Ty3L
	1WX9Hxew4ZYIXG2z1+7qjhd7HDR8u/XMiDIAwPXhEqFVhsiadd5o9aRXlBLfxxnvDkB/Fq5l1HE
	w+iG0/N5NnsaQHu0Kj2gIpSGP9dQDK64zUAOQc7s0DhEqEAL7lNY0OSGq8PQLwF/4k5v/A==
X-Received: by 2002:a05:600c:492f:b0:4a1:e384:5e12 with SMTP id 5b1f17b1804b1-4b8b04d4155mr845705e9.7.1794221775967;
        Mon, 09 Nov 2026 02:56:15 -0800 (PST)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7da62edb4sm270902255e9.1.2026.11.09.02.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:56:14 -0800 (PST)
Date: Mon, 9 Nov 2026 10:56:10 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com
Subject: Re: [PATCH v9 13/25] iommu/arm-smmu-v3-kvm: Add MMIO emulation
Message-ID: <avGmyuYdheMJdLik@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-14-smostafa@google.com>
 <au0LlPl2xwJvtfCu@nvidia.com>
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
In-Reply-To: <au0LlPl2xwJvtfCu@nvidia.com>

On Thu, Nov 05, 2026 at 03:04:52PM -0800, Nicolin Chen wrote:
> On Thu, Oct 15, 2026 at 08:08:44PM +0000, Mostafa Saleh wrote:
> > +static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
> > +			     struct user_pt_regs *regs,
> > +			     u64 esr, u32 off)
> > +{
> > +	bool is_write = esr & ESR_ELx_WNR;
> > +	unsigned int len = BIT((esr & ESR_ELx_SAS) >> ESR_ELx_SAS_SHIFT);
> > +	int rd = (esr & ESR_ELx_SRT_MASK) >> ESR_ELx_SRT_SHIFT;
> > +	const u64 read_write = -1ULL;
> > +	const u64 no_access = 0;
> > +	u64 mask = no_access;
> > +	const u64 read_only = is_write ? no_access : read_write;
> > +	bool is_xzr = (rd == 31);
> > +	u64 val = is_xzr ? 0 : regs->regs[rd];
> > +
> > +	switch (off) {
> > +	case ARM_SMMU_IDR0:
> > +		if (len != sizeof(u32))
> > +			break;
> 
> Maybe add a small helper to list all 64-bit registers:
> 
> static unsigned int smmu_reg_width(u32 off)
> {
>         switch (off) {
>         case ARM_SMMU_CMDQ_BASE:
>         case ARM_SMMU_STRTAB_BASE:
>         case ARM_SMMU_EVTQ_BASE:
>         case ARM_SMMU_PRIQ_BASE:
>         case ARM_SMMU_EVTQ_IRQ_CFG0:
>         case ARM_SMMU_PRIQ_IRQ_CFG0:
>         case ARM_SMMU_GERROR_IRQ_CFG0:
>                 return sizeof(u64);
>         default:
>                 return sizeof(u32);
>         }
> }
> 
> Then it'd be tighter by testing the width once, prior to switch (off)?

Makes sense, I will try that.

> 
> > +	/* Allowed RO 32 bit registers. */
> > +	case ARM_SMMU_IIDR:
> > +	case ARM_SMMU_IDR5:
> > +	case ARM_SMMU_IDR3:
> > +	case ARM_SMMU_IDR1:
> > +	case ARM_SMMU_IRQ_CTRLACK:
> > +	case ARM_SMMU_GERROR:
> > +		if (len != sizeof(u32))
> > +			break;
> > +		mask = read_only;
> > +		break;
> > +	}
> > +
> > +	if (WARN_ON(!mask))
> > +		goto out_ret;
> 
> Your cover letter mentions "WARNs are fatal in the hypervisor".
> 
> Is this WARN_ON fatal?

Yes. This is reached if the host does something not emulated:
1) A bug (writing to a RO register, writing STRTAB if SMMU is
   enabled...)
2) New arch feature not supported.

In that case, I'd rather panic here and fix the driver instead of
ignoring it which will manifest in a harder to debug symptoms later.

Also, this driver only handles the Linux host kernel (which must
be built-in in this config) so we can assume how the emulated driver
works and what features it use.

Thanks,
Mostafa

> 
> Nicolin
