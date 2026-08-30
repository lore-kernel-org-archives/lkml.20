Received: from mta0.migadu.com (out-113.mta0.migadu.com [91.218.175.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F4023EAB4
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 02:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788057856; cv=none; b=iabw1quwPWz5bpxRzUoIpm7WLrN1h87pjCherYVv97V96OloF6DFYkdQN429WzteP3P9/Vme24OUiuv0c2m8sstFOlxfhDOdAZvl3UU12IjuLpcVyq+5rzsyLQvC4ZJo7q4q5MC60y12HynMsvZynl61wzaAub+czVpuRlwQPsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788057856; c=relaxed/simple;
	bh=HMrK2tewBvrIMRD/RpK8lBB2m3OiLHhGTVVB+J2XoD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LCVumlWDMNm3vxvC/UefzFsQGX6oSIgVY7lN8JamgIku3Nc1eBMVYoBt6K+PC8vq/Glvz/PneqDxk5SepgUTd49kk96iWzRKE5+dfQJE91BuUA9w9co1OAVBmCx1I6OZJGIDLJCTt4xRLR48tTseJvi3WDPhtvuNXvSO/Gfgq7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ew6ndIm+; arc=none smtp.client-ip=91.218.175.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ew6ndIm+"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HMrK2tewBvrIMRD/RpK8lBB2m3OiLHhGTVVB+J2XoD0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788057850; v=1; x=1788662650;
 b=ew6ndIm+3T/64+6WjO/CQoJGGdwtkPgLsa20gsbinzE/3n4pQiVBU8GjCkv+3DszSy55U3gw
 hYqsueezzZlbYuLcJGYmLOjPcmOpmS1uh8ych6700w+9Z6V9z0tK+Wn/XTpzObQkUWkbqJexmFl
 K0HH/wiALxQLjkApjOoCvbGI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fa0b8e2f78cb6e66;
	Sun, 30 Aug 2026 02:44:10 +0000
X-Mizu-Trace-ID: fa0b8e2f78cb6e66
X-Migadu-Flow: FLOW_OUT
Message-ID: <af26ac3d-30cb-47de-a295-6f9b4f2e2c32@linux.dev>
Date: Sun, 30 Aug 2026 10:43:58 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] mm/mglru: enhance cold/hot inversion handling in
 inc_min_seq()
To: "Barry Song (Xiaomi)" <baohua@kernel.org>, akpm@linux-foundation.org,
 lianux.mm@gmail.com
Cc: axelrasmussen@google.com, baolin.wang@linux.alibaba.com,
 baoquan.he@linux.dev, chenridong@xiaomi.com, david@kernel.org,
 hannes@cmpxchg.org, kasong@tencent.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, ljs@kernel.org, lyugaofei@xiaomi.com, mhocko@kernel.org,
 qi.zheng@linux.dev, shakeel.butt@linux.dev, stevensd@chromium.org,
 wangzicheng@honor.com, weixugc@google.com, yuanchu@google.com,
 zhangbo56@xiaomi.com, Xueyuan Chen <xueyuan.chen21@gmail.com>
References: <20260827234704.63163-1-baohua@kernel.org>
 <20260827234704.63163-4-baohua@kernel.org>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20260827234704.63163-4-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/28/2026 7:47 AM, Barry Song (Xiaomi) wrote:
> During aging, a folio's generation may already have been updated by
> folio_update_gen(), even though it has not yet been moved to the
> corresponding generation list. Such folios are hotter than those
> already in that generation.
> 
> It makes sense for inc_min_seq() to increment the generation of
> folios that were never promoted during aging and move them to the
> tail of the new oldest generation. However, folios that were already
> promoted should instead be moved to the head of their updated
> generation, just as sort_folio() does in scan_folios().
> 
> Otherwise, promoted folios could end up behind folios that were
> never promoted, effectively inverting their hot/cold ordering.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Reviewed-by: Kairui Song <kasong@tencent.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> ---
>   mm/vmscan.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 07c22d51debd..b10d1703d907 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3949,9 +3949,12 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
>   			VM_WARN_ON_ONCE_FOLIO(folio_zonenum(folio) != zone, folio);
>   
>   			new_gen = __folio_inc_gen(folio, old_gen, &gen_increased);
> -			list_move_tail(&folio->lru, &lrugen->folios[new_gen][type][zone]);
> -			if (gen_increased)
> +			if (gen_increased) {
>   				delta += nr_pages;
> +				list_move_tail(&folio->lru, &lrugen->folios[new_gen][type][zone]);

Nit.
This is a bit confusing to me.

When I read the code, I thought this implementation contradicts what the commit 
message says, which means I thought that we move the folios that have been 
promoted to the tail.

> +			} else {

Maybe adding a comment would make it clearer, like:

If gen_increased == false, it means the folio has been promoted, so move it to 
the head.

> +				list_move(&folio->lru, &lrugen->folios[new_gen][type][zone]);
> +			}



>   			/* don't count the workingset being lazily promoted */
>   			if (refs + workingset != BIT(LRU_REFS_WIDTH) + 1) {
>   				int tier = lru_tier_from_refs(refs, workingset);

Overall, looks good to me.

Reviewed-by: Ridong Chen <ridong.chen@linux.dev>

-- 
Best regards
Ridong

