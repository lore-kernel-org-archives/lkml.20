Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC583A1DB
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 01:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787968792; cv=none; b=Y8ESdKtovo9tQJ7PwP2TgQp+HiQ9tMawhREDCeALNND4/9F0Jh4b0Wvfkmz07/H6HMfonezB7cLdohxu9tOseGInNTUjrebwoe9IoZ3NPP1spuFv8uHrmm+SAHEn5Ww0XyxlPQN+Yp7+O/lTGzC0wgcbBWD4ZgldtlhL9+cV1bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787968792; c=relaxed/simple;
	bh=rX1XzN2uM/GnLcNQ1zon6YvETR+Ge5U74yYVybm8P/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LSuOCcol3232PUXYIDIDCkTObXmm52fKcKZSOsynpO5JOMRZ5Xh1kb8knDPGVK0Be06Txb+VPxV99nyVn+qdb9KEi9fRctOZsGGFLYcdifiqZUiaedA4AXk8a+G64WIY7cM4DPQ0/R/+HfcR8ImIp8KP2L27J8oKdnpXpq3XuGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=VOz6UpFk; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="VOz6UpFk"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-9371bcf1f8fso86674285a.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1787968790; x=1788573590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jC5RZ0/W3U26Ng+tF+NWajMfbOb15T9nPbwMwMEpGWM=;
        b=VOz6UpFkwkvIKcmRgOOA+5iPgz4LLoXIyTrxJSCFj3keHvrmrShGEYMIb63MNZjVA4
         EKjfpvktXM8SxmVB0JUDkA6nvMkYqcWjiCtnJfqmELc2xa3M5DOUyeUtd/tfje11zQ9Q
         3ursYIJXKSt+Q/J6TNbj0YIpvyocmANz2gk8DK1vGxMkwkLxw0Afmjli29qSBNwHc4cc
         irzd4NTEorYuxaR6MqWmOmBdWOZvl6Nml2TNePvFrMrrA4o2GE3Gg8U6cBgJJMs/Iw2u
         ZCp6j+mkODN5fBzmcNqT4wgqX+IMy7wbWAbs3GFP+h8JZl4yvb7ELma3bSeRnns+q/xu
         WK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787968790; x=1788573590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jC5RZ0/W3U26Ng+tF+NWajMfbOb15T9nPbwMwMEpGWM=;
        b=h4hsrV7KBVeyzq9OPk8gJSdBN9HjYSqk4M5yejNIK3t8rPxZhqIua4O4NsWVh5to59
         wBHp/uzSsNVCMSWp0dGLqBVijsg33jftbwPtRYRnVTan8D1QwG9+CuzOAET8ruWtJEUM
         pJtYqhS1zn5t+F+EuIdal2XnrzJId8V18M9bHgN2M1AESA/NSZNNllLf5WNaOIrQT6ix
         LrYRzjPBIOkWugEt4ChTBqQQG9SI9B9/0VZaCi0aUy/lSBoejdc96WZyCWZpaGKO8/YQ
         2Gf8xKt62tcViBRkHz0PXuyzKXZ4+US5BRfn2fpXYIxJ2vtuPwI8gmYEAI20bvMi5Ps+
         qscA==
X-Gm-Message-State: AFuF++nW4UGUtHz0rgSSZ2g5ZMxY77A5zdqxqs99pd7o2aEhFZEvn1/y
	lbSFJ6uZqwroMuSkIW8qZxprxFUzUv8vzLrramBm6lWo9d1IKlz5enrCaa9/Oloxf2E=
X-Gm-Gg: AR+sD13VJis+0VnrUI3t1m3aeYEUtNHb7k7SJFfK2TZt8awpnC0/+aqA/hgEcfFFRrX
	Z5qUFqpEqXc9hm5vjhP8/3pC3Fkh1QNExZorbxwSQ1AeJOn62aBWW7T+sryJDnEce78ZFswM/mx
	e4+3F9p4Yo3UXJYSpNFqs+vS5oxQrAtE8cwV4LXV7iKPKykH7wxoB8pRcf3pKljqZ8+opxfjoDh
	AF9cCfkdfUrbHvGH3fS8aq4x8O2nTxYKy4DJgqZwrmQZrFPOl+KIYZp6gcWy3ruE3nPh5TTfcRX
	CtOqzIn3QEGqZBjwAe8W1lBDbyXUm0wL7e3B/jDSmUKx3TjJrSkr1X6yQt07WObc/g5PG0X0WOj
	EHjpSUrWGcNRIvElJIkCeUW2Tf+/rtuHSsblCHRQf7gRBrTIvAnCqOHizHobgIM3KSVCO9WtCWq
	UpLaO6NyrJ37WNPH/Uth7ju1CFlicpiTmHy2SrMXno7fGf8arhFAU6qgl9V21RyUeSQ+CUJjmXR
	bDUosSVYnz4K25EwgU4Xi39IBxQf6UWSwDNSIOHAH++Md8ySQ==
X-Received: by 2002:a05:620a:40cb:b0:936:cda7:554d with SMTP id af79cd13be357-93913798773mr1261501085a.14.1787968789658;
        Fri, 28 Aug 2026 18:59:49 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391701305dsm272582285a.4.2026.08.28.18.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 18:59:49 -0700 (PDT)
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
	urezki@gmail.com,
	chenwandun@huawei.com,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH 1/2] mm/mempolicy: use SRCU for the weighted interleave state
Date: Fri, 28 Aug 2026 21:59:42 -0400
Message-ID: <20260829015943.1258774-2-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829015943.1258774-1-gourry@gourry.net>
References: <20260829015943.1258774-1-gourry@gourry.net>
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
Assisted-by: Claude:claude-opus-5
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
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

