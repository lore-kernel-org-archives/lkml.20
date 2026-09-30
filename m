Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4307D4DDB27
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779575; cv=none; b=rbMP8HYqH6ILXm+pCZqQCmgLRwGq8oDKWKSxJkxz/6m+kizkxMed5utEpkG3XD7ooLPVVjLitOBZtQ93xda+smWim+o9gCYqYuPnPmXfeJkAElVusK5bxaA1FLFHKr1cSKcfynYxfvg/NuETJQ6eMRPxmKLxAgizvnWMplj364o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779575; c=relaxed/simple;
	bh=u9HgcsS6XcJw5MUU8OOHoDIP+87/QbOgQEx8BKTKzts=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLdfP+btqJg6zuq/4mRl2TbAwoE+Wk4GjNdtnZmbB/spFus/6Y2oEFC3tg7GcmsQKNgJKfcC8RJ8kmUfEEZPUXWMMaJftVzzFglg9SFn5J4tAVapHbq5PyxgQIh292xUmHpXkHT+LTR3a6IW0ZPgtEpFYe1SkZ7rQJUM9SnISDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2EVlbq6; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2EVlbq6"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a996c8adf3so8692382a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790779566; x=1791384366; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/F5K+TNyy2UgzuNElF3z3QNQRpGUcw1ZJkuRwiOyvlk=;
        b=O2EVlbq6fuvc6jeJoyMcUhPb1A9cKEepumh44UFWnHUulbQj9Wj8eR22MeRZC4hm/k
         AnttIIYawdk+qZ1cOM3gPoMtnPB50o8Ys3g6qRZ4neO5hmAg1o7GWKQSTet8zIDbMEc4
         d7Em7a3R1WLV17d/6qvM2ZVPw+VGsYb5mp6xN6mpmRE9HYcz2QxiEW8SmFBDMO0cVlbk
         Rcc2gf5+bw6d+X3oB5azMD2lmE1HMAkDoNC9Qq6X2PXgGONvQd5t8ARreIDoJp6yZs4A
         basSMADA/orOovKS6FuzE9fZDg0vy9pqj1jynFwGrHIVGbdILtH8qDoyi49okh4KRQLu
         RNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779566; x=1791384366;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/F5K+TNyy2UgzuNElF3z3QNQRpGUcw1ZJkuRwiOyvlk=;
        b=gyFav98YTSk/ApHqv9OffixaZcxEWdN+spMyFPJn2XWykB6VRiKdYvISWo+mVruHfP
         tB+IaxOfXlouPBpKA1sU/SHekvfrPkWdfTDK6LRq6jrGMhTuuzxjKKDu5vz1h9DwoOaT
         eLvFAbRT9otwI5ELsEVBY0Cj0bdggXd3JSLjkkps28sogOfRXVB5iCNkTJv+RBjGPXL+
         70W3o5sitgBiRDFx5zG/b2b9v55gikBMtvRVrhwNM457FWi7qtaEd46KCB6yq0KLERUn
         l8zSoD0fiWHRvDgyoeaGRQM10YgyQAZoE8A1/17DwX6eNstU7iiBdyVPwJ4BXA+f3mIK
         livA==
X-Forwarded-Encrypted: i=1; AKwUvBxmziedb4/CkmPwm22yaQHOKWzHslCihnrIgVMay31bwHCJH0kEnfbyCdw5K4pYCeYCPb5+FQOzB89/uUM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRydYEMFQDly2rXgfB5T97GP74QrMKDbSsLD5PmuAnNAPi3e/h
	OqGkXU4auo3N64YFCF2Ke6DJ4NiSd/a38SXD2ZlV9celBivLJfA32sBG
X-Gm-Gg: AYBFou0FoIa+gxBcTFLXY4snanAcWffqePrwwoK0zJ4kjNrikqVRDsze9FOQ0THVlzl
	+NJiok9YSzii3AVCBxWTn1w9v++phxyTEU2Ratbv04+WJdqSnWVqyox6xhROHpFDeMSn9xycYNv
	2GZCIzxeDJsa3pmcBn0Kw/ZXCM8aCsoAiLsuHQNhy/PGjWtKwIF3ryGqIjoLZdbB9jWnSyY5pUR
	qY25L1EEUqhpK+VsX2yO8o+mSvxGDuHc9ks3XUuW5ym9x9+mU0Kmhx8Gbeg+MUHvPzArbzzNNaH
	K5SRF7/anfsNXiBARbPEepsBfcNj48vfYj8RnNq71M3U/GKHo9q1Ntxx6wvzzrlYzonq7GNeI/0
	MLCT8/t8ICPrRohwTpvK1KmBE23hCpOGWPEaIDNkv3gFItZLcURzMHmlQqXdpgNTt/qqYQRsvpY
	xtb9T4CB2LIct1mA9B9CUoG9Gd5xa/gcKb4hRo/U+tMaqG8w==
X-Received: by 2002:a05:6402:1d54:b0:6aa:734a:a084 with SMTP id 4fb4d7f45d1cf-6ae198f00d8mr1300841a12.27.1790779565320;
        Wed, 30 Sep 2026 07:46:05 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae1569b42csm924295a12.24.2026.09.30.07.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:46:04 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Wed, 30 Sep 2026 16:46:01 +0200
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org,
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com, anshuman.khandual@arm.com, baohua@kernel.org,
	chleroy@kernel.org, david@kernel.org, dev.jain@arm.com,
	jiangwen6@xiaomi.com, leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, rppt@kernel.org,
	ryan.roberts@arm.com
Subject: Re: [PATCH v9 08/10] mm/vmalloc: extract vm_shift() to consolidate
 mapping shift selection
Message-ID: <ar0gqTEf2flG1TQd@milan>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
 <20260923062832.479455-9-jiangwen6@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923062832.479455-9-jiangwen6@xiaomi.com>

On Wed, Sep 23, 2026 at 02:28:30PM +0800, Wen Jiang wrote:
> Extract the vmalloc mapping shift selection from
> __vmalloc_node_range_noprof() into vm_shift(), preparing for reuse by the
> vmap batching path.
> 
> No functional change.
> 
> Suggested-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> ---
>  mm/vmalloc.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 6e0dec73107a7..a43965016eb4d 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3568,6 +3568,14 @@ void vunmap(const void *addr)
>  }
>  EXPORT_SYMBOL(vunmap);
>  
> +static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
> +{
> +	if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
> +		return PMD_SHIFT;
> +
> +	return arch_vmap_pte_supported_shift(size);
> +}
> +
>  /**
>   * vmap - map an array of pages into virtually contiguous space
>   * @pages: array of page pointers
> @@ -4079,11 +4087,7 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
>  		 * supporting them.
>  		 */
>  
> -		if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
> -			shift = PMD_SHIFT;
> -		else
> -			shift = arch_vmap_pte_supported_shift(size);
> -
> +		shift = vm_shift(prot, size);
>  		align = max(original_align, 1UL << shift);
>  	}
>  
> -- 
> 2.34.1
> 
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki
