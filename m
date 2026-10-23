Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792727225;
	b=cAWAQIDqYoK7kyPNJ9GGl+1b8h4Xcr003iuN92m60DR4LqhaSrHxs/Rcb6IDjy/fB+Vg
	 6npSolK/rqMNv/cK6Fac7Vs3nDNQT/K6RWHGOJ/aILRl0pWQgAM2V7eTz+AuisMzyHgr6
	 FgX0NidCBYnSJDA2aH9JLJH9KL0qeLpEZjc+4isfyyr2qVrhUb2mmn+33wrLRHSgfPNzx
	 ykvQnyQe8AAjl+Cb09pGT5SFQiT6pq8u7u5rRkK8ciuSMAIgEWW9B5P4aTiRqg2QfByO1
	 uFv5IgsazkXMyrqDVHgLq/J8DWqiGxGV7//xhiDkjtggB0pwJwa2QmzyXDQuxl2lK0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792727225;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3VNVf0/RTjTbRf57wl1w88rYS317KM33ofoAQG+5nfI=;
	b=szdq61LKkD62ozC+lf8PcAcjDjmNs+h2Vh3JBZMeFqTmOdgNW0Apv7+HtQUdjGy2BkxN
	 Rwz1Y4c/0KnYbmmHS5mDBtz8jGk7dwxhYblcKTc1Gp6J4kk5vUuzP+RSa1LHbRfBWzp9v
	 LSmBMSZK6Jkkh+wSV3vFM5uPXDk+p3+OJ3hwSSljNt0U6XSsJbDj6y0+fjllHknCzFBH5
	 Injhx41b0KB4qbpa4TDEZvjq+k6ZrHepnzsRjNAwrvl5JvVT032M4kDJj5ZhzmE8l84fP
	 y6wjdPG5FA5djRqIYK+6MpjMpqwe41TX0cXU+3hUM+jqB51T3kivaKBeeMAsg7lVdvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=owwUz7Ao;
	arc=none smtp.remote-ip=95.215.58.175
Received: from mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91939606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91939606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=owwUz7Ao
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=L+H22LxR/S7kNv+P15UOky1GL22rLifgQhK5zAHtVzg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792727222; v=1; x=1793332022;
 b=owwUz7Aox2bPMrctPPRlHZ2j1tPpyK6dWV4mMLTJepn8eVqJOoQhCTdENneeDNAR+fWlfwlv
 Wx0Zt9Nd6dczEbVXud+rFJhiGtBJ7KtfecojapI8sCCq6KPW0oxUNtdvrj3KaR5dijDVdXaS9Yv
 o736bXbls/Y7XgQt/YEnmbLM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 315b90f35bda0009;
	Fri, 23 Oct 2026 03:47:01 +0000
X-Mizu-Trace-ID: 315b90f35bda0009
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: songmuchun@bytedance.com
Cc: osalvador@suse.de,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	qi.zheng@linux.dev,
	lance.yang@linux.dev,
	jthoughton@google.com,
	david@kernel.org,
	muchun.song@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/12] mm: hugetlb_vmemmap: make vmemmap restoration folio-oriented
Date: Fri, 23 Oct 2026 11:46:55 +0800
Message-ID: <20261023034655.37422-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261020115824.823278-9-songmuchun@bytedance.com>
References: <20261020115824.823278-9-songmuchun@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Tue, Oct 20, 2026 at 07:58:22PM +0800, Muchun Song wrote:
>Like optimization, vmemmap restoration operates on one folio at a time,
>but the current interface exposes a raw address range and requires the
>HugeTLB caller to prepare part of the operation.  This splits the common
>mechanism across layers and obscures its natural unit of work.
>
>Make the folio the unit of vmemmap restoration and move the common
>mechanics behind a folio-oriented interface.  This keeps HugeTLB-specific
>eligibility and state in the caller and gives both directions of HVO
>consistent folio-level interfaces.
>
>No functional change intended.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>---
> mm/hugetlb_vmemmap.c | 37 +++++++++++++------------------------
> 1 file changed, 13 insertions(+), 24 deletions(-)
>
>diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
>index b76203e34881..97748a9cefe2 100644
>--- a/mm/hugetlb_vmemmap.c
>+++ b/mm/hugetlb_vmemmap.c
>@@ -360,28 +360,29 @@ static int vmemmap_optimize_folio(const struct folio *folio,
> }
> 
> /**
>- * vmemmap_remap_alloc - remap the vmemmap virtual address range [@start, end)
>- *			 to the page which is from the @vmemmap_pages
>- *			 respectively.
>- * @start:	start address of the vmemmap virtual address range that we want
>- *		to remap.
>- * @end:	end address of the vmemmap virtual address range that we want to
>- *		remap.
>- * @flags:	modifications to vmemmap_remap_walk flags
>+ * vmemmap_restore_folio - restore the vmemmap backing of a folio
>+ * @folio:	folio whose vmemmap pages should be restored.
>+ * @flags:	vmemmap remap control flags passed to vmemmap_remap_walk.
>+ *
>+ * Remap @folio's vmemmap so optimizable entries are restored from the shared
>+ * tail page back to distinct backing pages allocated for @folio, while
>+ * non-optimizable entries remain unchanged.
>  *
>  * Return: %0 on success, negative error code otherwise.
>  */
>-static int vmemmap_remap_alloc(unsigned long start, unsigned long end,
>-			       unsigned long flags)
>+static int vmemmap_restore_folio(const struct folio *folio, unsigned long flags)
> {
> 	LIST_HEAD(vmemmap_pages);
>-	int nid = page_to_nid((struct page *)start);
>+	int nid = folio_nid(folio);
>+	unsigned long start = (unsigned long)folio_page(folio, 0);
>+	unsigned long end = start + folio_vmemmap_size(folio);
> 	struct vmemmap_remap_walk walk = {
> 		.remap_pte	= vmemmap_restore_pte,
> 		.vmemmap_pages	= &vmemmap_pages,
> 		.flags		= flags,
> 	};
> 
>+	start += VMEMMAP_OPTIMIZATION_SIZE;
> 	if (alloc_vmemmap_page_list(&vmemmap_pages, (end - start) / PAGE_SIZE, nid))
> 		return -ENOMEM;
> 
>@@ -399,7 +400,6 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
> 					   struct folio *folio, unsigned long flags)
> {
> 	int ret;
>-	unsigned long vmemmap_start, vmemmap_end;
> 
> 	VM_WARN_ON_ONCE_FOLIO(!folio_test_hugetlb(folio), folio);
> 	VM_WARN_ON_ONCE_FOLIO(folio_ref_count(folio), folio);
>@@ -407,18 +407,7 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
> 	if (!folio_test_hugetlb_vmemmap_optimized(folio))
> 		return 0;
> 
>-	vmemmap_start	= (unsigned long)&folio->page;
>-	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
>-
>-	vmemmap_start	+= VMEMMAP_OPTIMIZATION_SIZE;
>-
>-	/*
>-	 * The pages which the vmemmap virtual address range [@vmemmap_start,
>-	 * @vmemmap_end) are mapped to are freed to the buddy allocator.
>-	 * When a HugeTLB page is freed to the buddy allocator, previously
>-	 * discarded vmemmap pages must be allocated and remapping.
>-	 */
>-	ret = vmemmap_remap_alloc(vmemmap_start, vmemmap_end, flags);
>+	ret = vmemmap_restore_folio(folio, flags);

Nit: we don't use h in __hugetlb_vmemmap_restore_folio() anymore. Could
we drop it from that helper while at it?

Otherwise, LGTM!

Reviewed-by: Lance Yang <lance.yang@linux.dev>
