Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794885229;
	b=PcV2FaSsCEVnz71cIpgFkAXc0Krb4fDoRE6fJcBf/rGSh+5ZlucMAQu390x85SSRWRoC
	 zQd0AW8JjNGV0zpT0UOoUeeFOdRUaBOYYH68jc3mEYoQIQ3paUVNG+IOczZF8iYdb/FEW
	 xvxLGUEWAxvTlNyPVM1i6k+nHXNM+mCkqNsjrf8umLyqO1rxwJJHaLetJFZVzU7NAR0vV
	 /g/EnwABV4ZU2YewjqEdD8qTEpvnpdxI/1geLDQpHepO10NZKECrqQ8nsGyDIBL0LoNqx
	 uD9pPPvZGWLQDbcJNvpQJpH+eQNg/MDkOz1T6sDxjAKh/Eufg/0cME/4TE+YolLOwOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885229;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=8Henz0FrWmmxzwoavWH1AFferz9Sy4A9czKO41x1rhs=;
	b=qVUFqPqvwBwRoLcXc5t9vuP6axgWZWBFwAOFmLLnp1Sdcgq+vR4riHJyXbr+tmj7I1n+
	 r685//b5Vrxjf39oyPiSh9blUPIiRJXOOUPDR6nP4bjP0JEZSIJyhi/kXIbUEbb6Am6q3
	 YEw2q6fIyVsj1kiOOpM+yE+GONrFg5YKLc6qE5Xa4BPoXEzKZrGN5/mAQ0+1ZQ0ziRbnS
	 ZepKI8yBxR4Yu4zjs8P+0Yu0FmXEfgVaRBjL8AvN7ya2OvUWCFkbNK0Z0nRRXELzHeB9N
	 XJ6OIaKvXawDJBD2Ee6loh4FOFWlPCE6M8NebCIPIu3eezjwS2iuU3zXvIx2UzO6gSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IFQyfyc4;
	arc=none smtp.remote-ip=95.215.58.193
Received: from mta1.migadu.com (out-193.mta1.migadu.com [95.215.58.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2FA606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E2FA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IFQyfyc4
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=R3QFMBD/atgM6V8xogzigzWPQmqYHpUv7HSFT3n7u58=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794885227; v=1; x=1795490027;
 b=IFQyfyc4sDt7Ud73LHiVUEWq8Soo68ERr2KoZoU8Z+GOwWqFBoogM3CuJBqsd+C9zbvckxb1
 qwZHNlPHTRN0PaLcr9XNOodg3JwOOM698v03nWbU2bWeMaGx6v6Q9fSTirWDIGKE2nZhJ5nAk/Q
 ohseESwX2PQGgp0XeoVeBxK4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bf6838e5dd8e88ed;
	Tue, 17 Nov 2026 03:13:46 +0000
X-Mizu-Trace-ID: bf6838e5dd8e88ed
X-Migadu-Flow: FLOW_OUT
Message-ID: <44fc03e4-a545-465b-a7f4-174be2038884@linux.dev>
Date: Tue, 17 Nov 2026 11:13:42 +0800
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
Subject: Re: [PATCH v2 04/14] mm/mm_init: factor out common struct page
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
 <20261113033442.62970-5-songmuchun@bytedance.com>
 <179482576829.2379196.2091312590305150578.b4-review@b4>
Content-Language: en-US
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <179482576829.2379196.2091312590305150578.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/11/16 18:42, Mike Rapoport wrote:
> Hi,

Hi Mike,

>> Several struct page fields have the same initial values for every page in
>> a zone. __init_single_page() initializes this state as part of its
>> per-page setup, while the shared vmemmap tail path open-codes only a
>> subset.
>>
>> Factor the PFN-independent state into memmap_init_page_common() and use
>> it for both regular and shared tail struct pages. Keep section-, PFN-
>> and instance-specific initialization in __init_single_page().
>>
>> This also initializes the last cpupid and KASAN tag for shared tail
>> struct pages consistently with regular struct pages.
>>
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>> v2:
>> - Remove __meminit from memmap_init_page_common() so HVO shared tail
>>    pages can call it after init text is freed (reported by Sashiko).
>> ---
>>   include/linux/mm.h  |  8 --------
>>   mm/mm_init.c        | 22 +++++++++++++++++-----
>>   mm/mm_init.h        |  1 +
>>   mm/sparse-vmemmap.c |  7 +------
>>   4 files changed, 19 insertions(+), 19 deletions(-)
>>
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 77b5d450fe45b..2e182498898ec 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -3022,14 +3022,6 @@ static inline void set_page_node(struct page *page, unsigned long node)
>>   	page->flags.f |= (node & NODES_MASK) << NODES_PGSHIFT;
>>   }
>>   
>> -static inline void set_page_links(struct page *page, enum zone_type zone,
>> -	unsigned long node, unsigned long pfn)
>> -{
>> -	set_page_zone(page, zone);
>> -	set_page_node(page, node);
>> -	set_page_section_from_pfn(page, pfn);
>> -}
>> -
>>   /**
>>    * folio_nr_pages - The number of pages in the folio.
>>    * @folio: The folio.
>> diff --git a/mm/mm_init.c b/mm/mm_init.c
>> index af3b81733193b..d0a11989bd249 100644
>> --- a/mm/mm_init.c
>> +++ b/mm/mm_init.c
>> @@ -602,15 +602,27 @@ static inline void vmemmap_optimization_verify_zone(struct page *page)
>>   			page_zone_id(page));
>>   }
>>   
>> -void __meminit __init_single_page(struct page *page, unsigned long pfn,
>> -				unsigned long zone, int nid)
>> +/* Initialize PFN-independent fields common to pages in the same zone. */
>> +void memmap_init_page_common(struct page *page, enum zone_type zone, int nid)
> I don't think _common adds much here, memmap_init_page() would do.

Naming is difficult. I'm fine with memmap_init_page.

>
>>   {
>>   	mm_zero_struct_page(page);
>> -	set_page_links(page, zone, nid, pfn);
>> -	init_page_count(page);
>> -	atomic_set(&page->_mapcount, -1);
>> +	set_page_zone(page, zone);
>> +	set_page_node(page, nid);
>>   	page_cpupid_reset_last(page);
>>   	page_kasan_tag_reset(page);
>> +	atomic_set(&page->_mapcount, -1);
>> +#ifdef CONFIG_ZONE_DEVICE
>> +	if (zone == ZONE_DEVICE)
>> +		__SetPageReserved(page);
>> +#endif
> Can't we keep this in ZONE_DEVICE part?

We can. But I put it here because there are at least two places where
we need to mark a ZONE_DEVICE page as reserved. Handling it in
memmap_init_page_common is simpler — it reduces the number of places
where we have to set reserved individually. Otherwise, we would need
to explicitly set reserved in multiple places.

>
> If we can't, __init_single_page() sets PG_reserved for ZONE_DEVICE pages
> and the
>
> if (zone == ZONE_DEVICE)
> 	__SetPageReserved(page);
>
> in the MEMINIT_HOTPLUG part of memmap_init_range() becomes redundant.
>

Good catch. I think I could remove this redundancy next version if you
think handing it in memmap_init_page_common is okay.

Thanks,
Muchun
