Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590310;
	b=FIBvENBuyplULY9PoMZxoDaRcjaD07yt756Z4449Z1fyJM4PovvfeXzemV002FXxbKd/
	 pgae4+pi4PrqrDxb3k1c6eFHeK/m0KS5pXe0CEMWwgnhGmhhc53/CcaNniwrjkOd4wP90
	 rKHug7BRXHGCsQLCjNAIjrbGoh8GxaSg8LuHhPZ36yb6I3Rk1zNH/A8CnVAlDaXRPwVXD
	 6LobO2dA/ayd59k8EL/pTj5uksnxNnqBUM7/XgeErbafifC0tz7L9RU66TzzW+FkbwCjk
	 NbFYwB2qOQ3e4z8ALLZ6xza37fR61SLe4XqRHtxy5pJ1wQZTx094TpTcGJ4irkf0LKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=14kePxaJgvrh0ObJmhms1Rosb4Wt+rKX1sH/AFcKt3s=;
	b=jpI61PrAF2NJlxlIzXcK/vevu7k37RLQR5nEn4AIT5HOtYlrk0gnMu7GXTb2ovN5wK+u
	 rXruTPdP4PY1VEJ+CaeIjcq9LGmmwJk/TkWikzA9il8jlMuS5Zx3bA6yvCfGukl5vEGg+
	 RCodvXdCgaHYeYJlGOdNrf+9PKLiP9MEIv9W87JwI2OJsEO/fCLNYmxB/wEfSFaJA/29i
	 0mubGj8uUINvUpYapS+ptIVPeMhI1cGe12+fdPR9KbHyhgpCycdN5tEMdKwIj6MQsGttX
	 DYRlwYWG++4j3cS1dWZk4bkEUgsOhH9o/syiAax+thr+7JG5tvtAQULHYCVp4xLWj2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=P35ASx2J;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4E3606A328
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF4E3606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=P35ASx2J
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso13167a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792590308; x=1793195108; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=14kePxaJgvrh0ObJmhms1Rosb4Wt+rKX1sH/AFcKt3s=;
        b=P35ASx2Jo9Do5+SMlGWjDrNn9yrkfwigEzooIzyae1URWlmgrxZ0haUJYvsvZbgd7Z
         olal293b4D0MsWvwXs54txROi9WxYZqQ/oj96PtPfys8sju1+JGxqFMu5bADyUdyVzJ7
         70eIcqTOkvLSOr1PwSsN/Rq0iDjFuDC3AHAPKY7y8MljnuRDR8mGlzoNuw5ZWyQTwjWz
         BFx2C3TuMU3xe7LkdTgss2pnqNuQoqry2vSxWJEzdW+K/usfuCgAEyLYaIVoMbNx3vpM
         RAIQDlWPbUGyPVW5uv1myNs7VyB8W4NXLN/spOUQNdN96S4vzuui5oeebJC7DqyD3rzx
         rYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590308; x=1793195108;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=14kePxaJgvrh0ObJmhms1Rosb4Wt+rKX1sH/AFcKt3s=;
        b=lnFqGOS5Ys2wMygNJVlQhLEj90AlJR2Xk9D9qDk4o3FU7nEP+WfStmlUyRBbap2Y+d
         K+zNOcuuZlSQMxBkX64fRarxh9MjfoXtx3E86gmS4Y2y+YbNbfG18tPlOvpeD3RDrlgv
         0TiDWYknqj3BSKJ6So5QUbJpPp4c41IlaYoDK3WJlYByWIS55sUb4US0mB2o3ZgsQhmr
         53+cjTL+GfoD0+BfQB7PUc5d67EXB1NGsGKRB0JWnPMCBlA80xFLYOm8azc7gwaw2blx
         ZjRJkOQ9cM70MJIAL+VEOrCO/Hf3kFdaosTpF+xItaSRnCHszVck5C71uj+HVceLeJ75
         K/Ag==
X-Forwarded-Encrypted: i=1; AKwUvBxf3PdO1EWVij9+tm/SEQBnPMTf/3LC/+Lnx6d4QzhVWwaolUft/pbMZYSU6oQkGLg/GhTVPLYLYbNOCvU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYBGdfHXbfJwdBkgGNylZtFHBGdRq2kZt+kGx7OOKhwAeriHm9
	OD1DngXM/xyuGqmlhnwnO4sDsrE4IjRNoSNEo8Yt/3tXVa6towTfbGJAB4Irn8UeXg==
X-Gm-Gg: AYBFou0sdsqhZTSjelKlJvdx8w+77HoczwQqWzsumExcx8uqKRUMWJTWh23dGhARzvX
	zY3m0vSgzu37+8Kyr6AduSn+HfDEFZPkjxFk+UyTqdjwUMAuSjHQtwJQK72LDePHsb3tc/cmwCa
	nStoa/GHI8rlvCHN3YPow/mGlY+5fLU9gEbOptJxjv4Ip7JRlcezxsIukkFfux/6R0HJ3k6Vk1Z
	AAK1L/2jEhzk4B7Ye5Mzjj9cPjY2M9Wo+DQKKJ8fAidommvWxEeasOej27ghLMXhyIHw0mXH/XJ
	0Btk+zNvlqVJq1PB9DhpkruBN5TOYjMAGcLQnYTGVVt9wAj0xsH41Lc5JkhMUgO1DOzHG+7vJFh
	VbV9RxB/gqZDLPmp1aNAiI+mNhNX9d7oA/Brfm9dwhUsOuxGzOtdLEIYNFp3hyFBH9ZNQ1DHtkd
	OOzul9A7INOeayz0CT6vQ07iEyojk2v0k0UW0/W4i45vxS9qJ5bD8Ggl2WhJijFBY0R9U43ffUm
	n+1pT2vHg5Ld/WX2vULBb1CumodsAB202Tqr/B0ylmW5IcE2aMjWykg3IPmMDKYMaidEdYplBP0
	zI0A7AG3z7wuAMcIgSxAHF3McKwaIW9fBsdRB0UnhBA=
X-Received: by 2002:aa7:cf8c:0:b0:6b1:d80d:396b with SMTP id 4fb4d7f45d1cf-6b3e9c11a49mr111990a12.14.1792590307609;
        Wed, 21 Oct 2026 06:45:07 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a61b2aasm5475966b.86.2026.10.21.06.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:45:06 -0700 (PDT)
Date: Wed, 21 Oct 2026 13:45:03 +0000
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
Message-ID: <atjB34tvJySp9abz@google.com>
References: <cover.1791226953.git.nicolinc@nvidia.com>
 <ee4257b62324aa75d7140f1f4a49aa0f78586fff.1791226953.git.nicolinc@nvidia.com>
 <atdSrRwrphdI9ZQA@google.com>
 <atemgT/67JPpdk57@nvidia.com>
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
In-Reply-To: <atemgT/67JPpdk57@nvidia.com>

On Tue, Oct 20, 2026 at 10:36:01AM -0700, Nicolin Chen wrote:
> On Tue, Oct 20, 2026 at 11:38:21AM +0000, Mostafa Saleh wrote:
> > On Mon, Oct 05, 2026 at 12:30:49PM -0700, Nicolin Chen wrote:
> > > +	/*
> > > +	 * According to spec (6.3.24), HW aligns the base down to the table size
> > > +	 * and ignores the low bits, so an unaligned base would make this kernel
> > > +	 * read a different table.
> > > +	 */
> > > +	if (!IS_ALIGNED(base, size)) {
> > > +		dev_err(smmu->dev, "unaligned stream table base %pa\n", &base);
> > 
> > I understand these are best effort, but what happens if the address
> > corrupted and happens to be aligned?
> 
> This is a basic sanity so HW wouldn't immediately fail. A corrupted
> address would be trickier to test out; also we don't have a perfect
> way to do that. Earlier versions had some address range check. I've
> dropped it, following Jason's comments.
> 
> This is also in the kdocs of the whole smmu kdump functions:
> 
>  *  - Only a coherent SMMU (ARM_SMMU_FEAT_COHERENCY) is supported, as the stream
>  *    table adoption is done by memremap with MEMREMAP_WB, which is verified on
>  *    the real hardware. Callers of these functions are responsible for gating
>  *    ARM_SMMU_FEAT_COHERENCY once during the probe.
>  */
> 
> > > +int arm_smmu_kdump_adopt_deferred_l2_strtab(struct arm_smmu_device *smmu,
> > > +					    u32 sid, phys_addr_t base, u32 span,
> > > +					    struct arm_smmu_strtab_l2 **l2table)
> > > +{
> > > +	struct arm_smmu_strtab_l2 *table;
> > > +	size_t size;
> > > +
> > > +	/*
> > > +	 * Retest the span in case the L1 descriptor has been overwritten since
> > > +	 * the adopt. Reject this master's insert; panic or SMMU-disable would
> > > +	 * either lose the vmcore or cascade aborts. Do not try to fix it, as it
> > > +	 * would break all other SIDs in the same bus (PCI case). The corruption
> > > +	 * blast radius is already bounded to that bus range.
> > > +	 */
> > > +	if (span != STRTAB_SPLIT + 1) {
> > > +		dev_err(smmu->dev,
> > > +			"L1[%u] span %u changed since adopt (was %u)\n",
> > > +			arm_smmu_strtab_l1_idx(sid), span, STRTAB_SPLIT + 1);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	size = (1UL << (span - 1)) * sizeof(struct arm_smmu_ste);
> > > +
> > > +	/* Same live-corruption check as the span; reject an overwritten base */
> > > +	if (!base || !IS_ALIGNED(base, size)) {
> > > +		dev_err(smmu->dev, "L1[%u] bad l2 table base %pa\n",
> > > +			arm_smmu_strtab_l1_idx(sid), &base);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > 
> > Those are a bit similar to arm_smmu_kexec_parse_strtab_2lvl() is it
> > possible to have some helpers instead?
> 
> Sure. I can do that.
> 
> > > +int arm_smmu_kdump_adopt_strtab(struct arm_smmu_device *smmu)
> > > +{
> > > +	u32 cfg_reg = readl_relaxed(smmu->base + ARM_SMMU_STRTAB_BASE_CFG);
> > > +	u64 base_reg = readq_relaxed(smmu->base + ARM_SMMU_STRTAB_BASE);
> > > +	bool was_2lvl = smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB;
> > > +	phys_addr_t base = base_reg & STRTAB_BASE_ADDR_MASK;
> > > +	u32 fmt = FIELD_GET(STRTAB_BASE_CFG_FMT, cfg_reg);
> > > +	int ret;
> > > +
> > > +	dev_dbg(smmu->dev, "adopting crashed kernel's stream table\n");
> > > +
> > > +	if (fmt == STRTAB_BASE_CFG_FMT_2LVL) {
> > > +		/*
> > > +		 * Both kernels run on the same hardware, so it's impossible for
> > > +		 * kdump kernel to see the support for linear stream table only.
> > > +		 */
> > 
> > STRTAB_SPLIT which influences ARM_SMMU_FEAT_2_LVL_STRTAB is a SW choice, so it is
> 
> I missed that.
> 
> > possible to get such mismatch if STRTAB_SPLIT of the newer kernel is larger than the
> > older kernel.
> > However, I agree that in that case it's better to refuse the adoption.
> >
> > > +		if (WARN_ON(!(smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)))
> > > +			ret = -EINVAL;
> 
> I can replace the FEAT guard here with
> 
> 	if (WARN_ON(FIELD_GET(IDR0_ST_LVL, idr0) != IDR0_ST_LVL_2LVL))
> 		ret = -EINVAL;
> 

That makes more sense with the comment about for structural validation,
although.

> > > +		else
> > > +			ret = arm_smmu_kdump_adopt_strtab_2lvl(smmu, cfg_reg,
> > > +							       base);
> > > +	} else if (fmt == STRTAB_BASE_CFG_FMT_LINEAR) {
> > > +		/*
> > > +		 * The kdump kernel need not match the crashed kernel. An older
> > > +		 * crashed kernel that predates two-level stream table support
> > > +		 * may have used a linear table on 2-level-capable hardware, so
> > > +		 * enforce the same format here to match the adopted table.
> > > +		 */
> > > +		ret = arm_smmu_kdump_adopt_strtab_linear(smmu, cfg_reg, base);
> > > +		if (!ret)
> > > +			smmu->features &= ~ARM_SMMU_FEAT_2_LVL_STRTAB;
> > 
> > For simplicity, it is better to enforce the same table formats between
> > kernels as the rest of the file, for example,
> > arm_smmu_kexec_parse_strtab_2lvl() refuses different STRTAB_SPLIT.
> > Some checks can be removed and the was_2lvl error path. It's
> > very unlikely to hit such case anyway.
> 
> Sashiko pointed out a corner case that a modified kernel kdumps
> into a vanilla kernel. It is not really a big effort to support
> it. So, I would rather keep this.

I see, I have no strong opinion, but I think we can just ignore sashiko
here, and this can be a limitation as long as it fails gracefully, it
makes the patch slightly easier to reason about.

> 
> > > +	} else {
> > > +		dev_err(smmu->dev, "invalid STRTAB format %u\n", fmt);
> > > +		ret = -EINVAL;
> > > +	}
> > > +
> > > +	if (ret) {
> > > +		arm_smmu_kdump_adopt_cleanup(smmu);
> > 
> > Probably easier to inline the error handling after each call and remove this?
> 
> I don't quite follow this. The clean function is used by three
> sites. How can we remove it?

I see, I missed it is also used in devm_add_action_or_reset()

Thanks,
Mostafa

> 
> Thanks
> Nicolin
> 
