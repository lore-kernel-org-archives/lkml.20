Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818F04BB296
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791212542; cv=none; b=Xdvr4bResn3MoBkj8fBSrMUYt43dvgRjYyWFBzgxnAgjpj9OV5bw8p/A/TiGUczPfjeFOSLMy2mR+RFUhFSu8PtIop17qO6wSuD5FYOEqlYlu5FX0ZAqNdBVdF5NhHuQfoQSH8Yh9KC1nm93DhTUka4oPQelW4u8sb4DkQwK0N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791212542; c=relaxed/simple;
	bh=J3uLqr1bwxQ3KPBelR/UqUHMgCgoV6kG7kJMNY3ASQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dy8KvhSXmB6HiTRr0mwYwijdFftvXLLsN9nzfFaF+WHgUKSSLRzDpDb8jOcaOWzdCeVjHDyzAgU0IL3+1dImehr5EDVZb2fIdNvfxVgO6NzUXC/ff+ezQgJc3THvIyG47pPjtAM7bUv4nUK0p1D5iraMUyoiolixrNlZAYvxm3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wc8FPDnz; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wc8FPDnz"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a1722c37c9so8691465e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 08:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791212539; x=1791817339; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lQ07Wpw/41IyXuGwO1TNf2h3w/qx6ENdaCXlHUoPSxo=;
        b=wc8FPDnzWpLPfnRjRwEqCXWH5BGmdVTHR+01Si090JsrgJrOrWv1Xi4ToF8XYTLysR
         jjHvqPtz0vT3yOA+o0InTbf1c3lIFFcPq80Oe+WUrqM5Ano3di28MBcilM9AQOVkmwwg
         ZXwFFCEcpNMrg/07byJY7dKXfM3qwJjS5ua4TL6Vzypg/W/P+turVbQLvUVHs9E5+xJs
         RFmipFjc2HHFRhgZte1qdItSp1ukFp5I6bOVU24aTc3427cmld83ab1xgMwxurJaMKpo
         rE0cz4htlIRgezCyKsV3enTYx5+K/XzzMDDjilIuOTaTEk2QV7vrz4SaMA7vi07sU/r/
         iGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791212539; x=1791817339;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQ07Wpw/41IyXuGwO1TNf2h3w/qx6ENdaCXlHUoPSxo=;
        b=rgXyvfq3LQF4PxhTatdlFEm6q4sRsvKEv2wVKUFNamg/WC7nupbp0xJFYaHCshT3ns
         kLM3xEBRyAEsd6nTzFb8iKpv3FShEJJMwMTHA2IGmaw6qBdNadjlM83FYTOhY3zftkz4
         dJ/XxwcOPLCT2wlHSTM7x0IJVRE1+cyVA86vyZT/3QNUf/1dJkG41NKfZeMLwybhPRmZ
         m7nb1J5lvyXmugi5LrgNFZtuC1CJfA7Obg2m1n2msdjPdPREAtp+gpHuyrz/iHFFPXbd
         N91DefBUlGX5nkuTk6p0PYSTWafHW5EkB3qrWK1NNXapsiBTCT5nQbXo5O6/tYZI3zlO
         s+DQ==
X-Gm-Message-State: AFuF++mN4MR8Rud5uPFg8qF3fhn4JPHAbm35c+AyFBzv0aBbrl6ArCsx
	UABFIqmiTv6tQ95lFYzxruFHMlQcNZGlYDgUY0RoQCtMd7w95JlriP9Sj63wzajtGA==
X-Gm-Gg: AYBFou0ppo8z49wF1Lhq0J/jiqBa5UW9l81vV4y5xumhG29X2M3sBu8qjiB47DJUZ19
	98TBJF5Fxafb5pjwt5rMBziuDiB1n1NSLzuYbt3brDMuY1YJ0z+2sWLE7VITK0AqoL1kzjuAYZw
	cweXAe1bjgCRe2DwQi4m+NsGIoXHsCfhwcrh0JY+2Wd/k5AZ5tRUc/FVuNd1sxVHyPMKRVxESK3
	P8D2iO0Pi65D1YdCVQSEASRz4527SJBiMDF4w1GBVwpvcKtD/4H9tRQHNfu0LUDp3txHjBqGLmo
	jFFoCwE0C+IPpVcWE47bcelNqp8+3ggpZJqe7S+DfyKy9P7RCRE3pKqGd8D3Ysh++8ttGItPka2
	mKr45aTVnPIvshnilNMMgd65xiGbk9152tFaGjfd3nOYTTcp4LC2oYhHVFVu678izteaDA1OQc3
	xERYhjXgEmvz//acJGKRsgun5DUA7PiQfgcVN/qQsMo0SwBi/fnwnfzLYABTVW3ITuHdP5HInCm
	Y9oVntMNCOpQthIiCm59wyNURnwoaN+8KLucFsZgCs=
X-Received: by 2002:a05:600c:4e4e:b0:4a0:62d:4424 with SMTP id 5b1f17b1804b1-4a027566f93mr192858015e9.8.1791212537927;
        Mon, 05 Oct 2026 08:02:17 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1785398b5sm156955e9.2.2026.10.05.08.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 08:02:12 -0700 (PDT)
Date: Mon, 5 Oct 2026 16:02:06 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	oupton@kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, tabba@google.com,
	sebastianene@google.com, keirf@google.com, qperret@google.com,
	linu.cherian@arm.com
Subject: Re: [PATCH v3 2/2] KVM: arm64: Support BBM level 3
Message-ID: <asO77kvqqwCsJt8I@google.com>
References: <20260904132855.638117-1-smostafa@google.com>
 <20260904132855.638117-3-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904132855.638117-3-smostafa@google.com>

On Fri, Sep 04, 2026 at 01:28:55PM +0000, Mostafa Saleh wrote:
> If the system supports hardware Break-Before-Make (BBM) level 3, use it
> to replace stage-2 PTEs directly. Otherwise, fall back to the software
> BBM sequence.
> 
> For BBML3 the sequence is:
> 1) Get a reference count on the containing table for the new PTE.
> 2) Atomically update the PTE with the new valid descriptor.
> 3) Invalidate the TLB for the old PTE.
> 4) Drop the reference count holding the old PTE.
> 
> Add 2 helpers:
> 1) kvm_pgtable_use_bbml3(): Checks for the architecture requirement
>    for BBML3.
> 
> 2) stage2_use_bbml3(): Extra checks added by SW design (FWB and DIC)
>    - As BBML3 will update the PTE atomically, it can only know it
>      raced with another core at the point of the cmpxchg failing,
>      unlike the SW implementation which locks the PTE first.
>      And as we must issue CMOs to the new mapped page before the
>      update, that means with BBML3 racing cores will issue redundant
>      CMOs.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  arch/arm64/kvm/hyp/pgtable.c | 111 ++++++++++++++++++++++++++++-------
>  1 file changed, 90 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index d670da8882a5..a9ba761e9a01 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -82,6 +82,27 @@ static bool kvm_pte_table(kvm_pte_t pte, s8 level)
>  	return FIELD_GET(KVM_PTE_TYPE, pte) == KVM_PTE_TYPE_TABLE;
>  }
>  
> +/*
> + * Check if BBML3 can be used for this PTE update.
> + * Fallback to software break-before-make for leaf-to-leaf changes.
> + */
> +static bool kvm_pgtable_use_bbml3(const struct kvm_pgtable_visit_ctx *ctx,
> +				  kvm_pte_t new)
> +{
> +	if (!system_supports_bbml3())
> +		return false;
> +
> +	if (!kvm_pte_valid(ctx->old) || !kvm_pte_valid(new))
> +		return false;
> +
> +	/* Block <-> Table is ok. */
> +	if (kvm_pte_table(new, ctx->level) ||
> +	    kvm_pte_table(ctx->old, ctx->level))
> +		return true;
> +
> +	return false;
> +}
> +
>  static kvm_pte_t *kvm_pte_follow(kvm_pte_t pte, struct kvm_pgtable_mm_ops *mm_ops)
>  {
>  	return mm_ops->phys_to_virt(kvm_pte_to_phys(pte));
> @@ -835,25 +856,46 @@ static void stage2_clean_old_pte(const struct kvm_pgtable_visit_ctx *ctx,
>  		mm_ops->put_page(ctx->ptep);
>  }
>  
> +/*
> + * Don't use bbml3 for stage-2 if FWB or DIC are not supported
> + * as that means racing cores will issue duplicate CMOs.
> + */
> +static bool stage2_use_bbml3(const struct kvm_pgtable_visit_ctx *ctx,
> +			     kvm_pte_t new)
> +{
> +	if (!cpus_have_final_cap(ARM64_HAS_STAGE2_FWB) ||
> +	    !cpus_have_final_cap(ARM64_HAS_CACHE_DIC))
> +		return false;
> +
> +	return kvm_pgtable_use_bbml3(ctx, new);
> +}
> +
>  /**
>   * stage2_try_break_pte() - Invalidates a pte according to the
>   *			    'break-before-make' requirements of the
> - *			    architecture.
> + *			    architecture, if BBML3 is supported it
> + *			    will be used and this function won't
> + *			    break the PTE.
>   *
>   * @ctx: context of the visited pte.
>   * @mmu: stage-2 mmu
> + * @new: New pte installed in make.
>   *
> - * Returns: true if the pte was successfully broken.
> + * Returns: true if the pte was successfully broken or BBML3 is used.
>   *
>   * If the removed pte was valid, performs the necessary serialization and TLB
>   * invalidation for the old value. For counted ptes, drops the reference count
>   * on the containing table page.
>   */
>  static bool stage2_try_break_pte(const struct kvm_pgtable_visit_ctx *ctx,
> -				 struct kvm_s2_mmu *mmu)
> +				 struct kvm_s2_mmu *mmu, kvm_pte_t new)
>  {
>  	kvm_pte_t locked_pte;
>  
> +	/* All handled in stage2_make_pte() */
> +	if (stage2_use_bbml3(ctx, new))
> +		return true;
> +

Wouldn't it be easier to keep try_break_pte/make_pte to the !bbml3 case and to
just create a make_pte_bbml3() variant to be called when stage2_use_bbml3()?

  if (!stage2_use_bbml3()) {
      if (stage2_try_break_pte())
          return -EAGAIN;
      stage2_make_pte();
  } else {
      if (stage2_make_pte_bbml3())
          return -EAGAIN;
  }

I believe also, the error path would look less weird as we catch an error in
make_pte() but without reverting the break_pte() (even if it is correct right
now).

And perhaps you could introduce a function that does both break/make
(stage2_update_pte()?) called by both stage2_split_walker() and
stage2_map_walk_leaf(). This would avoid repeating the error path.

Otherwise, everything looks functional to me.

-- 
Vincent


>  	if (stage2_pte_is_locked(ctx->old)) {
>  		/*
>  		 * Should never occur if this walker has exclusive access to the
> @@ -873,16 +915,37 @@ static bool stage2_try_break_pte(const struct kvm_pgtable_visit_ctx *ctx,
>  	return true;
>  }
>  
> -static void stage2_make_pte(const struct kvm_pgtable_visit_ctx *ctx, kvm_pte_t new)
> +static bool stage2_make_pte(const struct kvm_pgtable_visit_ctx *ctx, struct kvm_s2_mmu *mmu,
> +			    kvm_pte_t new)
>  {
>  	struct kvm_pgtable_mm_ops *mm_ops = ctx->mm_ops;
>  
> -	WARN_ON(!stage2_pte_is_locked(*ctx->ptep));
> -
>  	if (stage2_pte_is_counted(new))
>  		mm_ops->get_page(ctx->ptep);
>  
> +	if (stage2_use_bbml3(ctx, new)) {
> +		if (!kvm_pgtable_walk_shared(ctx)) {
> +			/*
> +			 * stage2_try_set_pte() uses WRITE_ONCE for non-shared walks,
> +			 * lacking release semantics used in the software BBM case.
> +			 */
> +			smp_wmb();
> +		}
> +
> +		if (!stage2_try_set_pte(ctx, new)) {
> +			/* Raced with another core. */
> +			if (stage2_pte_is_counted(new))
> +				mm_ops->put_page(ctx->ptep);
> +			return false;
> +		}
> +
> +		stage2_clean_old_pte(ctx, mmu);
> +		return true;
> +	}
> +
> +	WARN_ON(!stage2_pte_is_locked(*ctx->ptep));
>  	smp_store_release(ctx->ptep, new);
> +	return true;
>  }
>  
>  static bool stage2_unmap_defer_tlb_flush(struct kvm_pgtable *pgt)
> @@ -1001,7 +1064,7 @@ static int stage2_map_walker_try_leaf(const struct kvm_pgtable_visit_ctx *ctx,
>  		return 0;
>  	}
>  
> -	if (!stage2_try_break_pte(ctx, data->mmu))
> +	if (!stage2_try_break_pte(ctx, data->mmu, new))
>  		return -EAGAIN;
>  
>  	/* Perform CMOs before installation of the guest stage-2 PTE */
> @@ -1014,7 +1077,8 @@ static int stage2_map_walker_try_leaf(const struct kvm_pgtable_visit_ctx *ctx,
>  	    stage2_pte_executable(new))
>  		mm_ops->icache_inval_pou(kvm_pte_follow(new, mm_ops), granule);
>  
> -	stage2_make_pte(ctx, new);
> +	if (!stage2_make_pte(ctx, data->mmu, new))
> +		return -EAGAIN;
>  
>  	return 0;
>  }
> @@ -1057,19 +1121,21 @@ static int stage2_map_walk_leaf(const struct kvm_pgtable_visit_ctx *ctx,
>  	childp = mm_ops->zalloc_page(data->memcache);
>  	if (!childp)
>  		return -ENOMEM;
> -
> -	if (!stage2_try_break_pte(ctx, data->mmu)) {
> -		mm_ops->put_page(childp);
> -		return -EAGAIN;
> -	}
> -
>  	/*
>  	 * If we've run into an existing block mapping then replace it with
>  	 * a table. Accesses beyond 'end' that fall within the new table
>  	 * will be mapped lazily.
>  	 */
>  	new = kvm_init_table_pte(childp, mm_ops);
> -	stage2_make_pte(ctx, new);
> +	if (!stage2_try_break_pte(ctx, data->mmu, new)) {
> +		mm_ops->put_page(childp);
> +		return -EAGAIN;
> +	}
> +
> +	if (!stage2_make_pte(ctx, data->mmu, new)) {
> +		mm_ops->put_page(childp);
> +		return -EAGAIN;
> +	}
>  
>  	return 0;
>  }
> @@ -1549,18 +1615,21 @@ static int stage2_split_walker(const struct kvm_pgtable_visit_ctx *ctx,
>  	if (IS_ERR(childp))
>  		return PTR_ERR(childp);
>  
> -	if (!stage2_try_break_pte(ctx, mmu)) {
> -		kvm_pgtable_stage2_free_unlinked(mm_ops, childp, level);
> -		return -EAGAIN;
> -	}
> -
>  	/*
>  	 * Note, the contents of the page table are guaranteed to be made
>  	 * visible before the new PTE is assigned because stage2_make_pte()
>  	 * writes the PTE using smp_store_release().
>  	 */
>  	new = kvm_init_table_pte(childp, mm_ops);
> -	stage2_make_pte(ctx, new);
> +	if (!stage2_try_break_pte(ctx, mmu, new)) {
> +		kvm_pgtable_stage2_free_unlinked(mm_ops, childp, level);
> +		return -EAGAIN;
> +	}
> +
> +	if (!stage2_make_pte(ctx, mmu, new)) {
> +		kvm_pgtable_stage2_free_unlinked(mm_ops, childp, level);
> +		return -EAGAIN;
> +	}
>  	return 0;
>  }
>  
> -- 
> 2.55.0.979.g7e5102b832-goog
> 
