Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792727936;
	b=NM4Qx8oEzcN8MayVz/5PZE6kv9aowXx2h6G07cN/opaylVFjlxAAhAKfYQERO6+pCuwp
	 Nk14C9kioxaH9RtLv9LwWwFJejErqdrAeY1WcoflIem1IhsdQnCASZOBkFreBMPGpGgp3
	 5cTxWZuLpKmTCyEpsu1ol8P8yqKm1v26hDAPOdrQkIJij/ZrZrFE5JXyabHwMBnIczGcL
	 IuZgFnTHXUSIIQnKYT06nwuq0nGUExKVtFcILNbIICOn9hDkjn0+zrfFuiyf/dIAtU9DY
	 yIwLRfVbkPhTnK6eK98zWlp4wDO+pCahgQ8Ct0iQ7H/TDotz1toeY6DOhaaHyDGlUuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792727936;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=OSGGcWSknPo+lf5UkWyamUe8j/Nkv4Dn4WtHUpxHvu4=;
	b=s+k1LBAMVsyXtWeeoFZsvqR9ng8pFfUSukM5Df2gJiH/pnYV5OOxfPZeCyUlJ+rzIMaX
	 DBdVLEz5kERvIchUQi/FC3mEpeoeDJmqYKKZ2LuDogBKtYbMHvaL4endmsf1Bk/R3koiz
	 kYKr1TeNfC7niU8IsVB27lYvr03xhY75ONpDNfNjnwveoy654qk5+0uUaOW26K1v12ubW
	 W3419xwyE8TpINGl9dQLNTv9O8rYxnlmTYuh9sR2pbg1tZ3h7ERg7KAZh7D3CbuNMGlAN
	 ya1eY2NaBa0Sb11STpxJLk1II1vmj714aJi07jW0Zv9glx41ADd1vwraL4M3t/lrzHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CQJekbjU;
	arc=none smtp.remote-ip=95.215.58.39
Received: from mta1.migadu.com (out-39.mta1.migadu.com [95.215.58.39])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C545606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C545606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CQJekbjU
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=usMhOa4kJEpoNozXrGaTkLUWHcNqguBASe33U6okgtk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792727933; v=1; x=1793332733;
 b=CQJekbjUBUGvE000P0fCTruIX4FpIQ7hmj1qoJUdRpEH0k/aM0DeCbjhT/2IFLKZHpj3xSKN
 uPkvJzPpTOfbDEwX2DCD2jvyPkKFxh/h/qHYhhFC3KAgWcx0HPE36/gtKlrdQO4trDFe2v/V+ej
 1QD4CGbpkxe+r1JTwSvj4ApE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ec97eec7ac5e72fb;
	Fri, 23 Oct 2026 03:58:53 +0000
X-Mizu-Trace-ID: ec97eec7ac5e72fb
X-Migadu-Flow: FLOW_OUT
Message-ID: <8570a18a-2ed3-4b31-98ae-c7f2a46eda44@linux.dev>
Date: Fri, 23 Oct 2026 11:58:50 +0800
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
Subject: Re: [PATCH 10/12] mm: hugetlb_vmemmap: make vmemmap restoration
 folio-oriented
To: Lance Yang <lance.yang@linux.dev>
Cc: osalvador@suse.de, akpm@linux-foundation.org, rppt@kernel.org,
 qi.zheng@linux.dev, jthoughton@google.com, david@kernel.org,
 songmuchun@bytedance.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261020115824.823278-9-songmuchun@bytedance.com>
 <20261023034655.37422-1-lance.yang@linux.dev>
Content-Language: en-US
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261023034655.37422-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/10/23 11:46, Lance Yang wrote:
> On Tue, Oct 20, 2026 at 07:58:22PM +0800, Muchun Song wrote:
>> Like optimization, vmemmap restoration operates on one folio at a time,
>> but the current interface exposes a raw address range and requires the
>> HugeTLB caller to prepare part of the operation.  This splits the common
>> mechanism across layers and obscures its natural unit of work.
>>
>> Make the folio the unit of vmemmap restoration and move the common
>> mechanics behind a folio-oriented interface.  This keeps HugeTLB-specific
>> eligibility and state in the caller and gives both directions of HVO
>> consistent folio-level interfaces.
>>
>> No functional change intended.
>>
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>> mm/hugetlb_vmemmap.c | 37 +++++++++++++------------------------
>> 1 file changed, 13 insertions(+), 24 deletions(-)
>>
>> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
>> index b76203e34881..97748a9cefe2 100644
>> --- a/mm/hugetlb_vmemmap.c
>> +++ b/mm/hugetlb_vmemmap.c
>> @@ -360,28 +360,29 @@ static int vmemmap_optimize_folio(const struct folio *folio,
>> }
>>
>> /**
>> - * vmemmap_remap_alloc - remap the vmemmap virtual address range [@start, end)
>> - *			 to the page which is from the @vmemmap_pages
>> - *			 respectively.
>> - * @start:	start address of the vmemmap virtual address range that we want
>> - *		to remap.
>> - * @end:	end address of the vmemmap virtual address range that we want to
>> - *		remap.
>> - * @flags:	modifications to vmemmap_remap_walk flags
>> + * vmemmap_restore_folio - restore the vmemmap backing of a folio
>> + * @folio:	folio whose vmemmap pages should be restored.
>> + * @flags:	vmemmap remap control flags passed to vmemmap_remap_walk.
>> + *
>> + * Remap @folio's vmemmap so optimizable entries are restored from the shared
>> + * tail page back to distinct backing pages allocated for @folio, while
>> + * non-optimizable entries remain unchanged.
>>   *
>>   * Return: %0 on success, negative error code otherwise.
>>   */
>> -static int vmemmap_remap_alloc(unsigned long start, unsigned long end,
>> -			       unsigned long flags)
>> +static int vmemmap_restore_folio(const struct folio *folio, unsigned long flags)
>> {
>> 	LIST_HEAD(vmemmap_pages);
>> -	int nid = page_to_nid((struct page *)start);
>> +	int nid = folio_nid(folio);
>> +	unsigned long start = (unsigned long)folio_page(folio, 0);
>> +	unsigned long end = start + folio_vmemmap_size(folio);
>> 	struct vmemmap_remap_walk walk = {
>> 		.remap_pte	= vmemmap_restore_pte,
>> 		.vmemmap_pages	= &vmemmap_pages,
>> 		.flags		= flags,
>> 	};
>>
>> +	start += VMEMMAP_OPTIMIZATION_SIZE;
>> 	if (alloc_vmemmap_page_list(&vmemmap_pages, (end - start) / PAGE_SIZE, nid))
>> 		return -ENOMEM;
>>
>> @@ -399,7 +400,6 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
>> 					   struct folio *folio, unsigned long flags)
>> {
>> 	int ret;
>> -	unsigned long vmemmap_start, vmemmap_end;
>>
>> 	VM_WARN_ON_ONCE_FOLIO(!folio_test_hugetlb(folio), folio);
>> 	VM_WARN_ON_ONCE_FOLIO(folio_ref_count(folio), folio);
>> @@ -407,18 +407,7 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
>> 	if (!folio_test_hugetlb_vmemmap_optimized(folio))
>> 		return 0;
>>
>> -	vmemmap_start	= (unsigned long)&folio->page;
>> -	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
>> -
>> -	vmemmap_start	+= VMEMMAP_OPTIMIZATION_SIZE;
>> -
>> -	/*
>> -	 * The pages which the vmemmap virtual address range [@vmemmap_start,
>> -	 * @vmemmap_end) are mapped to are freed to the buddy allocator.
>> -	 * When a HugeTLB page is freed to the buddy allocator, previously
>> -	 * discarded vmemmap pages must be allocated and remapping.
>> -	 */
>> -	ret = vmemmap_remap_alloc(vmemmap_start, vmemmap_end, flags);
>> +	ret = vmemmap_restore_folio(folio, flags);
> Nit: we don't use h in __hugetlb_vmemmap_restore_folio() anymore. Could
> we drop it from that helper while at it?

You're really thorough. That's actually something on my follow-up series,
so I didn't include it in the current one.

>
> Otherwise, LGTM!
>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>

Thanks.

