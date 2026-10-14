Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345442D063E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987382; cv=none; b=IfrUNnS9O7a908Q7jljVsOPIrzS+XuhW3TlBjXBMUL7FVwt2bkFSMHAS+0GZ7Erxtw8gcuw6lAWCnWt6ckHc6L5o3O6p7ZmXkok1+iMQDzpRctMeeTp61+/oXOQio6U+aHdqT7CrrwRuQwRG6FTvxio+swm7JaQ7Gy9rCczuUD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987382; c=relaxed/simple;
	bh=+gcTnytu6bg29DEP+Z2oFEapatSpXXzRj1ksbk8npt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VT6M4kAn28whhl314xVqvQ1644qJmBgnX1rfXAciajdfqhS9B4QDpgzAT18roASNDtlWRBfrzleLOuHQOGECyNGXyiedTLTyhBWqNetH9oBC+P/OF0aHZ+btzDbdVTRSXa2WsV0EMj6PypwHrwtqB/zkaqzmk6ubFQrLMXHC+24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=kxehxrDm; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kxehxrDm"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3412A1570;
	Wed, 14 Oct 2026 07:16:17 -0700 (PDT)
Received: from [10.164.19.62] (unknown [10.164.19.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BBF633FB7F;
	Wed, 14 Oct 2026 07:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791987380; bh=+gcTnytu6bg29DEP+Z2oFEapatSpXXzRj1ksbk8npt4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kxehxrDm3UjrSeH8mx0a1SGe+IcIGgxOr9On33ZZWq3Tj4LdEPkUYFFvr2SXVqzLq
	 3fQi006eqvaihoKsVwPFwMR3K++MZonmqTJje5Z2ew/8zm0hO78RsfkGwg2mDWbj3a
	 ywnzqZBIJeCgPJi5R/Y/R78erG0j3/+PzbLgstKA=
Message-ID: <55f51fb8-9777-424a-b45f-a6a5bd9a4693@arm.com>
Date: Wed, 14 Oct 2026 19:46:12 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/5] mm/page_alloc: count a merged buddy's pages under
 the merged type
To: Rik van Riel <riel@surriel.com>, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
 Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>,
 linux-mm@kvack.org
References: <20261007021250.1665929-1-riel@surriel.com>
 <20261007021250.1665929-3-riel@surriel.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20261007021250.1665929-3-riel@surriel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 07/10/26 7:42 am, Rik van Riel wrote:
> __free_one_page() merges a freed page with a free buddy of another
> mergeable type at pageblock order and above, and retypes the buddy to
> match. The buddy's pages stay counted under the old type: nothing moves
> them to the merged type in the free counts.
> 
> That is unobservable today. NR_FREE_PAGES does not separate types, so the
> missing move nets to zero there.  Any future per-type free count would
> undercount on a merge from the other side, and allocating the merged
> run later could wrap it.
> 
> Move the buddy's pages to the merged type in the count too.
> 
> Assisted-by: LLM
> Signed-off-by: Rik van Riel <riel@surriel.com>
> ---
>  mm/page_alloc.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 4658af97be010..ae38e25971559 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -993,6 +993,11 @@ static inline void __free_one_page(struct page *page,
>  			account_freepages(zone, 1 << order, migratetype);
>  		} else {
>  			__del_page_from_free_list(buddy, zone, order, buddy_mt);
> +			/* The buddy's free pages join the merged block's type. */
> +			if (unlikely(buddy_mt != migratetype)) {
> +				account_freepages(zone, -(1 << order), buddy_mt);
> +				account_freepages(zone, 1 << order, migratetype);
> +			}
>  		}
>  

MAX_PAGE_ORDER > pageblock_order confuses things so much : (

Sashiko raises something:
https://sashiko.dev/#/patchset/20261007021250.1665929-1-riel%40surriel.com

Although feels like it is exaggerating.

My concern is for systems with a high diff between MAX_PAGE_ORDER and
pageblock_order. So on arm64 systems with 64K pagesize but pageblock
size as 2M (and PMD size 512M), the pageblock order is 5. We use this
configuration to reliably get TLB optimization from contpte size mappings.

Will we then repeatedly overflow the pcpu counter into the zone counter,
regressing stuff?

Perhaps I am overthinking. Your approach is clean, but perhaps we could
also do:

void account_freepages_move(zone, order, buddy_mt, mt)

	/* PCP-types do not have per-migratetype free counts. */
	if (likely (buddy_mt < MIGRATE_PCPTYPES && mt < MIGRATE_PCPTYPES))
		return;

account_freepages(zone, -(1 << order), buddy_mt);
account_freepages(zone, 1 << order, migratetype);


>  		if (unlikely(buddy_mt != migratetype)) {

