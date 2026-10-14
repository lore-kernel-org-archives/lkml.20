Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07D047B436
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971208; cv=none; b=kPCXs2qFiVKm3zzZ9XPJLeuabDogRwuzVYf1hgnfnMrU53dm2MK0cKvy3wg0HiHd93xGxxmLia2a3ncl9IapqYJhsgs3J/2lTjZG1Ahd/z+tYJKaZd747rW41IdHZ0DQ1LFX8LbzqEzxJ9trTiziglMWoNPfxdiJ5OosIECnA7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971208; c=relaxed/simple;
	bh=0RoX8LB+/mNG41tlBKaVRsCEHnuku/wbGoyCG+ubsT8=;
	h=To:Message-Id:Mime-Version:In-Reply-To:References:From:Subject:Cc:
	 Date:Content-Type; b=nNEUyGZQpz4+D2o+LCYHdgsU8g9YNcwNHqgS097eYFq4oR6tSgL+4tuIfWc9KoHGuXwBQo4ltWan4vMRCUeJd11ctSMLHuF6h3sRqeKWu6qkfcQizeocDF3Ya0qX/OiGFAz4kY/hUJmhKJU4lFRqUTCrW2BZJt63Cy3+DxQm4Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=WxmUyVUp; arc=none smtp.client-ip=209.127.230.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="WxmUyVUp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791971198; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=EoGHK2d9o+Gv89lihwm7ZyHMnSAieOGeRDgz9v8xE8U=;
 b=WxmUyVUp9f0VkCdRUyFck6O1+gg8N6BM8V54dce6x2J51ylLnREcTHnbg8xoTTh8WX7ule
 UcDlljtAxYDJe9PZGMjF9/ZvsFUFuCiP7cNzOo4KvW8n+ZbBsHOdEG/87PdCu0TI9g2CdI
 0HC5T6BqjjrLsGNx1lvyd+pnJhrHspzWLKDPAN+8f3kE+KDgaSeg1gR69Q0SzPCi1/8Lml
 i9xXN67sncjoqc17iXhoOMQod+ysi7jn5GxeCr3d0KpGbMIXI16S00Rd45OdqpHMR7nc9b
 oR9sm2Vp/zf8+J+U9fxLoJ+32QCdGvh7Tb3HfXkX5eEAMi5kDh1JtDqdsTuqTQ==
X-Mailer: git-send-email 2.45.2
To: <akpm@linux-foundation.org>, <david@kernel.org>, <ljs@kernel.org>, 
	<gourry@gourry.net>, <joshua.hahnjy@gmail.com>, <ziy@nvidia.com>, 
	<mingo@redhat.com>, <peterz@infradead.org>, <mgorman@suse.de>, 
	<riel@redhat.com>, <juri.lelli@redhat.com>, <vincent.guittot@linaro.org>, 
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>, 
	<vschneid@redhat.com>, <kprateek.nayak@amd.com>
Message-Id: <20261014094347.99157-6-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
In-Reply-To: <20261014094347.99157-1-lizhe.67@bytedance.com>
References: <20261014094347.99157-1-lizhe.67@bytedance.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
Subject: [PATCH 5/6] sched/numa: do not feed tiering promotions into task placement stats
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>, "Li Zhe" <lizhe.67@bytedance.com>
Date: Wed, 14 Oct 2026 17:43:46 +0800
Content-Type: text/plain; charset=UTF-8
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26acf4f7c+5a5bdf+vger.kernel.org+lizhe.67@bytedance.com>

NUMA balancing has separate mode bits for normal task placement and
memory tiering. In memory-tiering-only mode, NUMA hinting faults on
slow-tier pages are used to detect hot pages and promote them to a top
tier. They are not normal task-placement faults.

task_numa_fault() already avoids normal placement accounting for slow-tier
faults while memory tiering is enabled. However, a successful slow-to-fast
promotion can bypass that check. do_numa_page() reports the destination
node to task_numa_fault() after migration, so the fault is seen as a
top-tier fault and can update p->numa_faults, task placement state and
the preferred NUMA node.

Slow-tier PTEs store access-time metadata in the folio last-cpupid field.
Before this change, numa_migrate_check() returned the same all-ones
last_cpupid value for those faults that normal AutoNUMA uses for a first
or unknown access. Those cases are different: the ordinary unset value
means there is no previous CPU/PID sample, while a slow-tier access-time
value means the field does not contain a cpupid at all.

Name the ordinary all-ones sentinel LAST_CPUPID_UNSET and use it for the
normal first/unknown cpupid state. Return a distinct
LAST_CPUPID_ACCESS_TIME value while the folio still carries access-time
metadata. If normal NUMA balancing is disabled, keep the migrated-page
accounting but skip normal task-placement accounting for those faults.

When normal NUMA balancing and memory tiering are both enabled, promoted
pages can still feed task placement. In that mode, the user has enabled
both CPU placement feedback and tiering promotion, so a promoted top-tier
fault is treated as an ordinary unset-cpupid AutoNUMA fault.

A stale access-time value can also survive after memory tiering is
disabled and later reach task_numa_fault() from a top-tier page, where
the slow-tier validation no longer applies. Treat any remaining invalid
last_cpupid as LAST_CPUPID_UNSET before task_numa_group() can decode a
CPU from it.

This does not change whether a page is promoted. It only prevents
memory-tiering-only promotion faults from being consumed by the normal
AutoNUMA placement heuristic.

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 include/linux/mm.h  |  5 ++++-
 kernel/sched/fair.c | 26 +++++++++++++++++++++++++-
 mm/memory.c         |  2 +-
 3 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index dd09c438fa23..bb0c72640152 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2420,6 +2420,9 @@ static inline int folio_nid(const struct folio *folio)
 #define PAGE_ACCESS_TIME_MASK				\
 	(LAST_CPUPID_MASK << PAGE_ACCESS_TIME_BUCKETS)
 
+#define LAST_CPUPID_UNSET		(-1 & LAST_CPUPID_MASK)
+#define LAST_CPUPID_ACCESS_TIME		(-2 & LAST_CPUPID_MASK)
+
 static inline int cpu_pid_to_cpupid(int cpu, int pid)
 {
 	return ((cpu & LAST__CPU_MASK) << LAST__PID_SHIFT) | (pid & LAST__PID_MASK);
@@ -2468,7 +2471,7 @@ static inline int folio_last_cpupid(struct folio *folio)
 }
 static inline void page_cpupid_reset_last(struct page *page)
 {
-	page->_last_cpupid = -1 & LAST_CPUPID_MASK;
+	page->_last_cpupid = LAST_CPUPID_UNSET;
 }
 #else
 static inline int folio_last_cpupid(struct folio *folio)
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 2e11107bf5ca..ec08406d1364 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4214,6 +4214,21 @@ void task_numa_fault(int last_cpupid, int mem_node, int pages, int flags)
 	if (!p->mm)
 		return;
 
+	/*
+	 * Slow-tier pages use last_cpupid as access-time metadata instead of
+	 * a real cpupid. Do not feed these faults into normal task placement
+	 * when normal NUMA balancing is disabled.
+	 */
+	if (last_cpupid == LAST_CPUPID_ACCESS_TIME) {
+		if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL)) {
+			if (migrated)
+				p->numa_pages_migrated += pages;
+			return;
+		}
+
+		last_cpupid = LAST_CPUPID_UNSET;
+	}
+
 	/*
 	 * NUMA faults statistics are unnecessary for the slow memory
 	 * node for memory tiering mode.
@@ -4223,6 +4238,15 @@ void task_numa_fault(int last_cpupid, int mem_node, int pages, int flags)
 	     !cpupid_valid(last_cpupid)))
 		return;
 
+	/*
+	 * A stale slow-tier access timestamp can survive after memory tiering
+	 * is disabled and later reach here as if it was a cpupid from a
+	 * top-tier page. Treat any non-cpupid value as an ordinary first
+	 * access before task_numa_group() decodes a CPU from it.
+	 */
+	if (unlikely(!cpupid_valid(last_cpupid)))
+		last_cpupid = LAST_CPUPID_UNSET;
+
 	/* Allocate buffer to track faults on a per-node basis */
 	if (unlikely(!p->numa_faults)) {
 		int size = sizeof(*p->numa_faults) *
@@ -4240,7 +4264,7 @@ void task_numa_fault(int last_cpupid, int mem_node, int pages, int flags)
 	 * First accesses are treated as private, otherwise consider accesses
 	 * to be private if the accessing pid has not changed
 	 */
-	if (unlikely(last_cpupid == (-1 & LAST_CPUPID_MASK))) {
+	if (unlikely(last_cpupid == LAST_CPUPID_UNSET)) {
 		priv = 1;
 	} else {
 		priv = cpupid_match_pid(p, last_cpupid);
diff --git a/mm/memory.c b/mm/memory.c
index 8b0c2c735d3d..212e9d1d5b64 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6173,7 +6173,7 @@ int numa_migrate_check(struct folio *folio, struct vm_fault *vmf,
 	 * to record page access time.  So use default value.
 	 */
 	if (folio_use_access_time(folio))
-		*last_cpupid = (-1 & LAST_CPUPID_MASK);
+		*last_cpupid = LAST_CPUPID_ACCESS_TIME;
 	else
 		*last_cpupid = folio_last_cpupid(folio);
 
-- 
2.20.1
