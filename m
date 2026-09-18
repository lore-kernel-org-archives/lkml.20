Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A7627AC57
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789690341; cv=none; b=bwhQKNKEs+lSdqJ5YSX7evaxFQGNAroroeUGIlIMNoVvpIx6xWAPGAqrAcypZJ0U0/y6L8zlHWOZ6lh6k9EPu5MHqaLri7mVkoCgPQXkmUthcS4NrDkFDXQ+rFLFaCAAr68mC7UMsTEb7EMJ8+8GZpxRVeQbWGLPjZaG4vc0a/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789690341; c=relaxed/simple;
	bh=MiigpDHTrS/YH+wsTyUGR8pYU9kRznEBA5jNJoFFlHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IAZz0xn6uYfdJIcJjfFAWXlxZFmdB53U2ArH8PdzwLI9WwXeo1FOGJKDtQlsoTemjEoGKBK4vdhZI6gcdQWb8HbdJcl/jggzUhzv2A1++CUfm3i2qjlnFBJHOE9I7SWkpJ5EKAQMRP0wlw71n8O5CACYTvtWZDRVyJ1J/Z7NLQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=UrepoYds; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="UrepoYds"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93a0fd41a7bso20367085a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789690334; x=1790295134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ReC5OTam6MTJ6u4FECt/nJW9XaNR1Mg3esV3ZyKWZpE=;
        b=UrepoYdsfS2OILDDIOzCRdtk96VJLCe44aLqBs7EhEJm3hqF46Cu99XssurIzIqLqo
         y/4p4XkA2cjepzHSyS5ImiJXehWrSUgA2lcvG2bCCdirRuO01ZZ3NgrS2i2exGis5ASH
         oV7xlr745TZz7WJhcCD39XmUEWK4x+MiQspJ+OllS0giY9zIiIZ2sOoD4N8QGSD1A9j2
         SAuJlE6kkaKMagCicLbpBVdss0kl1fWWQGFprbW41LWFXDKJcAX2MhCDsf2RYdqKvbae
         Q1eEoqcdEkes8YExSFobfMMNZaN431Kr0SrZyfr69E4u418WZ9/jVvPLUJpZwx4mtuij
         /gUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789690334; x=1790295134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ReC5OTam6MTJ6u4FECt/nJW9XaNR1Mg3esV3ZyKWZpE=;
        b=a1uy4YbwUg2bVXATT1AybIdrvLYQvSfn/r/WJxz3DnyE7shtVc6JLIJ6CLQU7SYeDH
         FKDJgjEJgLDgEQk8zi7gptbZ98NXV10f0ixcjmcuEtwR7mhRM3ut+l6+ttO3ki2ipsel
         Upa3Bctnc1hOBCv1dUOvAwUCzL5UWA58owjGyRjTy1+Mdead04s1c9o/nSeJuDkPphmU
         183LHrBDhOOra33j7Siq0SeYh2DLYDUh3QhpaCDjzaGXTBEs8dTTQ2GEZAkax3tsjQvE
         mXL6HZ+Y81DRy169p0oAfDtTRsqE04FlEejQB0Q/ZMejv2iK4R/LFgR9R95CEJscJ3fm
         zkbQ==
X-Gm-Message-State: AFuF++moHyhLJ1X0yFOmpAWW7Anl2YTOboO5vL/e1P2qKy1PcUrltgMe
	L1nquHlGVrPyMgdclqaeT9XCtskSysW0HAhKlaKzRChCQdI7bO2qYE/iw8N3Yf7ICpE=
X-Gm-Gg: AYBFou1lDLJsCiDunTj8c6U1aB/iDXpSjVE2dAAiMGvmR79oWh3hdI0c8TBx9dN5uPp
	vWEty0NALOCJv8+/s4znNaD/qTPHdt3w8aQfusm3pTZ6UVYAdJITMNPuDfEgXLdJJeUMIbmIxqV
	ClefCOcXsjUzniwyrlezvd4cFp+OUApcdOw96lWHEzg3YTQX7wu3gpP6lqKkonGY/tvRbt1xTFn
	sWbabuGu9qChcSF2PTg+R8QS3vR5Ir2Su3q1NnXGyHDkVI0NzAeFA3663ysnQotNwbjQMS++0b5
	ZD3Tax98+lf1Uzt3xURjWtKRfl3cHPjenYnMcka1MJsdsuisD/QpGS1iN7IQgLc2Cm25k/Lhxe7
	AKrtFfpVAc9geMtHzIytZTZ2NlUmmJRKq6UQks4SP51XzT8ZK+9BfcA8wDYYHDnoEKGo8qzx4jm
	XqAICniVUHsFjszhdyU719JkqZkghcityu2UJd4+Qsh5nallshZANEfxN1NHibacyCenjarF//a
	SbhVbqUtulfocARTXy33OF8RfivN5yuck9cY5rbKxobTS6/lmrcRO0ACe9X
X-Received: by 2002:a05:620a:31a0:b0:93b:d7a0:d9e4 with SMTP id af79cd13be357-93bdca1640cmr106094985a.62.1789690334389;
        Thu, 17 Sep 2026 17:12:14 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b81cff7cbsm583762585a.41.2026.09.17.17.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 17:12:14 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v2 1/2] mm/mempolicy: use SRCU for the weighted interleave state
Date: Thu, 17 Sep 2026 20:12:02 -0400
Message-ID: <20260918001203.3389165-2-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918001203.3389165-1-gourry@gourry.net>
References: <20260918001203.3389165-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

alloc_pages_bulk_weighted_interleave() copies iw_table into a scratch
array on every call so it can walk the weights outside of RCU.  The copy
exists only because the loop may sleep in the page allocator and so cannot
hold rcu_read_lock().

Use SRCU to pin the global iw_table object and use it in-place instead.

Retire through both flavors - call_srcu() for the sleeping readers, then
kfree_rcu() for the reference-less ones - so writers no longer block on
synchronize_rcu() either.

Tested in a VM with KASAN, PROVE_LOCKING and DEBUG_OBJECTS_RCU_HEAD,
with a udelay() injected into the read section to widen the race against
concurrent sysfs weight writers, and placement checked against the
configured weights.

Every retired state reached its callback. Swapping the deferred free for
a bare kfree() in the same test reports a use-after-free immediately.

Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Suggested-by: Matthew Wilcox <willy@infradead.org>
Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
 mm/mempolicy.c | 70 ++++++++++++++++++++++++--------------------------
 1 file changed, 34 insertions(+), 36 deletions(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 060a0eb26917..2643915dc966 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -112,6 +112,7 @@
 #include <linux/printk.h>
 #include <linux/leafops.h>
 #include <linux/gcd.h>
+#include <linux/srcu.h>
 
 #include <asm/tlbflush.h>
 #include <asm/tlb.h>
@@ -157,6 +158,7 @@ static const int weightiness = 32;
  */
 struct weighted_interleave_state {
 	bool mode_auto;
+	struct rcu_head rcu;
 	u8 iw_table[];
 };
 static struct weighted_interleave_state __rcu *wi_state;
@@ -168,6 +170,24 @@ static unsigned int *node_bw_table;
  */
 static DEFINE_MUTEX(wi_state_lock);
 
+/* Readers that sleep while walking iw_table hold this instead */
+DEFINE_STATIC_SRCU_FAST(wi_srcu);
+
+static void wi_state_free_rcu(struct rcu_head *head)
+{
+	struct weighted_interleave_state *state =
+		container_of(head, struct weighted_interleave_state, rcu);
+
+	kfree_rcu(state, rcu);
+}
+
+/* Retire through both flavors: sleeping readers use SRCU, the rest RCU */
+static void wi_state_retire(struct weighted_interleave_state *state)
+{
+	if (state)
+		call_srcu(&wi_srcu, &state->rcu, wi_state_free_rcu);
+}
+
 static u8 get_il_weight(int node)
 {
 	struct weighted_interleave_state *state;
@@ -266,10 +286,7 @@ int mempolicy_set_node_perf(unsigned int node, struct access_coordinate *coords)
 	rcu_assign_pointer(wi_state, new_wi_state);
 
 	mutex_unlock(&wi_state_lock);
-	if (old_wi_state) {
-		synchronize_rcu();
-		kfree(old_wi_state);
-	}
+	wi_state_retire(old_wi_state);
 out:
 	kfree(old_bw);
 	return 0;
@@ -2644,7 +2661,8 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
 	unsigned long nr_allocated = 0;
 	unsigned long rounds;
 	unsigned long node_pages, delta;
-	u8 *weights, weight;
+	struct srcu_ctr __percpu *scp;
+	u8 *table, weight;
 	unsigned int weight_total = 0;
 	unsigned long rem_pages = nr_pages;
 	nodemask_t nodes;
@@ -2688,25 +2706,14 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
 	me->il_weight = 0;
 	prev_node = node;
 
-	/* create a local copy of node weights to operate on outside rcu */
-	weights = kmalloc(nr_node_ids, gfp & GFP_RECLAIM_MASK);
-	if (!weights)
-		return total_allocated;
-
-	rcu_read_lock();
-	state = rcu_dereference(wi_state);
-	if (state) {
-		memcpy(weights, state->iw_table, nr_node_ids * sizeof(u8));
-		rcu_read_unlock();
-	} else {
-		rcu_read_unlock();
-		for (i = 0; i < nr_node_ids; i++)
-			weights[i] = 1;
-	}
+	/* The page allocator may sleep, pin the weight table with SRCU */
+	scp = srcu_read_lock_fast(&wi_srcu);
+	state = srcu_dereference(wi_state, &wi_srcu);
+	table = state ? state->iw_table : NULL;
 
 	/* calculate total, detect system default usage */
 	for_each_node_mask(node, nodes)
-		weight_total += weights[node];
+		weight_total += table ? table[node] : 1;
 
 	/*
 	 * Calculate rounds/partial rounds to minimize __alloc_pages_bulk calls.
@@ -2718,10 +2725,10 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
 	rounds = rem_pages / weight_total;
 	delta = rem_pages % weight_total;
 	resume_node = next_node_in(prev_node, nodes);
-	resume_weight = weights[resume_node];
+	resume_weight = table ? table[resume_node] : 1;
 	for (i = 0; i < nnodes; i++) {
 		node = next_node_in(prev_node, nodes);
-		weight = weights[node];
+		weight = table ? table[node] : 1;
 		node_pages = weight * rounds;
 		/* If a delta exists, add this node's portion of the delta */
 		if (delta > weight) {
@@ -2747,7 +2754,7 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
 	}
 	me->il_prev = resume_node;
 	me->il_weight = resume_weight;
-	kfree(weights);
+	srcu_read_unlock_fast(&wi_srcu, scp);
 	return total_allocated;
 }
 
@@ -3673,10 +3680,7 @@ static ssize_t node_store(struct kobject *kobj, struct kobj_attribute *attr,
 
 	rcu_assign_pointer(wi_state, new_wi_state);
 	mutex_unlock(&wi_state_lock);
-	if (old_wi_state) {
-		synchronize_rcu();
-		kfree(old_wi_state);
-	}
+	wi_state_retire(old_wi_state);
 	return count;
 }
 
@@ -3742,10 +3746,7 @@ static ssize_t weighted_interleave_auto_store(struct kobject *kobj,
 update_wi_state:
 	rcu_assign_pointer(wi_state, new_wi_state);
 	mutex_unlock(&wi_state_lock);
-	if (old_wi_state) {
-		synchronize_rcu();
-		kfree(old_wi_state);
-	}
+	wi_state_retire(old_wi_state);
 	return count;
 }
 
@@ -3789,10 +3790,7 @@ static void wi_state_free(void)
 	rcu_assign_pointer(wi_state, NULL);
 	mutex_unlock(&wi_state_lock);
 
-	if (old_wi_state) {
-		synchronize_rcu();
-		kfree(old_wi_state);
-	}
+	wi_state_retire(old_wi_state);
 }
 
 static struct kobj_attribute wi_auto_attr = {
-- 
2.55.0

