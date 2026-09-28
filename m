Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25A7379C24
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598389; cv=none; b=SwCwZmvZxPgK5l5fUZK47VwjnDt/7n1Nppn5sMwdDBa6r6wO8xFJtmXDDMLnfkz8tBgYovU9GCU4A31IQkpwFhuls/yg7RL0zlo0gEOAmi6IVWt2zqfgVdbSNDvE18UoyXfKIf2GTAajuh7DpRh30k0pQAQh3qtX3ksgt8ROcdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598389; c=relaxed/simple;
	bh=3+PrsNTpFs1F5nRQFQYL/l0Cet/6LVKrGtzjgbLIvI0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BnOPRAUgZ5GIJvDYt/9SLQVSI81YOLxlm9UOfH+E3PcNRAnp6xZPlfvxlqaSgNt9gx8XYhI0D5chj8SMao8vHaP95+3eDg8B2dOWnd9llbDwFlH3w/D72EeRecDOGVK3PLwnxMKSNg/ZG6iWzaj3kMDcAsnFl2BaDVVWXEEBXV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rvNIx4DC; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rvNIx4DC"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24afso1519119a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790598387; x=1791203187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3pbWX09YPtxFjbmlki76d2pb69qD5FXbLyqqCfyJ69k=;
        b=rvNIx4DCg2bfrCpZkuEqQsWlrt/wFsPHnH9KMBniqUJrJrsuDRMPPos8YXrUyCiq1L
         J9WQGj/CnclUP2zTQ3Cnn173YLlgMBnXSIWLMxvItJ2S8ozDddM+n4MG9BSTKFwp+sCL
         AX0uLpWXQE1/OEZIiyA3WF/y8urEgtaa5RlQST/rXDsarWhfxEGi0TZnKNj7sb+4Lm1i
         8kXiov3TjlLmHOkGkb/1B/P2BYDLJ65LX03a4U1FucLOPmit6xeDWA25nlFmQcLWGrgk
         1gLbAkVTlN2RgPTAdNUqVdLfYsBlg/GLd6VpAp3oYW/B9jBR6koZ7kIoK/8eIa08ss+v
         B65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790598387; x=1791203187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3pbWX09YPtxFjbmlki76d2pb69qD5FXbLyqqCfyJ69k=;
        b=a/x4jyfQPSAf4ZmquRLGVaCK836f77HnBe95uNi5qwAPGbPt+Z2z5iMBBJv2SQ1bsD
         B3hnlJYM/H+tFBSFbaxvAgxI9fSRO8vcQPZdN71AKu6yU4IcsraqWEz5iQN/Aekigr+k
         llxQBohZmewgLDZ9hZa/TCgwoYIcNa+0GA/0IpYy9xEt1IJPoIZDBmRBI2APiFhdDqqS
         CASeJQi3Jdifle0kfpLy5FA2zKYrFTegKd3cvb6MrmmJwIzb1LLjgA1FQdX/tdgH/iHu
         tH6y7ESaXoAqBj0gcQsY1n0SB0aAMYD1L1g+lvInwBRP+0h01la1pmgTkEGzvskaiUPs
         IZ7w==
X-Forwarded-Encrypted: i=1; AKwUvBwD4S1XEAfq43ed7vZgsn6RlRGg08OtENWmhWlIe+qTGlGDevr6E6lYGpFMUTPg36QdnGSOI6xawd4ORH0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDmoTZJx3JTX6C+q49AUPe9q6MjpMv1Rn81h1gJbBhmuYJtQU+
	pi5UeeajiGwxYryI8q2mlmw7Fp5bWeyIfH0xrXlh0veK+PjE9GdQzCbA
X-Gm-Gg: AYBFou2jyWImmP44F8Pvenn9n0Lq8PVgwGSkaL3IJDs3upqWkqO/Tk2lqbPfZ5I6ZR4
	q6Zh4lr4suMgpc0gtsBrjHh/X3ZOU1iuFPUbkV6FZqjlGGXXJyR7yUdQur9hGT6GZyyu70VLM+I
	Y1ZjDnAu5gCOspu6ee9LM5qmol29+Z4TTLw5TYxzLro5jCX/qZQN2MeS4fEK6+Yh49Q0U+weQOl
	R62WZiuVNmh0vHwoYYLvitLAker79KGPkQsUn9jzujULtTlqQ2YknB2A30Xt3dpbV8EjZrRweUC
	c32kHJfjC5zxbWCMobeV8RIN/+hYTjrcIA8zW/Z2Y1uwUOu+NLl5ItBnhCiHMIllOsyHb6C31zL
	lYxeyLvvcZaDxSJWXaBEiHzeDFMGazjy+a5bIidOmcOd6OhzngN6Wt+Jl7C7aa9ruahlBmEhj4U
	9hNbD2BHP+lw8fynDdZ5xk2PsHLsRdO5aKYJThyVw7ADUfNVq0yuwR8eP2VECf5L26FWscsL1V2
	RIsYhAghCkYUDR6+80k2jVsxbzicRCXglP/M3LFTqfdI5y6fBKYVJT74oAqd3/8V3O1jCJdbUjV
	9bYYGzlcAh7KftrPICg4
X-Received: by 2002:a17:902:fc45:b0:2df:90d4:1188 with SMTP id d9443c01a7336-2df90d41bd2mr78290785ad.7.1790598386830;
        Mon, 28 Sep 2026 05:26:26 -0700 (PDT)
Received: from NV-9MNJ414.tailae2068.ts.net (2001-b011-2006-1fb9-8409-0195-705e-5b47.dynamic-ip6.hinet.net. [2001:b011:2006:1fb9:8409:195:705e:5b47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90fbc951sm40485615ad.8.2026.09.28.05.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 05:26:26 -0700 (PDT)
From: Yiwei Lin <s921975628@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Yiwei Lin <s921975628@gmail.com>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] rbtree: update augmented data on the way down in rb_add_augmented_cached()
Date: Mon, 28 Sep 2026 20:26:10 +0800
Message-Id: <20260928122611.336351-3-s921975628@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260928122611.336351-1-s921975628@gmail.com>
References: <20260928122611.336351-1-s921975628@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rb_add_augmented_cached() links the new node and then calls
->propagate() from the parent up to the root to bring the augmented
data of the ancestors up to date.  It marks that as "suboptimal": every
augmented user that open-codes its insertion (interval trees, vmalloc,
drm_mm, gpu buddy, ...) instead folds the new node's value into each
ancestor while walking down, which touches no sibling and needs no
second pass.  ->propagate() has to read both children of every
ancestor until it finds one whose value did not change.

Add a ->merge() callback to struct rb_augment_callbacks that folds the
augmented data of a node being inserted into one of its future
ancestors, and use it on the descent.

The new node's augmented data must describe the node alone before the
call. That was already required, since ->propagate() read it, and both
callers set it up that way.

Measured with rbtree_test's cached augmented test switched to
rb_add_augmented_cached() (next patch) on a Raspberry Pi 4 Model B
(Cortex-A72, 1.8 GHz), nnodes cached insert+delete, median of 5 runs,
arch timer ticks (54 MHz), for reference also the open-coded descent
used by augmented test 1. This brings the helper to the level of
the open-coded descent:

    nnodes    open-coded      before       after
       100           468         486         475  (-2.3%)
     10000        182772      188644      185810  (-1.5%)
    100000       5551237     5700029     5518725  (-3.2%)

Signed-off-by: Yiwei Lin <s921975628@gmail.com>
Assisted-by: LLM
---
 Documentation/core-api/rbtree.rst | 27 ++++++++++++++++++---
 include/linux/rbtree_augmented.h  | 40 ++++++++++++++++++++++++++-----
 kernel/sched/fair.c               | 13 +++++++++-
 3 files changed, 70 insertions(+), 10 deletions(-)

diff --git a/Documentation/core-api/rbtree.rst b/Documentation/core-api/rbtree.rst
index cce80e19087b4..210045f128d65 100644
--- a/Documentation/core-api/rbtree.rst
+++ b/Documentation/core-api/rbtree.rst
@@ -257,8 +257,14 @@ When erasing a node, the user must call rb_erase_augmented() instead of
 rb_erase(). rb_erase_augmented() calls back into user provided functions
 to update the augmented information on affected subtrees.
 
-In both cases, the callbacks are provided through struct rb_augment_callbacks.
-3 callbacks must be defined:
+Alternatively, rb_add_augmented_cached() performs the whole insertion into
+a cached tree: it walks down to the insertion point, merges the new node's
+augmented information into every node on that path, links the node and
+rebalances.  The new node's augmented information must already describe
+the node alone when it is called.
+
+In all cases, the callbacks are provided through struct rb_augment_callbacks.
+3 callbacks must be defined, plus a fourth one for rb_add_augmented_cached():
 
 - A propagation callback, which updates the augmented value for a given
   node and its ancestors, up to a given stop point (or NULL to update
@@ -271,6 +277,10 @@ In both cases, the callbacks are provided through struct rb_augment_callbacks.
   subtree to a newly assigned subtree root AND recomputes the augmented
   information for the former subtree root.
 
+- A merge callback, which folds the augmented value of a node being inserted
+  into the augmented value of one of its future ancestors.  It is only used
+  by rb_add_augmented_cached().
+
 The compiled code for rb_erase_augmented() may inline the propagation and
 copy callbacks, which results in a large function, so each augmented rbtree
 user should have a single rb_erase_augmented() call site in order to limit
@@ -395,8 +405,19 @@ Insertion/removal are defined using the following augmented callbacks::
 	old->__subtree_last = compute_subtree_last(old);
   }
 
+  static void augment_merge(struct rb_node *rb, struct rb_node *rb_new)
+  {
+	struct interval_tree_node *node =
+		rb_entry(rb, struct interval_tree_node, rb);
+	struct interval_tree_node *new =
+		rb_entry(rb_new, struct interval_tree_node, rb);
+
+	if (node->__subtree_last < new->__subtree_last)
+		node->__subtree_last = new->__subtree_last;
+  }
+
   static const struct rb_augment_callbacks augment_callbacks = {
-	augment_propagate, augment_copy, augment_rotate
+	augment_propagate, augment_copy, augment_rotate, augment_merge
   };
 
   void interval_tree_insert(struct interval_tree_node *node,
diff --git a/include/linux/rbtree_augmented.h b/include/linux/rbtree_augmented.h
index d2fa1c41bfd2b..6a1b78f6cb1e2 100644
--- a/include/linux/rbtree_augmented.h
+++ b/include/linux/rbtree_augmented.h
@@ -28,6 +28,7 @@ struct rb_augment_callbacks {
 	void (*propagate)(struct rb_node *node, struct rb_node *stop);
 	void (*copy)(struct rb_node *old, struct rb_node *new);
 	void (*rotate)(struct rb_node *old, struct rb_node *new);
+	void (*merge)(struct rb_node *node, struct rb_node *new);
 };
 
 extern void __rb_insert_augmented(struct rb_node *node, struct rb_root *root,
@@ -60,6 +61,12 @@ rb_insert_augmented_cached(struct rb_node *node,
 	rb_insert_augmented(node, &root->rb_root, augment);
 }
 
+/*
+ * Insert @node into the leftmost cached augmented tree @tree.
+ *
+ * The augmented data of @node must already describe @node alone; it is
+ * merged into every ancestor on the way down through augment->merge().
+ */
 static __always_inline struct rb_node *
 rb_add_augmented_cached(struct rb_node *node, struct rb_root_cached *tree,
 			bool (*less)(struct rb_node *, const struct rb_node *),
@@ -71,6 +78,7 @@ rb_add_augmented_cached(struct rb_node *node, struct rb_root_cached *tree,
 
 	while (*link) {
 		parent = *link;
+		augment->merge(parent, node);
 		if (less(node, parent)) {
 			link = &parent->rb_left;
 		} else {
@@ -80,7 +88,6 @@ rb_add_augmented_cached(struct rb_node *node, struct rb_root_cached *tree,
 	}
 
 	rb_link_node(node, parent, link);
-	augment->propagate(parent, NULL); /* suboptimal */
 	rb_insert_augmented_cached(node, tree, leftmost, augment);
 
 	return leftmost ? node : NULL;
@@ -95,10 +102,13 @@ rb_add_augmented_cached(struct rb_node *node, struct rb_root_cached *tree,
  * RBFIELD:     name of struct rb_node field within RBSTRUCT
  * RBCOPY:	name of function that copies the RBAUGMENTED datas
  * RBCOMPUTE:   name of function that recomputes the RBAUGMENTED datas
+ * RBMERGE:     name of function that merges a new node's RBAUGMENTED datas
+ *              into an ancestor's, used on the insertion path
  */
 
 #define RB_DECLARE_CALLBACKS_MULTI(RBSTATIC, RBNAME,			\
-			     RBSTRUCT, RBFIELD, RBCOPY, RBCOMPUTE)	\
+			     RBSTRUCT, RBFIELD, RBCOPY, RBCOMPUTE,	\
+			     RBMERGE)					\
 static inline void							\
 RBNAME ## _propagate(struct rb_node *rb, struct rb_node *stop)		\
 {									\
@@ -124,10 +134,18 @@ RBNAME ## _rotate(struct rb_node *rb_old, struct rb_node *rb_new)	\
 	RBCOPY(new, old);						\
 	RBCOMPUTE(old, false);						\
 }									\
+static inline void							\
+RBNAME ## _merge(struct rb_node *rb, struct rb_node *rb_new)		\
+{									\
+	RBSTRUCT *node = rb_entry(rb, RBSTRUCT, RBFIELD);		\
+	RBSTRUCT *new = rb_entry(rb_new, RBSTRUCT, RBFIELD);		\
+	RBMERGE(node, new);						\
+}									\
 RBSTATIC const struct rb_augment_callbacks RBNAME = {			\
 	.propagate = RBNAME ## _propagate,				\
 	.copy = RBNAME ## _copy,					\
-	.rotate = RBNAME ## _rotate					\
+	.rotate = RBNAME ## _rotate,					\
+	.merge = RBNAME ## _merge					\
 };
 
 /*
@@ -139,17 +157,21 @@ RBSTATIC const struct rb_augment_callbacks RBNAME = {			\
  * RBFIELD:     name of struct rb_node field within RBSTRUCT
  * RBAUGMENTED: name of field within RBSTRUCT holding data for subtree
  * RBCOMPUTE:   name of function that recomputes the RBAUGMENTED data
+ * RBMERGE:     name of function that merges a new node's RBAUGMENTED data
+ *              into an ancestor's, used on the insertion path
  */
 
 #define RB_DECLARE_CALLBACKS(RBSTATIC, RBNAME,				\
-			     RBSTRUCT, RBFIELD, RBAUGMENTED, RBCOMPUTE)	\
+			     RBSTRUCT, RBFIELD, RBAUGMENTED, RBCOMPUTE,	\
+			     RBMERGE)					\
 static inline void							\
 RBNAME ## _copy_single(RBSTRUCT *new, RBSTRUCT *old)			\
 {									\
 	new->RBAUGMENTED = old->RBAUGMENTED;				\
 }									\
 RB_DECLARE_CALLBACKS_MULTI(RBSTATIC, RBNAME,				\
-		     RBSTRUCT, RBFIELD, RBNAME ## _copy_single, RBCOMPUTE)
+		     RBSTRUCT, RBFIELD, RBNAME ## _copy_single,		\
+		     RBCOMPUTE, RBMERGE)
 
 /*
  * Template for declaring augmented rbtree callbacks,
@@ -185,8 +207,14 @@ static inline bool RBNAME ## _compute_max(RBSTRUCT *node, bool exit)	      \
 	node->RBAUGMENTED = max;					      \
 	return false;							      \
 }									      \
+static inline void RBNAME ## _merge_max(RBSTRUCT *node, RBSTRUCT *new)	      \
+{									      \
+	if (node->RBAUGMENTED < new->RBAUGMENTED)			      \
+		node->RBAUGMENTED = new->RBAUGMENTED;			      \
+}									      \
 RB_DECLARE_CALLBACKS(RBSTATIC, RBNAME,					      \
-		     RBSTRUCT, RBFIELD, RBAUGMENTED, RBNAME ## _compute_max)
+		     RBSTRUCT, RBFIELD, RBAUGMENTED, RBNAME ## _compute_max,  \
+		     RBNAME ## _merge_max)
 
 
 #define	RB_RED		0
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7455a83a6a990..60db4624b9897 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1066,9 +1066,20 @@ static inline bool min_vruntime_update(struct sched_entity *se, bool exit)
 	       se->max_slice == old_max_slice;
 }
 
+/*
+ * Fold @new's subtree data into @se, for each @se on @new's insertion path.
+ */
+static inline void
+min_vruntime_merge(struct sched_entity *se, struct sched_entity *new)
+{
+	__min_vruntime_update(se, &new->run_node);
+	__min_slice_update(se, &new->run_node);
+	__max_slice_update(se, &new->run_node);
+}
 
 RB_DECLARE_CALLBACKS_MULTI(static, min_vruntime_cb, struct sched_entity,
-		     run_node, min_vruntime_copy, min_vruntime_update);
+		     run_node, min_vruntime_copy, min_vruntime_update,
+		     min_vruntime_merge);
 
 /*
  * Enqueue an entity into the rb-tree:
-- 
2.34.1

