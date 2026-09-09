Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA9134B662
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967105; cv=none; b=eLWGk4IZ/ehhtNel97lrdljdfVl42buS00ovdeY+x+NLsRryHbJYi1P+8b5tifnDVDKxxWi1/WF6m0CEwXKgpbA3/xj2DNh1WR3a2A/4J0a35F2SMPSTaG2H6cTG9GUl32wLTw+9qxwLKlrcSaRK95/ohf++a/HH2JPoqU7CBBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967105; c=relaxed/simple;
	bh=2QGqX14GqjgukkUyFQMnBgMEEa9XRkfRy9MzyNDOasE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PmO4L//OHFYHOoiVclFZjBpRh0vY+cCIMiGhIr40UzEs/OOYGNCW3OytPDWysJy8EL/47WHQan8827KRb5rTZINO1rP+UnhaGj7pa5PMq8bzYb1KiZVngA5BYZVksDeavY1SI+4FxxQdmZ4DymR5uaHv5sfuqP0Vd3j71BaYKSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/7HNL27; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/7HNL27"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F7151F00A3A;
	Wed,  9 Sep 2026 15:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788967102;
	bh=aaD1iPdHXSKMIWmNsAZlaxDbgZwjJL30YcYTVXTbOpI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=B/7HNL27KzdYtSLenvs3BSAsGzCESsMj1zTYAn1O3A7hOZaYHx6vv7fAxQFh/9XlF
	 umpFWbG7ESfKcSKaBH9RQH4Jtk7jle7SRHT8H/2hsfLhbOGgfmrGHEPGWuUAeD/AI+
	 Fdf1TsuqFzdEBbPLTrfA7OtbPK+QU/GRxuLLi1EaX35lZrhYtOhktDQ786wkQa1MYm
	 PLmar6x3H1IC/SEFm2iWKXqamw/YLpo7TzpmgnD/xlu/oY3c5cJQskjplrtLNk+QSc
	 mV4Z80C0uDtYHxdegJqKEct4ECUDs8YDYwLhISfXE7qdnCgyoH+spEaN1CQ13vahcT
	 N0OtOBDb69WwQ==
Message-ID: <d3723be0-46f4-4025-b526-e1bb3cc2cad6@kernel.org>
Date: Wed, 9 Sep 2026 17:18:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] mm: make persistent huge zero folio read-only
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: akpm@linux-foundation.org, ljs@kernel.org, usama.arif@linux.dev,
 ziy@nvidia.com, baolin.wang@linux.alibaba.com, liam@infradead.org,
 nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, lance.yang@linux.dev, kas@kernel.org, rppt@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 linux-arm-kernel@lists.infradead.org, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 luto@kernel.org, peterz@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
 <20260901151818.3191443-2-xueyuan.chen21@gmail.com>
 <1d5ac9d7-48ce-4fee-b893-f646bade4a86@kernel.org>
 <CA+qSx6yjiXJkQm=hi=F8=_=DU0x_usSuXnL_1yuy0fUU9UU-Zg@mail.gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <CA+qSx6yjiXJkQm=hi=F8=_=DU0x_usSuXnL_1yuy0fUU9UU-Zg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/8/26 16:48, Xueyuan Chen wrote:
> On Tue, Sep 8, 2026 at 4:30 PM David Hildenbrand (Arm) <david@kernel.org> wrote:
>>
>> On 9/1/26 17:18, Xueyuan Chen wrote:
>>> The persistent huge zero folio is shared globally and should stay zero
>>> after initialization. As Jann Horn pointed out [1], kernel bugs have
>>> ended up writing to pages that were meant to be read-only, including in
>>> security-sensitive cases. Making the folio read-only in the direct map
>>> turns such writes into faults instead of silent zero-page corruption.
>>>
>>> Add a page-based helper consistent with the existing direct-map interfaces.
>>> Handle TLB invalidation in the architecture implementation; unsupported
>>> architectures retain their current behavior.
>>>
>>> Protect the folio after initialization. Skip highmem folios, which have no
>>> permanent direct-map mapping.
>>>
>>> Inspired by Jann Horn's read-only zero page work [1] and follow-up
>>> discussion [3] with Yang Shi.
>>>
>>> Link: https://lore.kernel.org/r/20260508-ro-zeropage-v1-1-9808abc20b49@google.com [1]
>>> Link: https://lore.kernel.org/r/0e5b23a6-4895-454a-9dfa-6dc21adc2991@kernel.org [2]
>>> Link: https://lore.kernel.org/r/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=jDx9E6dLOULohnhBguvi9A@mail.gmail.com [3]
>>>
>>> Suggested-by: David Hildenbrand <david@kernel.org>
>>> Suggested-by: Usama Arif <usama.arif@linux.dev>
>>> Co-developed-by: Lance Yang <lance.yang@linux.dev>
>>> Signed-off-by: Lance Yang <lance.yang@linux.dev>
>>> Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
>>> ---
>>>  include/linux/set_memory.h | 17 +++++++++++++++++
>>>  mm/huge_memory.c           | 13 ++++++++++---
>>>  2 files changed, 27 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
>>> index 3fe293cfed8c..ed9ce04b18a1 100644
>>> --- a/include/linux/set_memory.h
>>> +++ b/include/linux/set_memory.h
>>> @@ -54,6 +54,23 @@ static inline bool can_set_direct_map(void)
>>>  #endif
>>>  #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
>>>
>>> +#ifndef set_direct_map_ro
>>> +/**
>>> + * set_direct_map_ro - make a direct-map range read-only
>>> + * @page: first page in the direct-map range
>>> + * @nr: number of pages in the range
>>> + *
>>> + * Make the direct-map range starting at @page read-only and invalidate stale
>>> + * writable translations before returning.
>>> + *
>>> + * Return: 0 on success, or a negative error code on failure.
>>> + */
>>> +static inline int set_direct_map_ro(struct page *page, unsigned int nr)
>>> +{
>>> +     return 0;
>>> +}
>>> +#endif
>>> +
>>>  #ifdef CONFIG_X86_64
>>>  int set_mce_nospec(unsigned long pfn);
>>>  int clear_mce_nospec(unsigned long pfn);
>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>> index 54494c3fa983..742283b36d74 100644
>>> --- a/mm/huge_memory.c
>>> +++ b/mm/huge_memory.c
>>> @@ -42,6 +42,7 @@
>>>  #include <linux/pgalloc_tag.h>
>>>  #include <linux/pagewalk.h>
>>>  #include <linux/cleanup.h>
>>> +#include <linux/set_memory.h>
>>>
>>>  #include <asm/tlb.h>
>>>  #include "internal.h"
>>> @@ -291,10 +292,16 @@ static int __init huge_zero_init(void)
>>>       huge_zero_folio = alloc_huge_zero_folio();
>>>       if (!huge_zero_folio) {
>>>               pr_warn("Allocating persistent huge zero folio failed\n");
>>> -     } else {
>>> -             huge_zero_pfn = folio_pfn(huge_zero_folio);
>>> -             count_vm_event(THP_ZERO_PAGE_ALLOC);
>>> +             return 0;
>>>       }
>>> +
>>> +     huge_zero_pfn = folio_pfn(huge_zero_folio);
>>> +     count_vm_event(THP_ZERO_PAGE_ALLOC);
>>> +
>>> +     /* Highmem folios have no permanent direct-map mapping to protect. */
>>> +     if (!folio_test_highmem(huge_zero_folio))
>>> +             set_direct_map_ro(folio_page(huge_zero_folio, 0), HPAGE_PMD_NR);
>>
>> Assuming we keep the page-based approach, can't we just move the highmem test in
>> there?
> 
> Hi David,
> 
> We can move the check into set_direct_map_ro(). However, on x86,
> set_direct_map_invalid_noflush() and set_direct_map_default_noflush()
> also expect callers to exclude highmem pages.
> 
> Would it make sense to make highmem a documented no-op for those
> helpers as well, so the direct-map APIs handle it consistently?

I think getting something consistent for now is the most important thing. :)

-- 
Cheers,

David
