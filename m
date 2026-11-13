Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599412;
	b=14+MonlAJVv4y622sShzjEKeUQhE+1VunfCOU2h7PJAG/GMGVPMOye7DCIJ5W5yBope9
	 zaxsxqJkDhf6NyZMRlXjMfc/SQ0smEl0AH3Zn+S1ZtypoBOH3PWlgixb11AJMW/TxTOS7
	 Z3tD+rzj4ee2FPTVInO6JNL/uup0Zfk+wTl9u+LGYQp/hweeLDnyYyL8jCthe7SxDDh7F
	 IhxANn6ZhmZkt6SRSSBUtXNYDUpUgs1w5WKi3hgUxjU2l/RdxqYXPPpTOu7NUJNuuD+Qd
	 qSo5AItBYaK9TB9JklG1V3Ik1PDV+jjp52zCcwmunNOqmS1exWpPxUDbPLdmBMfuROQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599412;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=icSSFy6GjaSbuEQ4ljb9qXuvnPWw3H9lXh4lbn2mdRs=;
	b=dA5L42Vh5S56juEFxDx93O9Xcf8CRSmTPtynqXXnAzl/I5LT1UzumFqh6dOla1v4nbcd
	 bEo/1XVeSoyW/DNG00uelmu5KFT8hYEi3xaB8PXGPkI/WiSrB5g9evnYcFPC0szcrLjBs
	 UbNBAfdm0rFQpwuegIwNjzbaf5Ew7/4xqiYoMP5n++XxJ6eszlYgxmMpOpO8aiXnQaHM4
	 qcw9wt2vXLrlPZF259DGjNsGlG/RxUsZTD9rUTGJwiXFHa7E1kTqohWBIXLWJjyuvQdUh
	 /QDOOL/GblXwr2avtm4jGRbGN05Me74cnPsBZCqAkcUvKA+yrWm57pyjqPCipnz3fTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=pqHs8TES;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE04E606A880
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=pqHs8TES
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 820301F000C4;
	Fri, 13 Nov 2026 19:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794599412;
	bh=icSSFy6GjaSbuEQ4ljb9qXuvnPWw3H9lXh4lbn2mdRs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=pqHs8TESSdCkgZCf632amqMara786CCSSZNFMUL2TR9gYOwnTgEW0tzMZpiQvlpEq
	 W4VZT81obVTgxzwhf+4pFBJKGq355mRZ7i41mDGv3pFjJBAX7kAb+g1W9wdSeT0HIm
	 tdJz1J7236QoUVbKn0ehPDa5mltdmB8w//C/4g/w=
Date: Fri, 13 Nov 2026 11:50:11 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: linux-mm@kvack.org, axelrasmussen@google.com,
 baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, hannes@cmpxchg.org,
 hui.zhu@linux.dev, kasong@tencent.com, kunwu.chan@gmail.com,
 liam@infradead.org, lianux.mm@gmail.com, linux-kernel@vger.kernel.org,
 liuxiang.277@bytedance.com, lyugaofei@xiaomi.com, mhocko@kernel.org,
 mhocko@suse.com, qi.zheng@linux.dev, ridong.chen@linux.dev,
 rppt@kernel.org, ryncsn@gmail.com, shakeel.butt@linux.dev,
 surenb@google.com, wangzicheng@honor.com, weixugc@google.com,
 yuanchu@google.com, zhangbo56@xiaomi.com, zhuhui@kylinos.cn,
 sidchintamaneni@gmail.com
Subject: Re: [PATCH v8 00/16] mm: mglru: fix swappiness behavior
Message-Id: <20261113115011.f90e267d58a9a88c513ae325@linux-foundation.org>
In-Reply-To: <20261113185541.70203-1-baohua@kernel.org>
References: <20261113185541.70203-1-baohua@kernel.org>
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 14 Nov 2026 02:55:25 +0800 "Barry Song (Xiaomi)" <baohua@kernel.org> wrote:

> Classic LRU respects swappiness, while MGLRU only weakly
> honors it when selecting the scan type. The fallback logic
> can easily override the bias established by
> get_type_to_scan(). As a result, swappiness has a much
> smaller overall impact when changing from 1 to 200, as
> shown by the data presented later in this cover letter.
> 
> In this patchset, patches 1-8 from Kairui introduce a model that uses
> refaults to determine nr_to_scan[] for both file and anon in MGLRU.
> For each reclaim operation, we calculate how many file and anon
> folios to scan, similar to CLRU, rather than relying on
> get_type_to_scan() and fallback mechanisms to decide what to
> reclaim, which have proven rather unreliable in honoring swappiness.
> This model also allows scanning and reclaiming from the two youngest
> generations, including the youngest generation itself. This can help
> resolve OOM situations[1] and reduce the need for aging.
> 
> ...
>

Thanks, I've updated mm.git's mm-new branch to this version.  I expect
I'll advance the series into mm-unstable (hence linux-next) over the
weekend.

> v8:
> * Fixed Gaofei Lyu's name;
> * for debugfs proactive reclaim, use DEF_PRIORITY;
> * refine no-populatable aging (limit frequency, allow an aging
>   after eviction returns 0 scanned)
> * refine "restrict eviction accounting to eligible zones" for
>   potential premature OOM;
> * Collect Baolin's reviewed-by tag, thanks!

Here's how v8 altered mm.git:


 mm/vmscan.c |   34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

--- a/mm/vmscan.c~b
+++ a/mm/vmscan.c
@@ -4034,8 +4034,6 @@ static void try_to_inc_min_seq(struct lr
 
 	/* see the comment on lru_gen_folio */
 	if (swappiness && swappiness <= MAX_SWAPPINESS) {
-		unsigned long seq = lrugen->max_seq - MIN_NR_GENS;
-
 		if (min_seq[LRU_GEN_ANON] > seq && min_seq[LRU_GEN_FILE] < seq)
 			min_seq[LRU_GEN_ANON] = seq;
 		else if (min_seq[LRU_GEN_FILE] > seq && min_seq[LRU_GEN_ANON] < seq)
@@ -4246,7 +4244,13 @@ static bool lruvec_is_reclaimable(struct
 	if (mem_cgroup_below_min(NULL, memcg))
 		return false;
 
-	if (!lruvec_is_sizable(lruvec, sc))
+	/*
+	 * As in __alloc_pages_may_oom(), avoid triggering OOM for low-zone
+	 * allocations. Also, defer the LRU size check until reclaim reaches
+	 * a very low priority to avoid premature OOM.
+	 */
+	if (sc->priority <= 1 && sc->reclaim_idx >= ZONE_NORMAL &&
+	    !lruvec_is_sizable(lruvec, sc))
 		return false;
 
 	gen = lru_gen_from_seq(evictable_min_seq(min_seq, swappiness));
@@ -5220,6 +5224,13 @@ static bool try_to_shrink_lruvec(struct
 	bool need_rotate = false, should_age = false;
 	int swappiness = get_swappiness(lruvec, sc);
 	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
+	/*
+	 * Avoid aging the lagging type under extreme swappiness,
+	 * as reclaim of the unpreferred type is disabled until
+	 * DEF_PRIORITY / 2.
+	 */
+	bool allow_no_populatable_age = (sc->priority <= DEF_PRIORITY / 2) ||
+		(swappiness > MIN_SWAPPINESS + 1 && swappiness < MAX_SWAPPINESS);
 
 	/*
 	 * Proactive reclaim initiated by userspace for anonymous memory only.
@@ -5238,8 +5249,9 @@ static bool try_to_shrink_lruvec(struct
 
 	while (nr[LRU_GEN_ANON] > 0 || nr[LRU_GEN_FILE] > 0) {
 		unsigned long orig_file, orig_anon;
-		DEFINE_MAX_SEQ(lruvec);
+		unsigned long max_seq;
 		bool no_populatable;
+		long scanned;
 
 		if (mem_cgroup_below_min(sc->target_mem_cgroup, memcg)) {
 			need_rotate = true;
@@ -5248,8 +5260,7 @@ static bool try_to_shrink_lruvec(struct
 
 		orig_anon = nr[LRU_GEN_ANON];
 		orig_file = nr[LRU_GEN_FILE];
-		if (!evict_folio_lists(nr, lruvec, sc, swappiness, MIN_LRU_BATCH))
-			break;
+		scanned = evict_folio_lists(nr, lruvec, sc, swappiness, MIN_LRU_BATCH);
 
 		if (should_abort_scan(lruvec, sc))
 			break;
@@ -5261,14 +5272,20 @@ static bool try_to_shrink_lruvec(struct
 		if (root_reclaim(sc) && should_age)
 			break;
 
-		no_populatable = (nr[LRU_GEN_ANON] && nr[LRU_GEN_ANON] == orig_anon) ||
-				 (nr[LRU_GEN_FILE] && nr[LRU_GEN_FILE] == orig_file);
+		/* Limit no_populatable aging to once per try_to_shrink_lruvec() */
+		no_populatable = allow_no_populatable_age &&
+			((nr[LRU_GEN_ANON] && nr[LRU_GEN_ANON] == orig_anon) ||
+			(nr[LRU_GEN_FILE] && nr[LRU_GEN_FILE] == orig_file));
+		allow_no_populatable_age &= !no_populatable;
+		max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
 		if (should_run_aging(lruvec, max_seq, sc, swappiness, no_populatable)) {
 			trace_mm_mglru_aging(lruvec, sc, swappiness);
 			if (try_to_inc_max_seq(lruvec, max_seq, swappiness, false))
 				need_rotate = true;
 			should_age = true;
 		}
+		if (!scanned)
+			break;
 
 		cond_resched();
 	}
@@ -5965,6 +5982,7 @@ static ssize_t lru_gen_seq_write(struct
 		.may_writepage = true,
 		.may_unmap = true,
 		.may_swap = true,
+		.priority = DEF_PRIORITY,
 		.reclaim_idx = MAX_NR_ZONES - 1,
 		.gfp_mask = GFP_KERNEL,
 		.proactive = true,
_

