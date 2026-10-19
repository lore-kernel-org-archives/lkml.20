Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B981F367B9B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403025; cv=none; b=HRQg3ZwhcQprGGs6e/yS3N3plwROUs5u1UKQ988WTTdx9jMaOfB38ctyAvOFX+c/0u7zyGHaHlHBfic6pCSowx+2E0yl+fS4Gnx6WnWmP0HC8Jr3rg+Pf7fUKGe9wOAI/XmGCWIfA+8QBsYiVlLErytiFZM/ny3KTuKuew2ucRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403025; c=relaxed/simple;
	bh=wjXWIDX6E9efo9SoSpjdI20BZtWXx7eS+3XUoeg9ZNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bhWPAxu4YH3boioCmIjLs5cfZ0Q5P6rtqksnMGj4tWI4EPhFZQ9FcOrgoTIqOJAdGy1/8GwfV8GJ5gWVQMjUjbK2cWkRjKGegTNsLbId5zZdg3xi3EKBLNV8pd8hXnBED1xz5oKtzPc9MrQgmpx+pZCs1WlfKXxxSzk+BiLuc+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=kzoGYgAt; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kzoGYgAt"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B27381477;
	Mon, 19 Oct 2026 02:43:39 -0700 (PDT)
Received: from [10.164.19.55] (unknown [10.164.19.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A0C03F7D8;
	Mon, 19 Oct 2026 02:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792403022; bh=wjXWIDX6E9efo9SoSpjdI20BZtWXx7eS+3XUoeg9ZNQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kzoGYgAtae0nazZp7bpP9KyWhmuMn3GVItwvwoGbReeCO+g83J2C/FwjVqg3gdYK5
	 oeHmWsJ7W14jhVHG3L1eZ4ixsojf/Z07R9Z5ntxW8WLBmXhk6N+dGG96jlP7OXeyaG
	 zkAU0KehFADdXdCZubV6ojQ/bgMqg9GYgpeTcezk=
Message-ID: <f4b8c610-abc4-4c0c-8d15-5d2de679a409@arm.com>
Date: Mon, 19 Oct 2026 15:13:33 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 4/4] mm: compaction: skip unmovable blocks for
 non-costly proactive mTHP compaction
To: Bo Zhang <zhangbo0325@gmail.com>, akpm@linux-foundation.org,
 vbabka@kernel.org, david@kernel.org
Cc: surenb@google.com, mhocko@suse.com, brendan.jackman@linux.dev,
 hannes@cmpxchg.org, ziy@nvidia.com, ljs@kernel.org, liam@infradead.org,
 rppt@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev,
 kasong@tencent.com, baohua@kernel.org, axelrasmussen@google.com,
 yuanchu@google.com, weixugc@google.com, zhaonanzhe@xiaomi.com,
 lipengfei28@xiaomi.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Bo Zhang <zhangbo56@xiaomi.com>
References: <20261001001412.3837085-1-zhangbo56@xiaomi.com>
 <20261001001412.3837085-5-zhangbo56@xiaomi.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20261001001412.3837085-5-zhangbo56@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 01/10/26 5:44 am, Bo Zhang wrote:
> Proactive compaction scans all pageblocks including unmovable/reclaimable
> ones. For non-costly mTHP orders (<= PAGE_ALLOC_COSTLY_ORDER), those blocks
> are dominated by non-migratable kernel allocations (slab, page tables) and
> scanning them wastes cycles: a small order is easily satisfied from movable
> blocks alone, so there is no need to scavenge the few migratable fallback
> pages inside unmovable blocks.
> 
> Costly orders keep scanning all blocks: they are hard to form and benefit
> from any migratable page available, including allocator fallbacks inside
> unmovable blocks.

I think this is a reasonable compromise for now.

> 
> Restrict non-costly proactive compaction to movable/CMA blocks.
> 
> Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
> ---
>  mm/compaction.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/mm/compaction.c b/mm/compaction.c
> index 0ff454ee5604..deddf931d0f2 100644
> --- a/mm/compaction.c
> +++ b/mm/compaction.c
> @@ -1404,10 +1404,19 @@ static bool suitable_migration_source(struct compact_control *cc,
>  							struct page *page)
>  {
>  	int block_mt;
> +	unsigned int order = compact_hpage_order();
> +	bool costly = order > PAGE_ALLOC_COSTLY_ORDER;
>  
>  	if (pageblock_skip_persistent(page))
>  		return false;
>  
> +	if (is_via_compact_memory(cc->order) && !costly) {
> +		block_mt = get_pageblock_migratetype(page);
> +		if (block_mt == MIGRATE_MOVABLE || is_migrate_cma(block_mt))
> +			return true;
> +		return false;
> +	}
> +
>  	/*
>  	 * Background compaction produces blocks for the zone at
>  	 * large, with no particular allocation context. Allow al
