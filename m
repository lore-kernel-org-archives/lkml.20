Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794192738;
	b=YKuBntgQnXtQ4liPGLC5580/OBJOtDbBpQbbC9+E0/J4PVt+U1vRw00JHaffRdXxxknY
	 bv2/9wrZbiZNKGt7AvfsfAZbkI9VJV3WXjEkYlBYBafmmdHC6H/Ljsy4ixMf3kT5lqkt+
	 oX173l6i8qbZwQ5dNaZlkc8H5nOFdbVSaB/zLmHm3DKc+jeZtDGCmNU1xAKu0KQSayHrk
	 B4glfj2qmvitiq/e2QBhGb5eRzlS81w6EIJ+ySlriHWDx3Aj9565aT/rWVaxST0YIWcMa
	 xTwxer0oYbsW8uZhzA2I/xz33CMf9uuc9J8r2eP4aNfw0kHSqCv1TayKX7un2Ro8LKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794192738;
	h=DMARC-Filter:DKIM-Signature:References:In-Reply-To:
	 Content-Transfer-Encoding:Content-Type:Mime-Version:User-Agent:
	 X-Original-From:X-Lms-Return-Path:To:Cc:From:Subject:Date:Message-Id;
	bh=yCuez44DIiflK+TgYYvbZf169TnqdyWBhAx5pU0vziY=;
	b=3448FWe29OL6x9gSpZe8naTHty630M3saKKRaf8hkzV2g1xFME1euR8mrwc/2rpXVaEv
	 YdCFPfvZZPfF2vEskN1AkWeEYqIaJE+p36wFRQDKosFHBKLQipCB3y/5ckoXOwYs6F6Yx
	 tc0fUXyyhf8RLAsf/veG3VeQgEqcO6YFxdQrbMEB0LcHqFYbTAgpTSulmi7pSwKvmxcjD
	 eR4OAgRaUUWI6JnUj/p0FPZEQv0KdY/USePp19xAXsL/BG6A7HrLqoGW/FfMuOxUHJsxQ
	 Ia3b2+fBQ2n1i35Aczmxcqf55G6yDoNLuleSXhDmbQoos17DCICE1RBds8uyFXoBJFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	arc=none smtp.remote-ip=209.127.230.113
Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E64D606A338
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 02:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E64D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794192730; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=yCuez44DIiflK+TgYYvbZf169TnqdyWBhAx5pU0vziY=;
 b=KxyNBXOr2WX+/CCiYXTtCYnYklFW1pXMkg0Soddx2vt2uFSbwwoid1xH80xzBzbNaVmNET
 N2JgyDtddaT54CD+S9WoCnsGUv0jb32pKmQD/xskzNSnVrJNvFcJot6ml2WsRCDdA4rqvp
 zmHioFqb2X1+YDZ8AX787x3oZMdhtWgbB081svwSL8YA9V2EoywRJ2lepwVUVLGCZhL6Ts
 ufxQ4zi47HLD+lthy5VmxDNOkKRXQsZlnSv6Pp4ovdH7hjhXYuqVjWBBBAH7m0rGeQNOzJ
 ZBuh/HQszSBTzyUERX/KtS88cxiPlfjaKS858ZLvmR/auaRSukt8cHGKUVNk3w==
References: <20261105120615.16817-1-lizhe.67@bytedance.com> <20261105120615.16817-2-lizhe.67@bytedance.com> <au2tQaaMBg3umthq@parvat>
In-Reply-To: <au2tQaaMBg3umthq@parvat>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
X-Lms-Return-Path: <lba+26af13558+b772d5+vger.kernel.org+lizhe.67@bytedance.com>
To: "Balbir Singh" <balbirs@nvidia.com>
Cc: <muchun.song@linux.dev>, <osalvador@suse.de>, <david@kernel.org>, 
	<akpm@linux-foundation.org>, <rppt@kernel.org>, <apopple@nvidia.com>, 
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
From: "Li Zhe" <lizhe.67@bytedance.com>
Subject: Re: [PATCH 1/2] mm/mm_init: factor out memmap_init_page_from_template()
Date: Mon, 9 Nov 2026 10:51:52 +0800
Message-Id: <25a188bf-05e4-4f0e-b670-a9dc88195b21@bytedance.com>

On 11/6/26 6:34 PM, Balbir Singh wrote:
> On Thu, Nov 05, 2026 at 08:06:14PM +0800, Li Zhe wrote:
>> ZONE_DEVICE memmap initialization already uses a reusable struct page
>> template when initializing compound tail pages.  The template mostly
>> contains invariant state, but a few fields still depend on the target
>> PFN and must be refreshed before copying the template into each
>> destination struct page.
>>
>> Factor that operation into memmap_init_page_from_template() so other
>> boot-time memmap initialization paths can reuse the same helper.
>>
>> No functional change intended.
>>
>> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
>> ---
>>   mm/mm_init.c | 29 +++++++++++++++--------------
>>   mm/mm_init.h |  2 ++
>>   2 files changed, 17 insertions(+), 14 deletions(-)
>>
>> diff --git a/mm/mm_init.c b/mm/mm_init.c
>> index 2a0e782a151d..495e20fbdec0 100644
>> --- a/mm/mm_init.c
>> +++ b/mm/mm_init.c
>> @@ -625,6 +625,17 @@ void __meminit __init_single_page(struct page *page, unsigned long pfn,
>>   	vmemmap_optimization_verify_zone(page);
>>   }
>>   
>> +void __meminit memmap_init_page_from_template(struct page *page,
>> +		unsigned long pfn, unsigned long zone, struct page *template)
>> +{
>> +	set_page_section_from_pfn(template, pfn);
>> +#ifdef WANT_PAGE_VIRTUAL
>> +	if (!is_highmem_idx(zone))
>> +		set_page_address(template, __va(pfn << PAGE_SHIFT));
>> +#endif
>> +	memcpy_nontemporal(page, template, sizeof(*page));
>> +}
>> +
> Can we make the template a const? Why can't we do
>
> void __meminit memmap_init_page_from_template(struct page *page,
> 		unsigned long pfn, unsigned long zone,
> 		const struct page *template)
> {
> 	memcpy_nontemporal(page, template, sizeof(*page));
>
> 	set_page_section_from_pfn(page, pfn);
> #ifdef WANT_PAGE_VIRTUAL
> 	if (!is_highmem_idx(zone))
> 		set_page_address(page, __va(pfn << PAGE_SHIFT));
> #endif
>
> That way we don't update template once it is set, if template is r/o,
> then we don't need both first page and template in the caller to
> be different.
I kept it this way to preserve the memcpy_nontemporal() write pattern:
update the PFN-dependent fields in the template first, then copy the
final state to the destination page once.

If we copy first and then update the destination page, the hot loop
would do a non-temporal copy followed by normal stores to the same
struct page. That is the pattern this helper avoids.

Thanks,
Zhe
>
>>   #ifdef CONFIG_NUMA
>>   /*
>>    * During memory init memblocks map pfns to nids. The search is expensive and
>> @@ -1073,17 +1084,6 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
>>   	}
>>   }
>>   
>> -static void zone_device_page_init_from_template(struct page *page,
>> -		unsigned long pfn, struct page *template)
>> -{
>> -	set_page_section_from_pfn(template, pfn);
>> -#ifdef WANT_PAGE_VIRTUAL
>> -	if (!is_highmem_idx(ZONE_DEVICE))
>> -		set_page_address(template, __va(pfn << PAGE_SHIFT));
>> -#endif
>> -	memcpy_nontemporal(page, template, sizeof(*page));
>> -}
>> -
>>   /*
>>    * With compound page geometry and when struct pages are stored in ram most
>>    * tail pages are reused. Consequently, the amount of unique struct pages to
>> @@ -1136,8 +1136,8 @@ static void __ref memmap_init_compound(struct page *head,
>>   
>>   	/* Initialize the remaining tail pages from template. */
>>   	for (pfn = head_pfn + 2; pfn < end_pfn; pfn++)
>> -		zone_device_page_init_from_template(pfn_to_page(pfn), pfn,
>> -						    &template);
>> +		memmap_init_page_from_template(pfn_to_page(pfn), pfn,
>> +					       ZONE_DEVICE, &template);
>>   	prep_compound_head(head, order);
>>   }
>>   
>> @@ -1192,7 +1192,8 @@ void __ref memmap_init_zone_device(struct zone *zone,
>>   	for (; pfn < end_pfn; pfn += pfns_per_compound) {
>>   		page = pfn_to_page(pfn);
>>   
>> -		zone_device_page_init_from_template(page, pfn, &template);
>> +		memmap_init_page_from_template(page, pfn, ZONE_DEVICE,
>> +					       &template);
>>   
>>   		if (IS_ALIGNED(pfn, PAGES_PER_SECTION))
>>   			cond_resched();
>> diff --git a/mm/mm_init.h b/mm/mm_init.h
>> index 0034e37dbabd..22c465122b47 100644
>> --- a/mm/mm_init.h
>> +++ b/mm/mm_init.h
>> @@ -111,5 +111,7 @@ void memblock_free_all(void);
>>   
>>   void __meminit __init_single_page(struct page *page, unsigned long pfn,
>>   				unsigned long zone, int nid);
>> +void __meminit memmap_init_page_from_template(struct page *page,
>> +		unsigned long pfn, unsigned long zone, struct page *template);
>>   
>>   #endif /* __MM_MM_INIT_H */
>> -- 
>
> Balbir
