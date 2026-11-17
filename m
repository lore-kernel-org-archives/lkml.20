Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.26
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794898546;
	b=wsskBaSKrAD5hb0eWiJ2RkLZPaxmoWF/UN7oHYv8g+VtYhn8ykrpr3h6tV+xRWejn9LG
	 1l5ZYS3sdfCZRoHR7k8rIeL7j/tN2m9kehpiIicsQEVzRstcYg8ArBTtfY3sSOMLfVrVZ
	 dKsQPpxrH4e+47Tgm4BCyReuwMr98dWQHtRsXUyeZt3qXaqs6L/wIu0591xBHW++fKv3U
	 alEp8PDVmgmG37lrsvxmjhVXOv2Win0lmFj71rJbAqYAdgKtzUNdbIVKTO9ZG9b2nzlps
	 eOe6DEF1QwDD4Ol+A/ADrXPcTH0w12JKrtW7X2G3cdfptxGj7RxKHAqy0kxGP7HSmug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794898546;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=2oPYcBnyfKFBVmYGFPt3g8Jq1FN6zDjS6/VkvCawi+A=;
	b=BJtUZ4aK7tHCBH8hiq2dPhv+UyNzEgqJn+8VeokDyrXiGyhkUuwT2Kyz36NrPEMwmGvf
	 13csZjaJSXTgYfkc8qVQWzPKDodIc9OU4NUvZOx6bIeOBp3AgGw8ecXwo+9npbO+UeNIv
	 OHYFR46ScAoscdHdvF69GdTjKNvN0UY/dG2nw74btMzKwZMjESGcOcYf7PrDe+BUwu+ab
	 dWyWBTkdZ6ZBXLYxcp9hcDI0vQ8GKLOYDkaFrpV7ZtjgRgD4HxjhHA9NiYTPNfzoXU2Bo
	 6fghCcu96jNzDfccPfE1PuTm8EX1dQIr4DnNVO5PLcBXqHJ/Bl6UMlsYo53LVtjBtWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lXgRurMK;
	arc=none smtp.remote-ip=95.215.58.26
Received: from mta1.migadu.com (out-26.mta1.migadu.com [95.215.58.26])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BD5606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12BD5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lXgRurMK
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SU0b3f1zTiBLHbxV73c/5LDRiiQt2cN7KkcKdsVywD0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794898543; v=1; x=1795503343;
 b=lXgRurMK73j3nPHPEDrTPBOxyd8BD2/bhOZcU3E6iNtYJ8OIS3qBwRq8/vLYoj/f1d17VABg
 I6O9Um6r8E5j877oq1AFPW558zMJO9Bwyi2jF2lcE1g/H7Oy8y0hmLjPYr1Ew/dHp7SqifEUfes
 pqkfq9BAQZ+vFtjsHFT4EQXs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6d3558f114912485;
	Tue, 17 Nov 2026 06:55:42 +0000
X-Mizu-Trace-ID: 6d3558f114912485
X-Migadu-Flow: FLOW_OUT
Message-ID: <c3906ff3-c5ee-4672-8bab-2318185268c8@linux.dev>
Date: Tue, 17 Nov 2026 14:55:36 +0800
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
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, muchun.song@linux.dev,
 akpm@linux-foundation.org, osalvador@suse.de, azpijr@gmail.com,
 lance.yang@linux.dev, Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1794046188.git.zhengqi.arch@bytedance.com>
 <b1c1c835-180a-49e2-86c0-bc3f65981728@kernel.org>
 <7e733c3b-2aa2-406e-a5ca-cd9a2c872f9f@bytedance.com>
 <bc6ffcff-3aaa-43da-91b4-82f27513c761@linux.dev>
 <1e0aa28d-f81b-411f-92a3-6038c3961443@kernel.org>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <1e0aa28d-f81b-411f-92a3-6038c3961443@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi David,

On 11/16/26 8:07 PM, David Hildenbrand (Arm) wrote:
> 
> Hi,
> 
> sorry somehow I missed your mail.
> 
> 
>>>
>>>>
>>>> Likely cma_reserve_early() must be taught to align (and maybe consume an order
>>>> instead of a size), similar to how the dynamic cma allocations work.
>>>
>>> However, simply adding alignment would leave gaps that the
>>> current activation code cannot distinguish from actual reservations.
>>>
>>> The early allocation path would become:
>>>
>>> hugetlb_cma_alloc_bootmem()
>>>      -> cma_reserve_early()
>>>           pfn = ALIGN(cmr->early_pfn, nr_pages);
>>>           cmr->early_pfn = pfn + nr_pages;
>>>           cma->available_count -= nr_pages;
>>>
>>> For a CMA range starting at 4 GiB, reserving 32 MiB followed by 1 GiB
>>> would produce:
>>>
>>> 4 GiB       4 GiB + 32 MiB             5 GiB             6 GiB
>>> | 32 MiB used |------ 992 MiB gap ------| 1 GiB used       |
>>>                                                            ^
>>>                                                        early_pfn
>>>
>>> Later, cma_activate_area() marks the entire prefix below early_pfn as
>>> allocated, including the gap:
>>>
>>> count = early_pfn[r] - cmr->base_pfn;
>>> bitmap_count = cma_bitmap_pages_to_bits(cma, count);
>>> bitmap_set(cmr->bitmap, 0, bitmap_count);
>>>
>>> It only initializes and frees pageblocks after that cursor:
>>>
>>> for (pfn = early_pfn[r]; pfn < cmr->base_pfn + cmr->count;
>>>         pfn += pageblock_nr_pages)
>>> 	init_cma_reserved_pageblock(pfn_to_page(pfn));
>>>
>>> The gap therefore remains reserved and marked allocated. Releasing the
>>> two HugeTLB folios only clears their own ranges through
>>> cma_release_frozen(); neither release covers the gap. Those 992 MiB
>>> would be permanently lost from usable CMA capacity.
>>>
>>> So we would also need to track the gaps, clear their bitmap bits during
>>> activation, and initialize them as free CMA pageblocks.
> 
> Ugh, what a hacky mess people created.
> 
>>>
>>>>
>>>
>>> Another possibility would be to give 32 MiB pages their own pool,
>>> similar to the separate PMD-sized pool proposed in the other series. On
>>> arm64 with 4 KiB base pages, 2 MiB, 32 MiB and 1 GiB allocations would
>>> then use separate pools.
> 
> That would be cleanest. Would it break existing setups?

Yes, this requires an existing user to explicitly configure a 32M memory
pool.

But in practice there shouldn't be such a user today, otherwise the
misalignment issue would have surfaced long ago, wouldn't it?

> 
> 
> Another quick-fix idea could be to always allocate larger folios first.
> 
> That way we should avoid any holes, right>

Ah, this looks feasible. How about the following?

(If that looks good, this could go as a stable-first fix.)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 6fba92b0f6749..32e65ce347c90 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4556,6 +4556,22 @@ void __init hugetlb_bootmem_set_nodes(void)
  		node_set(nid, hugetlb_bootmem_nodes);
  }

+/* Return the largest early-CMA hstate below the given order. */
+static struct hstate * __init
+hugetlb_next_early_cma_hstate(unsigned int order)
+{
+	struct hstate *h, *next = NULL;
+
+	for_each_hstate(h) {
+		if (!hugetlb_early_cma(h) || huge_page_order(h) >= order)
+			continue;
+		if (!next || huge_page_order(h) > huge_page_order(next))
+			next = h;
+	}
+
+	return next;
+}
+
  void __init hugetlb_bootmem_alloc(void)
  {
  	struct hstate *h;
@@ -4571,9 +4587,19 @@ void __init hugetlb_bootmem_alloc(void)
  	for_each_hstate(h) {
  		h->next_nid_to_alloc = first_online_node;

-		if (hstate_is_gigantic(h))
+		if (hstate_is_gigantic(h) && !hugetlb_early_cma(h))
  			hugetlb_hstate_alloc_pages(h);
  	}
+
+	/*
+	 * CMA ranges are aligned to the largest supported size. Allocate larger
+	 * sizes first to keep the early reservation cursor aligned without gaps.
+	 */
+	h = hugetlb_next_early_cma_hstate(UINT_MAX);
+	while (h) {
+		hugetlb_hstate_alloc_pages(h);
+		h = hugetlb_next_early_cma_hstate(huge_page_order(h));
+	}
  }

  /*

> 
>>>
>>> This could work during early boot too: hugetlb_cma_reserve() establishes
>>> the CMA areas and their ranges before hugetlb_bootmem_alloc() runs.
>>> Although the bitmaps are allocated later, each range already has its
>>> own early_pfn. With naturally aligned ranges and one allocation size
>>> per pool, the cursors would stay aligned without creating gaps.
>>>
>>> What do you think?
>>
>> Hi David, gentle ping
>>
>> I’d like to update to v5 so that I can continue advancing the support
> 
> Feel free to fix this issue here independently from the current series.

OK. I'll go ahead and post the v5.

> 
>> for 2M hugetlb CMA. Regarding this issue, would you like me to include a
>> fix in v5? If you agree with the "split pool" approach, we can handle it
>> as part of the patch set for 2M hugetlb CMA support.
> 
> 
> I think we want a stable-first fix for that.

Got it.

Thanks,
Qi

> 
> 

