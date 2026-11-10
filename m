Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794302438;
	b=p9bbHDRa+q/8BaTm//T7QL283vusT6022sAVoICvYy2g7OaeGV3Yk7EBCdswOvdMRcB7
	 kRQ+IkuNg8QeIstQuRAknxN8VH1SLb8aejgnhM53XsInOMdNQ1jOPdHpD/cDOig5RgcXy
	 R/MhPtfGxzhjXj5izilOJACVkHK9rHW0J9ZJkpW6nWjmV3mcsIPAZJ4L9zPjEEIhinBQx
	 +3aI3+/AKCIIkKYOsoCISsCkvEszf5aZDhjkgWzWsLF0aJqY/ZIby7ZR9I0DgiL6aPrRP
	 kPDfXo9P4VvM49cbk/Q6OXVd/b4t9TtZRLTQAhVUSMfI0EC/NgKIqK7j9aS+AAB3JHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=z1EiYiesShrPXkvDVgUvtrE7Nbx28aPk1xRDvgjsVXE=;
	b=DIRcYbiDdoSxGulx45oEKYPNS6Irxx+/f2HC1nIv0LmmXiJyw0gNRo4ddJOXVEjVW44L
	 5x4OfA/w38sgpT05rOrKRHm/k9PPs7zCXHTOYhX1l88MpImkhvGoeocUqUG24DYGcSC+c
	 xZ9+86oWQBQN9pIU/UhUP4x4xe/rZQxiDhdNE3bo84okk1DxbYXLcwOO6lYgE//27NRyP
	 ffrUjYX8V3cpXRHkjctynil0yX3pmvp+U6iXbJmsWeY1XZI7fKeELWAWV3q+Af3eYnwc9
	 WKc7Avjk55KBHuDV1imKZ0IajKkL4eYddIDyp83iTUiQYlAkgz9uCLXiZUgJn43yEYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=k6eHQsY1;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8553607E063
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8553607E063
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=k6eHQsY1
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so21065845e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794302436; x=1794907236; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z1EiYiesShrPXkvDVgUvtrE7Nbx28aPk1xRDvgjsVXE=;
        b=k6eHQsY1X6QQ/El21/AD/NhQWepkxbQs0Z4pcenOpTF8VNpjnD3wecM54LzkjpJwOR
         cIkLGa9opH+fd5tFsP4ykKkn45rFc00CtEvtTjXgPj58K+1wCtWwTbYXu31hzhd0o9L2
         4LrnRcXgAAosQAB610IJf1fZWHo7lFzyPCRzofHZ/IeRmW+TIuChBDDWDF2dGLq8CJP8
         FRPpV7WOOC/iHylG5DIl/z/NSbP1DZT8+AHSO92538hXBakHktb4LmrTqPkzN9HEHhKK
         R9b9FXA3X/AsT1BHQamAkPLcv2rpLSc3waLABkYOTrNE8i29smevM5in3h1KMOul+qng
         KYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302436; x=1794907236;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z1EiYiesShrPXkvDVgUvtrE7Nbx28aPk1xRDvgjsVXE=;
        b=MDBBjy1iqgXjWBI3Nou1f7NgX+ZKCSB/8vF0CummHRmSUeLRm2xGIBJlBYDAzav4+y
         SYzGi64d3YlDutlt4FEtj4k5J352l93lVTGWoCnpS3yi+D0lYj80Ooq87JNJ2zAWFIhx
         74VGZmxXFHeAspBJdCAPrwNhSphheXjiSQqFjWNpoPo49udYWp8HG4/iZkDKm+7dJYkV
         R82xlAOHcwQ+Jm+cxgMZMHS2AQ8r8lW7TJAaY6RCOfpNqWtdUQbm8K5h459qkrTtnpBO
         D0HK7Ng6OLCnMM0uNA241RKI/lbULY+PsTKlcD9A5VfI4Ro4AovKZG071Gds7ksuNANy
         Errg==
X-Forwarded-Encrypted: i=1; AL+hErFFJgBy7jSsyCTWis50rUNSy6UifWoYCrvjXU6VcK4MiQczWrGpIh0eILRjRsbNc79Pf/7bUC2gjhy4NVM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PxD0+kMJCcQax79jCDG+1DvDFIUygH+GcCvPK0ij+vbjioJn+
	qhtj61Ks/yp8YU0S8pZ5S3pYdqpqlUq/lRiWZrx0aTpEoZxP+p+NGJIdQfMl8AQTpw==
X-Gm-Gg: AYBFou2oGsirlPFu44q7ZunnU5NK5sz4+6GsY0rsIeS0Ak9a6zC0Q2SPUC2bGfSwcgQ
	RdPR+8bgHCIoX5I/FjJIWEAaYNgkEwQAjRZJjr22s18MnZMq7DqK3Qwy+9rWS3qr1XLyOWQGai4
	lXENsuWuBU4/KCWqvhVCEEITVQ2Pd9AsRXSIOwid81DVC3esTnePrTMxDNQoSzTWHzCuTSOM84S
	9sbHS9YQnHZq1hpJKUZ9+KbrEFi9zBcNjeBriQOXCQF5CEehsVdhHC0+Bb0ZYrwJGV3GnWkJirI
	9iALOgT6AKk9dno75TzKYKzFE581/vjN2zVPB+O23szxuuPJdbbNSoPYH9LMNJxPLzFiVd8kdrL
	segnn4BIwpxviQJnMO9xfMGyTG1SSQ2FFvFTjya9ZEqjrzHBT3Famzmr2KNUrbS6t1PSBSUgOxl
	lk3M+VogwyrLgv1p//lTPvLg7rPr9QbciA8MWqwpyRxzc+J+Xysk7cYlQdgAOPDnwdPT27I3BzV
	mBAREEpMICR6QvXzQvMmyOrJwCDrBe5Vlrc+VBJCRRwEsQ1Al934z5/a3tAhMVCH2wBjFvxNgew
	2tfrEevogYwa6l5Pa25jCVJuGqLNqX3ti4iWmATBl9Sp5dsjaPd5oqXAPRGVgt/vEw==
X-Received: by 2002:a05:600c:6990:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4ba0233e86cmr29624555e9.14.1794302435405;
        Tue, 10 Nov 2026 01:20:35 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fef675sm50469705e9.14.2026.11.10.01.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:20:34 -0800 (PST)
Date: Tue, 10 Nov 2026 09:20:31 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: xuheng@cs.columbia.edu
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>,
	Mostafa Saleh <smostafa@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] KVM: arm64: Don't replace a valid hyp block mapping
 with a table
Message-ID: <avLh32oF-TnQrxtz@google.com>
References: <20261109-hyp-block-map-v3-1-bd70e67eb0bf@cs.columbia.edu>
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
In-Reply-To: <20261109-hyp-block-map-v3-1-bd70e67eb0bf@cs.columbia.edu>

On Mon, Nov 09, 2026 at 10:13:35PM +0000, Xuheng Li via B4 Relay wrote:
> From: Xuheng Li <xuheng@cs.columbia.edu>
> 
> When kvm_pgtable_hyp_map() is asked to map part of a range that a valid
> block mapping already covers, hyp_map_walker_try_leaf() declines, as the
> request cannot be a leaf at the block's level.  hyp_map_walker() then
> allocates a zeroed table and stores it over the valid block entry.  The
> walk descends into the new table and maps the requested pages, but the
> rest of the block is now unmapped, and the valid block was replaced
> without break-before-make.
> 
> No in-tree caller maps into an existing hyp block mapping today, so this
> cannot be triggered in mainline.  Fail such a request with -EEXIST
> instead, so that a future caller gets an error rather than silently
> losing the rest of the block.
> 
> The same check now catches a conflicting remap of an existing leaf, so
> drop the WARN_ON() from hyp_map_walker_try_leaf(): every caller checks
> the error, and a WARN is fatal at EL2.  Do the check before the
> last-level WARN_ON(), which is kept for internal errors, and update the
> kernel-doc of kvm_pgtable_hyp_map() to match.
> 
> Signed-off-by: Xuheng Li <xuheng@cs.columbia.edu>
> ---

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

> This is patch 3/3 of v2, sent alone: 1/3 is superseded by Mostafa's
> "KVM: arm64: Use consistent type for pool size" [1], and 2/3 is dropped.
> 
> With the WARN_ON() gone from hyp_map_walker_try_leaf(), a conflicting
> remap through the EL1 path (__create_hyp_mappings()) also returns
> -EEXIST without a warning, where it used to warn and return -EINVAL.
> 
> [1] https://lore.kernel.org/r/20261106172750.2678873-1-smostafa@google.com
> ---
> Changes in v3:
> - Drop the WARN_ON() from the new check and from
>   hyp_map_walker_try_leaf(), and update the kernel-doc of
>   kvm_pgtable_hyp_map() (Vincent, Fuad).
> - Do the check before the last-level WARN_ON(), so that a conflicting
>   page-level mapping returns -EEXIST instead of reaching it.
> - Link to v2: https://lore.kernel.org/r/20261105-hyp-pool-and-map-v2-3-44a6ca90190b@cs.columbia.edu
> ---
>  arch/arm64/include/asm/kvm_pgtable.h |  2 +-
>  arch/arm64/kvm/hyp/pgtable.c         | 10 +++++++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> index 1c9c57cd6..6d6ed8596 100644
> --- a/arch/arm64/include/asm/kvm_pgtable.h
> +++ b/arch/arm64/include/asm/kvm_pgtable.h
> @@ -508,7 +508,7 @@ void kvm_pgtable_hyp_destroy(struct kvm_pgtable *pgt);
>   * If device attributes are not explicitly requested in @prot, then the
>   * mapping will be normal, cacheable. Attempts to install a new mapping
>   * for a virtual address that is already mapped will be rejected with an
> - * error and a WARN().
> + * error.
>   *
>   * Return: 0 on success, negative error code on failure.
>   */
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index 9c83837b1..94a59f29a 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -414,7 +414,7 @@ static bool hyp_map_walker_try_leaf(const struct kvm_pgtable_visit_ctx *ctx,
>  		return true;
>  	if (!kvm_pte_valid(ctx->old))
>  		ctx->mm_ops->get_page(ctx->ptep);
> -	else if (WARN_ON((ctx->old ^ new) & ~KVM_PTE_LEAF_ATTR_HI_SW))
> +	else if ((ctx->old ^ new) & ~KVM_PTE_LEAF_ATTR_HI_SW)
>  		return false;
>  
>  	smp_store_release(ctx->ptep, new);
> @@ -431,6 +431,14 @@ static int hyp_map_walker(const struct kvm_pgtable_visit_ctx *ctx,
>  	if (hyp_map_walker_try_leaf(ctx, data))
>  		return 0;
>  
> +	/*
> +	 * A valid entry here is a leaf that conflicts with the request.
> +	 * Replacing a block with a table would need break-before-make, and
> +	 * would leave the rest of the block unmapped.
> +	 */
> +	if (kvm_pte_valid(ctx->old))
> +		return -EEXIST;
> +
>  	if (WARN_ON(ctx->level == KVM_PGTABLE_LAST_LEVEL))
>  		return -EINVAL;
>  
> 
> ---
> base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
> change-id: 20261109-hyp-block-map-0c19f8e9424b
> 
> Best regards,
> -- 
> Xuheng Li <xuheng@cs.columbia.edu>
> 
> 

-- 
Vincent
