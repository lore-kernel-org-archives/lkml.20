Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1768486634
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159421; cv=none; b=YED8sigN1gfvlewZguAPpglpsVueFNJl/LkMGd6rbBj7mUxMXZ8ApT+WU3kn7UwA3vyQk6OUporKb/EZo3RLtr5qcRIxLzOJZ/VGPo+noqA+TzdKD0Ho93LQqcA31SeAMnxp3YZT3t7ipkqWi5tRCZnAysUizspzYz7sFR8I2BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159421; c=relaxed/simple;
	bh=RH724JkT1TH0BVBbfq0vo+soCwQoN0cmU8izeXTd2vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMfh1ZXz2WVWc/ie69ZtuOociK41T6WjoHfpCumxEDQPrjMxpSsFKhRx9MRMz/IdO+Dshr+IPt/iHw17FNQGQi2CITB0vNwxzoQ4h9XlTAK93+Y+rlvznlrqCchQTl767II3IyyChuWyLYcVto/PnxmiZ8ZbLznkLJmlUmqItA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LtaCaY2L; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LtaCaY2L"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-498012a61f6so29725e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790159410; x=1790764210; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ovOwY8bLaV9a90WmLe0SJbMjYqolqHUHY1GzJaJp6yo=;
        b=LtaCaY2La35ANX0mzxQNKu/4QjXT3DOyITVsc+CzopEhVlol8tBTyOFFEzFFtTVJ1b
         slwtEFqqOPGaInb4Zha+Pn7ypazKh21qKtmKwJWOTyC0g/HgX9khafLqVbrYDuuZaOKh
         OJp5Dtmm52wXpzC1FGW1i2bDhwyrVLDTAPOOFGX6X7M9vzCeWVPeY+p1d+nbehjNU7yu
         u1Y8BDADni60OwQ7szoscN9jOC3BoA+1yeu5h1kM6VNSsxqWXBeR7eqtJXFl9Al303gm
         W2nSQTvCOy76ysfmVqjasNfsuFhC3yko6HcRaOB3ytg5bJy+1QwzXUSVnbAgIv7xgqLR
         Wh5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159410; x=1790764210;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ovOwY8bLaV9a90WmLe0SJbMjYqolqHUHY1GzJaJp6yo=;
        b=rnq2OtCOJrRt0EcuGGYEWykHGqzBREPAMQGtgWL4n0Kyslh4TNQbo8pRm1tQilHkWP
         IllvkGyYdakiWjkJsBRQppgX9e1Yzf60vvB5rvAm8PKYCkfSdwDLUplqwYU07FzN3cCB
         riBwE80ENxjvozm644j85A/c64k9kfVtiU14YaO1LhqiNdzxsHvlGDDPS8kAeIoGa73+
         k1tOIZMhFuCf/LJEsalaivuGl7UGuCedFvAP2WBlshLlG3yxFs4dDIINx20hPti8NxMd
         M51spdoRWgZqWT17I77MvfJ/xbio26EXf5xwh/7i8TzCqqrugbO9dfZDmSewKN3mlfXl
         ofmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRtFKs42XcIWHpXEezD9QFFyR3WVwyHaSnevqaL01TsCPSPL37ddVPGbhJ+g+v1M4W07ZuMfoGIhneGj8=@vger.kernel.org
X-Gm-Message-State: AFuF++nWz8x8C9ir3FhMjgh48EI5EuQx/E6m1tjML5YCoUHP34eJ4Gaw
	m3Jw4PHbV1bn2eHS6lo3/fNlzL8K/I6vLcVExInIeRwnjC+2IKOjtbm2mTnKqMpxPg==
X-Gm-Gg: AYBFou1ZMWPOux4729w/6kXUT6FN5wVLt+bI5tcvKFk1u7rkadLoQ4p5eCxxP9Ldwj2
	gS6X8tW2QNxg6hX3YqZgxjaF/yFmpmleoJlTl51V0eZx1wkxKu+ylnxe4CCCC1Ft4TT8Sk9m1lC
	IwmwWCgV66qTI93EcLuebg4TOQVEBg4eE1SneVQlHA5KGCLR5EIJTiZeUFMQ7NChnh2wVHsaflb
	yrYbI/ycOjFnBUzmHuX9wzWbyt+d3je6yfDHCLydkCHdsMRVlnLbbv2J3Eg5JpfTThWXTVR67d9
	ox4VlqBoOiJYDAoEa64vbFOOZDNDLL9HtT8kR7M0SbDEutieR8M5yNP4mca0Nb4TYxmgg/UtWBl
	6oSM+OJmwj5mZr7h6S7bimZMpdzLGKsqF7aXkZCkry3TNjUFUoZlpEnaX9qmsHxJKFvN7mMiu+t
	YQ3N4jma7/sRd5LOUsdbfukBd7zRH4cjSkz04rKrX+HRTKiCmbxci3rZzOXyCT/27qeXVf6RCzr
	1yRaMTnlOYUk1UFHYEY2iBUwAVzT6bnlGEe+uRf
X-Received: by 2002:a05:600c:8588:b0:48a:623c:8859 with SMTP id 5b1f17b1804b1-49fe1a55d46mr425265e9.7.1790159409353;
        Wed, 23 Sep 2026 03:30:09 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde185329sm68031695e9.1.2026.09.23.03.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:30:08 -0700 (PDT)
Date: Wed, 23 Sep 2026 10:30:05 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v8 10/25] iommu/arm-smmu-v3-kvm: Add SMMUv3 driver
Message-ID: <arOqLQTOsofAzCmg@google.com>
References: <20260922131259.2975334-1-smostafa@google.com>
 <20260922131259.2975334-11-smostafa@google.com>
 <arMDiPHiMvHVHsBr@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arMDiPHiMvHVHsBr@nvidia.com>

On Tue, Sep 22, 2026 at 03:39:04PM -0700, Nicolin Chen wrote:
> On Tue, Sep 22, 2026 at 01:12:43PM +0000, Mostafa Saleh wrote:
> > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > 
> > Add the skeleton for an Arm SMMUv3 driver at EL2.
> > 
> > The driver rely on an array of SMMUv3s on the system, where at
> 
> s/rely/relies

Will do.

> 
> > +++ b/drivers/iommu/arm/Kconfig
> > @@ -141,3 +141,15 @@ config QCOM_IOMMU
> >  	select ARM_DMA_USE_IOMMU
> >  	help
> >  	  Support for IOMMU on certain Qualcomm SoCs.
> > +
> > +config ARM_SMMU_V3_PKVM
> > +	bool "ARM SMMUv3 support for protected Virtual Machines"
> > +	depends on KVM && ARM_SMMU_V3=y
> 
> Should it depend on OF?

Makes sense, I will add it.

> 
> > +	help
> > +	  Enable a SMMUv3 driver in the KVM hypervisor, to protect VMs against
> 
> s/a SMMUv3/an SMMUv3

Will do.

> 
> > +++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
> > @@ -0,0 +1,31 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __KVM_ARM_SMMU_V3_HYP_H
> > +#define __KVM_ARM_SMMU_V3_HYP_H
> > +
> > +#include <asm/kvm_asm.h>
> > +
> > +/*
> > + * Parameters from the trusted host:
> > + * @mmio_addr		base address of the SMMU registers
> > + * @mmio_size		size of the registers resource
> 
> Are these still in the host's physical address space or guest's?
> 
> If it's still "host" (though trusted), what's different from the
> ioaddr in the main driver?

This is the physical address of the SMMUv3 as read from the device
tree.

The "base" pointer is for the hypervisor virtual address which is
created in the private mapping range (similar to ioremap())

The hypervisor doesn't keep the host VA anywhere. Also note that
there is no guest support at the moment, only the host.

> 
> > +size_t __ro_after_init kvm_hyp_arm_smmu_v3_count;
> > +struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
> 
> Should kvm_hyp_arm_smmu_v3_smmus be __ro_after_init as well?

That won't work at the moment as the hypervisor writes this pointer
after __ro_after_init to convert the kernel VA to hypervisor VA
unlike the count which is set once at boot.
It might be possible to make the kernel do this conversion early, I
will need to double check.

It's worth noting that __ro_after_init is just for the hypervisor
hardening and not for protection as those are protected by stage-2
MMU.

> 
> > +
> > +#define for_each_smmu(smmu) \
> > +	for ((smmu) = kvm_hyp_arm_smmu_v3_smmus; \
> > +	     (smmu) != &kvm_hyp_arm_smmu_v3_smmus[kvm_hyp_arm_smmu_v3_count]; \
> > +	     (smmu)++)
> 
> "smmu" sounds too generic. Maybe for_each_pkvm_smmu?

This macro is private to this driver, so I guess that's enough, also
smmu is used everywhere else, but no strong opinion.

> 
> > +/* Called while is the host is still trusted. */
> > +static int smmu_init(void)
> 
> s/while is/while

Will do.

> 
> > +/* Shared with the kernel driver in EL1 */
> > +struct pkvm_iommu_ops smmu_ops = {
> > +	.init				= smmu_init,
> > +	.host_stage2_idmap		= smmu_host_stage2_idmap,
> 
> Can we add a "pvkm_arm_smmu_" prefix for the ops and functions here?

Similar to above, these symbols are private to this file and the
hypervisor symbols gets prefixed with "__kvm_nvhe_" anyway, so they
never clash with the kernel. But no strong opinon.

Thanks,
Mostafa

> 
> Nicolin
