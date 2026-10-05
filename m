Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C54E35A3A4
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 06:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182128; cv=none; b=LJwjJH1fe4yfAes88WeY5YaJns6pUrB7hAXKAkuhNT43FMtZLCdkhoQCABeg5nUvmD4iZjPn2ybWSTKN7GVi9hY8rVoRNLT4zuBPvj/E/dqsSXiRvf0GLFmSMHcEqAFBK7sZMs9tXvhmPIpu1Irb0PC1Rm9BBobSeocK6cAbUz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182128; c=relaxed/simple;
	bh=ISjg7QB4MTmSfDNhKTcMpY2Rl2PEZH2Jd914ryrm0VI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hKpGzb1bvyKNQ437aol4jNeRg3HyHumMjeTI/leNpjaAjS3swQbfzYQ2BeMQJNAmACXGfu+FsdsDGtkgzOqpwJjnUvtPUWOf2adFOT6pHC651a3/Rw10MBOPfXM3xs6dtqWEJRRlGymqlrJLLk1s35XIzmHohYLmVjvpHw9vtcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXD9wNpb; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXD9wNpb"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so8323225e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 23:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791182125; x=1791786925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uk4knJvNCd2gZ59g/hSQzEEij2193g8fgyNRYXAesqs=;
        b=IXD9wNpbiWQrFt01Gi7DbLQMUnYUAfz7b1nkQWpDNACLcANI51Ew3TgxUgcav8/KM2
         76oBJyPynUAfJs/JbwxCUyFKbYM1Xzl3fC7f9z/kwX2qHBM+Txjd7WLDocdxvGzdAX2M
         otDTdcDTUbL3fS71fW2oer7Eg91mpawf9BOjSUrQvN/l3Ga5K7u5KzcA/2xWVeHI8icH
         S56MIbntJPhpJ6VioBsX3/UDUB6IoFeqI+UMa7ceDRvabAnweh07Vfobe09VObld0xzA
         oTMqH/pbysv4t26uTTkVL2xhUMLCAvdnh7oeAC5rNCbug7MDUW5G1EnW3rYpfL57IA2s
         OPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182125; x=1791786925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uk4knJvNCd2gZ59g/hSQzEEij2193g8fgyNRYXAesqs=;
        b=hKbqRvygyD9ox8Ky2C5hYD2dDp+cjf+WtF6uTdBiBOXDHtlbc2e819Yarz1EuKHpVe
         E58duogyWf9vne7zefyZhDcHUZrcfOYz3ePzoUyf4uBDIv0eFovJmQYL1keEf7yCdhfv
         ApDqds5BA+JHMbzjlx45HLjvSM9EZ+vpJuvQ7XlQ/ct1OZdyNpWVt5PH5/b1uhP3tzoD
         1GssCEsRw+/gr2RH0hwVVcxy9jsURkezHhO10TRkcfY90EMvSCfDuNHHU+z6WEvhVe8z
         +FD8q59HfZIYYuPZXjVTvt/73KRKYf8zdktDiraZg4F0d4TEOu6uLTem0DLNpWDJTCsX
         xp8A==
X-Forwarded-Encrypted: i=1; AKwUvBwYQJACLjMna+064y2LcZ/e0qjflLr0gzx8vqYnW9SbYuNjffjSppUmg5ejuKUHIjGYANQJ8EyiA+QyJ54=@vger.kernel.org
X-Gm-Message-State: AFuF++n8t2ywrTjf9SVXgomlCOl/UacA4dyYgQWMnlAhVE0JrkLpJwtt
	sm05Y0VK5+L+KzmVVw1LI3I/W/FjYsOdYMVf685w+0+N22spuWLAVydu
X-Gm-Gg: AYBFou0h9U5JLQVZlccMLbopeymqMl4tzuC1c4GU6yx1k7weq43xHT/M3x4n5HNh/2u
	re1Hx7BehwNh14s2YLKxKqKpveSpBvRq0g6eZFjujCB+I05y0MlIZslz31ZGaV3Jru+K012qMsJ
	FrsogvmmkkB41VVSLCnyD4rZnuu3GHMBT19DVAz7w6JCRqaW7EKV5rzq3i6V+CxT9FmIsPVzuVx
	vdjRbyTaOMZ8tBOmyipSq1WlehlRfR6mmi+IHiqn+rZOFC0OeOf0sH2g8KQYel1EoiNK1LsWvqY
	WqEPq6aiIjYLa6Qi0RaZIJQbjTVbWSpRdo5ztOHnTq5+8ndjR9wr73mjHRiLX5GHHiMEcFehxIE
	qBEtluZ3uEsuiWAuAzOLq6pR+5Mmqe4xOE8D255fwnnpy06NkffKsvpOOY9EMxhi9QtCjHVskW/
	t6T1CnskjCpchVFTNSFkEiOz0mDNTZ9TIideJWLjE32yz9GPgAeno4HzHF+YNPAqMtJHRgylkzw
	eDzN+W2uCe0SzhbUrq7weW5ZgQnf+kjqzxgXUcd2xxTB1hsSYSMzIAiWpcnr/uMgmFu7/pKCKJW
	tuD1a8NWDF4NTAqSixV7npSFVbJy2fLP1fhFe8OLCkchupAfY74SHRyjxFWZvlPQG1BpMe+2wRM
	kcA==
X-Received: by 2002:a05:600c:4e8e:b0:49f:ce78:3561 with SMTP id 5b1f17b1804b1-4a02759b360mr175379885e9.18.1791182125208;
        Sun, 04 Oct 2026 23:35:25 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b305-2001-39fa-3d24-821a-4eae.310.pool.telefonica.de. [2a02:3100:b305:2001:39fa:3d24:821a:4eae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff106d8sm219456545e9.3.2026.10.04.23.35.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 23:35:24 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>,
	David Hildenbrand <david@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] mm/page_alloc: skip shuffling and reporting for no-lock frees
Date: Mon,  5 Oct 2026 08:35:14 +0200
Message-Id: <20261005063515.6312-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

free_pages_nolock() may run in NMI context or while a raw spinlock is
held. When its zone trylock succeeds, __free_one_page() still reaches
optional work written for ordinary frees.

shuffle_pick_tail() can refill its random-bit cache through
get_random_u64(), which takes a per-CPU local lock.
page_reporting_notify_free() can queue delayed work. Both operations can
enter locking outside the trylock-or-defer mechanism used by no-lock
frees.

An instrumented PREEMPT_RT lockdep run forced a random-bit cache refill
while calling free_pages_nolock() under a raw spinlock. The unpatched
allocator reported:

    BUG: Invalid wait context

The attempted lock was batched_entropy_u64.lock in get_random_u64().
Lockdep showed the raw test lock and zone->lock both held.

Skip allocator shuffling and page-reporting notification for FPI_NOLOCK.
The freed page remains on the buddy list and can be collected by a later
reporting pass.

Trees from v6.15 through v7.2 call this flag FPI_TRYLOCK. Use
FPI_TRYLOCK in place of FPI_NOLOCK when backporting this change.

Fixes: 8c57b687e833 ("mm, bpf: Introduce free_pages_nolock()")
Cc: <stable@vger.kernel.org> # see patch description, needs adjustments for <= 7.2
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
This was found while auditing the no-lock paths discussed at:
https://lore.kernel.org/r/20260919171443.90512-1-kmehltretter@gmail.com

Tested on base e767a4ea70a3 in four-vCPU x86-64 QEMU TCG with
PREEMPT_RT, PROVE_LOCKING, PROVE_RAW_LOCK_NESTING,
SHUFFLE_PAGE_ALLOCATOR, PAGE_REPORTING and page_alloc.shuffle=1.

A temporary initcall registered page reporting and freed 65 maximum-order
allocations with free_pages_nolock() under a raw spinlock. This exhausts
shuffle_pick_tail()'s cache and forces a refill.

                                             unpatched  patched
  free_pages_nolock() calls                          65       65
  __free_one_page() calls                           130      130
  shuffle_pick_tail() calls                          65        0
  page_reporting_notify_free() calls                130        0
  reporting work pending                              1        0
  invalid-wait-context reports                        1        0

Maximum-order splitting accounts for the 130 __free_one_page() calls.
Both guests powered off. The patched guest emitted no diagnostics. This
forced test does not measure normal frequency.

A second A/B used no test-only MM caller. A BPF arena program attached to
mm_page_free_batched requested 2,048 pages from a memcg-limited map. Partial
failures rolled allocated pages back through free_pages_nolock() while the
tracepoint held the per-CPU page-list lock. A virtio-balloon device provided
page reporting.

                                      unpatched  patched
  arena allocation attempts                  70       70
  arena allocation failures                  70       70
  shuffle calls from rollback                 9        0
  get_random_u64() calls from shuffle         1        0
  reporting notifications                    12        0
  delayed-work queues                         5        0

Both guests powered off without a diagnostic. This confirms that an in-tree
caller reaches the optional operations. It did not reproduce a deadlock or
lockdep warning.

The upstream form applies to v7.3-rc1, mainline and next-20261002. The
FPI_TRYLOCK backport applies to v6.15 through v7.2. mm/page_alloc.o builds
on v6.18 and v7.2.7. Stable backports were not runtime tested.

 mm/page_alloc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 12fac9084c48..3e21dc90b858 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -89,7 +89,10 @@ typedef int __bitwise fpi_t;
  */
 #define FPI_TO_TAIL		((__force fpi_t)BIT(1))
 
-/* Free the page without taking locks. Rely on trylock only. */
+/*
+ * Request the no-lock free path. Use trylocks and skip optional operations
+ * which can take other locks or queue work.
+ */
 #define FPI_NOLOCK		((__force fpi_t)BIT(2))
 
 /* free_pages_prepare() has already been called for page(s) being freed. */
@@ -1013,7 +1016,7 @@ static inline void __free_one_page(struct page *page,
 
 	if (fpi_flags & FPI_TO_TAIL)
 		to_tail = true;
-	else if (is_shuffle_order(order))
+	else if (!(fpi_flags & FPI_NOLOCK) && is_shuffle_order(order))
 		to_tail = shuffle_pick_tail();
 	else
 		to_tail = buddy_merge_likely(pfn, buddy_pfn, page, order);
@@ -1021,7 +1024,7 @@ static inline void __free_one_page(struct page *page,
 	__add_to_free_list(page, zone, order, migratetype, to_tail);
 
 	/* Notify page reporting subsystem of freed page */
-	if (!(fpi_flags & FPI_SKIP_REPORT_NOTIFY))
+	if (!(fpi_flags & (FPI_SKIP_REPORT_NOTIFY | FPI_NOLOCK)))
 		page_reporting_notify_free(order);
 }
 
-- 
2.53.0

