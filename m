Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792496309;
	b=oPafmW+nju0trPRb+uZPATzW443qtKBinJxYp9CpTPK91HMQx83dAsLWPcjRru5soKxd
	 xqPWdtXJHgygdimyU+pJjmubNeTAm+UrOAWf60jiNaOB+lR+5tu+297wadgiIujQ2u9LL
	 QfUETaQe3MzS2GQv7To7Y9eW3g7OCKpBDMGhsQt+1Sfv1uDcYvJT/TpvOXombDxirJGns
	 R/Df49CBVc7WkQ4YPYPWUvWbXz9xbUyJUW+jCuagJ9bB6ljA+Gn9lMxYb9//aMMvO7v3e
	 JxkeGMGrWKriV0XqU9/cFRcF9FZX33Z8VI+lsGSW5q9pW1zASvtHItZiUPqbvI1bhMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GUu8RpiRqtBaHObtAlgfcXnRFq0vqSVGatN9hi/iKOE=;
	b=B/0B+XNj3Esb0sOWXX3lLxI/D9Y4L89VoyPV2zsXCGtn4G0eB4WRu+WegjfbsMNbmQOs
	 4rNg4cPxiFhVC9dipvA5uAFiWDLsdujB2zV7eIZAISZ6+kW4TRPPs2zEV8FIh5YDTlNz8
	 0HZMU8WjUJ0LaWXI2Yap9UchLjcRzThXThoBw5S13KBmcbQVR6kPEva9Ap2+hWRoPjU9U
	 +Fobpv/zIyMb3YsC0aWnmmCh8+ayGC3wp5vGXqPpFIF0MgRSCMau8Jo7pEblgeYY681Eq
	 264zrJHGzRvoGo9j9F+EOIyI8CJl/BtLNZBLiovdvvmCy/+xxLAf+ftvDe1TCBn4CaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jk8D+mrZ;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9082606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9082606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jk8D+mrZ
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a021c28046so32915e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792496306; x=1793101106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GUu8RpiRqtBaHObtAlgfcXnRFq0vqSVGatN9hi/iKOE=;
        b=jk8D+mrZP13UZqkhpwLd3Zqqw1Q6CKWLZDeEZiKL0I7ABSO87Kq0wngeTeiP3CD4tj
         H1W9udcjaeRkq9Pbmuuu4SNTOuBFWxX26t19Bpd92QzjVryydou0w8rjeCmG7XnC2QRY
         /nlPolrGcMWnFlDCTEr6OF78ZGvDg4XxcffCjKlJpmSC6yIX+RznIN4YMZIJy5FiEK8P
         0eyK5Juh5K0V0COJS5aKgEKxwSeKhHZkgx/wSxsrByYeFG/Jx7rp/WBivVuCsg2ALDoX
         EHWG9NTfO9PcpdPFKm8Zshf+AFKpiYjbn92RNRdNKfahaK39SqbPbapw1PZWF7LYsR9M
         J1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792496306; x=1793101106;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GUu8RpiRqtBaHObtAlgfcXnRFq0vqSVGatN9hi/iKOE=;
        b=gqqtTbReNup8XaRW/iW4z9KiadcQK92UUKRjjIAtdyLFYfIb/o64ml1j0vTCH4BgdO
         ynM0fqOJARnVw18ViuvebFJI6ZBaXPE33tN7CySr3NZg8k5kz6bQJG2HBRL6EfM72agn
         hj7XVoIqsCEifIQq6Otq0CFA58hFnvzRLNzm8XaOazON6pYWAHJZC01wR5yzf0qrdyrv
         ErSzPzNIvQ5wMgp5RWdXN3rmWqIIEvwjGFQfSxraoukinhutcWaFhLATViesZnMdM8tK
         V9pq+GbYzRzBdq7cFsBNBinhak4vCz8QI+oxumEq7blLzC69Covc5bGb7euPcu1P5y3q
         bCZg==
X-Forwarded-Encrypted: i=1; AKwUvBxyhfnWcpU+U8wTVdcpyy5QAIJ3x3H6z1oxSG9vrAB71+PaSVq5tQ+6d9qAVHWzKkZM6VyXf8QljJAWrH0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFTBGYLC/itIsKZ8sLHjm+nSufJVTSsLS9zMJXT+xovMMEz1yf
	WoDOsBmnc8vR+dyFsmFBfPxgxPJlSdpGf/V6gYpcUEmJ/jyCBsc43c/mi5NoDAuzBw==
X-Gm-Gg: AYBFou1MjAJZvyrvC456FdFOlshYU9xmXBf7nOIAy8NUSBfR2r+1ZsJxChqK8es+eTg
	KA6Pk0F+NC1yeU9euWxTtqf9zmKOJze7lGp1P8iE5ELMEvlWhALIpifCrqQsYw6diEbBeRq/x+b
	TL32LGTrsN9ja8zkn9lI8e9HInkbjbWLMocGfzzLf2FQtZYTlZOJ+h+Bz3t1MaD0tg2Gk5yc6aJ
	E8qdAz0GxqPCCKrCpjfZR7VZfHVghWjX0Xy97JsqiKRv8sJcygKsOxhCil1cWkuexYUrnNBH4jy
	BQFAdAmfvuUXFNpYX92WFHajR3sdlkGvM3WZ8ODLT23Z5VtYZ+k4wFeFOqDlbLD0mYQWux+Lhgv
	NaJRArFFrKOENbMQBqtIKMZGiAeknwAHvwERuvaPP1qT4bqj/DCB2UVw5C813F+nDiC1esnPc/V
	qU3PqH7RrvBm9l1vsBPk4HyFAXMA1DmZP9XtcvDbx7WYCOTTXMYCdIMNaOZbZmGKuvAsE926FAX
	+NEvK+CO3qozpZasWXbo9+ncAlKxbmCyUQ41fDA
X-Received: by 2002:a05:600c:4b89:b0:4a1:e7d5:5132 with SMTP id 5b1f17b1804b1-4a1f383e580mr570175e9.3.1792496305643;
        Tue, 20 Oct 2026 04:38:25 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f6631abfsm49603205e9.1.2026.10.20.04.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:38:24 -0700 (PDT)
Date: Tue, 20 Oct 2026 11:38:21 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@nvidia.com,
	praan@google.com, kevin.tian@intel.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, jamien@nvidia.com, kas@kernel.org,
	Cristian Prundeanu <cpru@amazon.com>,
	Breno Leitao <leitao@kernel.org>
Subject: Re: [PATCH v11 06/11] iommu/arm-smmu-v3: Add
 ARM_SMMU_OPT_KDUMP_ADOPT for kdump kernel
Message-ID: <atdSrRwrphdI9ZQA@google.com>
References: <cover.1791226953.git.nicolinc@nvidia.com>
 <ee4257b62324aa75d7140f1f4a49aa0f78586fff.1791226953.git.nicolinc@nvidia.com>
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
In-Reply-To: <ee4257b62324aa75d7140f1f4a49aa0f78586fff.1791226953.git.nicolinc@nvidia.com>

On Mon, Oct 05, 2026 at 12:30:49PM -0700, Nicolin Chen wrote:
> When transitioning to a kdump kernel, the primary kernel might have crashed
> while endpoint devices were actively bus-mastering DMA. Currently, the SMMU
> driver aggressively resets the hardware during probe by clearing CR0_SMMUEN
> and setting the Global Bypass Attribute (GBPA) to ABORT.
> 
> In a kdump scenario, this aggressive reset is highly destructive:
> a) If GBPA is set to ABORT, in-flight DMA will be aborted, generating fatal
>    PCIe AER or SErrors that may panic the kdump kernel
> b) If GBPA is set to BYPASS, in-flight DMA targeting some IOVAs will bypass
>    the SMMU and corrupt the physical memory at those 1:1 mapped IOVAs.
> 
> To safely absorb in-flight DMAs, a kdump kernel will have to leave SMMUEN=1
> intact and avoid modifying STRTAB_BASE, allowing HW to continue translating
> in-flight DMAs reusing the crashed kernel's page tables until the endpoint
> device drivers probe and quiesce their respective hardware.
> 
> However, the ARM SMMUv3 architecture specification states that updating the
> SMMU_STRTAB_BASE register while SMMUEN == 1 is UNPREDICTABLE or ignored.
> 
> This leaves a kdump kernel no choice but to adopt the stream table from the
> crashed kernel.
> 
> Introduce ARM_SMMU_OPT_KDUMP_ADOPT and adoption functions that memremap the
> stream tables extracted from STRTAB_BASE and STRTAB_BASE_CFG.
> 
> Note that the adoption of the crashed kernel's stream table follows certain
> strict rules, since the old stream table might be compromised. Thus, apply
> some basic validations against the values read from the registers. If tests
> fail, it means the stream table cannot be trusted, so toss it entirely. To
> avoid OOM due to a potentially corrupted stream table, the memremap for l2
> tables is done lazily on the kdump kernel's demand.
> 
> The new option will be set in a following change, once the device reset and
> the RMR setup are reworked not to overwrite the adopted stream table, and
> the crashed kernel's in-use ASIDs and VMIDs are reserved.
> 
> Keep all kdump functions and kexec helpers in a new arm-smmu-v3-kexec file,
> which will be shared with the liveupdate series in the future.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Suggested-by: Pranjal Shrivastava <praan@google.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Breno Leitao <leitao@kernel.org>
> Tested-by: Cristian Prundeanu <cpru@amazon.com>
> Assisted-by: LLM
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/Kconfig                     |   3 +
>  drivers/iommu/arm/arm-smmu-v3/Makefile        |   1 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  21 +
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kexec.c | 398 ++++++++++++++++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  21 +-
>  5 files changed, 441 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kexec.c
> 
> diff --git a/drivers/iommu/arm/Kconfig b/drivers/iommu/arm/Kconfig
> index 5fac08b89deea..9a7bebe16f395 100644
> --- a/drivers/iommu/arm/Kconfig
> +++ b/drivers/iommu/arm/Kconfig
> @@ -109,6 +109,9 @@ config ARM_SMMU_V3_IOMMUFD
>  
>  	  Say Y here if you are doing development and testing on this feature.
>  
> +config ARM_SMMU_V3_KEXEC
> +	def_bool CRASH_DUMP
> +
>  config ARM_SMMU_V3_KUNIT_TEST
>  	tristate "KUnit tests for arm-smmu-v3 driver"  if !KUNIT_ALL_TESTS
>  	depends on KUNIT
> diff --git a/drivers/iommu/arm/arm-smmu-v3/Makefile b/drivers/iommu/arm/arm-smmu-v3/Makefile
> index 493a659cc66bb..89a27de8dd2f0 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/Makefile
> +++ b/drivers/iommu/arm/arm-smmu-v3/Makefile
> @@ -3,6 +3,7 @@ obj-$(CONFIG_ARM_SMMU_V3) += arm_smmu_v3.o
>  arm_smmu_v3-y := arm-smmu-v3.o
>  arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_IOMMUFD) += arm-smmu-v3-iommufd.o
>  arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_SVA) += arm-smmu-v3-sva.o
> +arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_KEXEC) += arm-smmu-v3-kexec.o
>  arm_smmu_v3-$(CONFIG_TEGRA241_CMDQV) += tegra241-cmdqv.o
>  
>  obj-$(CONFIG_ARM_SMMU_V3_KUNIT_TEST) += arm-smmu-v3-test.o
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 559bfa8cbc5e0..a1f947e7d9fe4 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -986,6 +986,7 @@ struct arm_smmu_device {
>   * invalidated CONT
>   */
>  #define ARM_SMMU_OPT_FULL_CONT_RANGE_INV (1 << 6)
> +#define ARM_SMMU_OPT_KDUMP_ADOPT	(1 << 7)
>  	u32				options;
>  
>  	struct arm_smmu_cmdq		cmdq;
> @@ -1312,6 +1313,26 @@ tegra241_cmdqv_probe(struct arm_smmu_device *smmu)
>  }
>  #endif /* CONFIG_TEGRA241_CMDQV */
>  
> +#ifdef CONFIG_CRASH_DUMP
> +int arm_smmu_kdump_adopt_strtab(struct arm_smmu_device *smmu);
> +int arm_smmu_kdump_adopt_deferred_l2_strtab(struct arm_smmu_device *smmu,
> +					    u32 sid, phys_addr_t base, u32 span,
> +					    struct arm_smmu_strtab_l2 **l2table);
> +#else /* CONFIG_CRASH_DUMP */
> +static inline int arm_smmu_kdump_adopt_strtab(struct arm_smmu_device *smmu)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline int
> +arm_smmu_kdump_adopt_deferred_l2_strtab(struct arm_smmu_device *smmu, u32 sid,
> +					phys_addr_t base, u32 span,
> +					struct arm_smmu_strtab_l2 **l2table)
> +{
> +	return -EOPNOTSUPP;
> +}
> +#endif /* CONFIG_CRASH_DUMP */
> +
>  struct arm_vsmmu {
>  	struct iommufd_viommu core;
>  	struct arm_smmu_device *smmu;
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kexec.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kexec.c
> new file mode 100644
> index 0000000000000..6bbc369df86bb
> --- /dev/null
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kexec.c
> @@ -0,0 +1,398 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2026, NVIDIA CORPORATION & AFFILIATES
> + */
> +
> +#define dev_fmt(fmt) "kexec: " fmt
> +
> +#include <linux/io.h>
> +#include <linux/slab.h>
> +
> +#include "arm-smmu-v3.h"
> +
> +/*
> + * Common helpers for a kexec'd kernel to parse, validate, and walk through the
> + * previous kernel's SMMU table structures, shared by the kdump adoption and a
> + * future live-update restoration.
> + *
> + * The common helpers are read-only against the previous kernel's structures: a
> + * table that is not yet mapped by this kernel gets a transient memremap during
> + * a walk, followed by an immediate memunmap. They never allocate memory or take
> + * ownership of the previous kernel's tables; the callers make those decisions.
> + */
> +
> +/**
> + * arm_smmu_kexec_parse_strtab_2lvl() - Validate a 2-level stream table
> + * @smmu: SMMU device of this kernel
> + * @cfg_reg: STRTAB_BASE_CFG register value set by the previous kernel
> + * @base: stream table base address extracted from the STRTAB_BASE register
> + * @num_l1_ents: pointer to return the number of L1 entries
> + *
> + * Validate the 2-level stream table geometry in @cfg_reg and @base's alignment
> + * against this kernel's hardware limits.
> + *
> + * Return: 0 on success with @num_l1_ents set, or -EINVAL on a bad geometry
> + */
> +static int arm_smmu_kexec_parse_strtab_2lvl(struct arm_smmu_device *smmu,
> +					    u32 cfg_reg, phys_addr_t base,
> +					    u32 *num_l1_ents)
> +{
> +	u32 log2size = FIELD_GET(STRTAB_BASE_CFG_LOG2SIZE, cfg_reg);
> +	u32 split = FIELD_GET(STRTAB_BASE_CFG_SPLIT, cfg_reg);
> +	u32 num_ents;
> +	size_t size;
> +
> +	if (log2size < split || log2size > smmu->sid_bits) {
> +		dev_err(smmu->dev, "log2size %u out of range [%u, %u]\n",
> +			log2size, split, smmu->sid_bits);
> +		return -EINVAL;
> +	}
> +	if (split != STRTAB_SPLIT) {
> +		dev_err(smmu->dev,
> +			"unsupported STRTAB_SPLIT %u (expected %u)\n", split,
> +			STRTAB_SPLIT);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * Bound the entry count before the shift, as a log2size wider than what
> +	 * this kernel itself supports would overflow it.
> +	 */
> +	if (log2size - split > ilog2(STRTAB_MAX_L1_ENTRIES)) {
> +		dev_err(smmu->dev, "l1 entries 2^%u exceeds max %u\n",
> +			log2size - split, STRTAB_MAX_L1_ENTRIES);
> +		return -EINVAL;
> +	}
> +
> +	num_ents = 1U << (log2size - split);
> +
> +	size = num_ents * sizeof(struct arm_smmu_strtab_l1);
> +	/*
> +	 * According to spec (6.3.24), HW aligns the base down to the L1 table
> +	 * size, i.e. min 64 bytes, so an unaligned base would make this kernel
> +	 * read another table.
> +	 */
> +	if (!IS_ALIGNED(base, size)) {
> +		dev_err(smmu->dev, "unaligned l1 stream table base %pa\n",
> +			&base);
> +		return -EINVAL;
> +	}
> +
> +	*num_l1_ents = num_ents;
> +	return 0;
> +}
> +
> +/**
> + * arm_smmu_kexec_parse_strtab_linear() - Validate a linear stream table
> + * @smmu: SMMU device of this kernel
> + * @cfg_reg: STRTAB_BASE_CFG register value set by the previous kernel
> + * @base: stream table base address extracted from the STRTAB_BASE register
> + * @num_ents: pointer to return the number of STEs
> + *
> + * Validate the linear stream table geometry in @cfg_reg and @base's alignment
> + * against this kernel's own limits.
> + *
> + * Return: 0 on success with @num_ents set, or -EINVAL on a bad geometry
> + */
> +static int arm_smmu_kexec_parse_strtab_linear(struct arm_smmu_device *smmu,
> +					      u32 cfg_reg, phys_addr_t base,
> +					      u32 *num_ents)
> +{
> +	u32 log2size = FIELD_GET(STRTAB_BASE_CFG_LOG2SIZE, cfg_reg);
> +	unsigned int max_log2size = smmu->sid_bits;
> +	size_t size;
> +
> +	/* Cap the size at what this kernel itself would have allocated */
> +	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)
> +		max_log2size = min_t(
> +			unsigned int, max_log2size,
> +			ilog2(STRTAB_MAX_L1_ENTRIES * STRTAB_NUM_L2_STES));
> +
> +	/* num_ents is limited to a u32, so cap log2size at 31 */
> +	max_log2size = min(max_log2size, 31U);
> +	if (log2size > max_log2size) {
> +		dev_err(smmu->dev, "unsupported log2size %u (> %u)\n", log2size,
> +			max_log2size);
> +		return -EINVAL;
> +	}
> +
> +	size = (1U << log2size) * sizeof(struct arm_smmu_ste);
> +	/*
> +	 * According to spec (6.3.24), HW aligns the base down to the table size
> +	 * and ignores the low bits, so an unaligned base would make this kernel
> +	 * read a different table.
> +	 */
> +	if (!IS_ALIGNED(base, size)) {
> +		dev_err(smmu->dev, "unaligned stream table base %pa\n", &base);

I understand these are best effort, but what happens if the address
corrupted and happens to be aligned?

> +		return -EINVAL;
> +	}
> +
> +	*num_ents = 1U << log2size;
> +	return 0;
> +}
> +
> +/**
> + * arm_smmu_kexec_check_strtab_l1_desc() - Check one stream table L1 descriptor
> + * @smmu: SMMU device of this kernel
> + * @l1_desc: L1 descriptor value from the previous kernel's stream table
> + * @idx: index of the L1 descriptor, for diagnostics
> + * @l2_base: pointer to return the L2 table's physical address
> + *
> + * Return: 1 if the descriptor is unused, 0 if it is valid with @l2_base set, or
> + * -EINVAL if it is malformed
> + */
> +static int arm_smmu_kexec_check_strtab_l1_desc(struct arm_smmu_device *smmu,
> +					       u64 l1_desc, u32 idx,
> +					       phys_addr_t *l2_base)
> +{
> +	phys_addr_t base = l1_desc & STRTAB_L1_DESC_L2PTR_MASK;
> +	u32 span = FIELD_GET(STRTAB_L1_DESC_SPAN, l1_desc);
> +
> +	/* L1STD.L2Ptr is invalid */
> +	if (!span)
> +		return 1;
> +
> +	if (span != STRTAB_SPLIT + 1) {
> +		dev_err(smmu->dev, "L1[%u] unsupported span %u (vs %u)\n", idx,
> +			span, STRTAB_SPLIT + 1);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * A valid descriptor never carries a null pointer. Also, HW aligns the
> +	 * pointer down to the L2 table size, so an unaligned pointer would make
> +	 * this kernel read a different table.
> +	 */
> +	if (!base || !IS_ALIGNED(base, sizeof(struct arm_smmu_strtab_l2))) {
> +		dev_err(smmu->dev, "L1[%u] bad l2 table base %pa\n", idx,
> +			&base);
> +		return -EINVAL;
> +	}
> +
> +	*l2_base = base;
> +	return 0;
> +}
> +
> +#ifdef CONFIG_CRASH_DUMP
> +/*
> + * Helper functions of the kdump stream table adoption for ARM SMMUv3
> + *
> + * When the crashed kernel left the SMMU enabled with in-flight DMAs, the kdump
> + * kernel adopts the crashed kernel's stream tables, instead of doing a regular
> + * reset, to keep in-flight DMAs translating until the endpoint device drivers
> + * re-probe and quiesce their devices.
> + *
> + * Note:
> + *  - Adoption only starts on an SMMU that the crashed kernel left enabled, as a
> + *    disabled SMMU (CR0_SMMUEN=0) could hold meaningless register values.
> + *  - Values read from the crashed kernel's registers get structural validation
> + *    only (format, size, span, alignment, and ID range); the physical addresses
> + *    are not vetted, as the kdump kernel has no record of which pages held the
> + *    tables.
> + *  - A structural inconsistency at adoption time tosses the entire adoption and
> + *    makes the SMMU fall back to a full reset blocking in-flight DMAs.
> + *  - L2 stream tables are adopted lazily at master-inserting time, to bound the
> + *    peak memory use against a corrupted L1 table; any lazy L2 adoption failure
> + *    rejects that device alone, as its blast radius is bounded to the bus.
> + *  - Only a coherent SMMU (ARM_SMMU_FEAT_COHERENCY) is supported, as the stream
> + *    table adoption is done by memremap with MEMREMAP_WB, which is verified on
> + *    the real hardware. Callers of these functions are responsible for gating
> + *    ARM_SMMU_FEAT_COHERENCY once during the probe.
> + */
> +
> +int arm_smmu_kdump_adopt_deferred_l2_strtab(struct arm_smmu_device *smmu,
> +					    u32 sid, phys_addr_t base, u32 span,
> +					    struct arm_smmu_strtab_l2 **l2table)
> +{
> +	struct arm_smmu_strtab_l2 *table;
> +	size_t size;
> +
> +	/*
> +	 * Retest the span in case the L1 descriptor has been overwritten since
> +	 * the adopt. Reject this master's insert; panic or SMMU-disable would
> +	 * either lose the vmcore or cascade aborts. Do not try to fix it, as it
> +	 * would break all other SIDs in the same bus (PCI case). The corruption
> +	 * blast radius is already bounded to that bus range.
> +	 */
> +	if (span != STRTAB_SPLIT + 1) {
> +		dev_err(smmu->dev,
> +			"L1[%u] span %u changed since adopt (was %u)\n",
> +			arm_smmu_strtab_l1_idx(sid), span, STRTAB_SPLIT + 1);
> +		return -EINVAL;
> +	}
> +
> +	size = (1UL << (span - 1)) * sizeof(struct arm_smmu_ste);
> +
> +	/* Same live-corruption check as the span; reject an overwritten base */
> +	if (!base || !IS_ALIGNED(base, size)) {
> +		dev_err(smmu->dev, "L1[%u] bad l2 table base %pa\n",
> +			arm_smmu_strtab_l1_idx(sid), &base);
> +		return -EINVAL;
> +	}
> +

Those are a bit similar to arm_smmu_kexec_parse_strtab_2lvl() is it
possible to have some helpers instead?

> +	/*
> +	 * This L2 table is mapped lazily per master; devres frees it at unbind,
> +	 * as with the dmam_alloc_coherent() used for a fresh L2.
> +	 */
> +	table = devm_memremap(smmu->dev, base, size, MEMREMAP_WB);
> +	if (IS_ERR(table)) {
> +		dev_err(smmu->dev,
> +			"failed to adopt l2 stream table for SID %u\n", sid);
> +		return PTR_ERR(table);
> +	}
> +
> +	*l2table = table;
> +	return 0;
> +}
> +
> +static int arm_smmu_kdump_adopt_strtab_2lvl(struct arm_smmu_device *smmu,
> +					    u32 cfg_reg, phys_addr_t base)
> +{
> +	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
> +	u32 num_l1_ents;
> +	size_t size;
> +	int ret, i;
> +
> +	ret = arm_smmu_kexec_parse_strtab_2lvl(smmu, cfg_reg, base,
> +					       &num_l1_ents);
> +	if (ret)
> +		return ret;
> +
> +	cfg->l2.num_l1_ents = num_l1_ents;
> +
> +	size = num_l1_ents * sizeof(struct arm_smmu_strtab_l1);
> +	cfg->l2.l1tab = memremap(base, size, MEMREMAP_WB);
> +	if (!cfg->l2.l1tab)
> +		return -ENOMEM;
> +
> +	cfg->l2.l2ptrs =
> +		kcalloc(num_l1_ents, sizeof(*cfg->l2.l2ptrs), GFP_KERNEL);
> +	if (!cfg->l2.l2ptrs)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < num_l1_ents; i++) {
> +		u64 l2ptr = le64_to_cpu(cfg->l2.l1tab[i].l2ptr);
> +		phys_addr_t l2_base;
> +
> +		ret = arm_smmu_kexec_check_strtab_l1_desc(smmu, l2ptr, i,
> +							  &l2_base);
> +		if (ret < 0)
> +			return ret;
> +
> +		/*
> +		 * If the crashed kernel's l1 descriptors are deeply corrupted,
> +		 * blindly memremapping every l2 table here could lead to OOM.
> +		 *
> +		 * Defer the l2 memremap to arm_smmu_init_l2_strtab(), so peak
> +		 * memory is bounded by the kdump kernel's actual demand.
> +		 */
> +	}
> +
> +	return 0;
> +}
> +
> +static int arm_smmu_kdump_adopt_strtab_linear(struct arm_smmu_device *smmu,
> +					      u32 cfg_reg, phys_addr_t base)
> +{
> +	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
> +	u32 num_ents;
> +	size_t size;
> +	int ret;
> +
> +	ret = arm_smmu_kexec_parse_strtab_linear(smmu, cfg_reg, base,
> +						 &num_ents);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * We might end up with a num_ents != sid_bits, which is fine, since the
> +	 * ARM_SMMU_OPT_KDUMP_ADOPT case bypasses arm_smmu_write_strtab().
> +	 */
> +	cfg->linear.num_ents = num_ents;
> +
> +	size = num_ents * sizeof(struct arm_smmu_ste);
> +	cfg->linear.table = memremap(base, size, MEMREMAP_WB);
> +	if (!cfg->linear.table)
> +		return -ENOMEM;
> +	return 0;
> +}
> +
> +static void arm_smmu_kdump_adopt_cleanup(void *data)
> +{
> +	struct arm_smmu_device *smmu = data;
> +	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
> +
> +	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
> +		kfree(cfg->l2.l2ptrs);
> +		if (cfg->l2.l1tab)
> +			memunmap(cfg->l2.l1tab);
> +	} else {
> +		if (cfg->linear.table)
> +			memunmap(cfg->linear.table);
> +	}
> +}
> +
> +int arm_smmu_kdump_adopt_strtab(struct arm_smmu_device *smmu)
> +{
> +	u32 cfg_reg = readl_relaxed(smmu->base + ARM_SMMU_STRTAB_BASE_CFG);
> +	u64 base_reg = readq_relaxed(smmu->base + ARM_SMMU_STRTAB_BASE);
> +	bool was_2lvl = smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB;
> +	phys_addr_t base = base_reg & STRTAB_BASE_ADDR_MASK;
> +	u32 fmt = FIELD_GET(STRTAB_BASE_CFG_FMT, cfg_reg);
> +	int ret;
> +
> +	dev_dbg(smmu->dev, "adopting crashed kernel's stream table\n");
> +
> +	if (fmt == STRTAB_BASE_CFG_FMT_2LVL) {
> +		/*
> +		 * Both kernels run on the same hardware, so it's impossible for
> +		 * kdump kernel to see the support for linear stream table only.
> +		 */

STRTAB_SPLIT which influences ARM_SMMU_FEAT_2_LVL_STRTAB is a SW choice, so it is
possible to get such mismatch if STRTAB_SPLIT of the newer kernel is larger than the
older kernel.
However, I agree that in that case it's better to refuse the adoption.

> +		if (WARN_ON(!(smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)))
> +			ret = -EINVAL;
> +		else
> +			ret = arm_smmu_kdump_adopt_strtab_2lvl(smmu, cfg_reg,
> +							       base);
> +	} else if (fmt == STRTAB_BASE_CFG_FMT_LINEAR) {
> +		/*
> +		 * The kdump kernel need not match the crashed kernel. An older
> +		 * crashed kernel that predates two-level stream table support
> +		 * may have used a linear table on 2-level-capable hardware, so
> +		 * enforce the same format here to match the adopted table.
> +		 */
> +		ret = arm_smmu_kdump_adopt_strtab_linear(smmu, cfg_reg, base);
> +		if (!ret)
> +			smmu->features &= ~ARM_SMMU_FEAT_2_LVL_STRTAB;

For simplicity, it is better to enforce the same table formats between
kernels as the rest of the file, for example,
arm_smmu_kexec_parse_strtab_2lvl() refuses different STRTAB_SPLIT.
Some checks can be removed and the was_2lvl error path. It's
very unlikely to hit such case anyway.

> +	} else {
> +		dev_err(smmu->dev, "invalid STRTAB format %u\n", fmt);
> +		ret = -EINVAL;
> +	}
> +
> +	if (ret) {
> +		arm_smmu_kdump_adopt_cleanup(smmu);

Probably easier to inline the error handling after each call and remove this?

Thanks,
Mostafa

