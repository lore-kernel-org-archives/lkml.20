Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830845;
	b=qukt4k4E3DWyeLD26+nz6XnKSDRFXpHjZ5TbE3X8qcKMFYCYrgP17usCLeQ8Lxwj7/M8
	 A86UE060d1X3Lm9S9/4zjqNhqgBhEH22vXAS86+NeSBMDzdnMFvHgBAk5N3xEYsIB2fWi
	 nEGk/XXAoE2MJmppZCIp/ic2yffewwhfOSksXRuWzmKADcY1HeL9K54ZR8mR4Hr1PRrTW
	 YBJ2r4WeVDVduqIYNdAPT8P0Blv2jbnYOnvPaXxE68BNPI0ltGZnfADSeCbrJcHh+r1E/
	 4iXxUdaCUVKByHhtlELgem7Xz4gwvz7hJfPGAL0ZXRPdUnpHtAtXG0tCUBXPk/EUwMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830845;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ij8WSxLYaSgmAPv+jagcVK+yha+ciyMwZ9KkBQ7XuS4=;
	b=3VcbaM2Q7JNWL7Zow5qIc7IBCGS7Vs0xlb8R0Oh93pgaiJCyBGo3q8arQVne2Y8Hx1tk
	 3Zo3tj1GwU8b5QuAbnud0esYSxnXiCw5y1mOLCacsmtayFZZLm6WbupJ1QV2cYqkTa6Lb
	 iRslUREjUiNCX7l76t0fs3RSL+gMpn3e7r9fHWxYAdLMxAClkSDH4mrmVStxg0z+7J/85
	 NGKcdS0LtWjHU/vyP1FD+2AxY1SUkAHZicuR12wQ7WP+7nvOdy8QH/gnmZBGcDp2CPft/
	 Q9nze9Xu6hn4KE9Z8Ei7tmCzPVY9uZXdd0oAqJ2grD4DJaSUi6Y0qxH0228uT9QP8Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ivsEIs4+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444AB606A331
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ivsEIs4+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF5B1F000C8;
	Mon, 16 Nov 2026 12:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794830844;
	bh=ij8WSxLYaSgmAPv+jagcVK+yha+ciyMwZ9KkBQ7XuS4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ivsEIs4+7/BW6VgPWZm59IX9DUE+CcxD8Ik/p0Jg9nUHcNnsr6vuy5ILNcIfFtGz3
	 9XtbyNW2JaNam6wckrVnT0BZQX80jActeCTiZFeurMS0coLCl0bVTllwcJtniPuUMU
	 lRbwWUguQRAEkmq/AZHy99OjB9JF/A1oxhg9pAFzWPz/4iAZS2t4Ar78ESskRXWCfa
	 iBol6fu6irlSdzk+JXMjfwYUAIzjbBdRq5KYnu7DXRHlJ55057RUg9EOj4GdCradLR
	 XZpiXMGDVwLRVBuQsl/1SzrjSvT6RI7FTO3yEOcRAKa5ZHyoA32q3WHxvLjrWYuZCv
	 abDq+pjxyKNYg==
Message-ID: <1e0aa28d-f81b-411f-92a3-6038c3961443@kernel.org>
Date: Mon, 16 Nov 2026 13:07:16 +0100
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
To: Qi Zheng <qi.zheng@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Qi Zheng <zhengqi.arch@bytedance.com>, muchun.song@linux.dev,
 akpm@linux-foundation.org, osalvador@suse.de, azpijr@gmail.com,
 lance.yang@linux.dev
References: <cover.1794046188.git.zhengqi.arch@bytedance.com>
 <b1c1c835-180a-49e2-86c0-bc3f65981728@kernel.org>
 <7e733c3b-2aa2-406e-a5ca-cd9a2c872f9f@bytedance.com>
 <bc6ffcff-3aaa-43da-91b4-82f27513c761@linux.dev>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <bc6ffcff-3aaa-43da-91b4-82f27513c761@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Hi,

sorry somehow I missed your mail.


>>
>>>
>>> Likely cma_reserve_early() must be taught to align (and maybe consume an order
>>> instead of a size), similar to how the dynamic cma allocations work.
>>
>> However, simply adding alignment would leave gaps that the
>> current activation code cannot distinguish from actual reservations.
>>
>> The early allocation path would become:
>>
>> hugetlb_cma_alloc_bootmem()
>>     -> cma_reserve_early()
>>          pfn = ALIGN(cmr->early_pfn, nr_pages);
>>          cmr->early_pfn = pfn + nr_pages;
>>          cma->available_count -= nr_pages;
>>
>> For a CMA range starting at 4 GiB, reserving 32 MiB followed by 1 GiB
>> would produce:
>>
>> 4 GiB       4 GiB + 32 MiB             5 GiB             6 GiB
>> | 32 MiB used |------ 992 MiB gap ------| 1 GiB used       |
>>                                                           ^
>>                                                       early_pfn
>>
>> Later, cma_activate_area() marks the entire prefix below early_pfn as
>> allocated, including the gap:
>>
>> count = early_pfn[r] - cmr->base_pfn;
>> bitmap_count = cma_bitmap_pages_to_bits(cma, count);
>> bitmap_set(cmr->bitmap, 0, bitmap_count);
>>
>> It only initializes and frees pageblocks after that cursor:
>>
>> for (pfn = early_pfn[r]; pfn < cmr->base_pfn + cmr->count;
>>        pfn += pageblock_nr_pages)
>> 	init_cma_reserved_pageblock(pfn_to_page(pfn));
>>
>> The gap therefore remains reserved and marked allocated. Releasing the
>> two HugeTLB folios only clears their own ranges through
>> cma_release_frozen(); neither release covers the gap. Those 992 MiB
>> would be permanently lost from usable CMA capacity.
>>
>> So we would also need to track the gaps, clear their bitmap bits during
>> activation, and initialize them as free CMA pageblocks.

Ugh, what a hacky mess people created.

>>
>>>
>>
>> Another possibility would be to give 32 MiB pages their own pool,
>> similar to the separate PMD-sized pool proposed in the other series. On
>> arm64 with 4 KiB base pages, 2 MiB, 32 MiB and 1 GiB allocations would
>> then use separate pools.

That would be cleanest. Would it break existing setups?


Another quick-fix idea could be to always allocate larger folios first.

That way we should avoid any holes, right>

>>
>> This could work during early boot too: hugetlb_cma_reserve() establishes
>> the CMA areas and their ranges before hugetlb_bootmem_alloc() runs.
>> Although the bitmaps are allocated later, each range already has its
>> own early_pfn. With naturally aligned ranges and one allocation size
>> per pool, the cursors would stay aligned without creating gaps.
>>
>> What do you think?
> 
> Hi David, gentle ping
> 
> I’d like to update to v5 so that I can continue advancing the support

Feel free to fix this issue here independently from the current series.

> for 2M hugetlb CMA. Regarding this issue, would you like me to include a
> fix in v5? If you agree with the "split pool" approach, we can handle it
> as part of the patch set for 2M hugetlb CMA support.


I think we want a stable-first fix for that.


-- 
Cheers,

David
