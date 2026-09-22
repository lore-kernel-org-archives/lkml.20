Received: from mta0.migadu.com (out-95.mta0.migadu.com [91.218.175.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3BF522EF3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064192; cv=none; b=sh2YFsCZT6Jqz6F6l16CLkDl1/inqKh6Q2rXckyuTtwA45IjVYXsnYyiwI5v2zgpHCOCgVWo8k9jhXpoFW/uYiZuCerSsuhy8Mz3QEzQpCn72tIkaIScdVneQuPcxjEpTh2WMHR9MNShjOs8gApOAYKPLeUwwdZIW3uo5bJWcFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064192; c=relaxed/simple;
	bh=EOuJmH4XWkfRTntzYM5OUcyHR52bdbnBGOL16e7ckho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jCjmB5HzWdL4+AiJ3iEuypbHaRFuGv0fH2B4tkjzCv0hZsvioJE0FNvYifcu1o51AKPjAO0OOU4rJlJAFMBVe2bAKBIXrq9Tkh4rOx5PCVA52lo1CXV5ONIu5md4m0/qv2KPaxHBo/mG7Cur7WveADjs3+F7xvbcq7DP5EgT8sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZvTATnpc; arc=none smtp.client-ip=91.218.175.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZvTATnpc"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EOuJmH4XWkfRTntzYM5OUcyHR52bdbnBGOL16e7ckho=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790064174; v=1; x=1790668974;
 b=ZvTATnpcs/aV2Gp6tFIYAKaMInDABpGmadf6B4ywmoM/dKY81t6WWonTc/xQIiiGzxDpISRp
 dWyIi2RfJ38BfXFUjGjShW2JP+fE1aLsyWEiC1zqhs5ysNLcLIJCzASqGJxIsNKhCMmc/UgBPQ8
 rYdiNHOj6E6NXUavHx+h5MoA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 432c8cc7e60c9375;
	Tue, 22 Sep 2026 08:02:54 +0000
X-Mizu-Trace-ID: 432c8cc7e60c9375
X-Migadu-Flow: FLOW_OUT
Message-ID: <dad55fc6-56ff-4375-893b-938404238ca8@linux.dev>
Date: Tue, 22 Sep 2026 16:02:45 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] mm/sparse-vmemmap: support device DAX in common
 vmemmap path
To: Muchun Song <songmuchun@bytedance.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, muchun.song@linux.dev
References: <20260913083734.86802-1-songmuchun@bytedance.com>
 <20260913083734.86802-3-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20260913083734.86802-3-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/13/26 4:37 PM, Muchun Song wrote:
> The common vmemmap population path cannot yet handle optimized Device DAX
> mappings on its own. It uses pfn_to_zone() to find the shared tail page,
> but Device DAX populates its vmemmap at runtime before the ZONE_DEVICE span
> is initialized.
> 
> Teach the common path to use device_zone() for runtime optimized vmemmap
> population while retaining pfn_to_zone() for early boot. This allows the
> same path to support both early boot mappings and Device DAX.
> 
> The backing PFN supplied by the Device DAX-specific population path is no
> longer used, allowing the redundant lookup and population code to be
> removed later.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   mm/sparse-vmemmap.c | 44 +++++++++++++++++++-------------------------
>   1 file changed, 19 insertions(+), 25 deletions(-)
> 
> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
> index 878d29a4e862..e83821768c12 100644
> --- a/mm/sparse-vmemmap.c
> +++ b/mm/sparse-vmemmap.c
> @@ -208,18 +208,27 @@ static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
>   	struct page *page;
>   	const unsigned int order = pfn_to_section_compound_order(pfn);
>   
> -	/*
> -	 * Device DAX still relies on vmemmap_populate_compound_pages() for
> -	 * head/first-tail allocation and tail-page reuse.
> -	 */
>   	if (!vmemmap_optimizable_pfn(pfn))
>   		return vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
>   
> -	zone = pfn_to_zone(pfn, node);
> +	/*
> +	 * At runtime (slab available), only ZONE_DEVICE pages trigger vmemmap
> +	 * optimization, so device_zone() suffices. Note that pfn_to_zone()
> +	 * cannot be used at runtime because the zone span is not set up now.
> +	 */
> +	zone = slab_is_available() ? device_zone(node) : pfn_to_zone(pfn, node);
>   	page = vmemmap_shared_tail_page(order, zone);
>   	if (!page)
>   		return NULL;
>   
> +	/*
> +	 * When a PTE entry is freed, a free_pages() call occurs. This get_page()
> +	 * pairs with put_page_testzero() on the freeing path. This can only occur
> +	 * when slab is available.
> +	 */
> +	if (slab_is_available())

Would it make sense to introduce a helper function that wraps
slab_is_available() for better readability? Also, it might be worth
adding a comment to the helper function as well.

At least for me, encountering this always causes a moment of confusion.

> +		get_page(page);
> +
>   	return page_address(page);
>   }
>   
> @@ -231,27 +240,12 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
>   
>   	if (pte_none(ptep_get(pte))) {
>   		pte_t entry;
> +		void *p = vmemmap_alloc_pte(pfn, node, altmap);
>   
> -		if (ptpfn == (unsigned long)-1) {
> -			void *p = vmemmap_alloc_pte(pfn, node, altmap);
> -
> -			if (!p)
> -				return NULL;
> -			ptpfn = PHYS_PFN(__pa(p));
> -		} else {
> -			/*
> -			 * When a PTE/PMD entry is freed from the init_mm
> -			 * there's a free_pages() call to this page allocated
> -			 * above. Thus this get_page() is paired with the
> -			 * put_page_testzero() on the freeing path.
> -			 * This can only called by certain ZONE_DEVICE path,
> -			 * and through vmemmap_populate_compound_pages() when
> -			 * slab is available.
> -			 */
> -			if (slab_is_available())
> -				get_page(pfn_to_page(ptpfn));
> -		}
> -		entry = pfn_pte(ptpfn, PAGE_KERNEL);
> +		if (!p)
> +			return NULL;
> +
> +		entry = pfn_pte(PHYS_PFN(__pa(p)), PAGE_KERNEL);
>   		set_pte_at(&init_mm, addr, pte, entry);
>   	} else if (WARN_ON_ONCE(vmemmap_optimizable_pfn(pfn)))
>   		return NULL;

