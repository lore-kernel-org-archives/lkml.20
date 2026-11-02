Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660164;
	b=TFIWP4pZVjVG7IFDMykyn8GTU0awdlR0MN/UJWrpoUEuXkjswD+VJm3ff4XhWfCen1Mp
	 r+noY/VtGrJ5w0AsHkm7I26e025uJpLWiAFawkseic+0PFHjWES4kRC/zUhpPp+6SEhcF
	 LST8bIvf6Dn9rewGP+rzLFMVMDoL4QRhKaBOYylGmr4gpkTCkMaK93mPJuyxs8IROp0a9
	 7Lj4gffEx7K2nSUZGP7lV0EtUHygzp6f+ux1+uD6HGc3QO4Jv94vYQQsoS3agerh1gHCo
	 Se5kw1W11NDOkVSMLz8vHvq9qq5RCH8Vu4ARZdvRuQ1yT5eawBThug/uizTx6f8kRgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660164;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Tjywhpg4haa7M6XUPEdo07mUb7ffrhUZvgkBemX0i2U=;
	b=jP4gIJ2Yz2gq2NJR6D0XiNtgG5b2GRJvFPHHXpYJuS2lBhLoKb+ZPQJZ/OqRJr1ufj/o
	 hekqkCzWFDqUKtzIfTyJBB1PqpNq20X5WeSpc24uzQA096fITvA6ydnLve78nqRjwMTGJ
	 049hZAOZiP4wOTCFvx3uV+6+ZS+D3HyFuJ0hetbMFutqvca3scSt8m5iCpPXYJAvgNNli
	 +/uXQnQ+axzvWKRbvisNtAvffzfLHBdJnoOqUi6tICqKPkB47xWkryxlU2eCV8vWqjumN
	 pIWQfdrDMkgzq9BlgUY24ng3NcduEqO0CI/FeML2W3cD5cZd6wpsLs6UYLd7x9feg0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=yW+qkEsl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB829606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=yW+qkEsl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E259B1F00A16;
	Mon,  2 Nov 2026 22:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793660163;
	bh=Tjywhpg4haa7M6XUPEdo07mUb7ffrhUZvgkBemX0i2U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=yW+qkEslEALOo0D43uyXiR43/P08AtDgKt4P6xisCXzYiAWwHoC2m40quCecPKQ2M
	 SLJ+/sQFebV9fTCt3ibRoVZe4VcOa8KDZL71wttYVQ3k02xY+gGYz0bCoxw9ryvF/z
	 CNqy25uXiZjYlUdwcHh4kSKHgBfNayQHOKnZesWU=
Date: Mon, 2 Nov 2026 14:56:02 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Barry Song <baohua@kernel.org>
Cc: Siddharth Chintamaneni <sidchintamaneni@gmail.com>, hannes@cmpxchg.org,
 david@kernel.org, mhocko@kernel.org, qi.zheng@linux.dev,
 shakeel.butt@linux.dev, ljs@kernel.org, kasong@tencent.com,
 axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com,
 baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, yuzhao@google.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, apais@microsoft.com,
 rlmenge@gmail.com, Hardik Garg <hargar@linux.microsoft.com>
Subject: Re: [PATCH v2 1/2] mm: multi-gen LRU: use mem_cgroup_lruvec() in
 get_lruvec()
Message-Id: <20261102145602.44f2836b6aef7d8e2cd14562@linux-foundation.org>
In-Reply-To: <CAGsJ_4zVpHAGM=Sz8J+5PFv3H54CyVdpcp6cpVK+rQ5f82Q1EQ@mail.gmail.com>
References: <20261026202313.63122-1-sidchintamaneni@gmail.com>
	<20261026202313.63122-2-sidchintamaneni@gmail.com>
	<CAGsJ_4zVpHAGM=Sz8J+5PFv3H54CyVdpcp6cpVK+rQ5f82Q1EQ@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 3 Nov 2026 06:51:19 +0800 Barry Song <baohua@kernel.org> wrote:

> On Tue, Oct 27, 2026 at 4:23 AM Siddharth Chintamaneni
> <sidchintamaneni@gmail.com> wrote:
> >
> > Andrew Morton noted that get_lruvec() has the same pattern as
> > lru_gen_shrink_node(): when memcg is disabled on the command line
> > (cgroup_disable=memory), it returns &pgdat->__lruvec directly instead of
> > going through mem_cgroup_lruvec(), which initializes lruvec->pgdat.
> >
> > In practice all callers of get_lruvec() run after kswapd_init() has
> > already initialized pgdat->__lruvec.pgdat on every N_MEMORY node, so
> > this is not a runtime bug. Have get_lruvec() delegate to
> > mem_cgroup_lruvec() directly.
> 
> Somehow, I feel this changelog is a bit weird. The earlier
> description doesn't really justify the final sentence:
> "Have get_lruvec() delegate to mem_cgroup_lruvec() directly."
> 
> Can we change it to the below?
> 
> The patch was initially developed to address a possible NULL
> reference [1].
> 
> Andrew Morton reported that get_lruvec() has the same problem as
> lru_gen_shrink_node(): when memcg is disabled on the command line
> (cgroup_disable=memory), it returns &pgdat->__lruvec directly and so
> bypasses the initialization of lruvec->pgdat. The MGLRU debugfs
> interface calls get_lruvec(), then dereferences the pgdat pointer in
> lru_gen_seq_show() and other paths, so these can hit the same NULL
> dereference.
> 
> In practice, we found that this cannot happen, as all callers of
> get_lruvec() run after kswapd_init() has initialized
> pgdat->__lruvec.pgdat on every N_MEMORY node. Therefore, this
> is not a runtime bug.
> 
> However, it would still be good to clean up get_lruvec() by
> removing the MGLRU-specific code and having it delegate
> directly to mem_cgroup_lruvec().
> 
> [1] https://lore.kernel.org/linux-mm/20261017050928.128582-2-sidchintamaneni@gmail.com/

Thanks, I locally made that change.


From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: mm: multi-gen LRU: use mem_cgroup_lruvec() in get_lruvec()
Date: Mon, 26 Oct 2026 20:23:12 +0000

Patch series "mm: multi-gen LRU: replace get_lruvec() with
mem_cgroup_lruvec()", v2.

This series cleans up MGLRU's get_lruvec() helper in mm/vmscan.c.

Patch 1 updates get_lruvec() to delegate to mem_cgroup_lruvec() rather
than returning &pgdat->__lruvec directly when memcg is disabled on the
kernel command line.

Patch 2 removes get_lruvec() completely and replaces all 15 call sites
with mem_cgroup_lruvec().


This patch (of 2):

The patch was initially developed to address a possible NULL reference
[1].

Andrew Morton reported that get_lruvec() has the same problem as
lru_gen_shrink_node(): when memcg is disabled on the command line
(cgroup_disable=memory), it returns &pgdat->__lruvec directly and so
bypasses the initialization of lruvec->pgdat.  The MGLRU debugfs interface
calls get_lruvec(), then dereferences the pgdat pointer in
lru_gen_seq_show() and other paths, so these can hit the same NULL
dereference.

In practice, we found that this cannot happen, as all callers of
get_lruvec() run after kswapd_init() has initialized pgdat->__lruvec.pgdat
on every N_MEMORY node.  Therefore, this is not a runtime bug.

However, it would still be good to clean up get_lruvec() by removing the
MGLRU-specific code and having it delegate directly to
mem_cgroup_lruvec().

Link: https://lore.kernel.org/20261026202313.63122-1-sidchintamaneni@gmail.com
Link: https://lore.kernel.org/20261026202313.63122-2-sidchintamaneni@gmail.com
Link: https://lore.kernel.org/linux-mm/20261017050928.128582-2-sidchintamaneni@gmail.com/ [1]
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Signed-off-by: Hardik Garg <hargar@linux.microsoft.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Reviewed-by: Barry Song <baohua@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Qi Zheng <qi.zheng@linux.dev>
Cc: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Kairui Song <kasong@tencent.com>
Cc: Axel Rasmussen <axelrasmussen@google.com>
Cc: Yuanchu Xie <yuanchu@google.com>
Cc: Wei Xu <weixugc@google.com>
Cc: Baoquan He <baoquan.he@linux.dev>
Cc: Yu Zhao <yuzhao@google.com>
Cc: <apais@microsoft.com>
Cc: <rlmenge@gmail.com>
---

 mm/vmscan.c |   15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

--- a/mm/vmscan.c~mm-multi-gen-lru-use-mem_cgroup_lruvec-in-get_lruvec
+++ a/mm/vmscan.c
@@ -2866,20 +2866,9 @@ static struct lruvec *get_lruvec(struct
 {
 	struct pglist_data *pgdat = NODE_DATA(nid);
 
-#ifdef CONFIG_MEMCG
-	if (memcg) {
-		struct lruvec *lruvec = &memcg->nodeinfo[nid]->lruvec;
+	VM_WARN_ON_ONCE(!memcg && !mem_cgroup_disabled());
 
-		/* see the comment in mem_cgroup_lruvec() */
-		if (!lruvec->pgdat)
-			lruvec->pgdat = pgdat;
-
-		return lruvec;
-	}
-#endif
-	VM_WARN_ON_ONCE(!mem_cgroup_disabled());
-
-	return &pgdat->__lruvec;
+	return mem_cgroup_lruvec(memcg, pgdat);
 }
 
 static int get_swappiness(struct lruvec *lruvec, struct scan_control *sc)
_

