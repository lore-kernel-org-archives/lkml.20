Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480D94BF921
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164375; cv=none; b=c5lb30qM+sDEhzb+rQ0TAlvadVdkxfqZPQEHcaa08HYkO7u9I4KZwSfdHrUmnywER96/PesgSOZl63Frdkutlc0729rZRI4n7vzaxPlxtTU1UDEHe7k8NgRA5W6EoHPaIwh6YQRBuXCxHmEODp8NwJMuCc0gDU6OIxJoeAvVCZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164375; c=relaxed/simple;
	bh=lUYHJQmmmPLnvw+qXr+B62c88jlc853lezQ2xlWJuQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dsMT9Zfp5lGjSFFId9MfooJbdx+3tEJl3b8tnlZfrKcwVY8hKx3kDuC2msJF3B7rpZeGx36ms6W5Hktwgb2508rl++3fBxwifiPD6r5gxpdRpugzLXxxkOsyX57IJ4Ek0l/1I7MDDGkQuoWIJKAzJPNe5jvfXx8v3KUOrwrSSHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qjGz66GR; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qjGz66GR"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49e65a8f70eso34225e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790164361; x=1790769161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fAdFq/HquCPEOwe3O39yGHp6X7TbyFjfrWxFg5C9wy0=;
        b=qjGz66GRUcjij5R3GRUhy+Sc5VrdOQ83WLHGq2c6Aa4Cwhbb/lnyll1vIhSrV19R5p
         G67sdDyzSd1ymZgGVpRM2xQ0ytUH8MP0JnyDRK8FQpO+H02TNlpgZj/WMCjSNt6pwrm8
         7lxmEDo46Gb/dJS/6l6T3HZhU0diUEbfkigQn0gcYL3NQejcftRXJGex3ACk0WI2lUsB
         RZZXbbsTX7FhPmr7mdDOZKrcNYA7tMBw8PbyRwaa7E4aF4xK3OYk17k25ZnrL1KfLkIA
         0l6Q18DV7BAw3e06C8eTfAjSiuPSp1TFizpC+4pphDMlxHw2DsJ+h8ruyldWxoZNutig
         qk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790164361; x=1790769161;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fAdFq/HquCPEOwe3O39yGHp6X7TbyFjfrWxFg5C9wy0=;
        b=S5Gtkfq5xhxeLUhfIA0aySPZY+yl9yvdk2sWtGHGS6C/Bv6JV74h0i9AtMewwoKVN9
         wE/Uzwq2jYpmTrB6lnY0nw6q4FFBcWdWYZNeomto41NTNVsfQGxC+LAqgRbrid6u7Yox
         iLHEbKb/LrM38BrbgjEJxLM8/jIsw1Qf+KBynIMOjb51vY/vVVvG7mw76V9sw/eAC+xS
         Gtro5fxb8VuuV6Sp5zl+z9FqECAaSk1xBm8kD3j50wSjihEilH4bqjDmydnsu1BwQIvL
         h0R7Db8P2TfBLuyW98eMG2tbPxcPXCGCbOwrpHU3YwNbQ+tPCp9j4X1UAlfmKNI+14b2
         r25g==
X-Forwarded-Encrypted: i=1; AKwUvBzFEE727O1II5HFcpNwJ2D2DCxtSpI9x64jeSypwwhCnaxAHTyJ9b15Xok3WhNpPW1h3l2fQMvNxmjNaDI=@vger.kernel.org
X-Gm-Message-State: AFuF++meK5MOSWDqY0M5Ot8ee5FNzEAAnFhPNSQPdZ97KoXHGLVtMLGX
	7/B2LrR68Ku60uFGRVrsfLlfElVS9FZ5T94hV7JALcRGc579QyU2s6GTxXPLpCRy+Q==
X-Gm-Gg: AYBFou0fmVqiBxH+EYp+iECuPAKJomZljDGRgN7vzhK13bLlKWmiJjzfl0jH1lXHGDR
	bjjzOR8hqa8sf2rbCtbyiVfrUBxNgim7YvyRnCLPGk5DlkZKmmtuOlhMEU4A20WVsf4f7x8Vvhw
	tVtbfhqwkEcoM98WzGSS2do3FJ7Sj4VTbaAnI9komN4rJra7xzEVoFyveZ3UlW2g/f0MRF5HD+Y
	2y8TFbbxKvtvPQRSn4i26CBYjEADpsE1d8mUhGsk8hp79AwAYF5ljl3JwNPY7hPXHpqJPJGjb64
	mRR8OxR38YYGtu1QyQnEu1g2ZSUoW+RNF1CKK398P+tQpyCMuqUIULkteCzsT6O5T19JWoNUzrO
	j0/zZFhEAVay+3q/KcPnP6OfjG1WwGnXxif9ZqrvxjxdPj5jctWTne7Ug14tZR0ymUwws4eKm/9
	LBjO+TtMX/cQRpbNBxt8cazyVRQhY1b26usVxO6NjlEhkJWrg078gp9Wo7xA5R7P7DF0tqmFVT4
	S7ZTy+SLPrA4cBzfbtC6JUxPACMNvefFcw+FtEd2zOXYxP1568=
X-Received: by 2002:a05:600c:17ca:b0:49f:e12d:1a60 with SMTP id 5b1f17b1804b1-49fe12d2109mr449435e9.4.1790164360990;
        Wed, 23 Sep 2026 04:52:40 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682673bdsm6433690f8f.2.2026.09.23.04.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:52:40 -0700 (PDT)
Date: Wed, 23 Sep 2026 11:52:36 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v8 11/25] iommu/arm-smmu-v3-kvm: Add the kernel driver
Message-ID: <arO9hGmEx7c9mZAj@google.com>
References: <20260922131259.2975334-1-smostafa@google.com>
 <20260922131259.2975334-12-smostafa@google.com>
 <arMbxX+sqTS3gByB@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arMbxX+sqTS3gByB@nvidia.com>

On Tue, Sep 22, 2026 at 05:22:29PM -0700, Nicolin Chen wrote:
> On Tue, Sep 22, 2026 at 01:12:44PM +0000, Mostafa Saleh wrote:
> > When KVM runs in protected mode, and CONFIG_ARM_SMMU_V3_PKVM
> > is enabled, it will manage the SMMUv3 HW using trap and emulate
> > and present emulated SMMUs to the host kernel.
> > 
> > In that case, those SMMUs will be on the aux bus, so make it
> > possible to the driver to probe those devices.
> > 
> > Otherwise, everything else is the same, as the KVM emulation
> > complies with the architecture,so the driver doesn't need
> 
> Missing space before "so".

Will do.

> 
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
> > @@ -0,0 +1,187 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * pKVM host driver for the Arm SMMUv3
> 
> I am a bit confused by pkvm/arm-smmu-v3.c and arm-smmu-v3-kvm.c
> 
> It would be nicer to have a design doc or diagram here and the
> other place to show their relationships (with host and KVM too).

I can add more info in the cover letter about the code split. Mainly:
- arm-smmu-v3-kvm.c: Is the kernel driver for KVM SMMUv3 (this runs in
  EL1 and can use all the kernel functions).
  The main job of this driver is for discovery, it doesn't do anything
  else in the runtime.

- pkvm/arm-smmu-v3.c: Is the hypervisor driver (this runs in EL2), this
  is the driver that does the trap and emulate and is considered
  trusted. It can not access the kernel functions (all the code split
  is added for this file)

- After arm-smmu-v3-kvm.c creates the AUX devices, the upstream kernel
  driver (arm-smmu-v3.c) runs normally and the emulation code in
  pkvm/arm-smmu-v3.c should be transparent.


> 
> Naming-wise, could it be arm-smmu-v3-pkvm? I also wonder if we
> could move it into the pkvm folder:
>   pkvm/arm-smmu-v3-hyp.c
>   pkvm/arm-smmu-v3.c
> 

Anything under pkvm/ runs in EL2, so arm-smmu-v3-kvm.c should stay
outside. I am happy renaming both files (arm-smmu-v3-hyp.c,
arm-smmu-v3-pkvm works)

> > + *
> > + * Copyright (C) 2022 Linaro Ltd.
> > + */
> > +#include <asm/kvm_mmu.h>
> > +#include <asm/kvm_pkvm.h>
> > +
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include "arm-smmu-v3.h"
> > +#include "pkvm/arm-smmu-v3-hyp.h"
> > +
> > +extern struct pkvm_iommu_ops kvm_nvhe_sym(smmu_ops);
> > +
> > +static size_t				kvm_arm_smmu_count;
> > +static struct hyp_arm_smmu_v3_device	*kvm_arm_smmu_array;
> > +static size_t				kvm_arm_smmu_cur;
> 
> That spaces/tabs in those two lines look a bit odd..
> 

These are tabs to indent the variables, similar cases exist in the
SMMUv3 driver, check arm_smmu_cmdq and friends for example.

> > +static unsigned int smmu_hyp_pgt_pages(void)
> > +{
> > +	struct device_node *np = of_find_compatible_node(NULL, NULL, "arm,smmu-v3");
> > +
> > +	/*
> > +	 * SMMUv3 uses the same format as the CPU stage-2 and hence have the same memory
> > +	 * requirements, we add extra 500 pages for L2 STEs.
> > +	 * Only one set of memory is allocated as the page table is shared between all
> > +	 * the SMMUs.
> 
> Mind briefly elaborate the 500 pages in this notes? Why pick 500?
> 
> Also, there is no hard requirement, but the main driver still wraps
> inline comments at 80 cols. So, it would be nicer for this driver to
> follow that.
> 

TBH, this is a bit of a hack. The hypervisor can not allocate memory
at the runtime. All of the hypervisor memory comes from a carveout
allocated at boot (see kvm_hyp_reserve())

So we allocate the worst case for memory mapping with leaf granule. But
the hypervisor also need to allocate L2 pointers and the SID space can
be massive making the upper limit for this too large.

However, smmu_hyp_pgt_pages() defines the minimum pages required,
actual allocation comes from the command line, so it is possible to
tune the system without re-compiling the kernel.

Thinking about it now, we can just drop the 500 as this is the lower
bound, earlier versions of this series would allocate the carveout
based on this size, but it is not needed anymore.

> > +	 */
> > +	if (np) {
> > +		of_node_put(np);
> > +		return host_s2_pgtable_pages() + 500;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static struct platform_driver smmuv3_nesting_driver;
> > +static int smmuv3_nesting_probe(struct platform_device *pdev)
> > +{
> > +	struct hyp_arm_smmu_v3_device *smmu = &kvm_arm_smmu_array[kvm_arm_smmu_cur];
> > +	struct device *dev = &pdev->dev;
> > +	struct resource *res;
> > +
> > +	/* Only device tree, ACPI not supported. */
> > +	if (!dev->of_node)
> > +		return -EINVAL;
> 
> Sashiko reported a critical finding, which sounds plausible to me:
> "
> Can an adversary bypass pKVM stage-2 memory protections here?
> If an SMMU fails to bind to the hypervisor due to early returns in this
> probe function (like missing a device tree node or hitting the cavium
> erratum below), it is excluded from kvm_arm_smmu_array and the hypervisor
> does not trap its MMIO.
> When the native host arm_smmu_driver registers at device_initcall, it can
> successfully bind to this unbound SMMU. Does this allow an adversary host
> kernel at EL1 to natively program this untrapped SMMU to perform arbitrary
> DMA into hypervisor or guest memory?
> "
> 
> Would you please justify?

Yes, Sashiko replied to this mail with it and I replied:
https://lore.kernel.org/all/20260922132814.D398D1F000FF@smtp.kernel.org/

Basically, yes that is possible. Some SMMUs might not be in the device
tree or might not be compatiable or the system might have an SMMUv2 or
a completely different arch or no IOMMU at all.

pKVM can not defend against bad FW or missing HW, and if something i
missing there is nothing to do about (and it won't even know)

There are some extra notes in the last patch that includes the
documentation I can add more.

But this is also similar to how pKVM monitors SMC (TZ channels), by
inspecting FFA traffic, if some system decided that TZ will accept
other side channels for sharing physical addresses, pKVM can not do
anything about it and the system is not secure by design.

> 
> > +	if (kvm_arm_smmu_cur >= kvm_arm_smmu_count)
> > +		return -ENOSPC;
> 
> Both counts and probe() are coming from Device Tree. So, it doesn't
> seem possible unless a kernel bug. Should it WARN_ON?

I will add a WARN_OON()

> 
> > +	smmu->mmio_addr = res->start;
> > +	smmu->mmio_size = resource_size(res);
> > +	if (smmu->mmio_size < SZ_128K) {
> > +		dev_err(dev, "MMIO region too small(%pr)\n", res);
> > +		return -EINVAL;
> > +	}
> 
> Should it reject !PAGE_ALIGNED(addr|size) like the other driver?
> 

That check is in the hypervisor part but can be added here instead to
save a trip. Although that should never happen.

> > +static int __init kvm_arm_smmu_v3_register(void)
> > +{
> [...]
> > +out_err:
> > +	kvm_arm_smmu_count = 0;
> > +	kvm_arm_smmu_array = NULL;
> > +	return ret;
> > +};
> 
> No ';' after '}'.

Oops, will fix it.

> 
> > +static int kvm_arm_smmu_v3_post_init(void)
> 
> __init?
> 

That should be possible, I will add it.

> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > @@ -5203,6 +5204,72 @@ static struct platform_driver arm_smmu_driver = {
> >  module_driver(arm_smmu_driver, platform_driver_register,
> >  	      arm_smmu_driver_unregister);
> >  
> > +#ifdef CONFIG_ARM_SMMU_V3_PKVM
> > +/*
> > + * Now we have 2 devices, the aux device bound to this driver, and pdev
> > + * which is the physical platform device bound to the KVM driver but not used.
> > + * However, this driver keeps using the platform device for 2 reasons:
> > + * 1) Simplicity: Avoiding changing big parts of the code assuming
> > + *    the underlying device is a platform device.
> > + * 2) Dealing with DMA-API, irqs(MSIs), RPM... requires the physical device.
> > + *
> > + * That means arm_smmu_device_probe() allocates its devm resources on the
> > + * platform device, where they are not freed when the aux device unbinds.
> > + * The devres group bounds them to the lifetime of this binding instead.
> 
> There is an "unbinds", so I assume it should be:
> 
> s/bounds/binds
> 
> ?

I think "is bound", I am not sure if bounds/unbounds is correct.

Thanks,
Mostafa

> 
> Nicolin
