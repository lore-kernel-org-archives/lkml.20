Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794453963;
	b=baHzq95nYPomAprqcZJE5T01nHvT9cvu+mEgzejPVqh5Ir7GC5NjxjL6L9WWf4XmNHLF
	 VDA+IHF9cnRwMieO+0UwONehL41Dph5sAxy3vsHb7nhxSrsrlX8oQSL+jUgIKq5I3p7Zx
	 XxC8b6jgdJPNF/AiY7dB+C4mO+0IWmYhT1wxZ5Bi03V72twlgx2HLvZ/+/LfaDprhwOT9
	 Og3krHizR2rsEMekKZOyEAwZ5a4yEvH3wWXcifkiTt5KRlyN2frL+vpd4Gz2Wl/iHFxr3
	 e0uSlBEF3IoG6UjAbVpbfmOg2tMsfcTzLzUmIppk9KqlgsOfL4S5VGkAv11aWjjuzbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794453963;
	h=DMARC-Filter:DKIM-Signature:To:Cc:User-Agent:X-Original-From:
	 References:X-Lms-Return-Path:Subject:Mime-Version:Content-Type:
	 Content-Transfer-Encoding:From:Date:Message-Id:In-Reply-To;
	bh=KwVkcbc7y+N/n0v3EmYPeXpyF8Leg60aXI1iqgxnOa0=;
	b=iiT0HxUidNaIHpI7OQlgdlG0bflv7+WbgWMy0OxdzpWjjZ+VUU9e9hGNAZDO72Ts0/CX
	 UcEF/gOlHEzkj3T3BQLtwPYhifMrjMcKKCOmoIyldcYtvVunEfVxkAcyWWKjQYsO782e9
	 rPtwTzScjYH8tLTCZYVm5Z+eQ0dE1nO5sd9x7Vx0yH7JTMnpWx6gZ9+opGOI0qfoOARr5
	 m51VRdXw9UuAuP1dVWVKsfnZwQedyA4rjtj6ADet3/DxBRMe/6taPkCSzrFI3gfrp0mdU
	 KYeX7ph7LMVSfTrW6ecNObMsOrhAvOyXAvdoGdcBFJ8BtzhX+vgeRih0ZdQSyWmcmYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=Z0WoG611;
	arc=none smtp.remote-ip=209.127.230.113
Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F10606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80F10606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=Z0WoG611
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794453957; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=KwVkcbc7y+N/n0v3EmYPeXpyF8Leg60aXI1iqgxnOa0=;
 b=Z0WoG611yUE9gGcjG0XpeLIJj6VT4JCy5VpnIaefcKpVYPNuzo32E8xZLThNJ3pBZib0mK
 p1s4SaULdFh5qaLeNcTsbojeBXgfosa8Z/HP3Blrm/iQ8UbgXhyMbSjna7nN7dKySoN7HT
 QxhQ2hD6swpK92wcmH0BicOV9kke84batljU8gfrru5vivB7wKQjskfNaB7u7PDSS0FbmJ
 6my62Te8jMz7J8BcCrRLrvswnYZN0wtj56nxChvwBsrwd1ZwH0v1yO33vhHOVfZkohp9qs
 EQ7XC7TW0PUtKK+ikQXn9hwfZ/Cgk1GsOaiUovpvcnS9VQOLViRShJw7ntJusQ==
To: "David Hildenbrand (Arm)" <david@kernel.org>, 
	"Qi Zheng" <qi.zheng@linux.dev>, <muchun.song@linux.dev>, 
	<osalvador@suse.de>, <akpm@linux-foundation.org>, <azpijr@gmail.com>, 
	<lance.yang@linux.dev>
Cc: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
User-Agent: Mozilla Thunderbird
X-Original-From: Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1794046188.git.zhengqi.arch@bytedance.com> <b1c1c835-180a-49e2-86c0-bc3f65981728@kernel.org>
X-Lms-Return-Path: <lba+26af531c3+d6ed4b+vger.kernel.org+zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v3 0/3] mm: hugetlb: fix CMA-related issues
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
From: "Qi Zheng" <zhengqi.arch@bytedance.com>
Date: Thu, 12 Nov 2026 11:25:38 +0800
Message-Id: <7e733c3b-2aa2-406e-a5ca-cd9a2c872f9f@bytedance.com>
In-Reply-To: <b1c1c835-180a-49e2-86c0-bc3f65981728@kernel.org>

Hi David,

On 11/12/26 6:05 AM, David Hildenbrand (Arm) wrote:
> On 11/7/26 11:30, Qi Zheng wrote:
>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>
>> Hi all,
>>
>> This series fixes three CMA-related issues in HugeTLB reservation,
>> long-term pinning and allocation:
>>
> 
> Can I hand you over another CMA-related hugetlb problem?
> 
> On arm64, we can end up allocating 1GiB and 32MiB hugetlb folios from the cma
> region.
> 
> Doing that dynamically is not a problem. Doing it during boot doesn't quite work.
> 
> cma_reserve_early() does not handle any kind of alignment.
> 
> So if you allocate a 32M folio followed by a 1G folio, the 1G folio will
> suddenly start at offset 32M, not being naturally aligned in physical address space.

Yes.

> 
> Likely cma_reserve_early() must be taught to align (and maybe consume an order
> instead of a size), similar to how the dynamic cma allocations work.

However, simply adding alignment would leave gaps that the
current activation code cannot distinguish from actual reservations.

The early allocation path would become:

hugetlb_cma_alloc_bootmem()
   -> cma_reserve_early()
        pfn = ALIGN(cmr->early_pfn, nr_pages);
        cmr->early_pfn = pfn + nr_pages;
        cma->available_count -= nr_pages;

For a CMA range starting at 4 GiB, reserving 32 MiB followed by 1 GiB
would produce:

4 GiB       4 GiB + 32 MiB             5 GiB             6 GiB
| 32 MiB used |------ 992 MiB gap ------| 1 GiB used       |
                                                         ^
                                                     early_pfn

Later, cma_activate_area() marks the entire prefix below early_pfn as
allocated, including the gap:

count = early_pfn[r] - cmr->base_pfn;
bitmap_count = cma_bitmap_pages_to_bits(cma, count);
bitmap_set(cmr->bitmap, 0, bitmap_count);

It only initializes and frees pageblocks after that cursor:

for (pfn = early_pfn[r]; pfn < cmr->base_pfn + cmr->count;
      pfn += pageblock_nr_pages)
	init_cma_reserved_pageblock(pfn_to_page(pfn));

The gap therefore remains reserved and marked allocated. Releasing the
two HugeTLB folios only clears their own ranges through
cma_release_frozen(); neither release covers the gap. Those 992 MiB
would be permanently lost from usable CMA capacity.

So we would also need to track the gaps, clear their bitmap bits during
activation, and initialize them as free CMA pageblocks.

> 

Another possibility would be to give 32 MiB pages their own pool,
similar to the separate PMD-sized pool proposed in the other series. On
arm64 with 4 KiB base pages, 2 MiB, 32 MiB and 1 GiB allocations would
then use separate pools.

This could work during early boot too: hugetlb_cma_reserve() establishes
the CMA areas and their ranges before hugetlb_bootmem_alloc() runs.
Although the bitmaps are allocated later, each range already has its
own early_pfn. With naturally aligned ranges and one allocation size
per pool, the cursors would stay aligned without creating gaps.

What do you think?

Thanks,
Qi
