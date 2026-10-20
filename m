Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.147.23.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479544;
	b=5gDm1fej8Xg7y1wjovDluW5BvpHdunIUyzIJTrTtIg8lwvRyD9fPzgsQtkQpH8sLkNjm
	 1Yll+r1O8PBX/lsK89VNR4hvb/n3suLu3jtO76h+Bgo/IW9eNTc0Y0OKAyoU+JbsMBYxs
	 UOvjI3YeZ5dSXGNCUJY91PF/DjttNBktUnqcedrupJzU2HedcylKe0bHneo2ELvxPzVWU
	 B80zMFOQV7+6b3bPCsIoFsG0vsS83pF75ZouuEigh2lUZcX1GG5cNSKXF6pKQ6PD3EQh1
	 UvFbsLplZoz4yIh0NnGMzBx2kSReCbMrKC6NCbAUaRUHIrT+3AigSwWuB5oymjieO+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479544;
	h=DMARC-Filter:Received:X-Original-SENDERIP:X-Original-MAILFROM:
	 Received:X-Original-SENDERIP:X-Original-MAILFROM:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=6jEJaHu9Y6VT1XeMg7m9SCTxjFKNA6Hnu81PQYRc5yc=;
	b=pkOIX+hMUdJ1ToudGY1E8Wloo1ZyLlpwRGrY5Ki0uTkN+hxsLT/VrLfCmQO/WOgxtLYb
	 MZZwTsqUBByUpSsbkR73Y9L5QeH0VZCVJ82GCFC5wQhPjgOe+VLI2iYPXEkBU1WaMDQen
	 8bFADfiNYOa+Fh/ShLTV4jEo0JrfD/57TVGyWfVuix1hMDiXHiEFY3uGYTBX+B3WRH55w
	 32WFVyeElQF5XJewvJxDsQCipn3PeqxjdaWkmtdSi5MqU/vcnHPhusvsOmin5+iRw8Si1
	 9ObUGBE6MDWI+zV1JMkviKIkfC1KlS4XIh3hFX/kr3QW0G18WXFS208wumBiUKtCxtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lge.com;
	spf=pass smtp.mailfrom=lge.com;
	arc=none smtp.remote-ip=156.147.23.52
Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA3E606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AA3E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.52 with ESMTP; 20 Oct 2026 15:58:53 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: youngjun.park@lge.com
Received: from unknown (HELO yjaykim-PowerEdge-T330) (10.177.112.156)
	by 156.147.1.127 with ESMTP; 20 Oct 2026 15:58:53 +0900
X-Original-SENDERIP: 10.177.112.156
X-Original-MAILFROM: youngjun.park@lge.com
Date: Tue, 20 Oct 2026 15:58:53 +0900
From: Youngjun Park <youngjun.park@lge.com>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] mm, swap: revalidate populated clusters before scanning
Message-ID: <atcRLYvKavedT6Hs@yjaykim-PowerEdge-T330>
References: <20261019160615.2348500-1-nphamcs@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019160615.2348500-1-nphamcs@gmail.com>

On Mon, Oct 19, 2026 at 09:06:15AM -0700, Nhat Pham wrote:
> swap_cluster_populate() can publish a cluster's table with the cluster
> lock dropped. A cached allocator can use and empty it before the
> populating allocator reacquires the lock. The resumed scan can then
> dereference a NULL table.
> 
> For example, CPU1 can retain a cached cluster offset on an SSD with
> per-page discard disabled:
> 
>     CPU0                          CPU1
>     ----                          ----
>     swap_cluster_populate()
>       swap_cluster_alloc_table() fails
>       spin_unlock(&ci->lock)
>       local_unlock(&percpu_swap_cluster.lock)
>       swap_cluster_alloc_table()
>         rcu_assign_pointer(ci->table, table)
>                                   swap_alloc_fast()
>                                   local_unlock(&percpu_swap_cluster.lock)
>                                   mem_cgroup_try_charge_swap() fails
>                                   swap_cache_del_folio()
>                                     __swap_cluster_free_entries()
>                                       free_cluster()
>                                         __free_cluster()
>                                           swap_cluster_free_table()
>                                             rcu_assign_pointer(..., NULL)
>       local_lock(&percpu_swap_cluster.lock)
>       spin_lock(&ci->lock)
>       return ci
>     alloc_swap_scan_cluster()
>       cluster_scan_range()
>         __swap_table_get()

Hello Nhat.

Good catch!

> Reject an unusable cluster under its lock before scanning it. Relocate
> it only while its table is present.
> 
> Fixes: cdd77f84d966 ("mm, swap: consolidate cluster allocation helpers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> ---
>  mm/swapfile.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index c3288910b3e3..988b7316e0a1 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -981,7 +981,11 @@ static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
>  	bool need_reclaim, ret, usable;
>  
>  	lockdep_assert_held(&ci->lock);
> -	VM_WARN_ON(!cluster_is_usable(ci, order));
> +	if (!cluster_is_usable(ci, order)) {
> +		if (cluster_table_is_alloced(ci))
> +			relocate_cluster(si, ci);
> +		goto out_unlock;
> +	}

If this patch is applied as bloew, does it prevent the issue described here?

https://lore.kernel.org/linux-mm/20260720071342.50742-2-shikemeng@huaweicloud.com/
(This patch publishes cluster table after lock acquired.)

This patch is chagned the way I suggested during review... :(

As you pointed out, another context can free the table 
without alloc context knwoing this situation.  
I missed this situation.

IMHO, Publishing the table only after reacquiring the cluster lock, as Kemeng
suggested, and rejecting an unusable cluster under the lock as in this
patch both look correct to me!

Reviewed-by: Youngjun Park <youngjun.park@lge.com>
