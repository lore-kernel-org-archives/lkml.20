Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794620743;
	b=4Uawc3VvzLjTuhVpR9ZxHPuWNJ3U6AEdRNFG1Ui3HfZropWHmjl/dKzotuj+B0YKfrTv
	 fYrbEsWjBmIUHL7mJIm25fH2C76q05JgvwcG9wTeo5+sso4BvrTbjBBRu1CLMf/BAm7Kx
	 QBuJ7F1Z4TZ5n/MFE+hga3q9BXcaD5K0Y78uPyLH6RmaQ2CUcmERSOACGaBKFdZqldta8
	 igc9D0X/zEmyopDqeui4/DZaGA6+mZkN3KTnBAzGorirPXMGLHm+Y9CYl8GXLQbaKqVp1
	 RqggtrvvXcEldfhVRxWF1+j7DLA+6k5HCn3vd/vRU6JG5u+4pACwdH5N5p8QCkw+7dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794620743;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=nzPTEwjVAGuMkVeVrNJQmCZCNrgNkk2JW836iQoERSA=;
	b=wnZexZEjWuXPukIbyV7bJvJyIq6pISBLeACuGbmA5h0JKosknFB+jQK5m0tyn6B0AaVj
	 0sXKhk+ItgW5JSNhdHlP2j4TBKLCSdzvMBVXgWV/X6ISvJhNBFmk+K+LV+Y+KnlojNO5N
	 wIeWtQNRsI/6IiU5Qc5zLOGVwMqxzp3Hb85TbfaqI8FH1oebkaCByPJ3fvJnPxCnub28I
	 kfUVr8h16sf8RB6UOQJ4WlspwkyCyOZXy3tg8XhMOx7l+3E3zjRVbmOe3ZmrnS7iDOBwP
	 44kLAokW1cGGpZ8dqBc9kPiGC+g3gPMrjzQ4n9X7y2rk8u54LC3bB40skz/xARLUT7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m8pfWXH+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA343606A339
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m8pfWXH+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA5771F000CB;
	Sat, 14 Nov 2026 01:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794620743;
	bh=nzPTEwjVAGuMkVeVrNJQmCZCNrgNkk2JW836iQoERSA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m8pfWXH+rSDRwQSOjLLF/Q6INjVXDQL5TEoFbCOqKpbQGW5ysfXQEW/nFkDp8febQ
	 IHdRoij07Wk1WIqLcxgXUzLjma2NNY71GGr/fBxhOh0kwZJJmj2J1nCpfi6PVxu/bd
	 eZAvtUAGJVVkLg6yKDCfHzQUkgG78h587qs6lxux0a0Hq358ztgqXuIQDPKPyyRara
	 6xWVrRnaVeizg3nr5CeKVJB7oikQlKk45IoVmmrmie/gcrcUZqqELC1dVCuBEHIp9h
	 fvxDCE0OTeOBBJQ5WyEMd150kaDCwOecpzwK/vysmFbrewyNiBbN00oaak5frHdFwY
	 wC9dMf9xIgzIA==
From: SJ Park <sj@kernel.org>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH 2/3] mm/page_alloc: move the kswapd node skip check into a helper
Date: Fri, 13 Nov 2026 17:45:29 -0800
Message-ID: <20261114014530.86361-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113235238.3595412-3-joshua.hahnjy@gmail.com>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 13 Nov 2026 15:52:35 -0800 Joshua Hahn <joshua.hahnjy@gmail.com> wrote:

> get_page_from_freelist() checks many conditions for each zone, often
> with a big comment block explaining the conditions.
> 
> Move the kswapd check and its comment into should_skip_kswapd_zone() to
> make the zone iteration cleaner to read.
> 
> While moving this, also resolve a checkpatch warning which complains of
> a waitqueue_active() call with no corresponding comment explaining why
> the lockless use is OK in this case.
> 
> No functional change intended.

Looks correct to me.

> 
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>

Reviewed-by: SJ Park <sj@kernel.org>

[...]
> @@ -3865,22 +3885,10 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
>  			}
>  		}
>  
> -		/*
> -		 * If kswapd is already active on a node and the zone is below
> -		 * its kswapd watermark for this request, keep looking for
> -		 * other nodes that might be idle. This can happen if another
> -		 * process has NUMA bindings and is causing kswapd wakeups on
> -		 * only some nodes. Avoid accidental "node_reclaim_mode"-like
> -		 * behavior in this case.
> -		 */
>  		if (skip_kswapd_nodes &&
> -		    !waitqueue_active(&zone->zone_pgdat->kswapd_wait)) {
> -			mark = wmark_pages(zone, kswapd_watermark);
> -			if (!zone_watermark_fast(zone, order, mark,
> -					ac->highest_zoneidx, 0)) {
> -				skipped_kswapd_nodes = true;
> -				continue;
> -			}
> +		    should_skip_kswapd_zone(zone, order, ac)) {
> +			skipped_kswapd_nodes = true;
> +			continue;

Just thinking loud.  While reviewing I realized this patch is not based on
mm-new but apparently mm/page_alloc.git for-next.  I should also update some of
my setups.


Thanks,
SJ

[...]
