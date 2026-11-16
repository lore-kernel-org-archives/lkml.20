Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.248
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794794483;
	b=WZTt/jw037234gDbQ9849BkJqrFzWn0D1aO5MgiU6We3J4L05v6RcIwx+qmQL6L/DhNs
	 Wu1WDMU6jAYxKUwPk8lAoSQ0yS95FZHInDpWYo12rDeL6mKIwLGr0ecwJNbN6Rv56exVp
	 Ud8VdjZBrwUhzuSXqfegdeIFLo4um8N0BrC0gDSlZULlwWIHvZXQPlzB1ER1qE9T+DkfH
	 QFwMkGQztuNWnndje7danXCf/6qEZscnvLrzXEVDDtbCbYqCyt0JQorQ7+N/p7zNuM6wN
	 08j8TdJKQFnHej4jcV7+eEZsTXZtQcWF0v6VbV7/YAN7+qRJrqYwL/dQfYvTpQCQOhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794483;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=oT6p9IiKU91ZvAcaQZmWvOZAnFk+N0TACpK4N2ej6Vk=;
	b=zf/DB4c3z+tj2EJqCMLFleLls6c8rVK0evqQe5lMQHGUcJ4vpHkcqmjQh/2PoDZyH3qV
	 3RbP7+w5LG/naNDdUP96noiXecA7xr3H5d0bphMQWmuS63fS9mT+xTx2SaSeQbPE64drH
	 /WMwfHMZUhYEQCUcWem1WpR6jhYhEnHlzry3Een3tHx1IvKAnE5Z4ZDaHMnyiZweRWIM8
	 ctK8xG18N+IXbDtQN5FozFz0sQDyTVovlxfQTUL4jSVaTrvTTrDxWA6GCylgoawbpCMA7
	 sS4iRfO6CIffnEibDf7JI2OpsmYZuBNru2yjFCurBw/7M2cWZHPDmccWfxfEX+iuf7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=j4dFgkdZ;
	arc=none smtp.remote-ip=91.218.175.248
Received: from mta0.migadu.com (out-248.mta0.migadu.com [91.218.175.248])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACDB606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ACDB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=j4dFgkdZ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rrbl0nuDaW+pJdbFjfWrda5kId++kZCiqnbSpTRa/Zs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794794479; v=1; x=1795399279;
 b=j4dFgkdZfKiV8dYFY6aHoukrw1qGeJ5EV+SHf9HMY7e4In+tI2A4vru5HJT+hcO5kbHM+tod
 44d4AoVpzbK94NIpdYEz+mhNIjq6q0n6CCS4JMcC0nUVlCKMkF+/wjJxxFQv5sTAosP1J5NqfOk
 8oQQKrAHI2CKhi0yPKLvhLEQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5099c89ec1dbd413;
	Mon, 16 Nov 2026 02:01:19 +0000
X-Mizu-Trace-ID: 5099c89ec1dbd413
X-Migadu-Flow: FLOW_OUT
Message-ID: <bc6ffcff-3aaa-43da-91b4-82f27513c761@linux.dev>
Date: Mon, 16 Nov 2026 10:01:15 +0800
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
Subject: Re: [PATCH v3 0/3] mm: hugetlb: fix CMA-related issues
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Qi Zheng <zhengqi.arch@bytedance.com>, muchun.song@linux.dev,
 akpm@linux-foundation.org, osalvador@suse.de, azpijr@gmail.com,
 lance.yang@linux.dev
References: <cover.1794046188.git.zhengqi.arch@bytedance.com>
 <b1c1c835-180a-49e2-86c0-bc3f65981728@kernel.org>
 <7e733c3b-2aa2-406e-a5ca-cd9a2c872f9f@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <7e733c3b-2aa2-406e-a5ca-cd9a2c872f9f@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/12/26 11:25 AM, Qi Zheng wrote:
> Hi David,
> 
> On 11/12/26 6:05 AM, David Hildenbrand (Arm) wrote:
>> On 11/7/26 11:30, Qi Zheng wrote:
>>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>>
>>> Hi all,
>>>
>>> This series fixes three CMA-related issues in HugeTLB reservation,
>>> long-term pinning and allocation:
>>>
>>
>> Can I hand you over another CMA-related hugetlb problem?
>>
>> On arm64, we can end up allocating 1GiB and 32MiB hugetlb folios from the cma
>> region.
>>
>> Doing that dynamically is not a problem. Doing it during boot doesn't quite work.
>>
>> cma_reserve_early() does not handle any kind of alignment.
>>
>> So if you allocate a 32M folio followed by a 1G folio, the 1G folio will
>> suddenly start at offset 32M, not being naturally aligned in physical address space.
> 
> Yes.
> 
>>
>> Likely cma_reserve_early() must be taught to align (and maybe consume an order
>> instead of a size), similar to how the dynamic cma allocations work.
> 
> However, simply adding alignment would leave gaps that the
> current activation code cannot distinguish from actual reservations.
> 
> The early allocation path would become:
> 
> hugetlb_cma_alloc_bootmem()
>     -> cma_reserve_early()
>          pfn = ALIGN(cmr->early_pfn, nr_pages);
>          cmr->early_pfn = pfn + nr_pages;
>          cma->available_count -= nr_pages;
> 
> For a CMA range starting at 4 GiB, reserving 32 MiB followed by 1 GiB
> would produce:
> 
> 4 GiB       4 GiB + 32 MiB             5 GiB             6 GiB
> | 32 MiB used |------ 992 MiB gap ------| 1 GiB used       |
>                                                           ^
>                                                       early_pfn
> 
> Later, cma_activate_area() marks the entire prefix below early_pfn as
> allocated, including the gap:
> 
> count = early_pfn[r] - cmr->base_pfn;
> bitmap_count = cma_bitmap_pages_to_bits(cma, count);
> bitmap_set(cmr->bitmap, 0, bitmap_count);
> 
> It only initializes and frees pageblocks after that cursor:
> 
> for (pfn = early_pfn[r]; pfn < cmr->base_pfn + cmr->count;
>        pfn += pageblock_nr_pages)
> 	init_cma_reserved_pageblock(pfn_to_page(pfn));
> 
> The gap therefore remains reserved and marked allocated. Releasing the
> two HugeTLB folios only clears their own ranges through
> cma_release_frozen(); neither release covers the gap. Those 992 MiB
> would be permanently lost from usable CMA capacity.
> 
> So we would also need to track the gaps, clear their bitmap bits during
> activation, and initialize them as free CMA pageblocks.
> 
>>
> 
> Another possibility would be to give 32 MiB pages their own pool,
> similar to the separate PMD-sized pool proposed in the other series. On
> arm64 with 4 KiB base pages, 2 MiB, 32 MiB and 1 GiB allocations would
> then use separate pools.
> 
> This could work during early boot too: hugetlb_cma_reserve() establishes
> the CMA areas and their ranges before hugetlb_bootmem_alloc() runs.
> Although the bitmaps are allocated later, each range already has its
> own early_pfn. With naturally aligned ranges and one allocation size
> per pool, the cursors would stay aligned without creating gaps.
> 
> What do you think?

Hi David, gentle ping.

I’d like to update to v5 so that I can continue advancing the support
for 2M hugetlb CMA. Regarding this issue, would you like me to include a
fix in v5? If you agree with the "split pool" approach, we can handle it
as part of the patch set for 2M hugetlb CMA support.

Thanks,
Qi

> 
> Thanks,
> Qi

