Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794885107;
	b=vwdY5nDgxDEHV2E07b+mp4tmKCvprgh/87JP3GzMwCzg0RJGcqQdpuECuEGnuMeSAtsY
	 N81uogkUulbE22hIZUY0gfx3Zz594bqbbg2prP1WARM0vTYEMKHJiizZOYVIgeROUHszj
	 Ldo5eBCBidsBJ2fto8HhKd4ik2c5/lc04z99x3bEsbHALbjQ3+gbi+S4DtzNy67DMw/6w
	 5o/U1Y46CvzTGD9TePgZ+zyXYOuTNoFRfS6ej4HXetcPaGyr/YagUVpox3Nd0GoB5uAyH
	 Mao6f3IKctyAdtCmTSw/Amndr/8r2Y63vFR/ECztLCv3XxZojkOGp2J0IAamSpCjy9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885107;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=qQu7ydPyiXxJnszdjAuda6MBtG/hw6yFx+eKHBW3+tU=;
	b=zI/ex82acZawB0pF+hIrHh3KxPG9w2LpNGVUlgNN+QK9O33DpK2hHgY0xsFv3Ea/25C8
	 u/nEF6OH+LuXtG2YnfNLTFPPjDu1u24IBXX8iRbT05xSzZbYUsq5SLHNEK/J9No2ELNXT
	 yp6k+kOksLDkw8RXV6TdAE1nAq4t1d536I4b9qgHMX1+Siduwn7KsEQWItPAm8drXrbKl
	 +FWsYC4vJ0fIv9W68TPiI9MvsxMANzwa3LcVThqHCtyGKWC4sQcZ0yrUiq0HVAfFSLnTO
	 XjOvzqKlcS0adUc727cZbP2KsOwGWCaYISA7Wk/csVPNqGLvMecX4w8wMyrukVYpL8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HbqWS3zd;
	arc=none smtp.remote-ip=95.215.58.172
Received: from mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99726606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99726606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HbqWS3zd
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=do3iUEHsRUOXXkxYyuNnpPjohxgfsv86UsfgKD2v+UQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794885104; v=1; x=1795489904;
 b=HbqWS3zdfE+jWBSrnRQkLRJchmm5y5sku8Gby1ASLwABW9VHwQaFtJKFUi9yuDW6gtawAcpE
 dWzySC02stEvXMD+lSvf3Q3eNbg0l8WZV1rUeUAdqkVfyVeDVj5FJGHT1x7DNUnIegmtlLjXY49
 C1phM7X6Rr+rxf1VMyffK/Lg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 546bf800db40f8e2;
	Tue, 17 Nov 2026 03:11:44 +0000
X-Mizu-Trace-ID: 546bf800db40f8e2
X-Migadu-Flow: FLOW_OUT
Message-ID: <f618fc7e-371e-4f83-92fd-ee97db4b682f@linux.dev>
Date: Tue, 17 Nov 2026 11:11:33 +0800
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
Subject: Re: [PATCH v2 06/14] mm/mm_init: factor out frozen compound page
 initialization
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Li Zhe <lizhe.67@bytedance.com>, Andrew Popple <apopple@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, James Houghton <jthoughton@google.com>,
 Lance Yang <lance.yang@linux.dev>, Qi Zheng <qi.zheng@linux.dev>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Muchun Song <songmuchun@bytedance.com>
References: <20261113033442.62970-1-songmuchun@bytedance.com>
 <20261113033442.62970-7-songmuchun@bytedance.com>
 <179482576829.2379196.14870002582501235383.b4-review@b4>
Content-Language: en-US
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <179482576829.2379196.14870002582501235383.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/11/16 18:42, Mike Rapoport wrote:
> Hi,

Hi Mike,

>
>> ZONE_DEVICE initializes compound struct pages while their refcounts remain
>> frozen. The setup is open-coded in memmap_init_compound(), including the
>> per-page initialization and compound tail preparation.
>>
>> Factor the common setup into memmap_init_compound_page_frozen(). Keep the
>> pgmap association and MEMORY_DEVICE_GENERIC refcount handling in the
>> ZONE_DEVICE-specific path.
>>
>> This provides an MM-internal helper for other early memmap users to
>> share.
>>
>> No functional change is intended.
>>
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>> v2:
>> - Rebase on memmap_init_page_from_template().
>> - Rename memmap_init_zone_device_head_page to memmap_init_zone_device_head_fields.
>> ---
>>   mm/mm_init.c | 114 +++++++++++++++++++++++++--------------------------
>>   mm/mm_init.h |   2 +
>>   2 files changed, 59 insertions(+), 57 deletions(-)
>>
>> diff --git a/mm/mm_init.c b/mm/mm_init.c
>> index bf943ae72a3e5..f1e539aec3d91 100644
>> --- a/mm/mm_init.c
>> +++ b/mm/mm_init.c
>> @@ -738,6 +738,28 @@ void __meminit memmap_init_page_from_template(struct page *page,
>>   	vmemmap_optimization_verify_zone(page);
>>   }
>>   
>> +void __meminit memmap_init_compound_page_frozen(struct page *head,
>> +		unsigned long pfn, const struct zone *zone, unsigned int order)
> Do we really need the _frozen suffix here?

Maybe not. I can remove it.

>
>> +{
>> +	unsigned long nr_pages = 1UL << order;
>> +	struct page template;
>> +
>> +	memmap_init_page_common(&template, zone_idx(zone), zone_to_nid(zone));
>> +	prep_compound_tail(&template, head, order);
>> +
>> +	/* Initialize the head page. */
>> +	__init_single_page(head, pfn, zone_idx(zone), zone_to_nid(zone));
>> +	set_page_count(head, 0);
>> +	__SetPageHead(head);
>> +
>> +	if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
>> +		nr_pages = VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES;
>> +	/* Initialize the tail pages from PFN-independent template page. */
>> +	for (unsigned long i = 1; i < nr_pages; i++)
>> +		memmap_init_page_from_template(head + i, pfn + i, zone, &template);
>> +	prep_compound_head(head, order);
>> +}
>> +
>>   struct zone __meminit *pfn_to_zone(unsigned long pfn, int nid)
>>   {
>>   	pg_data_t *pgdat = NODE_DATA(nid);
>> @@ -1063,44 +1085,39 @@ static void __init memmap_init(void)
>>   }
>>   
>>   #ifdef CONFIG_ZONE_DEVICE
>> -/*
>> - * With compound page geometry and when struct pages are stored in ram most
>> - * tail pages are reused. Consequently, the amount of unique struct pages to
>> - * initialize is a lot smaller that the total amount of struct pages being
>> - * mapped. This is a paired / mild layering violation with explicit knowledge
>> - * of how the sparse_vmemmap internals handle compound pages in the lack
>> - * of an altmap.
>> - */
>> -static inline unsigned long compound_nr_pages(unsigned long pfn,
>> -					      struct dev_pagemap *pgmap)
>> +static void memmap_init_zone_device_head_fields(struct page *head,
>> +		struct dev_pagemap *pgmap)
> I can't say I like this name. Essentailly we initialize ZONE_DEVICE
> folio here, so maybe it can be
>
> 	memmap_init_zone_device_folio(struct folio *folio)

Make more sense.

>
>>   {
>> -	const struct mem_section *ms = __pfn_to_section(pfn);
>> -
>> -	if (!section_vmemmap_optimizable(ms))
>> -		return pgmap_vmemmap_nr(pgmap);
>> -
>> -	return VMEMMAP_OPTIMIZATION_PAGES * (PAGE_SIZE / sizeof(struct page));
>> +	/*
>> +	 * MEMORY_DEVICE_GENERIC pages start with a refcount of one; other
>> +	 * ZONE_DEVICE pages raise it when handed out. Use atomic_set() because
>> +	 * @head may be a stack template, while init_page_count() expects a
>> +	 * memmap-backed page.
>> +	 */
>> +	if (pgmap->type == MEMORY_DEVICE_GENERIC)
>> +		atomic_set(&head->_refcount, 1);
>> +	/*
>> +	 * ZONE_DEVICE pages union ->lru with a ->pgmap back pointer and
>> +	 * zone_device_data. It is a bug if a ZONE_DEVICE page is ever freed
>> +	 * or placed on a driver-private list.
>> +	 */
>> +	((struct folio *)head)->pgmap = pgmap;
> ... and then we won't need this cast and the caller will just pass
> page_folio() here.

Right. Initially, I thought using page_folio on the template page might
be problematic when compound_info_has_mask() == true. However, I found
that the template page happens to be order-0, which avoids the issue.
So, we can safely use page_folio.

>
>> +	head->zone_device_data = NULL;
>>   }
>>   
>> -static void __ref memmap_init_compound(struct page *head,
>> -				       unsigned long head_pfn,
>> -				       unsigned long zone_idx, int nid,
>> -				       struct dev_pagemap *pgmap,
>> -				       unsigned long nr_pages)
>> +static void memmap_init_zone_device_basepages(unsigned long start, unsigned long end,
>> +		const struct zone *zone, struct dev_pagemap *pgmap)
> _basepages sounds odd for me, maybe _pages will do?
>

Sounds good.

Thanks,
Muchun
