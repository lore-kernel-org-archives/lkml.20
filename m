Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793393678;
	b=4tcDDAZ6NJQO5CQKL86XJGXvc1bLOJ5SrxPdHl7i+1sICw3YYRLD0V1LuJzfYcr03uYb
	 tVzVtj3iydLAlF8MXYp3N/3sS9K7iq7eTkpWM76a7nxHI8yuq0EJiaeYo/Wtj6LwLt+V0
	 0Y52iX+wmEsk4Ii280BX7MyLTk5djBk+MmGCSfCupUh/GgxfNabES6FrA5Yr0ubUY0tqI
	 sYbcYPwo+NeFY7mY9uK1RC1eTEnEGQhUJsf16rdaau/HmlTlczFPakaZrgWU29gLCKMKl
	 GpN1To2jacPAySgBPlNCNKzrf7Cc6cVAOwY+NvH3AJGWYRYbr7H0mLP3FaS6XxfQ7vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793393678;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KR9I261kTrsqtzc7fnfrlPtlTPG2hb9NkIOztRWBktc=;
	b=Vl/C1bSolZdD9j+N1CCw7HLo2gLsuOIHL2BKYQOcuALl7rXooSmvX2seEfz/dU/3Vfxx
	 niriGMZgUVtqkrrh9/E8Lgw2ZUEJVyoQijl3nFZTfyZ/R7DB0BUuRrv77mkSMfAUzFkmX
	 aFlWhXMfy0wIM+sSQEa5r9/XupNG4zFpdbNGnjoH7hdXIo4NwDUss8Rd0Ssuk9m3dZetG
	 AZrYPLP/n4BZMLt/eEW6Yd2DVnlN1k0EfuEYKoKnHRD9CQsQ00chLzqdyD4jwBGSdVZ4Y
	 x0tR5fLEhmRgsU95nmRM86f/SCYn/zeTQZyvdXUF8rZ554dz1N/ri2WLSkFW/Drjbwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=posSsXvV;
	arc=none smtp.remote-ip=95.215.58.129
Received: from mta1.migadu.com (out-129.mta1.migadu.com [95.215.58.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F89E606A325
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F89E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=posSsXvV
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rrc83QUVCEKjAuO1Psc8BzjH8gymP25jq76cd3gkcmA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793393675; v=1; x=1793998475;
 b=posSsXvVXjEAaZaa0oR9bQKlIo/bHUN4IQyorG+PQGNbEuIPcIyTSLRPtkrGTYIn41NZMrQt
 t/hnK4dFo6wHtUtVHWJI/sbzPPfXQBamtdjZVwkTK0S6YDiGYLNpVQzngdGNc1gfOAlkjd1/Qez
 2HOHlGkH3opotEnH+p2lDDHY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f4708c483aea1fb8;
	Fri, 30 Oct 2026 20:54:35 +0000
X-Mizu-Trace-ID: f4708c483aea1fb8
X-Migadu-Flow: FLOW_OUT
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Meta kernel team <kernel-team@meta.com>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v2 1/5] memcg: move memory.high enforcement out of try_charge_memcg()
Date: Fri, 30 Oct 2026 13:54:12 -0700
Message-ID: <20261030205418.341214-2-shakeel.butt@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030205418.341214-1-shakeel.butt@linux.dev>
References: <20261030205418.341214-1-shakeel.butt@linux.dev>
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

try_charge_memcg() does a lot. It charges the page counters, reclaims
when a limit is hit, may call the OOM killer, and at the end it checks
and enforces memory.high. Move the memory.high part into a new function,
memcg_enforce_high(), so that try_charge_memcg() is shorter and the
memory.high code is easier to read and change.

The code and its comments move as they are. The only difference is that
the new function gets allow_spinning from gfp_mask itself.

No functional change.

Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>
Acked-by: Michal Hocko <mhocko@suse.com>
---
 mm/memcontrol.c | 125 ++++++++++++++++++++++++++----------------------
 1 file changed, 69 insertions(+), 56 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 84f4a8fd4d16..0e484f7f823a 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2699,6 +2699,74 @@ void __mem_cgroup_handle_over_high(gfp_t gfp_mask)
 	css_put(&memcg->css);
 }
 
+/*
+ * Called after @nr_pages were charged to @memcg. If @memcg or one of its
+ * ancestors is over memory.high or memory.swap.high, start reclaim or slow
+ * down the task.
+ */
+static void memcg_enforce_high(struct mem_cgroup *memcg, unsigned int nr_pages,
+			       gfp_t gfp_mask)
+{
+	bool allow_spinning = gfpflags_allow_spinning(gfp_mask);
+
+	/*
+	 * If the hierarchy is above the normal consumption range, schedule
+	 * reclaim on returning to userland.  We can perform reclaim here
+	 * if __GFP_RECLAIM but let's always punt for simplicity and so that
+	 * GFP_KERNEL can consistently be used during reclaim.  @memcg is
+	 * not recorded as it most likely matches current's and won't
+	 * change in the meantime.  As high limit is checked again before
+	 * reclaim, the cost of mismatch is negligible.
+	 */
+	do {
+		bool mem_high, swap_high;
+
+		mem_high = page_counter_read(&memcg->memory) >
+			READ_ONCE(memcg->memory.high);
+		swap_high = page_counter_read(&memcg->swap) >
+			READ_ONCE(memcg->swap.high);
+
+		/* Don't bother a random interrupted task */
+		if (!in_task()) {
+			if (mem_high) {
+				if (allow_spinning)
+					schedule_work(&memcg->high_work);
+				else
+					irq_work_queue(&memcg->high_irq_work);
+				break;
+			}
+			continue;
+		}
+
+		if (mem_high || swap_high) {
+			/*
+			 * The allocating tasks in this cgroup will need to do
+			 * reclaim or be throttled to prevent further growth
+			 * of the memory or swap footprints.
+			 *
+			 * Target some best-effort fairness between the tasks,
+			 * and distribute reclaim work and delay penalties
+			 * based on how much each task is actually allocating.
+			 */
+			current->memcg_nr_pages_over_high += nr_pages;
+			set_notify_resume(current);
+			break;
+		}
+	} while ((memcg = parent_mem_cgroup(memcg)));
+
+	/*
+	 * Reclaim is set up above to be called from the userland
+	 * return path. But also attempt synchronous reclaim to avoid
+	 * excessive overrun while the task is still inside the
+	 * kernel. If this is successful, the return path will see it
+	 * when it rechecks the overage and simply bail out.
+	 */
+	if (current->memcg_nr_pages_over_high > MEMCG_CHARGE_BATCH &&
+	    !(current->flags & PF_MEMALLOC) &&
+	    gfpflags_allow_blocking(gfp_mask))
+		__mem_cgroup_handle_over_high(gfp_mask);
+}
+
 static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
 			    unsigned int nr_pages)
 {
@@ -2856,62 +2924,7 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
 	if (batch > nr_pages)
 		refill_stock(memcg, batch - nr_pages);
 
-	/*
-	 * If the hierarchy is above the normal consumption range, schedule
-	 * reclaim on returning to userland.  We can perform reclaim here
-	 * if __GFP_RECLAIM but let's always punt for simplicity and so that
-	 * GFP_KERNEL can consistently be used during reclaim.  @memcg is
-	 * not recorded as it most likely matches current's and won't
-	 * change in the meantime.  As high limit is checked again before
-	 * reclaim, the cost of mismatch is negligible.
-	 */
-	do {
-		bool mem_high, swap_high;
-
-		mem_high = page_counter_read(&memcg->memory) >
-			READ_ONCE(memcg->memory.high);
-		swap_high = page_counter_read(&memcg->swap) >
-			READ_ONCE(memcg->swap.high);
-
-		/* Don't bother a random interrupted task */
-		if (!in_task()) {
-			if (mem_high) {
-				if (allow_spinning)
-					schedule_work(&memcg->high_work);
-				else
-					irq_work_queue(&memcg->high_irq_work);
-				break;
-			}
-			continue;
-		}
-
-		if (mem_high || swap_high) {
-			/*
-			 * The allocating tasks in this cgroup will need to do
-			 * reclaim or be throttled to prevent further growth
-			 * of the memory or swap footprints.
-			 *
-			 * Target some best-effort fairness between the tasks,
-			 * and distribute reclaim work and delay penalties
-			 * based on how much each task is actually allocating.
-			 */
-			current->memcg_nr_pages_over_high += batch;
-			set_notify_resume(current);
-			break;
-		}
-	} while ((memcg = parent_mem_cgroup(memcg)));
-
-	/*
-	 * Reclaim is set up above to be called from the userland
-	 * return path. But also attempt synchronous reclaim to avoid
-	 * excessive overrun while the task is still inside the
-	 * kernel. If this is successful, the return path will see it
-	 * when it rechecks the overage and simply bail out.
-	 */
-	if (current->memcg_nr_pages_over_high > MEMCG_CHARGE_BATCH &&
-	    !(current->flags & PF_MEMALLOC) &&
-	    gfpflags_allow_blocking(gfp_mask))
-		__mem_cgroup_handle_over_high(gfp_mask);
+	memcg_enforce_high(memcg, batch, gfp_mask);
 	return ret;
 }
 
-- 
2.53.0-Meta

