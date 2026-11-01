Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793514702;
	b=CJ781kXOtQ7oxNfsa9WcYmcDuc1WdplshQeOq/19KvPSp5y/sMDa8EqhuZbMjw4lM13g
	 UEBJ5/eSkF+MvL/hlnXVf3rkosC7y6VLPSLsJ2qFn53RMhYk84tmMflRG96zFsWhgMXyH
	 wCrT2jE7YjCz0cBQBGG5OCXNc6FSOokgxJ6sTE7xTGEnbSizFp4IukVRq5MWJMpUEONoc
	 1nRy3kWTL2batfY5m5C1/TX0asvIKaQOc1bDyRwz9tKNi/LfGchno3G1aMlc1j+wEsQbv
	 rm0hOZvXClSmkXKNDA/mpR2Qi1BDpvURdv/JuurxArcJEJr+mDJspN/iS0KuHfOz1tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793514702;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=J/f/Ic8iNRBscTPM/Roy1R1y5UupvBWWJfdvYPp6M38=;
	b=Xl0BRXgObPUIFu0YGOv6cuEm7CqUBBpnxswgpcfDFKG2kiYyPuxgf9W/WNOt5ZO7ltsT
	 TYmevXqzOZEzZTIowoSM4A3hFFnmVX8jh+2J3gnxbKh297j0tYA2X3xJSRWMnjm3RD0Hh
	 sbXCt5Co5HxBPkCRvBUQexkmH5LZ6xgykPFUruJzG3CUoy9oCgsiAe2TopnJJYbF88KH6
	 E+Y9hLSYM4p/jYqOlKS6OZFsRceKv0GojRGvXkW1gM4Sk1HIMKQjeFT7jnqc0np0oSU8Y
	 47xsY3Wh49v2cLiq608L3tDAJqJHx3h0rYKKDMX70Bzd4zm6VNTesqcZPfQp4KIR8qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xY+HVFBq;
	arc=none smtp.remote-ip=95.215.58.104
Received: from mta1.migadu.com (out-104.mta1.migadu.com [95.215.58.104])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F98606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 06:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49F98606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xY+HVFBq
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MQQBK01CLkmuEldY36FpAZR9pIhbrpe/1CRm0UOIKVA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793514699; v=1; x=1794119499;
 b=xY+HVFBqLlL29sSlrtuRKeI04WYPdqOOYeX/KNUAtfX3c07DyoO6W0VNhOpCy95Jp7sUzoC3
 eofCnKq9srkbprjgFaMDAzpGHPTPMtTcjDvGWNZ4gk4eB09LFzDOEivHvFWo/EOOvWci8ghNCj+
 9oQG35VurhFDKW+oduG9lJt4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7f876ae71b4a29e6;
	Sun, 01 Nov 2026 06:31:39 +0000
X-Mizu-Trace-ID: 7f876ae71b4a29e6
X-Migadu-Flow: FLOW_OUT
Message-ID: <587556c5-389f-4616-99f9-f0216b72f112@linux.dev>
Date: Sun, 1 Nov 2026 14:31:33 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] mm: hugetlb_vmemmap: simplify vmemmap head page
 handling
To: Muchun Song <songmuchun@bytedance.com>, Oscar Salvador
 <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Cc: Lance Yang <lance.yang@linux.dev>, James Houghton
 <jthoughton@google.com>, David Hildenbrand <david@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261020115306.813483-1-songmuchun@bytedance.com>
 <20261020115824.823278-1-songmuchun@bytedance.com>
 <20261020115824.823278-2-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20261020115824.823278-2-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/20/26 7:58 PM, Muchun Song wrote:
> The new head page is already tracked on the vmemmap page list before
> remapping starts.  Passing it separately gives the remap walker two
> ways to refer to the same page and unnecessarily complicates its
> interface.
> 
> Use the page list as the single handoff mechanism for the head page,
> removing the redundant state from the walker.
> 
> No functional change intended.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   mm/hugetlb_vmemmap.c | 17 +++++++----------
>   1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index 8b3abb562599..164e93e980bf 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -25,7 +25,6 @@
>    *
>    * @remap_pte:		called for each lowest-level entry (PTE).
>    * @nr_walked:		the number of walked pte.
> - * @vmemmap_head:	the page to be installed as first in the vmemmap range
>    * @vmemmap_tail:	the page to be installed as non-first in the vmemmap range
>    * @vmemmap_pages:	the list head of the vmemmap pages that can be freed
>    *			or is mapped from.

The @vmemmap_pages description may need updating as well. After this
change, the list is no longer only an output list for pages to be freed;
its first entry is also consumed as the new head backing page. It would
be helpful to document this input contract explicitly.

Other than that, once Lance's comment is addressed:

Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

> @@ -37,7 +36,6 @@ struct vmemmap_remap_walk {
>   					     struct vmemmap_remap_walk *walk);
>   
>   	unsigned long		nr_walked;
> -	struct page		*vmemmap_head;
>   	struct page		*vmemmap_tail;
>   	struct list_head	*vmemmap_pages;
>   
> @@ -208,10 +206,13 @@ static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
>   	pte_t entry;
>   
>   	/* Remapping the head page requires r/w */
> -	if (unlikely(walk->nr_walked == 0 && walk->vmemmap_head)) {
> +	if (unlikely(walk->nr_walked == 0)) {
> +		struct page *head;
> +
>   		VM_WARN_ON_ONCE(!PageHead((const struct page *)addr));
>   
> -		list_del(&walk->vmemmap_head->lru);
> +		head = list_first_entry(walk->vmemmap_pages, struct page, lru);
> +		list_del(&head->lru);
>   
>   		/*
>   		 * Makes sure that preceding stores to the page contents from
> @@ -220,7 +221,7 @@ static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
>   		 */
>   		smp_wmb();
>   
> -		entry = mk_pte(walk->vmemmap_head, PAGE_KERNEL);
> +		entry = mk_pte(head, PAGE_KERNEL);
>   	} else {
>   		VM_WARN_ON_ONCE(!PageTail((const struct page *)addr));
>   
> @@ -289,7 +290,6 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end)
>    *		to remap.
>    * @end:	end address of the vmemmap virtual address range that we want to
>    *		remap.
> - * @vmemmap_head: the page to be installed as first in the vmemmap range
>    * @vmemmap_tail: the page to be installed as non-first in the vmemmap range
>    * @vmemmap_pages: list to deposit vmemmap pages to be freed.  It is callers
>    *		responsibility to free pages.
> @@ -298,7 +298,6 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end)
>    * Return: %0 on success, negative error code otherwise.
>    */
>   static int vmemmap_remap_free(unsigned long start, unsigned long end,
> -			      struct page *vmemmap_head,
>   			      struct page *vmemmap_tail,
>   			      struct list_head *vmemmap_pages,
>   			      unsigned long flags)
> @@ -306,7 +305,6 @@ static int vmemmap_remap_free(unsigned long start, unsigned long end,
>   	int ret;
>   	struct vmemmap_remap_walk walk = {
>   		.remap_pte	= vmemmap_remap_pte,
> -		.vmemmap_head	= vmemmap_head,
>   		.vmemmap_tail	= vmemmap_tail,
>   		.vmemmap_pages	= vmemmap_pages,
>   		.flags		= flags,
> @@ -547,8 +545,7 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
>   	 * they can be freed by the caller.
>   	 */
>   	ret = vmemmap_remap_free(vmemmap_start, vmemmap_end,
> -				 vmemmap_head, vmemmap_tail,
> -				 vmemmap_pages, flags);
> +				 vmemmap_tail, vmemmap_pages, flags);
>   out:
>   	if (ret)
>   		folio_clear_hugetlb_vmemmap_optimized(folio);

