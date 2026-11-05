Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898402;
	b=KzbQ3JI4WIGB1b6zU/kcwv1RX8AvNIzm+r6wEMo8UUXDNIYrnslUK4cncZGtzk5i7pUJ
	 xNc/OmmRsgb3ayeWqfZhIJmTw/Mk0V/QyrpYAD4WtFGlKXBz7tTs8DnrQPZnM2e1PmUXv
	 383r5xPu3SDvcB0WgHA/pSa3NMygIGfvi6XxATH/1il2Ah18fi3LtQsTuLIRW3uc1xT8K
	 tv6iOu8bynBur64DjlSF+rdOFSxPKTXQLFe+fyn4WFvsS1gV6tDwd+PDvFcHhHXIRuRVT
	 xVgjvDDD52X5pmHJJAsuIeP2p1Zep+rPzcFHOpOCa+LyqwSVf+uRxDhqpslBC4EwnFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898402;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ianTrveSK4dhFW5UqHYxXDFeTMj4FVLXLf+aTFzURnY=;
	b=zfzSyDB3XYhmNOxyPyexzD7HyzKMZW8gArCvLEfGB6WmsC111J6x0ydECJebpF+dP5YI
	 DXy5yArHPSYFsJLNTJeYlc0XJFOkS7OPd7m/rh+D73wMPSqRdG4d3Gf4tMyQKQ+3ptuO1
	 YkiKJrq2nOm4DTATqxBWaQAMfmwqka+q8bYyNwEuJ0ZHseNUBYHdd66Qd0Asvstt5h+GG
	 RrFfPymDK+/CL00tauF/Um/kTkeNB8UYfv59WwrYjgGK4B5DdUMKXtMbCmc5Tu8UZeWiN
	 KsquX8kpomYjSEFqUH0f93QBFCzNMbdnAlYxtogywM74GeIWzBdeeS1cSrjfiS6lz8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iC2dcB3k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A67606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iC2dcB3k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6658B1F00A1C;
	Thu,  5 Nov 2026 17:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793898401;
	bh=ianTrveSK4dhFW5UqHYxXDFeTMj4FVLXLf+aTFzURnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iC2dcB3k5D083AyxQGoh0br5hmHCzcBMciwr0URm2plF6gm/0IObUPjrMo9g/exVo
	 nwVnrdMkve4CCOMdwiEv+Sm/HRK8BL2Pyw+QBM8SqpwKyvbIipTbfOzAf9hlXZMdlM
	 suPseaYWxWu6nkyF+SjiMXDqoFkCJrgROQM9SXiPEmfKtEylkaOXv4K597mboTvhtt
	 mf+adjoxQv/Ml5XKISFK5ehd1wVBBDeT0r0w/SH9fvoMsA7UIRwmwNd6h+qbvd5c6k
	 39jwlCnQA3D97nRwrey+AMeK1pk3deP5etzCSjv5YWgQh75VLzu1bv/ZDDbdqJzAPe
	 RqfA2nWLqPfxg==
Date: Thu, 5 Nov 2026 17:06:39 +0000
From: Harry Yoo <harry@kernel.org>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Zi Yan <ziy@nvidia.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Dev Jain <dev.jain@arm.com>, Usama Arif <usama.arif@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 1/3] mm: page_alloc: add a watermark check that knows
 the migratetype
Message-ID: <auynaZkzdzL6Aeyo@thinkstation>
References: <20261102093939.3340540-1-kas@kernel.org>
 <20261102093939.3340540-2-kas@kernel.org>
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
In-Reply-To: <20261102093939.3340540-2-kas@kernel.org>

On Mon, Nov 02, 2026 at 09:39:34AM +0000, Kiryl Shutsemau (Meta) wrote:
> The high-order check in __zone_watermark_ok() accepts a free page of any
> migratetype.  Under ALLOC_NOFRAGMENT, a request below pageblock_order can
> only take a page of its own migratetype or claim a whole free block, so
> the check can pass when the allocation cannot succeed.
> 
> Telling those apart needs the request's migratetype, but not every check
> wants them told apart.  A check whether an allocation can be served now
> has to count only the pages it can take.
>
> A check whether there is enough free memory counts every migratetype:
> kswapd and kcompactd balancing a zone, order-0 thresholds, the
> slowpath's forecast whether reclaim and compaction can still make
> progress.  Reclaim and compaction work across migratetypes to free whole
> pageblocks.

nit: perhaps we could make the changelog above bit more concise.

I think the necessary bit here is "With defrag_mode, allocations cannot
steal a page from pageblocks of other migrate type, thus
__zone_watermark_ok() needs to take that into account."

... and maybe

- "Ignoring the allocation's migrate type leads to
   stopping direct compaction and reclamation prematurely".

- "Indirect compaction and reclamation are not affected as they do not
   serve specific allocations"

> Move the body of __zone_watermark_ok() into __zone_watermark_ok_mt(),
> which takes the migratetype as well, and make __zone_watermark_ok() a
> wrapper around it for the second kind of check.  These use the new
> function:
> 
>   - the allocator fast path, zone_watermark_fast();
>   - its recheck after node reclaim in get_page_from_freelist();
>   - compaction's up-front check, compaction_suit_allocation_order().
> 
> Declare both in mm/internal.h: nothing outside mm uses them.
> 
> Nothing reads the migratetype yet: no functional change.
> 
> Tested-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---

otherwise looks good to me,
Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>

with a nit below.

>  include/linux/mmzone.h |  3 ---
>  mm/compaction.c        | 11 ++++++-----
>  mm/internal.h          |  7 +++++++
>  mm/page_alloc.c        | 37 ++++++++++++++++++++++++++++---------
>  4 files changed, 41 insertions(+), 17 deletions(-)
> 
> diff --git a/mm/compaction.c b/mm/compaction.c
> index f1b2060eb201..6c553d0e90f8 100644
> --- a/mm/compaction.c
> +++ b/mm/compaction.c
> @@ -3116,7 +3117,7 @@ static void kcompactd_do_work(pg_data_t *pgdat)
>  
>  		ret = compaction_suit_allocation_order(zone,
>  				cc.order, zoneid, cc.alloc_flags,
> -				false, true);
> +				MIGRATE_MOVABLE, false, true);

nit: maybe let's set cc.migratetype and pass it?

> @@ -3665,6 +3666,21 @@ bool __zone_watermark_ok(struct zone *z, unsigned int order, unsigned long mark,
>  	return false;
>  }
>  

-- 
Cheers,
Harry / Hyeonggon
