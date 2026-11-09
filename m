Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794193060;
	b=zwN5R6hfiMjhlEj3Xx5mRBi/JclrqAlS3LQ5/w74ofhHEdrqn/Co3RPGhVSszh1HgB24
	 fQc+d8GmEX8Lwhm57GjLl2AzMh8jHR1FyB0KVuj+iojxJJ8vJcFB7DvjyB5vznqTFYdsC
	 3FiDD4/kW93j/3QKeLXugcHzA1SXrRm2JgQdcBhhxpjGAjyfN1XIKAjfhDekdcEbDbIjd
	 BVElqC8j3i9HuEUklyMdYy+EElTepPcExPyPemicA+TbBJVDq81LqBTC6VRP6YSXQDw2v
	 DCpWwHuu3PBfiOo0FtZIwE1iy1PJQx3J6ladCufnRIyktaW+DXfbUoSDqhY9KapHgtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794193060;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=dwJNxf5rCTAUship/jh+E19aKDon5spv76HcuaGEvU0=;
	b=nzLXg4S/eu5NKL7ysp4U6KvbVd2QSTzUV0kHINgLiyKmUg+UR1liX1Ew9B6RjmHB/Gsx
	 xOxIZiXH69nBXkQ3eRjB9H1bfkfuTOAomuxDnCqFpVSKBuKEFP2Y3gTd8lrxat9ENLiGQ
	 8QX4CLKRjp2BB5vzeo7kc+FXudeo1mzqtETfxHUllkAY8n13lJnP1oIQHynOKRi57sN3o
	 K8plVGp7AZi3mkGKnTs6KlPsK30eSLKapdQBe5hIczGLDIWjD7Xt5nH2RFA0/21OSm6t8
	 Po800K2qt9BG8oOocX3vfHMwwmUH5qUlI0vmDuwCxiwxjykpK8ibzUEY3fUTHKCuzTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=I8byLkeK;
	arc=none smtp.remote-ip=95.215.58.77
Received: from mta1.migadu.com (out-77.mta1.migadu.com [95.215.58.77])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB6B606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 02:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEB6B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=I8byLkeK
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=u5WrG/yasaWjBHktQ78tjm0ZVxb5BYE57NobquyrXQE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794193058; v=1; x=1794797858;
 b=I8byLkeKV8e26R9x/axeTIC88d6JqAaJWmc2v1X3zNoSbxc5GzsqJ5RsezFM+BlRGgJzG/so
 naERNpQyMvNttHnnPVnld5pGPknHctfXbmAzh8w6NXRN6azXloAu2kOY+DQpKuSBiKw9EXbZrqx
 25E6X3fkyWY89AK0Y8bHRFfk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e5337828cc32e4d1;
	Mon, 09 Nov 2026 02:57:37 +0000
X-Mizu-Trace-ID: e5337828cc32e4d1
X-Migadu-Flow: FLOW_OUT
Message-ID: <f062d92e-a016-447f-926f-bd1b1ce7f106@linux.dev>
Date: Mon, 9 Nov 2026 10:57:35 +0800
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
Subject: Re: [PATCH 1/2] mm/mm_init: factor out
 memmap_init_page_from_template()
To: Li Zhe <lizhe.67@bytedance.com>, Balbir Singh <balbirs@nvidia.com>
Cc: osalvador@suse.de, david@kernel.org, akpm@linux-foundation.org,
 rppt@kernel.org, apopple@nvidia.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261105120615.16817-1-lizhe.67@bytedance.com>
 <20261105120615.16817-2-lizhe.67@bytedance.com> <au2tQaaMBg3umthq@parvat>
 <25a188bf-05e4-4f0e-b670-a9dc88195b21@bytedance.com>
Content-Language: en-US
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <25a188bf-05e4-4f0e-b670-a9dc88195b21@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/11/9 10:51, Li Zhe wrote:
> On 11/6/26 6:34 PM, Balbir Singh wrote:
>> On Thu, Nov 05, 2026 at 08:06:14PM +0800, Li Zhe wrote:
>>> ZONE_DEVICE memmap initialization already uses a reusable struct page
>>> template when initializing compound tail pages.  The template mostly
>>> contains invariant state, but a few fields still depend on the target
>>> PFN and must be refreshed before copying the template into each
>>> destination struct page.
>>>
>>> Factor that operation into memmap_init_page_from_template() so other
>>> boot-time memmap initialization paths can reuse the same helper.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
>>> ---
>>>    mm/mm_init.c | 29 +++++++++++++++--------------
>>>    mm/mm_init.h |  2 ++
>>>    2 files changed, 17 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/mm/mm_init.c b/mm/mm_init.c
>>> index 2a0e782a151d..495e20fbdec0 100644
>>> --- a/mm/mm_init.c
>>> +++ b/mm/mm_init.c
>>> @@ -625,6 +625,17 @@ void __meminit __init_single_page(struct page *page, unsigned long pfn,
>>>    	vmemmap_optimization_verify_zone(page);
>>>    }
>>>    
>>> +void __meminit memmap_init_page_from_template(struct page *page,
>>> +		unsigned long pfn, unsigned long zone, struct page *template)
>>> +{
>>> +	set_page_section_from_pfn(template, pfn);
>>> +#ifdef WANT_PAGE_VIRTUAL
>>> +	if (!is_highmem_idx(zone))
>>> +		set_page_address(template, __va(pfn << PAGE_SHIFT));
>>> +#endif
>>> +	memcpy_nontemporal(page, template, sizeof(*page));
>>> +}
>>> +
>> Can we make the template a const? Why can't we do
>>
>> void __meminit memmap_init_page_from_template(struct page *page,
>> 		unsigned long pfn, unsigned long zone,
>> 		const struct page *template)
>> {
>> 	memcpy_nontemporal(page, template, sizeof(*page));
>>
>> 	set_page_section_from_pfn(page, pfn);
>> #ifdef WANT_PAGE_VIRTUAL
>> 	if (!is_highmem_idx(zone))
>> 		set_page_address(page, __va(pfn << PAGE_SHIFT));
>> #endif
>>
>> That way we don't update template once it is set, if template is r/o,
>> then we don't need both first page and template in the caller to
>> be different.

I used to think that too.

> I kept it this way to preserve the memcpy_nontemporal() write pattern:
> update the PFN-dependent fields in the template first, then copy the
> final state to the destination page once.
>
> If we copy first and then update the destination page, the hot loop
> would do a non-temporal copy followed by normal stores to the same
> struct page. That is the pattern this helper avoids.

After thinking it through, that should be the reason. To prevent
similar confusion for others, I suggest adding a comment here
explaining why this specific order is used.

Thanks.

>
> Thanks,
> Zhe
>>>    #ifdef CONFIG_NUMA
>>>    /*
>>>     * During memory init memblocks map pfns to nids. The search is expensive and
>>> @@ -1073,17 +1084,6 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
>>>    	}
>>>    }
>>>    
>>> -static void zone_device_page_init_from_template(struct page *page,
>>> -		unsigned long pfn, struct page *template)
>>> -{
>>> -	set_page_section_from_pfn(template, pfn);
>>> -#ifdef WANT_PAGE_VIRTUAL
>>> -	if (!is_highmem_idx(ZONE_DEVICE))
>>> -		set_page_address(template, __va(pfn << PAGE_SHIFT));
>>> -#endif
>>> -	memcpy_nontemporal(page, template, sizeof(*page));
>>> -}
>>> -
>>>    /*
>>>     * With compound page geometry and when struct pages are stored in ram most
>>>     * tail pages are reused. Consequently, the amount of unique struct pages to
>>> @@ -1136,8 +1136,8 @@ static void __ref memmap_init_compound(struct page *head,
>>>    
>>>    	/* Initialize the remaining tail pages from template. */
>>>    	for (pfn = head_pfn + 2; pfn < end_pfn; pfn++)
>>> -		zone_device_page_init_from_template(pfn_to_page(pfn), pfn,
>>> -						    &template);
>>> +		memmap_init_page_from_template(pfn_to_page(pfn), pfn,
>>> +					       ZONE_DEVICE, &template);
>>>    	prep_compound_head(head, order);
>>>    }
>>>    
>>> @@ -1192,7 +1192,8 @@ void __ref memmap_init_zone_device(struct zone *zone,
>>>    	for (; pfn < end_pfn; pfn += pfns_per_compound) {
>>>    		page = pfn_to_page(pfn);
>>>    
>>> -		zone_device_page_init_from_template(page, pfn, &template);
>>> +		memmap_init_page_from_template(page, pfn, ZONE_DEVICE,
>>> +					       &template);
>>>    
>>>    		if (IS_ALIGNED(pfn, PAGES_PER_SECTION))
>>>    			cond_resched();
>>> diff --git a/mm/mm_init.h b/mm/mm_init.h
>>> index 0034e37dbabd..22c465122b47 100644
>>> --- a/mm/mm_init.h
>>> +++ b/mm/mm_init.h
>>> @@ -111,5 +111,7 @@ void memblock_free_all(void);
>>>    
>>>    void __meminit __init_single_page(struct page *page, unsigned long pfn,
>>>    				unsigned long zone, int nid);
>>> +void __meminit memmap_init_page_from_template(struct page *page,
>>> +		unsigned long pfn, unsigned long zone, struct page *template);
>>>    
>>>    #endif /* __MM_MM_INIT_H */
>>> -- 
>> Balbir

