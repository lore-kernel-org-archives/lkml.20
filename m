Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.127
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832079;
	b=JMevd7IyqcXG76DG6qnIb/elsCK566xXS3WHvgJwZv950CEQgIQSuAy2vEZTrLNvgGIe
	 rNqm5zEKZqh4bBKaQlkF3uvkEirY4560laZ+nH51zC6h4mt26bfykhpwz+Sc5sD0KfNP7
	 +5rde79DfpqLesKGxOtHEkjvWMV87X5PYbXnqISCHC7BLwvdpzPLLw5qE1o2Qbbl0Q4pw
	 eiBIxVXO4IpZ7O+A+dFfLgrMysHYSqwGsqCtP58Zwzpp+3JhH0LtaNCkF7ghed+2R924y
	 fGa/sgAFMfZ/XdPrtWs67AUoGyy/cPkrpi1WCKyw6jZjW10wf+Dd9EcLve52wLw1xUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832079;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=kx5FtkmNVBJTIPMl0Mjj8C0dyNOu/3z6ThVSeBWYgAw=;
	b=BF7kCqqbObAEFCoGiVbt9Q3IPhOOHg0Z+Eg2+xHeqUvznRs7/OXQDX9e7QchYbX4UPk2
	 sJYLvNSyGEARvR9ZyCKS2XZYeNMphYUemuYPeC3r0I2xI50UmJYabsL4HuBYyd7CDH8Em
	 BLmDN2xeH0x5BDve7Jwjdq+41DZa8uQAjLS2++8C6X9NYmqGLGw2jVADwz+rYyDe6q5+5
	 ZuwoYB+vJ9SjSqj0pzkmsKSjMqyxGpIJtjn0Mv6Mc5+a5nVKNqGyJVYE1q5jp/9Ot+OeN
	 VESHKMeUAUsjzemJjdtNj5qtRFSOJqxmt7QvwirgULiHeB+QZKV6e3Q88w7ZSi5w/MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZBUdc5Uu;
	arc=none smtp.remote-ip=95.215.58.127
Received: from mta1.migadu.com (out-127.mta1.migadu.com [95.215.58.127])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3900A606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3900A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZBUdc5Uu
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=g6QVX7tnnVwAGTDOuJi5dF9bHqzxlFE9Z1IlVUFl1Qg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794832077; v=1; x=1795436877;
 b=ZBUdc5UuOAr3/V/ldU3f/8Lh399nVHUmdwT1a38w8vIjLjk5tEPg1HCHuUr7kRbEyG7k3ITJ
 iHXK3xeeAsMQCFjp/QNoalwt0OaUnWMm9BLuPnaiE00MxIQxRANnSmq+moH+r6NJdXvAEtoku4T
 LNgOZCb3Yos9B5uUpRamXATU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 060a218e1ec6539b;
	Mon, 16 Nov 2026 12:27:57 +0000
X-Mizu-Trace-ID: 060a218e1ec6539b
X-Migadu-Flow: FLOW_OUT
Message-ID: <d138bb44-3af2-46ec-b8eb-77307209c3e8@linux.dev>
Date: Mon, 16 Nov 2026 20:27:46 +0800
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
Subject: Re: [PATCH v9 03/16] mm/mglru: reclaim from the oldest populated gen
To: "Barry Song (Xiaomi)" <baohua@kernel.org>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: axelrasmussen@google.com, baolin.wang@linux.alibaba.com,
 baoquan.he@linux.dev, hannes@cmpxchg.org, hui.zhu@linux.dev,
 kasong@tencent.com, kunwu.chan@gmail.com, liam@infradead.org,
 lianux.mm@gmail.com, linux-kernel@vger.kernel.org,
 liuxiang.277@bytedance.com, lyugaofei@xiaomi.com, mhocko@kernel.org,
 mhocko@suse.com, qi.zheng@linux.dev, rppt@kernel.org, ryncsn@gmail.com,
 shakeel.butt@linux.dev, surenb@google.com, wangzicheng@honor.com,
 weixugc@google.com, yuanchu@google.com, zhangbo56@xiaomi.com,
 zhuhui@kylinos.cn, sidchintamaneni@gmail.com
References: <20261114200803.23129-1-baohua@kernel.org>
 <20261114200803.23129-4-baohua@kernel.org>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20261114200803.23129-4-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/15/2026 4:07 AM, Barry Song (Xiaomi) wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> Currently MGLRU tries to keep the gen numbers of the two types in sync,
> avoiding reducing the gen number of one type when the other type has
> more gens, as described in the comment in try_to_inc_min_seq().
> 
> This makes scan_folios() stuck reclaiming the type with fewer gens: it
> always scanned the oldest gen of the type, even when that gen was
> empty, so reclaim made no progress on that type unless forced aging
> created a new gen and eliminated the dead empty gen.
> 
> There are other approaches, like lifting the gen number
> synchronization [1]. However, that would break the gen layout used by
> lru_gen_folio_seq(): newly added folios would no longer have a
> well-defined hotness according to their gen number, which reduces
> accuracy. It is also not pressure-aware, since with gentle reclaim we
> still want to respect the gen layout (hotness).
> 
> Instead, reclaim from whichever populated oldest gen is left, but only
> when the default reclaim priority can't satisfy the reclaimer's
> requirement. This is typical for swappiness limitations: e.g., low
> swappiness asks the reclaimer to reclaim from file, but file gens are
> drained, so the reclaim cycle fails and priority is raised.
> 
> At the default priority the scan quota is 1/4096 of the evictable
> size, and the old behavior is kept there to respect the hotness
> distribution. Once priority is raised, the quota is at least 1/2048,
> so the hotness bias introduced by reclaiming from a younger gen is
> bounded by that quota, which seems fair. Global reclaim for MGLRU may
> start with DEF_PRIORITY / 2 (1/64); the ratio is still reasonable at
> that point, and when global pressure is more critical, we should
> reclaim harder.
> 
> Note that scan_folios() still refuses to reclaim a type left with only
> MIN_NR_GENS gens, so a completely drained type still requires aging.
> This change only avoids scanning empty gens when populated reclaimable
> gens remain.
> 
> Link: https://lore.kernel.org/linux-mm/20260726122123.7614-4-baohua@kernel.org/ [1]
> Signed-off-by: Kairui Song <kasong@tencent.com>
> Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
> Signed-off-by: Barry Song <baohua@kernel.org>
> ---
>   mm/vmscan.c | 30 +++++++++++++++++++-----------
>   1 file changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index ae3e13b1fb27..1197e15065fe 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3312,11 +3312,9 @@ static int __folio_inc_gen(struct folio *folio, int old_gen, bool *increased)
>   }
>   
>   /* protect pages accessed multiple times through file descriptors */
> -static int folio_inc_gen(struct lruvec *lruvec, struct folio *folio)
> +static int folio_inc_gen(struct lruvec *lruvec, struct folio *folio, int old_gen)
>   {
> -	int type = folio_is_file_lru(folio);
> -	struct lru_gen_folio *lrugen = &lruvec->lrugen;
> -	int new_gen, old_gen = lru_gen_from_seq(lrugen->min_seq[type]);
> +	int new_gen;
>   	bool gen_increased;
>   
>   	new_gen = __folio_inc_gen(folio, old_gen, &gen_increased);
> @@ -4679,7 +4677,7 @@ void lru_gen_reparent_memcg(struct mem_cgroup *memcg, struct mem_cgroup *parent,
>    ******************************************************************************/
>   
>   static bool sort_folio(struct lruvec *lruvec, struct folio *folio, struct scan_control *sc,
> -		       int tier_idx)
> +		       int min_gen, int tier_idx)
>   {
>   	int gen = folio_lru_gen(folio);
>   	int type = folio_is_file_lru(folio);
> @@ -4697,14 +4695,14 @@ static bool sort_folio(struct lruvec *lruvec, struct folio *folio, struct scan_c
>   		return false;
>   
>   	/* promoted */
> -	if (gen != lru_gen_from_seq(lrugen->min_seq[type])) {
> +	if (gen != min_gen) {
>   		list_move(&folio->lru, &lrugen->folios[gen][type][zone]);
>   		return true;
>   	}
>   
>   	/* protected */
>   	if (tier > tier_idx || refs + workingset == BIT(LRU_REFS_WIDTH) + 1) {
> -		gen = folio_inc_gen(lruvec, folio);
> +		gen = folio_inc_gen(lruvec, folio, min_gen);
>   		list_move(&folio->lru, &lrugen->folios[gen][type][zone]);
>   
>   		/* don't count the workingset being lazily promoted */
> @@ -4719,7 +4717,7 @@ static bool sort_folio(struct lruvec *lruvec, struct folio *folio, struct scan_c
>   
>   	/* ineligible */
>   	if (zone > sc->reclaim_idx) {
> -		gen = folio_inc_gen(lruvec, folio);
> +		gen = folio_inc_gen(lruvec, folio, min_gen);
>   		list_move_tail(&folio->lru, &lrugen->folios[gen][type][zone]);
>   		return true;
>   	}
> @@ -4762,17 +4760,27 @@ static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>   	int scanned = 0;
>   	int isolated = 0;
>   	int skipped = 0;
> +	unsigned long min_seq;
>   	unsigned long remaining = nr_to_scan;
>   	struct lru_gen_folio *lrugen = &lruvec->lrugen;
>   
>   	VM_WARN_ON_ONCE(nr_to_scan > MAX_LRU_BATCH);
>   	VM_WARN_ON_ONCE(!list_empty(list));
>   
> +	/*
> +	 * Respect the gen hotness distribution at low priority to avoid
> +	 * aging and scan cost, but prefer to satisfy the reclaimers request
> +	 * when under pressure to respect swappiness more and reduce IO cost.
> +	 */
> +	if (sc->priority == DEF_PRIORITY)
> +		min_seq = lrugen->min_seq[type];
> +	else
> +		min_seq = lruvec_populated_min_seq(lruvec, type, lrugen->max_seq - MIN_NR_GENS + 1);
> +
>   	if (get_nr_gens(lruvec, type) == MIN_NR_GENS)
>   		return 0;
>   
> -	gen = lru_gen_from_seq(lrugen->min_seq[type]);
> -
> +	gen = lru_gen_from_seq(min_seq);
>   	for (i = MAX_NR_ZONES; i > 0; i--) {
>   		LIST_HEAD(moved);
>   		int skipped_zone = 0;
> @@ -4790,7 +4798,7 @@ static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>   
>   			scanned += delta;
>   
> -			if (sort_folio(lruvec, folio, sc, tier))
> +			if (sort_folio(lruvec, folio, sc, gen, tier))
>   				sorted += delta;
>   			else if (isolate_folio(lruvec, folio, sc)) {
>   				list_add(&folio->lru, list);

Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
Thanks.

-- 
Best regards
Ridong

