Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794023583;
	b=H4kneYv6JLzX/fIO4iz9xPGyJN5o3CVvd7lodLE/qlNZk30nc03Ul9UsZei+KwTY+3Xs
	 BLLCrGfdg8SRd8P9XxEnZDRBYvZULU68+GhbLRUslKAYWqQg0lsMIxLEkKS/rwZ1nNnus
	 RBKoX8enbL/NPIPeoEqMh1YLG08wb8Phkp/90vh4X84UQ8PK4JhTlp/UtmlQuDuXuW4yi
	 hjMfNlqbNLUF3vHvZI2Lv3e+qzmmWmgMT1uv1JJ4ev+pqissyHaJ1eVGOAsw9JbZJlPDw
	 674v57iLmm3aIGlnVnsU7gGKpJnPwilLwLsi1xcnbOmR5wXVSSEinF+kRrmvFx/ws0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794023583;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ner3iiszqjA2gB2L+tmjkpwZjCeaE3ezc3JeQhoS9bY=;
	b=KJzic4GvAnKQ1cPIGsT+o9W8F9KbBY8RRudwtMkAyl1vAHCDnSM9lv8aJwBtekYM1Ht4
	 d2Wi5MdOCLKxDFzyziQ7itEHqXa2PllRMb7EezXu2D2xJGV0Oa9V4VaT+OurLtp3E1UeC
	 sU/0zOhyLt3JHpU+E797ylgoEjpjBE91kP5rMekNDWdbFIMZnn41lrtSqG19yn3f0C2tv
	 soRvLxzI5UWBonCzWkUMBhT6AyKXQRrgCYIXNyviNBfNjYEg67C7Qlh5rM9VcTRfyUSAQ
	 WU38B5Vt2A6+rU1hfp+ZqJzdKGYWhn51EtSuH9JVkHeDDO+Pgc6m5m3P0gL+1f3Jodw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=XIC548ok;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1449D606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 03:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=XIC548ok
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 943F21F0089F;
	Sat,  7 Nov 2026 03:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794023582;
	bh=Ner3iiszqjA2gB2L+tmjkpwZjCeaE3ezc3JeQhoS9bY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=XIC548okmbhMJGvvJaj3PaAegr2ndah8JUK4KO5IAVjSzGWzPFM9FdcTRi5DBqQ4E
	 gj8CNldOz4UC3PkKiPZGegeHkbjEPm1RjSZVBrJien13m7V7ascsvacFjWcv6mApfB
	 5MaWva4dEgWUDpIVZdDk8OBmYxZm7Q3aPtnLexRI=
Date: Fri, 6 Nov 2026 19:53:02 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>, Qi
 Zheng <qi.zheng@linux.dev>, Lance Yang <lance.yang@linux.dev>, James
 Houghton <jthoughton@google.com>, David Hildenbrand <david@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, Yili Zhang <zhangyili01@baidu.com>,
 Kiryl Shutsemau <kas@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/13] mm: Decouple folio-based vmemmap optimization
 from HugeTLB
Message-Id: <20261106195302.fd572ac49e52af9e305cbcef@linux-foundation.org>
In-Reply-To: <20261107022756.77731-1-songmuchun@bytedance.com>
References: <20261107022756.77731-1-songmuchun@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat,  7 Nov 2026 10:27:43 +0800 Muchun Song <songmuchun@bytedance.com> wrote:

> Hi,
> 
> Section-based vmemmap optimization is implemented in sparse-vmemmap.c,
> while folio-based optimization currently lives in hugetlb_vmemmap.c.
> The latter is tightly coupled to HugeTLB-specific state even though the
> underlying page-table remapping operates on one folio at a time.
> 
> To make these interfaces easier to maintain, the folio-based remapping
> mechanics first need a boundary that is independent of HugeTLB-specific
> state and raw address ranges. This will allow the mechanics to be moved
> into a common vmemmap optimization layer alongside the section-based
> interface.
> 
> This series establishes that boundary through three folio-oriented
> operations, each with a distinct role:
> 
>   - vmemmap_optimize_folio() optimizes the vmemmap backing of a folio;
>   - vmemmap_restore_folio() restores the vmemmap backing of a folio; and
>   - vmemmap_pteify_folio() converts the vmemmap backing of a folio to
>     PTE mappings.
> 
> Together, these operations encapsulate the address-range calculation and
> remapping mechanics for a folio. HugeTLB wrappers retain policy decisions
> such as eligibility, optimized state, batching and TLB flush handling.

Thanks, I've update mm.git's mm-unstable branch to this version.

> v4:
> - Rebase onto mm/mm-new at f735a2c21aa9
> - Split the HVO head-page allocation fix into a standalone prerequisite
>   and retain Yili Zhang as its author
> - Add __GFP_NOWARN and pass caller-selected GFP masks through the
>   generalized allocator and folio-oriented helpers
> - Propagate alloc_vmemmap_page_list() errors directly (suggested by Oscar
>   Salvador)
> - Remove the redundant order check from vmemmap_pteify_folio() (suggested
>   by Oscar Salvador)
> - Collect Reviewed-by tags from Oscar Salvador and Mike Rapoport
> - Collect Tested-by from Andrew Morton

Here's how v4 altered mm.git:


 mm/hugetlb_vmemmap.c |   32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

--- a/mm/hugetlb_vmemmap.c~b
+++ a/mm/hugetlb_vmemmap.c
@@ -198,13 +198,13 @@ static void free_vmemmap_page_list(struc
 }
 
 static int alloc_vmemmap_page_list(struct list_head *head,
-		unsigned int nr_pages, int nid)
+		unsigned int nr_pages, int nid, gfp_t gfp_mask)
 {
-	LIST_HEAD(new_pages);
 	struct page *page, *next;
+	LIST_HEAD(new_pages);
 
 	for (unsigned int i = 0; i < nr_pages; i++) {
-		page = alloc_pages_node(nid, GFP_KERNEL | __GFP_RETRY_MAYFAIL, 0);
+		page = alloc_pages_node(nid, gfp_mask | __GFP_RETRY_MAYFAIL, 0);
 		if (!page)
 			goto free_pages;
 		list_add(&page->lru, &new_pages);
@@ -312,14 +312,11 @@ static inline int vmemmap_restore_range(
  */
 static int vmemmap_pteify_folio(const struct folio *folio, unsigned long flags)
 {
+	unsigned long start = (unsigned long)folio_page(folio, 0);
+	unsigned long end = start + folio_vmemmap_size(folio);
 	struct vmemmap_remap_walk walk = {
 		.flags		= flags,
 	};
-	unsigned long start = (unsigned long)folio_page(folio, 0);
-	unsigned long end = start + folio_vmemmap_size(folio);
-
-	if (!vmemmap_optimizable_order(folio_order(folio)))
-		return -EOPNOTSUPP;
 
 	return vmemmap_remap_range(start, end, &walk);
 }
@@ -341,9 +338,10 @@ static int vmemmap_pteify_folio(const st
 static int vmemmap_optimize_folio(const struct folio *folio,
 		struct list_head *vmemmap_pages, unsigned long flags)
 {
-	int ret, nid = folio_nid(folio);
 	unsigned long start = (unsigned long)folio_page(folio, 0);
 	unsigned long end = start + folio_vmemmap_size(folio);
+	gfp_t gfp_mask = GFP_KERNEL | __GFP_NOWARN;
+	int ret, nid = folio_nid(folio);
 	struct vmemmap_remap_walk walk = {
 		.remap_pte	= vmemmap_optimize_pte,
 		.vmemmap_pages	= vmemmap_pages,
@@ -355,8 +353,10 @@ static int vmemmap_optimize_folio(const
 	if (!vmemmap_optimizable_order(folio_order(folio)))
 		return -EOPNOTSUPP;
 
-	if (alloc_vmemmap_page_list(vmemmap_pages, VMEMMAP_OPTIMIZATION_PAGES, nid))
-		return -ENOMEM;
+	ret = alloc_vmemmap_page_list(vmemmap_pages, VMEMMAP_OPTIMIZATION_PAGES,
+				      nid, gfp_mask);
+	if (ret)
+		return ret;
 
 	ret = vmemmap_remap_range(start, end, &walk);
 	if (!ret || !walk.nr_walked)
@@ -381,14 +381,16 @@ static int vmemmap_optimize_folio(const
  */
 static int vmemmap_restore_folio(const struct folio *folio, unsigned long flags)
 {
-	LIST_HEAD(vmemmap_pages);
-	int nid = folio_nid(folio);
 	unsigned long start = (unsigned long)folio_page(folio, 0);
 	unsigned long end = start + folio_vmemmap_size(folio);
+	int ret, nid = folio_nid(folio);
+	LIST_HEAD(vmemmap_pages);
 
 	start += VMEMMAP_OPTIMIZATION_SIZE;
-	if (alloc_vmemmap_page_list(&vmemmap_pages, (end - start) / PAGE_SIZE, nid))
-		return -ENOMEM;
+	ret = alloc_vmemmap_page_list(&vmemmap_pages, (end - start) / PAGE_SIZE,
+				      nid, GFP_KERNEL);
+	if (ret)
+		return ret;
 
 	return vmemmap_restore_range(start, end, &vmemmap_pages, flags);
 }
_

