Received: from slategray.cherry.relay.mailchannels.net (slategray.cherry.relay.mailchannels.net [23.83.223.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6864C8FF3
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.223.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854918; cv=none; b=LC3iewL36TGDEl4S6AbrBhgXjB6YmUGWLlgkILGUr4JWBJlX8OLSz0b1M3mczehVPlD37DiD7hjKulD9Tcvq5mdTQV45vAAJ/v/ecXhguIQV39ekSUGOLZ/AISSDfhURMdeZG5n3yv1+QgUwLNuoccGobtUbLwqhg4yOaBqoSg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854918; c=relaxed/simple;
	bh=SaJfz3VfTDT7G9lGtsAYQnCiiL6KPVDIXWfykvy+Smg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qac1JRaiUomKsPAU/MkJQOjVu7M+3YdwoxiVqqVkt6RtF+n9qxVoc/C+KUo60BhnPcWDPocMyuRpW6zsaETlgLfCdWjB+6jbvcm9gQFRU5w3IGk037IH6y1vomi/iasskYUjza8Jok7H25yNHZmBsR6w4Ga9lgBAlXKhfu0JTWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=fail smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=gu/mdLwI; arc=none smtp.client-ip=23.83.223.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="gu/mdLwI"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id DB16F3E2967;
	Thu, 27 Aug 2026 13:57:03 +0000 (UTC)
Received: from pdx1-sub0-mail-a230.dreamhost.com (100-97-3-207.trex-nlb.outbound.svc.cluster.local [100.97.3.207])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 1933E3E2174;
	Thu, 27 Aug 2026 13:57:03 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Harbor-Abortive: 02c2864649e2b1f8_1787839023524_1077040877
X-MC-Loop-Signature: 1787839023524:2677987914
X-MC-Ingress-Time: 1787839023523
Received: from pdx1-sub0-mail-a230.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.97.3.207 (trex/8.0.2);
	Thu, 27 Aug 2026 13:57:03 +0000
Received: from offworld (unknown [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a230.dreamhost.com (Postfix) with ESMTPSA id 4hW33f0MMMz2s;
	Thu, 27 Aug 2026 06:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1787839022;
	bh=g36eCBdW6YCkN4JZFF2wStGV66A2T43tQBEQe1vgjdY=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=gu/mdLwIWZQKYn0UqzVHRTWVnMaO6MymBwcRO6Q6zsoi+91xjPwDbIvxl0Z3ZyrQp
	 p/nNV9CTUnoXaEJqXWfz+RXBG8TVpjtOzx++KJylPpdoH/mXMxrn+X1jMQGgwoYCsf
	 otts37bWHliDW8PvT6sgj7BY91plGfDmgsXDeKm9H1tDy5Ve8GIpiDRoZ0yh8zIasr
	 h06XYLsCsR8CK3L5LFXEi6OmJmOjQLDSM/ml3XlkPlyzR4vh7uNk7jCga49p8tkBTp
	 WJFkCdUGgLp4jWNkPrWAf2HzCAKitzM1voHGPwcWDyFNdMSgKS87VY+QA06xHjUjml
	 MLNmKDhAoMtKQ==
Date: Thu, 27 Aug 2026 06:56:59 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Ridong Chen <ridong.chen@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>, Kairui Song <kasong@tencent.com>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Ridong Chen <chenridong@xiaomi.com>
Subject: Re: [PATCH] mm/vmscan: drop the combined limit gate in
 __node_reclaim()
Message-ID: <20260827135659.f735ms26jimuedq5@offworld>
References: <20260826124409.35569-1-ridong.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260826124409.35569-1-ridong.chen@linux.dev>
User-Agent: NeoMutt/20220429

On Wed, 26 Aug 2026, Ridong Chen wrote:

>From: Ridong Chen <chenridong@xiaomi.com>
>
>__node_reclaim() is called from two paths: node_reclaim() and
>user_proactive_reclaim().
>
>node_reclaim() already bails out early unless node_pagecache_reclaimable()
>is over pgdat->min_unmapped_pages or the reclaimable slab is over
>pgdat->min_slab_pages.  The identical check inside __node_reclaim() that
>guards the shrink_node() loop is therefore redundant for this path.
>
>user_proactive_reclaim() is proactive reclaim driven by userspace and
>should not be gated by the per-node min_unmapped_pages / min_slab_pages
>limits at all [1].  With the gate in place, a proactive request is silently
>turned into a no-op whenever the node happens to sit below both
>thresholds.
>
>Drop the gate in __node_reclaim() and always run the shrink_node() loop.
>The node_reclaim() path is unchanged, since its caller has already applied
>the same test; the proactive path is no longer wrongly gated.
>
>[1] https://sashiko.dev/#/patchset/20260723045718.2052070-1-ridong.chen@linux.dev
>Fixes: b980077899ea ("mm: introduce per-node proactive reclaim interface")
>Assisted-by: Claude:claude-opus-4-8
>Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
>Acked-by: Johannes Weiner <hannes@cmpxchg.org>

Acked-by: Davidlohr Bueso <dave@stgolabs.net>

>---
> mm/vmscan.c | 13 +++----------
> 1 file changed, 3 insertions(+), 10 deletions(-)
>
>diff --git a/mm/vmscan.c b/mm/vmscan.c
>index f11491ee9ed5..6dff207ad8c6 100644
>--- a/mm/vmscan.c
>+++ b/mm/vmscan.c
>@@ -7851,16 +7851,9 @@ static unsigned long __node_reclaim(struct pglist_data *pgdat,
>	noreclaim_flag = memalloc_noreclaim_save();
>	set_task_reclaim_state(p, &sc->reclaim_state);
>
>-	if (node_pagecache_reclaimable(pgdat) > pgdat->min_unmapped_pages ||
>-	    node_page_state_pages(pgdat, NR_SLAB_RECLAIMABLE_B) > pgdat->min_slab_pages) {
>-		/*
>-		 * Free memory by calling shrink node with increasing
>-		 * priorities until we have enough memory freed.
>-		 */
>-		do {
>-			shrink_node(pgdat, sc);
>-		} while (sc->nr_reclaimed < nr_pages && --sc->priority >= 0);
>-	}
>+	do {
>+		shrink_node(pgdat, sc);
>+	} while (sc->nr_reclaimed < nr_pages && --sc->priority >= 0);
>
>	set_task_reclaim_state(p, NULL);
>	memalloc_noreclaim_restore(noreclaim_flag);
>--
>2.34.1
>
