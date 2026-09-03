Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B89F41BA82
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429986; cv=none; b=raxxlXD50li2f/UebEqZ8/Fg8OG142cZfSqX9j0IsAgmGpf/wM/WFYn0Afw9AW0xhPeOgb42m+RTwBleXHOIL9L/dQR6I2IB/jzRogbl3KdpoKn8Nl65NTx8GDiXtB2933A2DRtOuqjxErCZnMVT3COZtLOxcYjMpWNf4HDUEW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429986; c=relaxed/simple;
	bh=nIkdqPKw0YSs56WtLqYavjL+GoHx0RknfouZioIQYnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g6ZkiWaz6E/b09/sYd9X9wiNQ5Zv7R8tGNbRQitLxGiMzkrnBfPmeXdwo2tUvWViIN8QvG2MZ3Gw9EMJ93HuPCKIwxA8zjmo0Z5bxWGfJhgwlzCk2XUYX0BOrH+bdiYgD3JpdpAgsFip62SI70Dg6c7JxwxJDTjT0rluyi7/bnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=qWIYn/nS; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="qWIYn/nS"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788429981; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Fpdjgc9+sv9jCsQkNtcRXnZevnJDV+QJt0b62KNfz6w=;
	b=qWIYn/nSw24ADrsALaLu1xdMefXQXbtLaTqnMldJ8cWzz3xMYJw5Np8ForgqKp4xsXspue+VXnSnO6hkD05VbRvA5ll/UPrURShyWO2LABuufCUQjHevPVzPxhIwz5WLHmrm0papWkx211BLlv1tRQKTHaO2T9QySUeeM3MYMuk=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=23;SR=0;TI=SMTPD_---0XAFjTM5_1788429979;
Received: from 30.74.144.116(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAFjTM5_1788429979 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 03 Sep 2026 18:06:19 +0800
Message-ID: <ac1f4e9a-d45a-433c-b26a-23fd0d955243@linux.alibaba.com>
Date: Thu, 3 Sep 2026 18:06:16 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] mm/mglru: batch update lrugen->nr_pages in
 inc_min_seq()
To: "Barry Song (Xiaomi)" <baohua@kernel.org>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: axelrasmussen@google.com, baoquan.he@linux.dev, chenridong@xiaomi.com,
 david@kernel.org, hannes@cmpxchg.org, kasong@tencent.com,
 lianux.mm@gmail.com, linux-kernel@vger.kernel.org, ljs@kernel.org,
 lyugaofei@xiaomi.com, mhocko@kernel.org, qi.zheng@linux.dev,
 shakeel.butt@linux.dev, stevensd@chromium.org, wangzicheng@honor.com,
 weixugc@google.com, yuanchu@google.com, zhangbo56@xiaomi.com,
 Xueyuan Chen <xueyuan.chen21@gmail.com>, Kunwu Chan <kunwu.chan@gmail.com>
References: <20260901232421.40157-1-baohua@kernel.org>
 <20260901232421.40157-3-baohua@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260901232421.40157-3-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/2/26 7:24 AM, Barry Song (Xiaomi) wrote:
> Currently, folio_inc_gen() updates lrugen->nr_pages for every folio
> as it advances generations. Instead, accumulate the size changes
> and update lrugen->nr_pages in a batch after scanning the entire
> oldest generation, or when the scan stops because remaining reaches
> zero.
> 
> Since we only move folios from the oldest generation to the second
> oldest generation, the active/inactive state cannot change. We can
> therefore skip __lru_update_size().

Make sense to me.

> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Reviewed-by: Lian Wang <lianux.mm@gmail.com>
> Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
> ---

LGTM. One nit follows.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

>   mm/vmscan.c | 23 ++++++++++++++++++-----
>   1 file changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 54bce2f608ef..27494505cecc 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3918,6 +3918,7 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
>   	struct lru_gen_folio *lrugen = &lruvec->lrugen;
>   	int hist = lru_hist_from_seq(lrugen->min_seq[type]);
>   	int new_gen, old_gen = lru_gen_from_seq(lrugen->min_seq[type]);
> +	int target_gen = (old_gen + 1) % MAX_NR_GENS;
>   
>   	/* For file type, skip the check if swappiness is anon only */
>   	if (type && (swappiness == SWAPPINESS_ANON_ONLY))
> @@ -3927,35 +3928,47 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
>   	if (!type && !swappiness)
>   		goto done;
>   
> +	VM_WARN_ON_ONCE(get_nr_gens(lruvec, type) != MAX_NR_GENS);
> +	VM_WARN_ON_ONCE(lru_gen_is_active(lruvec, old_gen) !=
> +			lru_gen_is_active(lruvec, target_gen));
>   	/* prevent cold/hot inversion if the type is evictable */
>   	for (zone = 0; zone < MAX_NR_ZONES; zone++) {
>   		struct list_head *head = &lrugen->folios[old_gen][type][zone];
> +		long delta = 0;
>   
>   		while (!list_empty(head)) {
>   			struct folio *folio = lru_to_folio(head);
> +			long nr_pages = folio_nr_pages(folio);
>   			int refs = folio_lru_refs(folio);
>   			bool workingset = folio_test_workingset(folio);
> +			bool gen_increased;
>   
>   			VM_WARN_ON_ONCE_FOLIO(folio_test_unevictable(folio), folio);
>   			VM_WARN_ON_ONCE_FOLIO(folio_test_active(folio), folio);
>   			VM_WARN_ON_ONCE_FOLIO(folio_is_file_lru(folio) != type, folio);
>   			VM_WARN_ON_ONCE_FOLIO(folio_zonenum(folio) != zone, folio);
>   
> -			new_gen = folio_inc_gen(lruvec, folio);
> +			new_gen = __folio_inc_gen(folio, old_gen, &gen_increased);

IMO, it's better to add some comments to describe why we don't need to 
call __lru_update_size(), in case someone thinks this needs to be fixed 
in the future. :)
