Received: from mta0.migadu.com (out-195.mta0.migadu.com [91.218.175.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF9D372662
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 21:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791666630; cv=none; b=fAWCIMa03x8NZrM5bNoFhk9GVttuB8sJ7dDfIrDTtBt/hJ+2yh9Vk+L7iv4OlGgXxZBmfE4jxn0SA9g69TE/rCNAa523qDA/V+QfrYY674GUBbckr3YVc2kU4oii3MNV6/+IGZnfp0UgJkJ+n9jZCy5W9lV1FLSDHrmCmQC/WNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791666630; c=relaxed/simple;
	bh=I9Jbe/FzwhYUq3Ebi/TIDOHeruGUbjsfkx6G/pKSGvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e+U838pLSBOT4Uefd9wZA8NqNhEZaB5ZXIGZg/WsNQxNlVuO/5eSbewGF2TbSoTEwk7Rqrae308VRxlxj5aB47gmmiA8sm0emddQWXG3E5frOSqHpybljE1HKd6PTsoBXWKItOJm2O0csfEBsuKi7yBBvr1h186zWC69O8r7bKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bjXXxXEi; arc=none smtp.client-ip=91.218.175.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bjXXxXEi"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=I9Jbe/FzwhYUq3Ebi/TIDOHeruGUbjsfkx6G/pKSGvc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791666626; v=1; x=1792271426;
 b=bjXXxXEii3oBT+t4vR0lQwKLFoRgJlRWgclBZjpu+U5l+WWnv1jOJoxJ+N/YYY980xJI8Bw6
 6hZvnzrHnCnH5s4+SGVPGoONozOV4jrnwqRe42/RLtsZBz1Ch9RFSkJSblRw6aiBBx8uMUDuPT7
 XUV+JKQezHAgRZxF6pzaoLlo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 60868bde65bc6ff9;
	Sat, 10 Oct 2026 21:10:25 +0000
X-Mizu-Trace-ID: 60868bde65bc6ff9
X-Migadu-Flow: FLOW_OUT
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Meta kernel team <kernel-team@meta.com>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH for-7.5 3/5] memcg: use high_work for remote charges
Date: Sat, 10 Oct 2026 14:09:55 -0700
Message-ID: <20261010210957.1350874-4-shakeel.butt@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261010210957.1350874-1-shakeel.butt@linux.dev>
References: <20261010210957.1350874-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some charges go to a cgroup outside the current mm's cgroup and its
ancestors. The high handler uses current->mm, so it cannot handle these
overages. Filesystem notifications and remote page faults can take
this path.

Use mm_match_cgroup() before checking the high limits. If it does not
match, use high_work instead of recording task overage or doing
synchronous reclaim and throttling. Charges to the same cgroup or an
ancestor keep their current handling. Tasks without an mm also use the
worker.

Like kernel threads, remote chargers skip memory.swap.high throttling
and its high-event reporting, and a fast allocator can outrun the worker.
The memory.max and memory.swap.max checks stay the same.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
---
 mm/memcontrol.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 8116fce6ab96..3456960cbe68 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2705,7 +2705,8 @@ static void memcg_enforce_high(struct mem_cgroup *memcg, unsigned int nr_pages,
 			       gfp_t gfp_mask)
 {
 	bool allow_spinning = gfpflags_allow_spinning(gfp_mask);
-	bool use_worker = !in_task() || (current->flags & PF_KTHREAD);
+	bool use_worker = !in_task() || (current->flags & PF_KTHREAD) ||
+		!current->mm || !mm_match_cgroup(current->mm, memcg);
 
 	/*
 	 * If the hierarchy is above the normal consumption range, schedule
@@ -2728,6 +2729,7 @@ static void memcg_enforce_high(struct mem_cgroup *memcg, unsigned int nr_pages,
 		 * Don't make an unrelated interrupted task handle this charge.
 		 * Kernel threads may be working for other tasks, so let a worker
 		 * reclaim instead.
+		 * Remote charges need reclaim from their charged hierarchy.
 		 */
 		if (use_worker) {
 			if (mem_high) {
@@ -2756,7 +2758,7 @@ static void memcg_enforce_high(struct mem_cgroup *memcg, unsigned int nr_pages,
 		}
 	} while ((memcg = parent_mem_cgroup(memcg)));
 
-	/* Interrupts and kernel threads stop here. */
+	/* Interrupts, kernel threads, and remote chargers stop here. */
 	if (use_worker)
 		return;
 
-- 
2.53.0-Meta

