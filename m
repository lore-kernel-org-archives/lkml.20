Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792722732;
	b=tXsX4Y54RUzhhKdZmUxfwOCxaZ1S9LXG+357Y7sXBQ3W1OaO/OnWH3xV4qjM4iJC6xMJ
	 6BJ/1DVVxiXfZ5gnJUjjfi0yNcojOkuAHp7ipGZmBXVb+PD06GKJNkWGrpXHgZ5thNOW8
	 rKxN7eLZGFXBafcVETkbM4538ar+W4cMim2AV3JnIho4w3W7xO7kTucuACyjlNLC/gWwc
	 l1BjWtSmZNzezFcCEHiqIEAR4xsxvVR6IsWfwt0+obL2paG3GtJ4gOXYjG6MszZ1maM6N
	 SAXyJRBMbgwRQ9PXf4hXYqCW37mKObQvaktPHcNmIU7lh/JBiCRM8D5kalA+GPb1u+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792722732;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=r7c3swfnj+SAiJYhFBwLA8X/WD+blCLvWAWJF6ltOFs=;
	b=5iyVWAGAonocSW+jPAacKQ1RLJO7Ykt1W3y4/3G3eqpNFf8tE6JxI+5TTTzbgIS0kZ4C
	 GZmww6obkjXb/kQToURaHynkDTqlyKhheVKEHU7/Kle2rZgnPMa9Qv1dLO2bWpXHVXKrN
	 xtGlhtEKyhcgZmhAN3qOffXBVz9mRC08w/nVOdjNcpM/hrVLOlUO92ZUuM6uNF6ajLnm0
	 9SUSfeMVEpK69NYcVTiPMo7zCy2App7uEGx4RO4clpVrF+/HQntKXjhntpqcxgug3BVUa
	 NsUslT9xGRpraBbMPGu7Kfz6wCkaxzFRctX7jmkkA4e2Gds0+43arue5Ox4HuMODFIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nzA2GmE4;
	arc=none smtp.remote-ip=91.218.175.95
Received: from mta0.migadu.com (out-95.mta0.migadu.com [91.218.175.95])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3117606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:32:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3117606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nzA2GmE4
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Kl4/f0wED6XjvWDZ9iOMhZfzmTjfloXcrEiM0IjOl9A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792722728; v=1; x=1793327528;
 b=nzA2GmE4Yh/G+hp15F1INaQ8plk0J9EG26KOPWZNUJzG2EKZfo00IeFbc+OMmoF+Enswn2Kr
 oCsefht8iJ372OlQ3fHcMiY5NtNuYhvhN/3Qw1RylNDFF+JzAQWqH+bhYuMPHwDMckBQRm2dPrX
 E4LJMcZddlMBGt1Wzx4Xi4vQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4ce4a1801382ae1c;
	Fri, 23 Oct 2026 02:32:08 +0000
X-Mizu-Trace-ID: 4ce4a1801382ae1c
X-Migadu-Flow: FLOW_OUT
Message-ID: <a340ec5a-c50b-4fa3-b325-52dba86f0015@linux.dev>
Date: Fri, 23 Oct 2026 10:32:05 +0800
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
Subject: Re: [PATCH 07/12] mm: hugetlb_vmemmap: simplify shared tail page
 handling
To: Lance Yang <lance.yang@linux.dev>
Cc: osalvador@suse.de, akpm@linux-foundation.org, rppt@kernel.org,
 qi.zheng@linux.dev, jthoughton@google.com, david@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Muchun Song <songmuchun@bytedance.com>
References: <20261020115824.823278-6-songmuchun@bytedance.com>
 <20261023022027.25898-1-lance.yang@linux.dev>
Content-Language: en-US
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261023022027.25898-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/10/23 10:20, Lance Yang wrote:
> On Tue, Oct 20, 2026 at 07:58:19PM +0800, Muchun Song wrote:
>> The remap walker currently carries a shared tail page selected by its
>> caller, even though the optimize and restore callbacks can derive the
>> same information from the folio being processed.  This adds redundant
>> state to the walker and couples its interface to caller-side preparation.
>>
>> Derive the shared mapping state in the callbacks instead, keeping the
>> mapping policy with the PTE being processed and simplifying the remap
>> interface.
>>
>> No functional change intended.
>>
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>> include/linux/vmemmap-optimization.h |  6 +-
>> mm/hugetlb_vmemmap.c                 | 89 ++++++++++++----------------
>> mm/mm_init.c                         |  6 +-
>> mm/sparse-vmemmap.c                  |  5 +-
>> 4 files changed, 49 insertions(+), 57 deletions(-)
>>
>> diff --git a/include/linux/vmemmap-optimization.h b/include/linux/vmemmap-optimization.h
>> index 065840f3c241..858311a71b0c 100644
>> --- a/include/linux/vmemmap-optimization.h
>> +++ b/include/linux/vmemmap-optimization.h
>> @@ -91,11 +91,13 @@ static inline struct page *vmemmap_shared_tail_page(unsigned int order,
>> }
>> #endif /* CONFIG_VMEMMAP_OPTIMIZATION */
>>
>> -static inline bool vmemmap_optimizable_pfn(unsigned long pfn)
>> +static inline bool vmemmap_optimizable_pfn(unsigned long pfn, unsigned int order)
>> {
>> -	const unsigned int order = pfn_to_section_compound_order(pfn);
>> 	const unsigned long nr_pages = 1UL << order;
>>
>> +	if (!IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION))
>> +		return false;
>> +
>> 	if (!is_power_of_2(sizeof(struct page)))
>> 		return false;
>>
>> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
>> index 18b72d553955..8fac61b7d74a 100644
>> --- a/mm/hugetlb_vmemmap.c
>> +++ b/mm/hugetlb_vmemmap.c
>> @@ -24,22 +24,18 @@
>>   * struct vmemmap_remap_walk - walk vmemmap page table
>>   *
>>   * @remap_pte:		called for each lowest-level entry (PTE).
>> - * @nr_walked:		the number of walked pte.
>> - * @vmemmap_tail:	the page to be installed as non-first in the vmemmap range
>> + * @nr_walked:		the number of PTEs successfully remapped.
>>   * @vmemmap_pages:	the list head of the vmemmap pages that can be freed
>>   *			or is mapped from.
>>   * @flags:		used to modify behavior in vmemmap page table walking
>>   *			operations.
>>   */
>> struct vmemmap_remap_walk {
>> -	void			(*remap_pte)(pte_t *pte, unsigned long addr,
>> +	int			(*remap_pte)(pte_t *pte, unsigned long addr,
>> 					     struct vmemmap_remap_walk *walk);
>> -
>> 	unsigned long		nr_walked;
>> -	struct page		*vmemmap_tail;
>> 	struct list_head	*vmemmap_pages;
>>
>> -
>> /* Skip the TLB flush while updating the vmemmap page tables. */
>> #define VMEMMAP_REMAP_NO_TLB_FLUSH	BIT(0)
>> 	unsigned long		flags;
>> @@ -140,12 +136,14 @@ static int vmemmap_pmd_entry(pmd_t *pmd, unsigned long addr,
>> static int vmemmap_pte_entry(pte_t *pte, unsigned long addr,
>> 			     unsigned long next, struct mm_walk *walk)
>> {
>> +	int ret;
>> 	struct vmemmap_remap_walk *vmemmap_walk = walk->private;
>>
>> -	vmemmap_walk->remap_pte(pte, addr, vmemmap_walk);
>> -	vmemmap_walk->nr_walked++;
>> +	ret = vmemmap_walk->remap_pte(pte, addr, vmemmap_walk);
>> +	if (!ret)
>> +		vmemmap_walk->nr_walked++;
>>
>> -	return 0;
>> +	return ret;
>> }
>>
>> static const struct mm_walk_ops vmemmap_remap_ops = {
>> @@ -213,51 +211,51 @@ static struct page *vmemmap_dup_page_from_list(const struct page *src,
>> 	return dst;
>> }
>>
>> -static void vmemmap_optimize_pte(pte_t *pte, unsigned long addr,
>> -				 struct vmemmap_remap_walk *walk)
>> +static inline struct page *folio_vmemmap_shared_tail_page(const struct folio *folio)
>> {
>> -	struct page *page = pte_page(ptep_get(pte));
>> -	pte_t entry;
>> -
>> -	/* Remapping the head page requires r/w */
>> -	if (unlikely(walk->nr_walked == 0)) {
>> -		struct page *head;
>> +	return vmemmap_shared_tail_page(folio_order(folio), folio_zone(folio));
>> +}
>>
>> -		VM_WARN_ON_ONCE(!PageHead((const struct page *)addr));
>> +static int vmemmap_optimize_pte(pte_t *pte, unsigned long addr,
>> +				struct vmemmap_remap_walk *walk)
>> +{
>> +	pte_t entry;
>> +	struct page *src = pte_page(ptep_get(pte)), *dst;
>> +	const struct page *page = (const struct page *)addr;
>> +	const struct folio *folio = page_folio(page);
>>
>> -		head = vmemmap_dup_page_from_list(page, walk->vmemmap_pages);
>> -		entry = mk_pte(head, PAGE_KERNEL);
>> +	if (likely(vmemmap_optimizable_pfn(page_to_pfn(page), folio_order(folio)))) {
>> +		dst = folio_vmemmap_shared_tail_page(folio);
>> +		if (!dst)
>> +			return -ENOMEM;
> One thing caught my eye here ... shared tail allocation can now fail after
> we've already remapped the head.

Right. Once the shared page has been allocated successfully, this
shouldn't be a common case.

>
> IIUC, nothing to worry about there, though :) since rollback keeps the
> new head mapped and flushes before clearing the optimized flag or freeing
> the old backing page.

Yes.

>
> [...]
>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>

Thanks.
