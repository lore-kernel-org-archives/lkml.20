Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.164
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794553003;
	b=nwrjxZ3+aA4qPgQiWNizcOIgKjKn751nDmujGTF0tuVZVTb1+H5igP83hRn0wsWBK7ey
	 iSvTvgQVyP71aSzHC9bZOWZJKpJGHqp8bLTTpJ7mfWCnGBDCqbUIRXSzzUqlRB6T6BTpz
	 h+WVFNFoKHFGuijHK9vCdaXS8qc2fI/ZYUxPSsE6Tf1BeXevA+X06hb23Wl08SL4WwU8F
	 68pa0zullrc8LzaPUPhB2wxYCO3x6OZF89AQUcqu2gZwc8yPIyk0Lt/7xGs0kn3Ge0f6P
	 GM5UQfgNIsqBaMjFwg8Yq4UVcFv/cXuSZuQntTu8RxccdTBBPjoqdgcRQ4klaxOEHvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794553003;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dleCmS+wcIoZt0s8RSq4SghUIJElDi6eszWr991uRyM=;
	b=2xc3bDXHQaOz042UYm21JtO6GsCl8YNL/VMEMfe6GO4hxTQ4alfcqU5eGQBW5HZtWMd4
	 6RS/KdsF59RCRYIz6ynYkrCMpHOVMPo9tvmdf7waebF6ex2qy4IdTN13gCQtYQMfndUYI
	 8g2TaCkS5F4tQeW9NYJ8NQgI6vOlcjvzAVNfUVURHAs+7jGiGYNM0emdmlqQA4DkRLKqR
	 gSADB1lIxkx3kqqYoJy/Mq1Gw5UpwXuJ7bKytdPu57iOYGMh6QM8eyrTQeLcQhXZur+/a
	 LXLaRaADkWpDQ3WPmKwFIdvfYlbC9I7CDPf+3GxyA+QIYACBe61ueTON/bpvk4VtfTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UNkyA3Jn;
	arc=none smtp.remote-ip=91.218.175.164
Received: from mta0.migadu.com (out-164.mta0.migadu.com [91.218.175.164])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E84606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5E84606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UNkyA3Jn
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=I3d8MPdHTNroLOq0wxxtMmc+Uc1DmX33W42S6M5zY04=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794553000; v=1; x=1795157800;
 b=UNkyA3JnPdAidvUvOJTuIvQmZpPY8ozTwnkilYyO2Yz0+psZFKteeR6nuYxReRyUReMJdiBE
 LK7CSRmGggvJbt1kemXL0HN7gbpIFRn15BASDwSvJbIJ5HiIuxAgqWbjQxEINhQQ/iIfCEpWU50
 ksCYhpiYNihWqFiKDcKbRxY0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 120149e2deeb02e7;
	Fri, 13 Nov 2026 06:56:40 +0000
X-Mizu-Trace-ID: 120149e2deeb02e7
X-Migadu-Flow: FLOW_OUT
Message-ID: <dbfa9791-5a4e-4837-a2cc-ac506826761c@linux.dev>
Date: Fri, 13 Nov 2026 14:56:34 +0800
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
Subject: Re: [PATCH v4 3/3] mm: hugetlb: fix GFP mask propagation to CMA
To: Kefeng Wang <wangkefeng.wang@huawei.com>, muchun.song@linux.dev,
 osalvador@suse.de, david@kernel.org, akpm@linux-foundation.org,
 azpijr@gmail.com, lance.yang@linux.dev, Qi Zheng <zhengqi.arch@bytedance.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, stable@vger.kernel.org,
 "Oscar Salvador (SUSE)" <osalvador@kernel.org>
References: <cover.1794379433.git.zhengqi.arch@bytedance.com>
 <1c5e8c4ae230dc238a16f2f42d65bffac6244ad3.1794379434.git.zhengqi.arch@bytedance.com>
 <7def88b4-cba5-4e8b-9e68-6069c492b582@huawei.com>
 <1cd3c151-24c2-4fec-8356-99853f8d6971@linux.dev>
 <9b46d8e0-104e-4659-8dec-67eb6f059dac@huawei.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <9b46d8e0-104e-4659-8dec-67eb6f059dac@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/13/26 11:56 AM, Kefeng Wang wrote:
> 
> 
> On 11/13/2026 10:30 AM, Qi Zheng wrote:
>>
>>
>> On 11/12/26 7:27 PM, Kefeng Wang wrote:
>>>
>>>
>>> On 11/11/2026 2:46 PM, Qi Zheng wrote:
>>>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>>>
>>>> cma_alloc_frozen_compound() uses GFP_KERNEL, allowing direct reclaim
>>>> during the first MPOL_PREFERRED_MANY allocation attempt even though
>>>> the caller clears __GFP_DIRECT_RECLAIM.
>>>
>>> MPOL_PREFERRED_MANY is only used for the partner allocator. Without your
>>
>> It's doesn't seem so.
>>
>> Gigantic surplus allocations already use MPOL_PREFERRED_MANY, following
>> eb02f14c4a2b ("mm/hugetlb: allow overcommitting gigantic hugepages"),
>> which predates 9bda131c6093.
>>
>> alloc_buddy_hugetlb_folio
>> --> MPOL_PREFERRED_MANY
>>      --> gfp_t gfp = gfp_mask & ~(__GFP_DIRECT_RECLAIM | __GFP_NOFAIL);
>>          folio = alloc_surplus_hugetlb_folio(h, gfp, mpoli->nid, 
>> nodemask);
>>          --> alloc_fresh_hugetlb_folio
>>              --> only_alloc_fresh_hugetlb_folio
>>                  --> alloc_gigantic_frozen_folio
>>                      --> hugetlb_cma_alloc_frozen_folio
>>                          --> cma_alloc_frozen_compound
>>
>> Before 9bda131c6093, cma_alloc_folio() forwarded the caller's GFP mask.
>> The conversion to cma_alloc_frozen_compound() replaced it with
>> GFP_KERNEL, re-enabling direct reclaim during the preferred-node
>> attempt.
> 
> Oh, I forgot about that commit. The naming and some of the comments are 
> misleading because alloc_buddy_hugetlb_folio/alloc_surplus_hugetlb_folio
> can allocate both buddy and gigantic folios (which can be allocated from
> CMA).
> 
> Maybe rename alloc_buddy_hugetlb_folio to hugetlb_alloc_surplus_folio,
> or other names...

Naming is difficult. ;)

The Hugetlb implementation seems quite messy in many places; let’s focus
on fixing the issues first.

