Received: from mta1.migadu.com (out-81.mta1.migadu.com [95.215.58.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC465437D0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953475; cv=none; b=Jnn2GpQWaBdTRYvkOd6RygW+7YQNw+iCqPifhijSkqwTs3T8f0n/d0iosHEbpwTn2RAiSWCS6T22ywT9K9iN4uqegMG5jvtbL1WggUQRjULFw+V7CY8ZFYW0u5WiG+c2i1BZ743W/FiRqHbxnJ7SJcguyIBklky2x0+jVVG8rjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953475; c=relaxed/simple;
	bh=9HOsj4bih3CqIQmvANIElp6oKbMbWWKSe38JZT060/w=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=hTcA4LrHJDXHCaELjymJne51Hh85vBoybnpqifAKU0s1bmfQ0+pntlrbv3BYvsK3mfFSPoCyqlM6uL9ylmzyT6tRheUVwO1yfrSq0FxrboihcGTrpilQ4GRcKky/bGPUP/YI3EfLeEfosFGw4pyEpEZ3GTPxuHgNkK71vnRoRPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SEzxv1an; arc=none smtp.client-ip=95.215.58.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SEzxv1an"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9HOsj4bih3CqIQmvANIElp6oKbMbWWKSe38JZT060/w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788953471; v=1; x=1789558271;
 b=SEzxv1anCVqI1MluofqeJQ8J/yYHtOlV/yNwkuWtBtRBNoYo6Gr0mXzmLlWknGgpGwVtFPIj
 t29iNPmlfJvua6EQcuCQF30ndnMZs976/fSPnzVXYj5hKVgClth04uIqODBtQIu+o98kRo172E4
 t8zxOt9mLGccOROEoTst3RN8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 5a4d81d9a7ca1752;
	Wed, 09 Sep 2026 11:31:11 +0000
X-Mizu-Trace-ID: 5a4d81d9a7ca1752
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH v5 03/17] mm/mm_init: skip initializing shared vmemmap
 tail pages
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <c465c8e8-c789-458c-8053-4f0db90069ed@kernel.org>
Date: Wed, 9 Sep 2026 19:30:50 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 Michal Hocko <mhocko@suse.com>,
 David Laight <david.laight.linux@gmail.com>,
 "Liam R . Howlett" <liam@infradead.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Qi Zheng <qi.zheng@linux.dev>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <3047F607-7A16-4D7E-B0F1-07ED795EC1BD@linux.dev>
References: <20260825084608.47437-1-songmuchun@bytedance.com>
 <20260825084608.47437-4-songmuchun@bytedance.com>
 <c465c8e8-c789-458c-8053-4f0db90069ed@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 9, 2026, at 17:36, David Hildenbrand (Arm) <david@kernel.org> wrote:
> 
> On 8/25/26 10:45, Muchun Song wrote:
>> memmap_init_range() initializes every struct page in the target range.
>> For compound pages with vmemmap optimization, the tail struct pages are
>> backed by a shared vmemmap page.
>> 
>> Initializing those tail struct pages would overwrite the shared
>> vmemmap page contents, requiring users such as HugeTLB to restore the
>> metadata afterwards.
>> 
>> Track the compound order for HVO-backed sections and use that metadata
>> to detect struct pages that fall into the shared tail vmemmap range.
>> Skip those shared tail pages in memmap_init_range(), then initialize
>> pageblock migratetypes for the processed range with a helper after the
>> per-page initialization loop.
>> 
>> Keep direct mem_section access inside sparse helpers by exposing
>> pfn_to_section_order() to users that only need the order associated with
>> a PFN. This lets memmap_init_range() skip shared tail vmemmap pages
>> without exposing __pfn_to_section() to !SPARSEMEM builds.
>> 
>> This is a preparatory change for consolidating handling across users of
>> vmemmap optimization, and it also avoids redundant initialization of
>> shared tail vmemmap pages during early boot. That early-boot benefit
>> appears only once HugeTLB is switched to this common handling, since
>> HugeTLB is the early-boot user that creates those shared tail vmemmap
>> pages.
>> 
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>> v5:
>> - Add comments for pageblock migratetype helper callers and shared
>>  tail vmemmap skipping (suggested by Mike Rapoport)
>> 
>> v4:
>> - Rename pfn_vmemmap_optimizable() to vmemmap_optimizable_pfn()
>>  for consistency with vmemmap_optimizable_order()
>> 
>> v3:
>> - Replace the !SPARSEMEM __pfn_to_section() stub with
>>  pfn_to_section_order() (suggested by Mike Rapoport)
>> 
>> v2:
>> - Fold section order tracking into the first user instead of keeping a
>>  standalone API-only patch (suggested by Mike Rapoport)
>> - Rename page_vmemmap_optimizable() to pfn_vmemmap_optimizable() and
>>  pass a PFN directly (suggested by Mike Rapoport)
>> - Initialize pageblock migratetypes from a helper after the per-page
>>  loop (suggested by Mike Rapoport)
>> - Use a 1G PFN chunk for cond_resched() in the pageblock helper
>>  (suggested by Mike Rapoport)
>> - Guard section_order() with CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP so
>>  it returns 0 when HVO is disabled and lets the compiler optimize the
>>  code as much as possible (suggested by Mike Rapoport)
>> - Explain why the !SPARSEMEM __pfn_to_section() stub belongs here
>>  (suggested by Mike Rapoport)
>> ---
>> include/linux/mmzone.h |  8 ++++++++
>> mm/mm_init.c           | 40 +++++++++++++++++++++++-----------------
>> mm/sparse.h            | 33 +++++++++++++++++++++++++++++++++
>> 3 files changed, 64 insertions(+), 17 deletions(-)
>> 
>> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
>> index 5fb9b37819d5..df31cac12311 100644
>> --- a/include/linux/mmzone.h
>> +++ b/include/linux/mmzone.h
>> @@ -2022,6 +2022,14 @@ struct mem_section {
>> unsigned long section_mem_map;
>> 
>> struct mem_section_usage *usage;
>> +#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
>> + /*
>> + * Normally, sections hold regular (order-0) pages. However, for
>> + * sections with HVO enabled, this tracks the compound page order
>> + * to enable deduplication of redundant vmemmap pages.
>> + */
>> + unsigned int order;
> 
> order is a way too generic name for this. page_order? compound_page_order?

compound_page_order is more accurate. I think it is more suitable.

Thanks.

> 
> -- 
> Cheers,
> 
> David

