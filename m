Received: from mail-ed2-f33.google.com (mail-ed2-f33.google.com [74.125.228.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C487F5187D4
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779193; cv=none; b=TbMkXl49/TE607pVocepBK+SFrNkB4+iYvOhL5wO8UHDwBehXfHYQ11zg6Sij5SIn7mRvsafmRmjUN8/VXykOK2sQrcsfeNrorpBpYImvafGpVIkSwhcC1MsGb1e89ZY5bn+Urg+3SCk1M14YV3/uumhh+DMLaKfFNEW2WkhaPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779193; c=relaxed/simple;
	bh=QhdeY5YotJZfeAil2Ozn8cWXLO4GRyzmnz1dWWIPINQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZc0xO63XZo0FaXiVpfGn/J0Tt0fLI1B5l6jD+rxKVWpjEaR10vDVbuTCBy1KW0IuUPokYK/0lxE2vqDt+3Gh82HQeRRMtjBtJ4WK4bMpqNZx9ww++DtHQo5xWh92fbdtclidLDX7EVpGeH06Qo2yDl5PKYuHHypbES9vqH0gP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r4VaHY9r; arc=none smtp.client-ip=74.125.228.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r4VaHY9r"
Received: by mail-ed2-f33.google.com with SMTP id 4fb4d7f45d1cf-6abe19c4262so5384866a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790779177; x=1791383977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8zIgRBEcUOotWURvolQ5JIFyn/MboxYU1izn9qFVjOk=;
        b=r4VaHY9rZmWC0gJf9B6h/AxSCczGSRLNnn8RlXT0RU4y2EWnOdpo3XhdC8dLM06U48
         ilra3vrDBYC5VrHA1syD9SsmHz3Jut/gpe6mX9vEvvZeJ6GVAsnxPNmPmWkel3mCVhrt
         eYbCGq2nq/r7GuIq7STznlxAh59CWXvPbM8yBkSG+NCLoMN966F2SeIUQ5+1EN6HNJFK
         ya29Lr1INnPdS02CFM1VZWrXrp/5c/dZLMmU0OmY/AGmVUlFKhWiFjGZ58x6/3o4XAj7
         2gECDPsqoSg4vI2RaqlAd0uxdNPXVaambG3dkQ8tgl93VceNJQyoTM4S2xXKewjppznW
         S2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779177; x=1791383977;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8zIgRBEcUOotWURvolQ5JIFyn/MboxYU1izn9qFVjOk=;
        b=nTZZzmbacCcGHZ1cRnY/6ZeHNuZv5vum9+eSCCwbBf8jpc1MlsXB+NduYUjolSdxVU
         M8ic6uSYPC+qbBRW319o6/omDstIWYgH9dkKOqThyU0AgvpseE/TytKafWgbBZMwC76v
         bRpkVZHZVOFQ/5WPVH2SP2ttwHqA3hlWUArqjtklBpyX6zD1EM4WwAZxnc9ROAJYR5Ct
         kBzeGXLoErU+TIuW3PDo+xT4v6FySScJuQa+7uXDfN8z/CecsVTUHsBldchWyhYIT760
         fcaNq/O3PAwZMAKVThy8kfDtoYQ+2sT0EqD+KR43f6z4PgfAeL1wLAG88QAyQcboESVE
         0o1A==
X-Forwarded-Encrypted: i=1; AKwUvByWfLm5j1Cs1ZBlPFMoWIYcpcJzH2X1D9mpHzVQt15b0uPjlrelXkxwN6Bi4uBLAZ90Udy3pK4RTNhsaXA=@vger.kernel.org
X-Gm-Message-State: AFuF++nHsqn/6niJHKOzFuf5/Pmokgzx0v6B568Kcn+8mdRegCEmnOuI
	3gaz1bqQ94GrMlp2P7X6YXFIIdVFbLIvfw6s+CUl537r+Nvk08WTk7Yg
X-Gm-Gg: AYBFou060CguLH15LESsZwj54+jevW2b+02PCHECt3arDd1/PReyuqs8RHMsmjTz3FR
	q+hlPGqsOJyAm1ocB990uYi0nCY4p6WG9UcVjs30uE2VwP6LVp1F80tNBiyvnFoQip2b1oTFBtT
	Y2vW6SCfN1nJb2+aZAXqE5rTErN+qASFKgB1i0jgb3lJqNoBTWdm23h2TTIEyFp67IUwBxV+hIg
	hbR4PO66AbVI1z9YMf2aXt0mPYSRaHNsbHsLAMrzKTwK03fI4jvICc1gGkHr+lgEj5e/bZJU7vG
	cvqMX1Yde51CYpbTGetA5iF3rAaf3GFV9xRWCI6guXvEJxuFXwJmMNQmw4AQcfU45LJqTmZXm6z
	de70H5xGEcXIv8HfSFLg9lRSH4txSYHuGXOrt4WeJryaQKe22vTsV+vJPZMvhlTF501EpNvcI5V
	kf6aSyS/Ho1XnNh7Z0IUkHOGlDl1Dyp+VAn1o=
X-Received: by 2002:a17:907:2d24:b0:c29:5172:6151 with SMTP id a640c23a62f3a-c2e23de355amr130161966b.45.1790779177087;
        Wed, 30 Sep 2026 07:39:37 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31cf0d6esm13604766b.37.2026.09.30.07.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:39:36 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Wed, 30 Sep 2026 16:39:33 +0200
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
Subject: Re: [PATCH v9 06/10] mm/vmalloc: extract vmap_set_ptes() to
 consolidate PTE mapping logic
Message-ID: <ar0fJcjNmGGV6uFu@milan>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
 <20260923062832.479455-7-jiangwen6@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923062832.479455-7-jiangwen6@xiaomi.com>

On Wed, Sep 23, 2026 at 02:28:28PM +0800, Wen Jiang wrote:
> Extract the common PTE mapping logic from vmap_pte_range() into a
> shared helper vmap_set_ptes(). This handles both CONT_PTE and regular
> PTE mappings in a single function, preparing for the next patch which
> will extend vmap_pages_pte_range() to also use this helper.
> 
> No functional change.
> 
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> ---
>  mm/vmalloc.c | 36 +++++++++++++++++++++++++++---------
>  1 file changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index fb757d95bde25..d475e52110e4a 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -92,6 +92,29 @@ struct vfree_deferred {
>  static DEFINE_PER_CPU(struct vfree_deferred, vfree_deferred);
>  
>  /*** Page table manipulation functions ***/
> +
> +/*
> + * Try contiguous mappings at the PTE level for arches which support them, and if
> + * requested by the caller. Fall back to PAGE_SIZE mappings otherwise.
> + *
> + * Return: mapping size.
> + */
> +static __always_inline unsigned long vmap_set_ptes(pte_t *ptep,
> +		unsigned long addr, unsigned long end, u64 pfn,
> +		pgprot_t prot, unsigned int max_page_shift)
> +{
> +	unsigned long size;
> +
> +	size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
> +	if (size != PAGE_SIZE) {
> +		pte_set_huge(ptep, addr, PFN_PHYS(pfn), prot, size);
> +		return size;
> +	}
> +
> +	set_pte_at(&init_mm, addr, ptep, pfn_pte(pfn, prot));
> +	return PAGE_SIZE;
> +}
> +
>  static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  			phys_addr_t phys_addr, pgprot_t prot,
>  			unsigned int max_page_shift, pgtbl_mod_mask *mask)
> @@ -100,6 +123,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	u64 pfn;
>  	struct page *page;
>  	unsigned long size;
> +	unsigned int steps;
>  
>  	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
>  		return -EINVAL;
> @@ -120,15 +144,9 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  			BUG();
>  		}
>  
> -		size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
> -		if (size != PAGE_SIZE) {
> -			pte_set_huge(pte, addr, PFN_PHYS(pfn), prot, size);
> -			pfn += PFN_DOWN(size);
> -			continue;
> -		}
> -		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
> -		pfn++;
> -	} while (pte += PFN_DOWN(size), addr += size, addr != end);
> +		size = vmap_set_ptes(pte, addr, end, pfn, prot, max_page_shift);
> +		steps = PFN_DOWN(size);
> +	} while (pte += steps, pfn += steps, addr += size, addr != end);
>
#define PFN_DOWN(x)	((x) >> PAGE_SHIFT) - how many pages covers the size.
Replace steps by nr_pages or nr_ptes?

--
Uladzislau Rezki
