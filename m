Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793933658;
	b=WIz5zBEvMvMVA8oXPV4W+rvUMNsfhk7VJnodEJh/RtvIPVb5vmAY37LNnU8VHhzFpWCI
	 lbIdFJXq6bKlqgIhMXvWJRVyyQhhiSV6ep4TpEOB4nk42y937wEfL3eiZYIqF2SYnAm6y
	 MsikUqfrLSOP+0/bVppxA4nizOw+92YNRyvod+kqlDeTpcwQ8MHfSnB8STo0rCybPoPYE
	 pNqOwdvgo7Yh2wOIWlH7Reb8LQoyDvCKBQ8N6dDn+Kql7qtDgBiAQ+BzpZHiqD0XO5wvi
	 xk9yjMDgW+SRjQOoyCUuyrkTYxwT/N2aguFAq0cO/HoR1kpwAwOxUpY9TbwSJz/chwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793933658;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=xAvnfgdYn02gy1CmYaw8G14nazz/ElOEY3XPVZ3GfBY=;
	b=iyuzaFwbGRhNxwn8zeuSC7fW/fungPQVNv9irHEh2EBe7V9s628gr9hrsoXMdOkaiqLA
	 yE7wrygYSON30xBIFDg/eZ3qJMacSmSf+s/qH62Axx9Wz2J56yPUNk3AfvQnIqSrgx18U
	 f0kRQLFB/sZLDADUWCxayorZScUmXdtlbe2NDu7zMc8N7TgZDNKal0M1ehjzXm5jiKGIE
	 nVAmRDNO+nTprptnvgOEPHgEU1SBdzuYzCkM0/0rLWS+MowlhzudMy0L7MBcmaZPXaZni
	 Ksv0cLO+Gbog+ECkej2e9zrhVB7+Eu65khgJa9bpQ9KIGyp+FBY3vKWbCge8OvSAHVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=pgU06jn1;
	arc=none smtp.remote-ip=115.124.30.132
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D3F606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 02:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05D3F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=pgU06jn1
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793933648; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=xAvnfgdYn02gy1CmYaw8G14nazz/ElOEY3XPVZ3GfBY=;
	b=pgU06jn1FRlfCKqaxOqblPiaUuIztg4+IZxaz6YjIxHEOb1J0YnRUnmHHnf2TqabpmtaEcbU07YqM3fjo4Zob6tRd/co7CLOJZgdbLVfOcvz5cORiPN32wALpAvrgMf+TOvQFmDGaJsVAENafYylWeq2iNcDzdVoBDNHjXUKjeI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0XEA9APb_1793933645;
Received: from 30.74.144.130(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XEA9APb_1793933645 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 10:54:06 +0800
Message-ID: <9916bea5-3b53-43a0-8f65-cc33995adb23@linux.alibaba.com>
Date: Fri, 6 Nov 2026 10:54:05 +0800
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
Subject: Re: [PATCH] mm: synchronize with PTE table reclaim for all folio
 sizes
To: Lance Yang <lance.yang@linux.dev>, david@kernel.org
Cc: baohua@kernel.org, akpm@linux-foundation.org, ljs@kernel.org,
 riel@surriel.com, liam@infradead.org, vbabka@kernel.org, harry@kernel.org,
 jannh@google.com, qi.zheng@linux.dev, pfalcato@suse.de, ayushr@modal.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <f06d2004-f3c5-46b0-b708-780ffd6727ce@linux.alibaba.com>
 <20261106023326.10838-1-lance.yang@linux.dev>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20261106023326.10838-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/6/26 10:33 AM, Lance Yang wrote:
> 
> On Fri, Nov 06, 2026 at 09:57:47AM +0800, Baolin Wang wrote:
>>
>>
>> On 11/5/26 9:22 PM, Lance Yang wrote:
>>>
>>> On Thu, Nov 05, 2026 at 11:06:29AM +0100, David Hildenbrand (Arm) wrote:
>>>> On 11/5/26 10:00, Baolin Wang wrote:
>>>>> CC Barry, who added the TTU_SYNC in shrink_folio_list().
>>>>>
>>>>> On 11/5/26 1:48 PM, Lance Yang wrote:
>>>>>>
>>>>>>
>>>>>> On 2026/11/5 12:54, Lance Yang wrote:
>>>>>>>
>>>>>>>
>>>>>>> Good catch!
>>>>>>>
>>>>>>>
>>>>>>> Right. Whether the folio can be PMD-mapped doesn't tell us whether its
>>>>>>> PTE table can be reclaimed, so those extra checks can skip synchronization
>>>>>>> that the caller explicitly asked for ;)
>>>>>>
>>>>>> Ouch ... one thing I missed ... what about order-0 reclaim?
>>>>>>
>>>>>> shrink_folio_list() only sets TTU_SYNC for large folio, so can't we still
>>>>>> hit the same race there?
>>>>>
>>>>> Thanks Lance. But this matches the purpose of the TTU_SYNC flag, which is used
>>>>> to avoid racy checks with PVMW_SYNC. If no TTU_SYNC flag is set, it means the
>>>>> caller can tolerate some racy checks.
>>>>>
>>>>> For this case, I think we should set TTU_SYNC unconditionally in
>>>>> shrink_folio_list(). Barry, what do you think?
>>>>
>>>> That makes sense. I hope this doesn't throw a big wrench into our reclaim
>>>> performance numbers.
>>>>
>>>> Can someone benchmark this?
>>>>
>>>> But maybe we should really follow-up with the folio-size based optimization in
>>>> sync_with_folio_pmd_zap(), where we only need a memory barrier (and sufficient
>>>> documentation why something that cannot be PMD-mapped can get away cheaper).
>>>
>>> Dug into the history a bit :D
>>>
>>> TTU_SYNC goes back to Hugh's THP splitting fix [1]. A racing zap could
>>> clear the PTE/PMD before updating mapcount, so the walker could skip the
>>> lock and return before the accounting caught up.
>>>
>>> Barry later enabled it for large-folio reclaim [2], to avoid skipping
>>> temporarily cleared PTEs and ending up with a partially unmapped folio.
>>> He mentioned that small folios had the same race, but with just one PTE,
>>> they couldn't be partially unmapped. That's where the large-folio check
>>> in shrink_folio_list() came from.
>>>
>>> Then PTE table reclaim [3] added another way to end up with an empty PMD,
>>> even for a folio that can't be PMD-mapped. The truncation fix [4] moved
>>> the rmap flush before the PMD clear and extended synchronization in
>>> zap_pmd_range() to cover those folios too.
>>>
>>> Looking back at the truncation discussion [5], you also pointed out that
>>> page_vma_mapped_walk() needed checking, and suggested a possible
>>> folio-size based optimization in the helper.
>>
>> Thanks.
> 
> Cheers!
> 
>>> [1] https://lore.kernel.org/all/c1e95853-8bcd-d8fd-55fa-e7f2488e78f@google.com/
>>> [2] https://lore.kernel.org/all/20240306095219.71086-1-21cnbao@gmail.com/
>>> [3] https://lore.kernel.org/all/92aba2b319a734913f18ba41e7d86a265f0b84e2.1733305182.git.zhengqi.arch@bytedance.com/
>>> [4] https://lore.kernel.org/all/14ebbd556cc4941f0ebc43da59fa6a2fdca25dc8.1793148609.git.baolin.wang@linux.alibaba.com/
>>> [5] https://lore.kernel.org/all/08a0907f-8e3a-4071-a2e4-fd1411c446f3@kernel.org/
>>>
>>> So, how about starting with order-0 folios?

.......

>>>
>>> atomic_add_negative() provides full ordering for mapcount updates. With
>>> 243cf1f67b36, rmap removal completes before clearing PMD, including when
>>> another CPU reclaims an empty table under PTE lock. So smp_rmb() is enough
>>> here, without an extra writer-side barrier.
>>
>> I'm afraid the memory barrier here is subtle. __folio_remove_rmap() is
>> complex, and in the CONFIG_NO_PAGE_MAPCOUNT branch,
>> folio_sub_return_large_mapcount() doesn't provide full ordering, so we
>> may still need smp_wmb().
> 
> Yeah, agreed for large folios. In the diff above, only order-0 folios
> use smp_rmb().
> 
> Note that order-0 folios take the fully ordered atomic_add_negative()
> branch and skip the CONFIG_NO_PAGE_MAPCOUNT branch entirely.

Yes.

> static __always_inline void __folio_remove_rmap(struct folio *folio,
> 		struct page *page, int nr_pages, struct vm_area_struct *vma,
> 		enum pgtable_level level)
> {
> 	...
> 	switch (level) {
> 	case PGTABLE_LEVEL_PTE:
> 		if (!folio_test_large(folio)) {
> 			nr = atomic_add_negative(-1, &folio->_mapcount);
> 			break;
> 		}
> 
> 		if (IS_ENABLED(CONFIG_NO_PAGE_MAPCOUNT)) {
> 			nr = folio_sub_return_large_mapcount(folio, nr_pages, vma);
> 			...
> 		}
> 		...
> 	}
> 	...
> }
> 
> And large folios still take the PMD lock :D

IIUC, the memory barrier optimization targets all non-PMD-sized folios 
(including large folios). That is, for PMD-sized large folios we still 
use the original PMD lock, while for other non-PMD-sized folios we can 
use memory barriers to sync.
