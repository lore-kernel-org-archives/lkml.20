Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794350674;
	b=0s/Gda3PR392MdF/+jowGHMmOXNWbIGZsH+KLmSpeNOVyWILHsaPqPrmxScUZTq8KDmu
	 /BaCT1/E2kUyLPAT9Sf46SzU7kxD450vTrLHU/iUGMLwbz+JRmj7u1/gEr3PvgB6r94++
	 pkJCecnmiZzcbvZUw9NGjbmQ18e07ova5np3U52T75UI37S2YNM0OG+2eV4/3thQB67t0
	 YESKpCE6IGoh3NvShWwSRh9nL35Ro+pYXw9EAw458UZqNcIj6T7KiMsLIEfg3To/RbXwI
	 Q42XidLn6tF0PaQgmLwUgIorhHkYrthqlt1a6wbasgnuZPLZa0i21yfnrf3gRlVJbLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794350674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pW9oDqWW/PRcNxLLod97kMD+KHWBIi6BHP/J0nIg8/Y=;
	b=BbNclNhuvfERQo3VbMOQ9HtNv7/G121WPlQO9TuGLewRrKhJEnzYra6EeB84PS+0Z9NI
	 0c5pnKKN/J+FEC93XnnWXf24Asw7YnZWl/velCxtQxewWsZg1PC+6nvF51U5c/59fW+Dn
	 XLJlrS2m5HgT0Lx//tT7T+76XMbhOJ8k4nHjIzuVGiGy7+KLw+t0phFqN0xiPiDrOHMdI
	 5gGmd/wLfcREzW2CFaRkRhQW3ZTMV63GfTcz8j3HTlNM86WpblVrb/UsvgLzY0tYNdLJY
	 qupWK1eqTRMpOVui9urDMClNe/HeOS2bsreQzgyl4x2WkIoNsuU7ONdvRrFHEOL7hFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="P/NYGISY";
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892D8606A332
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 892D8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P/NYGISY
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b31ca7e0bcso29091947b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794350673; x=1794955473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pW9oDqWW/PRcNxLLod97kMD+KHWBIi6BHP/J0nIg8/Y=;
        b=P/NYGISYAH7voIlCW7yl9h8dtnGXADYpjfuG45FiOvLgc/wa+nX42ngiMjJIG9Rcdc
         BD7t6bVYwRlp7vNoNtwJsmDMjkPjABu3AflWkTMKrPq2roGYMOldtRq/aEOLCvozcamr
         ILAYqeHdIwGh/SXCzkntYi2zgNIK/hnp/iHHgvPXGihnk2Buqqybm22O+yTcNRYJ4VU3
         PGHt4B+Onkve6oLpL3uTCLtdZkboHlYa1JU7ON+3/IWG2BgKtemqRnu+MU20Jcw2uGqN
         +RzijWC5uheMqYDVvnjDmvzKKORYxvY/zOBoGonpl4eZoSDcKqOdvfZBg+0f1KVOEL8R
         /Y9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794350673; x=1794955473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pW9oDqWW/PRcNxLLod97kMD+KHWBIi6BHP/J0nIg8/Y=;
        b=r4ADepyi/U9uXBQTzphDdH7oUdhTnEaBLGMCwua9ygBFp/8IcTPPWMmvVXApJS8yMv
         QnEW5PAaC4vIIHU8V+I63oaVWthlTLFCAHKJhsSXT//p5NHnWjRu/dJjSMrLnuxAsmX6
         dNtp9jqLaPTPkG6sutpfUoJe6R20lKqUYacmQE0p/CYbstqb3EPCO+Ln+4Hy2KEa7h7x
         PE6BbDklvOwCONYJBJa9jtMvom0YItbefBGe4cK0Qk6FQBvbroHMtT3LGr9yKKAXV05z
         fQt3a2LiU1P45tz0PYJITNU80EL51vPh5rCdmBDigBrjxUKLXrOYEOyW37TUWrAgQXTh
         hQ2A==
X-Forwarded-Encrypted: i=1; AL+hErFHfcUVfZTkTVay+YbHR2jCFI7NBu3jLCVO1ClUKMN2tVtPWcMi6+aMVZbSSSZY6w/djZ/mF0TclTPcloI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bRNlY1a3tWlnT/KwWtY3BfMXvHZDoHhYiwQQTELRyTvLY7AEL
	jI7OGCX2yVzZh3LMuUErg7xZw31/NQWRIfE+dlFEHThERK+hseAbSl70
X-Gm-Gg: AYBFou2OEIfX7LxHtmvbqjuNgbnnjZ2phx4M2BfBQUaBueHMBDCjmQidaZx4LLH5Diy
	p40267W3PkV9Mt27m6Vzz3k5jroNeK5UKs/P+TpzLtgVKTH+ttTb2uWtIo+mImH5z/CXlOGno9i
	36pGDehPZI8GjypTz6n0NoE7bPem5EakhIOzvG5oUHKt8xcnUHv3Bg32dWOOdisBh2Z0t/aT10Q
	290B1/B4rRiZCcwsqCLnCuE14pcUyFuyDMyRJnNRd/ECaWGcrwV1wgqs4negemNx2CI8B87lwPX
	2fv5UPZSj8csFl7GjeiBMjQ3ZrKNFq3qIw0yio63HBC45Ec0UP3g5XdHpcZMEPlM2OOklOErN01
	z4fRK5Q82rJ0NREnD8DcJHLwjPGe52cY9WMfXD7qo+S9K8oQ52fHA4+Fy1fAtiWPETgLxzbBeoU
	Isc0FptQPeYRpV3pF64RMs2ce+bcIHfNFBQClyyYUKV3HUP20JqxL9P46zkzMkclIkNFcS9iDmr
	GxiD0XWwhR2FkcJDvoeP5rXMynAAaDca3Ddi3tq7xhyqSwIzJdu4hk+ZqAoBHSe00eCDfPan06g
	MBOpVFU5go2N+WI35RtI7Z7FS5ZW11Vs5/hu5CRkYxRYNqXKzioonn4+5c9t
X-Received: by 2002:a05:690c:9e:b0:8b1:233d:7054 with SMTP id 00721157ae682-8b3a817a567mr6432867b3.32.1794350672973;
        Tue, 10 Nov 2026 14:44:32 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:49::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933a06cfsm30224987b3.7.2026.11.10.14.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:44:32 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Gregory Price <gourry@gourry.net>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v2] mm/page_alloc: only skip kswapd nodes below their kswapd watermark
Date: Tue, 10 Nov 2026 14:44:31 -0800
Message-ID: <20261110224432.2347606-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Commit 19c5fb83f2a4 ("mm: page_alloc: avoid kswapd thrashing due to
NUMA restrictions") makes get_page_from_freelist() skip any node with an
active kswapd on the first pass through the zonelist, so unrestricted
allocations don't immediately consume the memory kswapd is freeing.

But kswapd is also woken for high-order requests. With THP defrag set to
defer, each THP fault that fails on a fragmented node wakes kswapd at
PMD order. kswapd reclaims a batch, wakes kcompactd, and sleeps until
the next failed fault, so it stays awake much of the time even on a node
with plenty of free order-0 memory. This means those order-0 allocations
get directed elsewhere.

This was observed on some Meta production workloads running on 2-NUMA
systems, where processes with a preference for node0 allocations
continuously allocated order-0 pages on node1, despite node0 having
hundreds of GB of free memory.

Only skip a zone with an active kswapd if it is also below kswapd's
target watermark.

On a 2-NUMA VM with a 60G node0 and a 20G node1, with THP enabled=always
and defrag=defer, I ran a process that prefers allocating on node0.
With a fragmented node0:
- Before the patch, 68% of pages were served from node0
- After the patch, 100% of pages were served from node0

One remaining gap is that since this uses kswapd's own threshold,
unrestricted allocations can take what kswapd frees above the target
watermark. The current code already lets such allocations drain from the
high to the low watermark while kswapd sleeps.

One potential solution, as hinted by Johannes in the discussion from the
original fix [1] is to add some kind of fudge factor (for instance,
wmark_pages + high_wmark_pages - low_wmark_pages).

But in tests that I ran in a VM where the allocation demand outpaces
kswapd, about 4% more pages landed on the busy node and kswapd reclaimed
about 15% more, but kswapd still finished and slept. So let's hold off
on the fudge factor until it becomes an observable issue in workloads.

[1] https://lore.kernel.org/linux-mm/20251001164131.GB1597553@cmpxchg.org/

Fixes: 19c5fb83f2a4 ("mm: page_alloc: avoid kswapd thrashing due to NUMA restrictions")
Suggested-by: Daniel Hodges <hodgesd@meta.com>
Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
v1 --> v2:
- Added a Fixes tag and separated this from the other cleanup patches
- Check zone_watermark_fast with no flag to match the call in
  pgdat_balanced().
- Calculates mark outside the zone_watermark_fast check to match the
  style for the other zone checks.
- Wordsmithing commit message to explain the unaddressed gap.
- Yes, this is ugly. I have another series to clean this code up but
  I wanted this to be a feature-minimal patch so that it could be
  easily backported. Things will be much prettier once those are landed.

 mm/page_alloc.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 8532af052d74b..56121c3f9c4a7 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -45,6 +45,7 @@
 #include <linux/mmu_notifier.h>
 #include <linux/migrate.h>
 #include <linux/sched/mm.h>
+#include <linux/sched/sysctl.h>
 #include <linux/page_owner.h>
 #include <linux/page_table_check.h>
 #include <linux/memcontrol.h>
@@ -3799,6 +3800,9 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 	struct zoneref *z;
 	struct zone *zone;
 	struct pglist_data *last_pgdat = NULL;
+	enum zone_watermarks kswapd_watermark =
+		sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING ?
+		WMARK_PROMO : WMARK_HIGH;
 	bool last_pgdat_dirty_ok = false;
 	bool no_fallback;
 	bool skip_kswapd_nodes = nr_online_nodes > 1;
@@ -3866,16 +3870,21 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 		}
 
 		/*
-		 * If kswapd is already active on a node, keep looking
-		 * for other nodes that might be idle. This can happen
-		 * if another process has NUMA bindings and is causing
-		 * kswapd wakeups on only some nodes. Avoid accidental
-		 * "node_reclaim_mode"-like behavior in this case.
+		 * If kswapd is already active on a node and the zone is below
+		 * its kswapd watermark for this request, keep looking for
+		 * other nodes that might be idle. This can happen if another
+		 * process has NUMA bindings and is causing kswapd wakeups on
+		 * only some nodes. Avoid accidental "node_reclaim_mode"-like
+		 * behavior in this case.
 		 */
 		if (skip_kswapd_nodes &&
 		    !waitqueue_active(&zone->zone_pgdat->kswapd_wait)) {
-			skipped_kswapd_nodes = true;
-			continue;
+			mark = wmark_pages(zone, kswapd_watermark);
+			if (!zone_watermark_fast(zone, order, mark,
+					ac->highest_zoneidx, 0, gfp_mask)) {
+				skipped_kswapd_nodes = true;
+				continue;
+			}
 		}
 
 		cond_accept_memory(zone, order, alloc_flags);
-- 
2.53.0-Meta

