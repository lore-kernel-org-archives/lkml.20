Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091EA4CDDE9
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790780734; cv=none; b=tukMUvEazk5niLQDk9pTX8NoGkN2uQX7g/BOXeIVU+qRDK0UpV9VMn3703rmBelw3UAytJQGinnHjSc+m7D6sGp2CvmJ8BzN6egURbDgcwhi+ZElvArLB7C0i1N4NRCY5dysZxC+sZqclFji/cQTIE68QwjJWZyxqzpCWKRopqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790780734; c=relaxed/simple;
	bh=B23mS5c2FJ25HRiAPwPE0K+hf3GlLwh02iOE5FI9uxA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAXmtB5HyVw+9UAiGmU2QOyOhe76luWABF5DW4dnBNWrU+x4c/adWSeajqhvh/4QJrWiIx9cgZduWPnGGAr4NdXXC2GVdH2W58TcQeLSrm3Y1CsXPxM/VwozITsE+twIRoyVSgER02uRMqgwXFKPmlMdK9BxT+zzzW2+EkIYXq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/QTRcXh; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/QTRcXh"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e309aeb38so30617866b.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790780726; x=1791385526; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jfRtojeauzUhQb4SePcX378h8gySuQTk235TQqLiiHA=;
        b=g/QTRcXhKC547mQqfWFEbObdJlo8GqMlNhTBGJ1pqsSBldJM+aYok50kSO9At8p05R
         T1QLzrMhL19S4r2zcInJ5al28EnBZKtXKrXEGk3LiUqvfPFFofieVG5IH4QABvztsuMv
         Cm9f9RpU+FZnCdY6ykGkqhfQPid4SLhUNwDJ5KOH5n2TMxPIRpI15WRfeMTmp7aIBbLH
         Mv6TiHGsC83Hzf9GLJyg6fyJjNemzsz9XtdsfbZUTCayen7+7gMaeLQgyD6FkXNiVdlV
         40kBqrDZzXy5hKI4SyrYTwIyQQ423CAhoKx0RgZSYAAQX2Lu/kN3HzT864jV9j4ZZ9jw
         nKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790780726; x=1791385526;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jfRtojeauzUhQb4SePcX378h8gySuQTk235TQqLiiHA=;
        b=EUIUrFp4Ho0rj0UnHsiIzsg3dYjVqYmvr49K2YNLyO54oEtP5r8E6KCp5DRveTRQzU
         KQr/vZf6sQ2Q+b26C6Sr2q8FTUtzOh5yBABsyf8/8aRbiZRIDcnJxXvQC1+4nllgA/PO
         4ULGQskhLVS7RCxq7ptIe2ToCQAmZU+soqJLukad/iW0rkrTxRyhzI5Cl22+tFFF+aa0
         fMM4Ua+mxjRtvtDXncNV7z2BkFDsaLcuPGmCVW1WyZpdT2xLjqbptwCet5Ub4bquC8R7
         cUDW/6sdjl6T8W2PbV0/YQC8QQwQw5ZDCceGxcTofMrJZVdYZZpM6X69CQRwLj3/Mcnq
         atHQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6xf/zH3fAd7TYE4vS7X18vzrySVz78PPY1kfJHGDvBAdtyTcF5IKEPbvrMuHACet1Qw79+IiBtbesieM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2g3ElJ4sS9tk1uA7GUdqer033B4NrRjDGa0acVdygPXqr+t53
	j93AbQ3qSTqN8y+ABMAR1Sk7KSHmRSIE7dP600ha7qtgNERU0KgVzz+/
X-Gm-Gg: AYBFou1jnMkzWkhKR6hcauSMYtNWr5Flz8FOlZIKepXK40NBFGVJPyNQa3gayBUy8RI
	TJbY8jGhBkHWshj8tq7XjKyWqpkXGPhiVxUGI3jC4HcUwcvkmTKMTnk4t221V1L4eIjW9xz01S8
	1N1cL2NMA5jx+TpJflRhahW/2qYMBls6PrfqvJtiqMsIMjiTXDEwojjKVWTaX5DyrINC6RwwvMo
	DLcW1965l1MU54gUkhYQhKQoQ7HhKqiaEAjlY+QpAA/IkIi4lr5acybN5fiNpZdzYYBRGwGeifh
	91nWBgXHiexKqicUGodqVAYAIVVd/VFsv2zQ4DMgoEkx87itnADetHMLAgroBCcoJ7unpwQXV/H
	zDV4NNabNzfnkaHQvFst04IJeO+crNBu6xvOoYPo+1rSAJalcGdAEL/NX/OWb0la7Q3mkXrblpj
	v9c5UZCXibiyqv+UfhU/Ki
X-Received: by 2002:a17:906:ba89:b0:c2d:a4ef:64ca with SMTP id a640c23a62f3a-c2e23e39566mr171362866b.42.1790780725514;
        Wed, 30 Sep 2026 08:05:25 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31a3cc87sm20827866b.6.2026.09.30.08.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:05:24 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Wed, 30 Sep 2026 17:05:22 +0200
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
Subject: Re: [PATCH v9 09/10] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
Message-ID: <ar0lMkKxugZV7xyw@milan>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
 <20260923062832.479455-10-jiangwen6@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260923062832.479455-10-jiangwen6@xiaomi.com>

On Wed, Sep 23, 2026 at 02:28:31PM +0800, Wen Jiang wrote:
> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> 
> In many cases, the pages passed to vmap() may include high-order
> pages. For example, the systemheap often allocates pages in descending
> order: order 8, then 4, then 0. Currently, vmap() iterates over every
> page individually—even pages inside a high-order block are handled
> one by one.
> 
> This patch detects physically contiguous pages (regardless of whether
> they are compound or non-compound) by scanning with
> num_pages_contiguous(), and maps them as a single contiguous block
> whenever possible. The mapping order is determined by taking the
> minimum of the contiguous page count and the pfn alignment, allowing
> graceful degradation when pfn alignment is less than the contiguous
> range.
> 
> Pages with the same page_shift are coalesced and mapped via
> vmap_pages_range_noflush_walk() to avoid page table rewalk.
> 
> As users typically allocate memory in descending orders (e.g.
> 8 → 4 → 0), once an order-0 page is encountered, we stop scanning
> for contiguous pages since subsequent pages are likely order-0 as well.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Co-developed-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> ---
>  mm/vmalloc.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 80 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index a43965016eb4d..37cddb7f45a4f 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3576,6 +3576,85 @@ static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
>  	return arch_vmap_pte_supported_shift(size);
>  }
>  
> +static inline int get_vmap_batch_order(struct page **pages,
> +		pgprot_t prot, unsigned int nr_pages)
>
get_vmap_mapping_order()?

> +{
> +	unsigned long pfn;
> +	unsigned int nr_contig;
> +	int order;
> +
> +	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
> +		return 0;
> +
> +	/* Limit nr_pages by pfn alignment */
> +	pfn = page_to_pfn(*pages);
> +	if (pfn > 0)
> +		nr_pages = min_t(size_t, nr_pages, 1UL << __ffs(pfn));
> +
> +	nr_contig = num_pages_contiguous(pages, nr_pages);
> +	if (nr_contig < 2)
> +		return 0;
> +
> +	order = ilog2(nr_contig);
> +
> +	if (vm_shift(prot, PAGE_SIZE << order) == PAGE_SHIFT)
> +		return 0;
> +
> +	return order;
> +}
> +
> +static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
> +		pgprot_t prot, struct page **pages)
> +{
> +	const unsigned int nr_pages = (end - addr) >> PAGE_SHIFT;
> +	unsigned int prev_shift = 0, batch_idx = 0;
> +	unsigned long batch_start = addr, batch_end = addr;
> +	int err;
> +
> +	err = kmsan_vmap_pages_range_noflush(addr, end, prot, pages,
> +					     PAGE_SHIFT, GFP_KERNEL);
> +
> +	if (err)
> +		goto out;
> +
> +	for (unsigned int i = 0; i < nr_pages; ) {
> +		unsigned int shift = PAGE_SHIFT +
> +			get_vmap_batch_order(pages + i, prot, nr_pages - i);
> +
> +		if (!i)
> +			prev_shift = shift;
> +
> +		if (shift != prev_shift) {
> +			err = vmap_pages_range_noflush_walk(batch_start, batch_end,
> +					prot, pages + batch_idx, prev_shift);
> +			if (err)
> +				goto out;
> +			prev_shift = shift;
> +			batch_start = batch_end;
> +			batch_idx = i;
> +		}
> +
> +		/*
> +		 * Once we fail to batch pages, we expect to fail batching
> +		 * for all remaining pages, so just give up.
> +		 */
> +		if (shift == PAGE_SHIFT)
> +			break;
> +
> +		batch_end += 1UL << shift;
> +		i += 1U << (shift - PAGE_SHIFT);
> +	}
> +
> +	/* Remaining */
> +	if (batch_start < end)
> +		err = vmap_pages_range_noflush_walk(batch_start, end, prot,
> +				pages + batch_idx, prev_shift);
> +
> +out:
> +	flush_cache_vmap(addr, end);
> +	return err;
>
On error, if kmsan_vmap_pages_range_noflush() succeed you do not do a
proper cleanup?

i.e. to cleanup KMSAN metadata: kmsan_vunmap_range_noflush(addr, end);

> +}
> +
>  /**
>   * vmap - map an array of pages into virtually contiguous space
>   * @pages: array of page pointers
> @@ -3619,8 +3698,7 @@ void *vmap(struct page **pages, unsigned int count,
>  		return NULL;
>  
>  	addr = (unsigned long)area->addr;
> -	if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
> -				pages, PAGE_SHIFT) < 0) {
> +	if (vmap_pages_range_batched(addr, addr + size, pgprot_nx(prot), pages) < 0) {
>  		vunmap(area->addr);
>  		return NULL;
>  	}
> -- 
> 2.34.1
> 
