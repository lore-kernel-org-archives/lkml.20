Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794887865;
	b=qgGBlQbsgXhdPVZ/OOxgaBBJF5mvChwg/fJZw9fTceZGPm+FvSaPeBSWei7gIVOfgHPv
	 e+PjYfzIFXN4SekCZdx9NEMxMGjhU2AxACZ0GT3WXqJAavwUOu4ZPMIeaUiVM2n0hhpEV
	 ZNBxpQ84Undf3/HZ/w1MewfSq2CWQ4Qs+/ofhfA4cQrVuLEYwoZ3fRl9Z5TWZ0XWBfz7C
	 2CPUVtwgnRy5TLwpReOb3sy+g9V2TLBXixWJYzADi+qlJlF+GaBlrXRFJgn23AGXnwhDe
	 DAotssMWXuB60H1qlJQSsmQqnsosc1GZMwmtYlY3wO9wxEQtIq/9RH3BHkd2juOrfwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794887865;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=izXu3SEz8eIFng5c+cQzMPJh1su6k7eUDwqgFAEy9no=;
	b=lBt8w6Es7/9QGPkSYGmmTDBn47M9JEasqUo+Q/pn/D6DvwQQP7ik3qOAXKk/bHZRD4oG
	 +Or0ZXSsYmONiXpGS+UHcRBkPqzPpJyQEfrPc/A8rPkuGgN2GTeH3rVrO1898QL13Ug0c
	 V/Jcc8ICVS1qvLsk0d+60yHZyh0UZpylN+AqOkgb5yNCAMaZ+6fpJlD+3+/HIK+3a255P
	 ieipSppMeGNQ0gdCmW1gG3LjFf3vh/xsFvY61l8/qmNzZGrbV1MOTiLk1bEm27T8N2q8g
	 pYba4v/jG+0ohX5hDDzmBtI1sP7oM+yN0f5msyJUB93TjHlye5SP9nl7IhhrMTuoU/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="dZ3oK/EA";
	arc=none smtp.remote-ip=95.215.58.203
Received: from mta1.migadu.com (out-203.mta1.migadu.com [95.215.58.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A98606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:57:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83A98606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dZ3oK/EA
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5Txe0D+CvURkPmiB6vwpp+Xu6DG12FpQu2ufKeIMMqA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794887862; v=1; x=1795492662;
 b=dZ3oK/EAar9zcpIqddMZXYRE/bC8qGS96x9te7lMTiyEodAkOYd4rN6fNsGaCFvc7fKRwrYa
 CU9UfWEUBlQiN6hHxN9Mxy1yBZzH5J9qRsnJOBboe1q5W9Wje/B168qEuhArLTOa7iFGxocbNp4
 TLyk25XCYiMYfVAZGLQnUrOU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id dfb182efd82b894e;
	Tue, 17 Nov 2026 03:57:42 +0000
X-Mizu-Trace-ID: dfb182efd82b894e
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v2 00/14] mm: Unify memmap initialization for compound
 pages
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <179482576829.2379196.3205677806966393313.b4-review@b4>
Date: Tue, 17 Nov 2026 11:57:22 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Li Zhe <lizhe.67@bytedance.com>,
 Andrew Popple <apopple@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 James Houghton <jthoughton@google.com>,
 Lance Yang <lance.yang@linux.dev>,
 Qi Zheng <qi.zheng@linux.dev>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <A4F207DD-9535-42EC-B9A6-88578BFE369B@linux.dev>
References: <20261113033442.62970-1-songmuchun@bytedance.com>
 <179482576829.2379196.3205677806966393313.b4-review@b4>
To: Mike Rapoport <rppt@kernel.org>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 16, 2026, at 18:42, Mike Rapoport <rppt@kernel.org> wrote:
> 
> Hi,

Hi Mike,

> 
>> Hi,
>> 
>> This v2 is based on the mm-new branch at commit daed51c91051.
>> 
>> This series is split out from the earlier, larger series
>> "mm: Generalize HVO for HugeTLB and device DAX" [1]. That series
>> generalized vmemmap optimization across HugeTLB and device DAX. One
>> remaining piece is the separate compound struct page initialization used
>> by boot-time gigantic HugeTLB pages and compound ZONE_DEVICE ranges.
>> 
>> This v2 also folds in Li Zhe's two-patch series, using that series' v2
>> as the integration point [2].
>> 
>> Li Zhe (2):
>>  mm/mm_init: factor out memmap_init_page_from_template()
>>  mm/hugetlb: optimize bootmem hugepage tail vmemmap init
>> 
>> Muchun Song (12):
>>  mm/mm_init: verify zones for template-initialized pages
>>  mm/mm_init: factor out common struct page initialization
>>  mm/mm_init: simplify zone device page initialization
>>  mm/mm_init: factor out frozen compound page initialization
>>  mm/hugetlb: drop boot-time HVO handling for gigantic folios
>>  mm/hugetlb: initialize all struct pages for bootmem hugepages
>>  mm/hugetlb: use common compound page initialization helper
>>  mm/mm_init: make __init_single_page() static
>>  mm/mm_init: make memmap_init_page_from_template() static
>>  mm/cma: centralize CMA pageblock initialization
>>  mm/cma: localize init_cma_pageblock() to cma.c
>>  mm/mm_init: move pageblock migratetype init to memmap helpers
>> 
>> include/linux/mm.h   |   8 --
>> mm/cma.c             |  24 +++--
>> mm/hugetlb.c         | 111 ++-----------------
>> mm/hugetlb_vmemmap.c |  17 +--
>> mm/mm_init.c         | 247 +++++++++++++++++--------------------------
>> mm/mm_init.h         |  13 +--
>> mm/sparse-vmemmap.c  |   7 +-
>> 7 files changed, 129 insertions(+), 298 deletions(-)
> 
> That's nice :)
> 
> The series would be easier to review if Li Zhe's patches were integrated
> rather than stacked in. I hoped that the changes for template
> initialization would fit into the patches that rework other parts.

I have a much clearer idea of what you mean by integration now. I'll push
out a new version once the Zhe data testing is finished.

> 
> The way it's done now several patches in the beginning of the series
> change code that the later patches remove or turn some of new functions
> into static.
> 
> Another thing is that the numbers Li Zhe measured were for a different
> implementation, so they would be stale for the state after these
> changes.
> 
> I have some nits and naming comments in a few patches, other than that
> the series LGTM.

Thanks for your review.

Muchun

> 
> -- 
> Sincerely yours,
> Mike.


