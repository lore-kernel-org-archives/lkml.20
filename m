Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393FD3CAA2E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789120443; cv=none; b=LNyM8AVFi6nrIIMuCnmX76FWcmc3dgbn9n8h219fnWovA9f5vSi9eg7sNtWE2V/ej8P5ly8nnMO7hGjBVqWBOyAs+tE8fpOCSEc5d3yFOUzEgqhzvhRbQ2W514b3vkqbBaB+U1/0K+OmWo7K/ZQ1TKfGuIVvGNfr193pbgRvwpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789120443; c=relaxed/simple;
	bh=P93zf/if6O8xkhJq7rQ6DePmlWDuaeDRsy/JRlLbXcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aPE7HwUj4KLgomU5zMC6qENUDDLFu1caurFaHz3SbMR00jESeVOVflYHGt96C9KMys9zqMujEUdMmggucHUWfrpAQiyK/eVZ6pM/6RmFnJURc1BN7b/3uBmbigO5TylgexpJ4tKpGoJaZc24Fbxalq/HQN2d1kObRTQszdlA9nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhj2+KWF; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhj2+KWF"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-86959a6f7f6so539766b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789120440; x=1789725240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R5M95WIaFsi2d1eZZAa7AEXfbZ9VQBY7mOxP3ywQF0g=;
        b=bhj2+KWFTdeeNSk6pNoih9K7Px1GVJeE9JxcBrvmKgjIfrc2gSYR82rmBTPdhHseMV
         UxXydc527/vbAoPfRULj3rTRDCDwhN0L+3p9z6KOVgkIGZFm2ZcQhctoFhBrKH4jAKxK
         +d6IftEmRDpYtzuHIEA+7QMtfOJ0Uc2NMKb/PiMHDgayafSuQprFQdm/P1hfAaepQyQu
         zcyV1FVttj0lIRx/jVhj0nZb6Dw0QiFT+bI+gfHKdn6Ov3iqYK0I2nt2eFsksJdEaCSj
         5op4uEckFhoBiyID142OdGAfGe7xCp5n8TqgX93X6Ac4gyys2IkhnWiCeyVDa1lzfNuE
         077w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789120440; x=1789725240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R5M95WIaFsi2d1eZZAa7AEXfbZ9VQBY7mOxP3ywQF0g=;
        b=VcK00B2W/p4Y8DeYUCYyfM0R/xelQ2I8SloPectSA1+fL8tnv1PmpK8CiIZQ7SXcL7
         H45FbuRhHgUVV7nKBpazCoFy7PKxMImay2vQmdGbUJMLbI5uidgy3I8xM8/ieqNiVJQo
         EEga6QuSQvEM/sICjeTJ4CFq6bJJmtWTd6Tp7spw5G8QenGIDePMneMvE8ubZrC4Cazo
         TqTIDzHEdeOIcR2J9IN8PfvpTXEpXP2ZT65FqKfx2Zs+megjZ0FK/hXTdE+UHKDTsGlt
         OV4jEN+nkzIfpC3rRd6xxSSif6/sfzbUyrb7KHvNIheMsLaRc13kFYYAzOwt84em8yG6
         l44w==
X-Forwarded-Encrypted: i=1; AKwUvBzzo8Z49M1qZRi2GiS8O9VI+8sPOihO2LRat1Duo0BJT3D5t/OmF1wUa+7k7N9aqBssxtSodvpQ0kQNfsQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lBBVLEvm0+XNxe4e4N9wtJHqLyItWxQBN1ANJoYTkyGX9kcU/I
	e4aWnmtrVr7SYApHfs5SsrLm67uZDAB5CwCTbrbNSF2tOnEgiOAM4G0i
X-Gm-Gg: AYBFou0xDqZ33wztZvHCuEcJK2wv0j5uRzR/Epk18kBe10La5cl1jd222HwoXunNNw7
	coR9E9tIYoWkWY6wK4XrmjhNqn0T2O4HCsp4QsQMz4hJ2eoJT+8uJyJXMuy/JZmaC1caaB2T/2N
	HSGrtlKkApDWuPNgUkNLBn2vc36nyT5C58ZPqlPBDUpf5WzlQBhsWYSIVGVry1GEec0yc3F9DvF
	6bB0atP7b/y32MurbCaRKwdvaCenSOaUdimWHWaW+mXSowk/8A7sQO9T57d693JZHVibjw8Res5
	XzNeBrmNtFWkxwWWOhss74pkKl3O/SKlr/E13IrdA94ZVdVMFlSm+lzJHeb5IJ8MBrRcIhNUDHd
	jfLc71zMq4zE0VDEPtr5LEtpSVxGeyvXRT2GT5EmYZhrFNvphggW56lWbluL++XxsUVW91/7vpq
	j7REThqHX6EN6cFg9c2yt43C7dz/hNNeSmtNNa6ulZ+ry3ZushWi9YeKV4c5ttVbwFTXoqJA==
X-Received: by 2002:a05:6a20:7f96:b0:3cd:9dea:2be1 with SMTP id adf61e73a8af0-3daecb20df1mr6246360637.0.1789120439682;
        Fri, 11 Sep 2026 02:53:59 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6550df9sm868437a12.16.2026.09.11.02.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 02:53:59 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Kunwu Chan <kunwu.chan@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH REPOST 4/5] mm/damon/vaddr: extend apply_probes() for hugetlb
Date: Fri, 11 Sep 2026 17:53:51 +0800
Message-ID: <20260911095352.2803549-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909140408.104699-5-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed,  9 Sep 2026 07:04:06 -0700 SJ Park <sj@kernel.org> wrote:

> DAMON virtual address space operation set(vaddr) does not support
> hugetlb pages in apply_probes.  Extend it for hugetlb pages.
> 
> Signed-off-by: SJ Park <sj@kernel.org>
> ---
>  mm/damon/vaddr.c | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/damon/vaddr.c b/mm/damon/vaddr.c
> index 7c548ec0cf6b5..45239f05e113b 100644
> --- a/mm/damon/vaddr.c
> +++ b/mm/damon/vaddr.c
> @@ -598,6 +598,34 @@ static int damon_va_probe_pmd_entry(pmd_t *pmd, unsigned long addr,
>  	return 0;
>  }
>  
> +#ifdef CONFIG_HUGETLB_PAGE
> +static int damon_va_probe_hugetlb_entry(pte_t *pte, unsigned long hmask,
> +		unsigned long addr, unsigned long end, struct mm_walk *walk)
> +{
> +	struct damon_va_probe_walk_private *priv = walk->private;
> +	struct hstate *h = hstate_vma(walk->vma);
> +	struct folio *folio;
> +	spinlock_t *ptl;
> +	pte_t entry;
> +
> +	ptl = huge_pte_lock(h, walk->mm, pte);
> +	entry = huge_ptep_get(walk->mm, addr, pte);
> +	if (!pte_present(entry))
> +		goto out;
> +
> +	folio = pfn_folio(pte_pfn(entry));
> +	folio_get(folio);
> +	damon_va_probe_folio(priv->ctx, priv->r, folio);
> +	folio_put(folio);
> +
> +out:
> +	spin_unlock(ptl);
> +	return 0;
> +}
> +#else
> +#define damon_va_probe_hugetlb_entry NULL
> +#endif /* CONFIG_HUGETLB_PAGE */
> +
>  static void __damon_va_apply_probes(struct damon_ctx *ctx,
>  		struct mm_struct *mm,  struct damon_region *r)
>  {
> @@ -607,7 +635,7 @@ static void __damon_va_apply_probes(struct damon_ctx *ctx,
>  	};
>  	struct mm_walk_ops damon_probe_walk_ops = {
>  		.pmd_entry = damon_va_probe_pmd_entry,
> -		.hugetlb_entry = NULL,
> +		.hugetlb_entry = damon_va_probe_hugetlb_entry,
>  	};
>  	unsigned long addr = r->sampling_addr;
>  
> -- 
> 2.47.3
> 

Hi SJ,

Reviewed patches 1-4, with particular attention to the vaddr prep/apply flow, 
the filter handling shared with paddr, and the hugetlb page-walk path. 
The changes look consistent with the existing DAMON interfaces 
and page-walk semantics. 

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com> 

Thanks,
Kunwu

Sent using hkml (https://github.com/sjp38/hackermail)
