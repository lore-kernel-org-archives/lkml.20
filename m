Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9EA490BF6
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 12:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460867; cv=none; b=pPEAirkGQ3vWQY2xbOiND31qKLRIGHTf8RPnSHtIgfA3bIYYPnBHgse/NWZxJoJqB9wcov6aFpoTyB1id0bLGHI4VYml52cTiFnO1HZ5tD2hqYaWbruVUOhpZ17jBddrN7a+/KxGFy/dvdmotZz3uPHoX1BF2rbXUrk9X26lHKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460867; c=relaxed/simple;
	bh=l08wiuIgbUvwdQTYTAli7d72hDVxQCwZZrnkxFex9dg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k/TiU/Gaj5zNipWsKXE8v7dLZF7mVT8J/QfRSC7w6w2oeZpVIwSvUeUPOUApDnhhA+C+/WTAoaqfcaS6Jigk39vR0kySEUrZDrPQbim6YL52kOe0RH7wGzXCvTK7fDst1KvBJJDwQtryKqZ2WNTUwha4GtsAfBYLscJlN40WnRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/36OSL1; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/36OSL1"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so2739907a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 05:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791460865; x=1792065665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sFAvEonzWsVz+E/ulC/KEIrSh4b/OG6L9cxESlyjugs=;
        b=m/36OSL15hwSwjEcJQDPml0Y9T4cqcaEn8Z5tlilSJjUqiaQFdDmnmelwAxPXuqoyz
         mNNVTWM0f1QbtuWT5Fr2AcFdzFltn6y8iRc8nUTnl66avDSZwYhNLn43MRtNAhE3P0PC
         b7Xdj+8RvkE1ZU3u2EclwuYW5VXc10ZRmxkAdn98s7yyDnYh8OqClLCOIoW3FKilAxbG
         Pqm6Enk/lGeu2rM102M2o7R/ZgK8gIO7SmGxU8i7dCPxjSGQVJvYNARTygL3akxHKnab
         unhz53LH23mp32Or0dW8ijwVpfHCZeQUTXADbcTTYmzwEkppmJXPB++/B8GP1pUuWbf0
         tuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791460865; x=1792065665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFAvEonzWsVz+E/ulC/KEIrSh4b/OG6L9cxESlyjugs=;
        b=2sch2w3angjH2pSba/gAL+99Sma+pcIn+sPYlXkjyPecoGlc/+FCVIJqCXOow3orKy
         PCzva4WMLa+MQZrI2RqMmWuBXzdTIEn/RVf1mYbjhnFE2k9AnUEXkjlmy4ti9Sj9a1n/
         svPegUao+C21IlBZftGDnPeLXJCM+AqWvtYzeFrzmOYNOLreVi6Aa3KdKE3RBibNo3E2
         2xs1S8/Xg0sngmv5qQpHQ5KXicHrZXR5mV8R7VWPOkan2aJfZccuuKWRToA6IRV2mrAz
         Pyq16T9RvCfjIwKjvKNfF4/hDNls/ZeLnlABe/wzCjkTtLz8cXNeYvwKvyQ8gC3LFeDB
         VOZA==
X-Forwarded-Encrypted: i=1; AKwUvByE2y125yGboESjVRd/CctjwyKDUd5RAKgF8SCzpT8T0mFAWyBHC2jVXJFaU9VZz2fos6zraa3Qg8WNU6M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnjidUEKWnsm+L0LN3oAvDe4CKHXaKLFJZroTjzaXNoukipA56
	HPL2N2quAuaRcWX8O9Zx90wn95fUMunoakzdO/Hy2WACqnRieoFisDe8
X-Gm-Gg: AYBFou0pRjgrNL2U9v1bLAEFzu8bykxXHnvVjCFCPdMQyKlUn/c/J8oBjTY/n9ghb7Z
	4U84i8+ZyMGCX0ktMTII1jh7t6rrvxm9FYpW5gWPWidw7+oiHYtpL3QfVxToqAOfDlmlqrQzysw
	JcAWRy3+NnLffhfb2VEIjCdkeDn7noQuMROgj6oHsVU/PQKokNUQjkrmOvuKOf7IampybrvyKmU
	eJpVTnItTJ7N24RjQDcfWyZ5N4Ov6fIGOKrjRI+wwK88vFtqlS5dYthhFIQ9CC1SEf3KQg58+dF
	33HNJNoYGYOXMtM/IhjC/YE0kkPauKGfe3mKtfOQ9e7iHDtYZNZWvB3Dr7iRdBzoGobG7GbGTHX
	ZY9xr/ZfFNdNUOQQiEAt2Wzf9Aq6ja4d1+sp9i7+96BgNOVvj5vNNCM2d+1zzZW3rM70Xgk0xDG
	L4pX92MFlLeqKyKaq0rNU9yAPMItz2Uh/wZ8bPrgKux0thIbLcdrvvjeqx6gWmVdizqSb1sUoOu
	sVjzgjj2eOajdtskA==
X-Received: by 2002:a17:90b:28d0:b0:3a8:768d:70e4 with SMTP id 98e67ed59e1d1-3a8a1b59a17mr4486706a91.17.1791460865210;
        Thu, 08 Oct 2026 05:01:05 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff817537sm3901580a91.8.2026.10.08.05.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 05:01:04 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
To: akpm@linux-foundation.org,
	hannes@cmpxchg.org
Cc: kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	david@kernel.org,
	mhocko@kernel.org,
	ljs@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	zhangbo56@xiaomi.com
Subject: [RFC PATCH] mm: vmscan: avoid over-reclaim in classic LRU direct reclaim path
Date: Thu,  8 Oct 2026 20:00:56 +0800
Message-Id: <20261008120056.575272-1-zhangbo0325@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bo Zhang <zhangbo56@xiaomi.com>

On production Android devices, direct reclaim is a frequent source of
unpredictable, large latency spikes. A direct reclaim request typically
asks for only nr_to_reclaim = SWAP_CLUSTER_MAX (32) pages, and in the
common case completes in well under a millisecond. But the classic LRU
path has no reliable "goal met" check, so under memory pressure a single
reclaim can scan tens of thousands of pages and free hundreds to
thousands - far beyond the 32 requested - before returning.

Pooling the 20 slowest direct-reclaim events, before this patch the
worst case scanned 130,079 pages and reclaimed 1,635, and the average
scanned 37,955 pages and reclaimed 881.

The root cause is over-reclaim: the classic LRU path keeps scanning well
past its target in two ways:

1. shrink_lruvec() does not stop as soon as nr_to_reclaim is met; it
   keeps scanning the remaining LRU batches, over-reclaiming past the
   target.

2. shrink_node_memcgs() only breaks early on a partial walk. When the
   initial partial walk misses nr_to_reclaim, do_try_to_free_pages()
   retries with a full walk, which has no "goal met" check and shrinks
   every memcg in the tree even after the target is satisfied.

Add an early exit to shrink_lruvec() and shrink_node_memcgs(), and the
matching check to should_continue_reclaim(), all keyed on

    sc->nr_reclaimed >= max(sc->nr_to_reclaim, compact_gap(sc->order))

The compact_gap() term keeps correctness for high-order reclaim, where
nr_to_reclaim alone may be too small to free a block of the requested
order; MGLRU's should_abort_scan() uses the same threshold. Using it in
all three places keeps the retry decision consistent with where reclaim
actually stops.

After this patch, over the same 20 slowest events the worst case scans
45,593 pages and reclaims 57, and the average scans 6,399 pages and
reclaims 38 - reclaim now stays close to the requested target instead
of running far past it. Removing this over-reclaim greatly reduces the
direct-reclaim tail latency, which significantly cuts the jank caused by
direct reclaim on interactive workloads.

Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
---
 mm/vmscan.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 91295070ca33..b1efbd2a9bb6 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -6236,6 +6236,18 @@ static void shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
 
 		cond_resched_tasks_rcu_qs();
 
+		/*
+		 * For high-order allocations, nr_to_reclaim may be smaller
+		 * than what is needed to make a block of the requested order
+		 * available for compaction. When memory is plentiful, keep
+		 * reclaiming until at least compact_gap() pages have been
+		 * freed so the target order can actually be satisfied.
+		 */
+		if (!cgroup_reclaim(sc) &&
+		    sc->nr_reclaimed + nr_reclaimed >=
+		    max(nr_to_reclaim, compact_gap(sc->order)))
+			break;
+
 		if (nr_reclaimed < nr_to_reclaim || proportional_reclaim)
 			continue;
 
@@ -6345,6 +6357,16 @@ static inline bool should_continue_reclaim(struct pglist_data *pgdat,
 	if (!nr_reclaimed)
 		return false;
 
+	/*
+	 * Stop once the overall reclaim goal is met, using the same
+	 * max(nr_to_reclaim, compact_gap()) threshold as the early exits
+	 * in shrink_lruvec() and shrink_node_memcgs(), so the retry
+	 * decision here stays consistent with where reclaim actually
+	 * stops.
+	 */
+	if (sc->nr_reclaimed >= max(sc->nr_to_reclaim, compact_gap(sc->order)))
+		return false;
+
 	/* If compaction would go ahead or the allocation would succeed, stop */
 	for_each_managed_zone_pgdat(zone, pgdat, z, sc->reclaim_idx) {
 		unsigned long watermark = min_wmark_pages(zone);
@@ -6442,8 +6464,17 @@ static void shrink_node_memcgs(pg_data_t *pgdat, struct scan_control *sc)
 				   sc->nr_scanned - scanned,
 				   sc->nr_reclaimed - reclaimed);
 
-		/* If partial walks are allowed, bail once goal is reached */
-		if (partial && sc->nr_reclaimed >= sc->nr_to_reclaim) {
+		/*
+		 * Break loop once the overall reclaim goal is met. For
+		 * high-order allocations nr_to_reclaim may be too small to
+		 * free a block of the requested order, so when memory is
+		 * plentiful keep going until at least compact_gap() pages
+		 * have been reclaimed. This applies to both partial and full
+		 * walks: a full walk is only a means to reach the goal, not a
+		 * requirement to visit every memcg.
+		 */
+		if (sc->nr_reclaimed >= max(sc->nr_to_reclaim,
+					    compact_gap(sc->order))) {
 			mem_cgroup_iter_break(target_memcg, memcg);
 			break;
 		}
-- 
2.34.1

