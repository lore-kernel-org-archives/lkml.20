Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DC047D45D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787846726; cv=none; b=TlamVSZ+NVsKZvQCuRBqQzM6q92brubJ3h6XV1LYKckK70pNDnArJU6AUz35oC9kn2z7xX4rnpLn070s6YkLsZ4/6siJ+SqQ0xBp21a/KvhZO0NiMwSupJdxP8frRkHOmR4ZlYjAwaI0K/ZaqWpV2L4CEPtDPsHYZXaceaQQcVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787846726; c=relaxed/simple;
	bh=gETAEBgYwDXWClB5e9959ZIcXDa0GZBBwA4nXRnjY6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rAgh87d3piGZiDz4mmZytBbahFSUjquTO+3VYm0dCFhxj3utwJiRAz6xY3HQ+KD26ZglCKbn0dA4PkFKIPjdSJf5U5s7QZDqmCZnfKqqHZJPJ89bNyy34ufc0r2QIDKgmIUmadXGC6Xr+UYYCKlHsv45zTI9MVeK+xDlZ2GIbTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kHuWm5MM; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kHuWm5MM"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-499add6348fso51185e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787846722; x=1788451522; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CmON3stCzHBRSuZfkMe1xGImPljQrocTgH9KyyEufC0=;
        b=kHuWm5MM0zJWDGdXTa+vHNdO1Q/hFlaTg/9QJvGEUFuXqut/JfPxQPUo2EM+4utIOK
         ikPDXk8uZnUYhnIByIJmVoX9xJHTZt2/TrlmJRavSntpgA9f/598K1PUYuQXh/InbMJf
         aVzFC5HTgqpRQOIJEADSfDce6u/7nYwZe6X01S4vWKcSQGIW/rDO97uDnf5Nhy/Y5s4o
         Rq+ZZOOQ7tId/L0bLYY84OPPtFHs8VW/d3qY3YCCjMM2QmsMzwwRlh4P5HmvJiEXrZhW
         1ut8oOri1W4nIK9+ZMYrRtHdn2gPg8TqVyvf1dAuHhylP63SzGwQ0gbR6DjLbucR8+iz
         6i9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787846722; x=1788451522;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CmON3stCzHBRSuZfkMe1xGImPljQrocTgH9KyyEufC0=;
        b=oACaE1efPhAdZAVzpjXw2gMGmw3BiK1+Z7ch4HM/lj6Pkgl+LjAtRKBbOl8/+nAd4D
         vz2QpAHZXQtMCAFX0ywo2iiWPItXdhjUdAgerB+Y9dOHEq9JvmCoMIBSzW1oG5Q6Y1nB
         DBRaorlczxu95OqXzrnl6h6fC9a+MS1ohXmfM2xk29KrPcc/wr7MyFtiUmz1tkyxBSKJ
         n0EfIyYST1jdD7W0u1iFjyUYWAX2bbyXlxd2e58BpTLB9XyRm9jpVKfseLgQ3rhJgHJi
         GTlIs/lKa9JWxQsIS4ypRbMDxPhECxLAQBy2KnUF2A5DcfC+JLXLkHe4QSjErTOUsWIU
         Y4nw==
X-Forwarded-Encrypted: i=1; AHgh+RrvfEYwELLFwyfbA6/ja/gIyLMqHRkjk1Ehc9CiVn/lxGZKVrr/KciLe4+mWi0G05TR5UcHNy7A7NPUqmw=@vger.kernel.org
X-Gm-Message-State: AFuF++nsdYl8rF07UZ3Y4zpT8f+GYzNF0Ju9ipGAQJK8aAmuMYe/E0RC
	G7J5vgXfE3Y0kbFCtZ1fr9apTuHkwAX4J4vfoS09h78NWOUmX7uho61sC587WEleYA==
X-Gm-Gg: AR+sD12/AGi5gYzfPPRot1TkeVtsQB+uSc4+G3PaYxbDf5FCdM47NgJa2ckRwBTog8c
	wVlyGY8ajY+9sY9sGXsF8gX4D+3EAc6QsFIiu/4cFE9F6UF7WiQBPBt2ql2QQiK7f1mbBa91axK
	fa2s7Iz8jKpLG4IPKYpnZKKAPV/+lowz1AzwBCuEAxwrKCQK08Dj+9MigD5fTNbFXhsXIzwuCSd
	kDnzgHo217vFD0EVaf8C/Ah3rgPw5vJOJ7tju7jWzekNGk+QLau8jLBPWRDH2NU2t5Nw+PSMV6g
	XfP0VNW8KwPf38c0Lj3jrzwbcy4tdo3opZi6nckOi6hPQ9aBDxQBMtO0Zs6JGg/Xo1NZLv/wcMY
	bzWYzTyMuMLepPmei5yhXt/VYUfu4+Hn8Q6YiOWFUKvKBAL1WN9Cs1mOpeBRhQVX1OSU7xx4yz5
	B9XrRKuk5s2n0KQN0iDFQbevIj55W8C+UyVUoafPCsot0zcxjNih80ENvB/nBXlqRa5IQqglFIe
	jxE8aEnTM+6ccDtfg2R/6CNKoFM+Q4pMLgjYEK7
X-Received: by 2002:a05:600c:468b:b0:499:7da3:dd0c with SMTP id 5b1f17b1804b1-49b0e3a0067mr1313355e9.0.1787846721412;
        Thu, 27 Aug 2026 09:05:21 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4dfdf00csm57599795e9.14.2026.08.27.09.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:05:18 -0700 (PDT)
Date: Thu, 27 Aug 2026 16:05:14 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Yuanhe Shu <xiangzao@linux.alibaba.com>
Cc: joro@8bytes.org, will@kernel.org, jgg@ziepe.ca, robin.murphy@arm.com,
	baolu.lu@linux.intel.com, kevin.tian@intel.com, praan@google.com,
	skhawaja@google.com, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] iommu: Drop IOMMU_DEBUG_PAGEALLOC refs on iommupt
 domain teardown
Message-ID: <apBgOqEP4Fv6cOaV@google.com>
References: <20260827145855.1616223-1-xiangzao@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827145855.1616223-1-xiangzao@linux.alibaba.com>

Hi Yuanhe,

On Thu, Aug 27, 2026 at 10:58:53PM +0800, Yuanhe Shu wrote:
> Since commit b948a8722848 ("iommu: Fix up map/unmap debugging for
> iommupt domains") iommu_map() takes an IOMMU_DEBUG_PAGEALLOC reference
> for every page it maps into a domain, and the only path that drops
> those references is the IOVA based unmap.  When a generic_pt domain is
> freed while mappings are still installed, pt_iommu_deinit() releases
> the page table memory without going through that path, so every mapped
> page keeps its reference forever and each later allocation or free of
> it trips:
> 
>     WARNING: drivers/iommu/iommu-debug-pagealloc.c:91 at __iommu_debug_check_unmapped+0x4e/0x70, CPU#0: init/1
>     iommu: Detected page leak!
> 
> Freeing a domain with mappings still installed is not driver misuse:
> the deinit contract in include/linux/generic_pt/iommu.h only requires

Which drivers cause this?

AFAICT, users of the DMA-API must unmap the pages, otherwise they
run into bigger issue (as leaking IOVA).
This is stated in Documentation/core-api/dma-api-howto.rst
  Every dma_map_{single,sg}() call should have its dma_unmap_{single,sg}()
  counterpart, because the DMA address space is a shared resource and
  you could render the machine unusable by consuming all DMA addresses.

On the other side, there are very few driver that use the IOMMU API
directly, and from what I can see they do iommu_unmap().

Some page table implementations might tolerate it (because it is simpler
and more efficient to implement instead of descending to last level
tables) but I don't think that makes it right.

Thanks,
Mostafa


> the table to be removed from HW access and caches, with no requirement
> to unmap first.  iommu_setup_default_domain() frees the old domain with
> its IOMMU_RESV_DIRECT mappings still installed (those pages normally
> never return to the page allocator, so it does not WARN today), and the
> generic_pt kunit suite (CONFIG_IOMMU_PT_KUNIT_TEST) does the same in
> pt_kunit_iommu_exit().
> 
> Patch 1 adds __iommu_debug_unmap_phys(), the physical address based
> counterpart of __iommu_debug_map().  Patch 2 wires it into the deinit
> walk: a debug_unmap flag makes __collect_tables() drop the reference of
> every OA leaf it destroys, symmetric to how iommu_map() created them.
> 
> io-pgtable has the same gap in __arm_lpae_free_pgtable(), but its
> cookies cannot reach the struct iommu_domain, so that fix needs an ABI
> change or per-driver handling and is left as a follow-up.
> 
> The kunit suite doubles as an in-tree reproducer: with
> CONFIG_IOMMU_DEBUG_PAGEALLOC=y and CONFIG_IOMMU_PT_KUNIT_TEST=y, boot
> with iommu.debug_pagealloc=1
> kunit.filter_glob=x86_64_iommu_test.test_pgsize_boundary, then
> allocate and free most of memory (the case maps 128K at the hard-coded
> OA 0x208b95d000 and never unmaps it, so the machine needs enough RAM
> for that address to be online memory - a 150G guest was used here, and
> the sweep was a tmpfs filled to 95% of RAM):
> 
>     unpatched:          64 page leak WARNINGs
>     with this series:   0
> 
> The 64 is one WARNING for each of the 32 mapped pages on both its
> allocation and free.  On unpatched mainline the suite already fails
> test_random_map's NR_SECONDARY_PAGETABLE assertion, which aborts its
> cleanup and cascades into the following cases, hence the isolation.  An
> out-of-tree module mapping a page into an amdv1 domain and freeing the
> domain without unmapping shows the same behaviour, 384 WARNINGs over
> 64 iterations unpatched and none with the series; each leaked page is
> reported again on every later allocation and free, so the count
> exceeds the 64 leaked pages.  The control case that unmaps first stays
> silent.
> 
> The generic_pt format code can be built as a module (e.g.
> CONFIG_IOMMU_PT_AMDV1=m), so the new helper and the
> iommu_debug_initialized static key are exported GPL.
> 
> Yuanhe Shu (2):
>   iommu: Add __iommu_debug_unmap_phys() to drop refs by physical address
>   iommupt: Drop pagealloc references during domain deinit
> 
>  drivers/iommu/generic_pt/iommu_pt.h   | 22 +++++++++++++++++---
>  drivers/iommu/iommu-debug-pagealloc.c | 30 ++++++++++++++++++++++++---
>  drivers/iommu/iommu-priv.h            | 24 +++++++++++++++++++++
>  3 files changed, 70 insertions(+), 6 deletions(-)
> 
> base-commit: 45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
> -- 
> 2.43.5
