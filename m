Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17ABA544D79
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695508; cv=none; b=SHcLHZVLoxGvdittxQxN/F/tfOCEUKmvMJNcgDqE4gnwlNBEZu0kgmvcncTf8stwOcjcoKGNzU4z1x3JEE5bgqucvIPwKF+lgef+/5+o6GUriN01twFs5EU7qKLsjUDrcptVtIPUl3s+p86TjReRtBg2Ha/+9OJoCrcxDoVhpVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695508; c=relaxed/simple;
	bh=FlfAW9NPixvgxPY4j91cxXxxO8EyYWOWeO1atyD9tXc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BS8DIJnCESjas1JaCMzmgVgcqBHZMEoU4MjxwQZzeRk1aYYY5TXn1wwr5706VNNoi7901v4f3OLC5tcLnZdHjdj2NA7Sp/U6bVlCjfFyFCE1vOfhFVQTnXOdEXMJYLP5Bxx8zOrOeis6Ylk+Whuvzx+gnjrn4Hbywz3KDY2m28A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjDBW266; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjDBW266"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc797656e36so1364186a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695496; x=1791300296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RlVRHw9EiwiHf61KjjRotTikYGjwibOZZsii0htXMZY=;
        b=BjDBW266I0+CjmmStUKwaGuIe0wQ+4ENkv9WBGgVUp472f83l9PC/ZzEKhuB+AB/k5
         GY7ePhwVwEGKJgEgwaj3L1axCwryQsIDN7qymbKxO9CPbOQctxwtPWq8wi8GlGH5eKTp
         tzFE8RGZFz+A2gTp2Q9xyBZK0kytvNgVQJXb2AxIQHy67muYStdJvo+9++faDRXvjprf
         SgTZZhiY0MRNQvvFxqfh0hRQtWChkw2bH4fDSjoH8vJ8yxztfw6iGdgdF56T747IUkXy
         sa+JqpSIFbQo1unqgazeDJOrogemMzBo8ygkxnzeYe4Ae8VDT5miMnEUk/oirWRVrI5Z
         zesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695496; x=1791300296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RlVRHw9EiwiHf61KjjRotTikYGjwibOZZsii0htXMZY=;
        b=2efdSMAcqonz7rUeo/3wXO2b05SNNdwqzi1UKWyXJ2cBZATistCD2FwVtcRu2rTfup
         wWMdwv5EPK6a+9Q1+/rgt+fMbudibgjSnEiYCkvV1BO6jvhRVeMkBX5U8BkRioNSek0z
         87QjGOAd5XXrEsjjLj+d5GjJ4YSupEFkm5L6YtE4EtzWU2tCgLUdUIfNRQPz7Mik2PI9
         /FlgYhd0yOEA1l+u79i3nAYDduQ+Pjfd11rYEWsBIpIVD7YDPDWqXCByfn34DIxhXQtQ
         WNFhx0k0jSpXVU4k7TjTpkq8YfHxYpora549Of2aB9bEPfhE7vB5navAjAaUw+tjL+Mj
         tLFw==
X-Forwarded-Encrypted: i=1; AKwUvBw2QdilmwC7P1EMjp/mdgj1foXMw+bOL3693UXLSpzhUjc6k627/Wxb+kY+p4VuRWveRQu55RE9U818Dpc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIv1IqgZ6m9SHTWGslllkPbBh9xlzMwoX7RH3PJJV2qLNkJnLbt
	KpyMb76d4JOC+6t1HNfmhMTNPus8tMJTz1OiQN8nEaIlhw7/BwXRljrz
X-Gm-Gg: AYBFou32HjtTw+lJr7aMaPapcOntrI+eU9fLpo58/NAmHdemfpWLBgqtDw3L2nN0LUM
	imIRm9pprD8HLXoL4maOdpRUPPpnbgbgK8QuHWdW2VyTiGh2IVRexjnv1NUf9CAwRZFKUEQX0bF
	TK7AION6SdC+Jmx55N1RXE2CLzBaNYWzz6QMzqFVABZJoHIkInxqy+oq3dwXToFmIcP4Wrigq4t
	Hfi4ISt2544MlmoObgghnioduJ0MGGj1bJ/zRR4gDMiYF2cySZ8Gh4Qwgpz/cGF8tIF4MGVr5cA
	tzQcj2iuXGD7yW0KQ1k/iOzyKC58XNBypGo05+VeYIHY+Uhsfxz+AOduTVJIIi8iZZkZP95vdr6
	Gy7raaSxeksmlZb+Gz5uhyVUejRsncnZDTjaCMnZYLriFVoWHWu5LYgskL00IAKCUFe6cXYWJ3/
	HVfYG+nCQZVQdTzON5cne68L04VGnBPVrT/T43X9rCkNYCLCqup6rUX0876H4TtneSidShYi5dD
	YbllfBqCmmdbGQTJnPlpUcy60KqAaToLBElULtxTlpG+NraEVxyyj5GHcBgC5KKtIeAyR2/lUqN
	RV6vquO+QYDW8PTSRB4N
X-Received: by 2002:a17:903:2f50:b0:2dd:c0ff:e72a with SMTP id d9443c01a7336-2df7dff64ffmr125793155ad.60.1790695496438;
        Tue, 29 Sep 2026 08:24:56 -0700 (PDT)
Received: from NV-9MNJ414.tailae2068.ts.net (2001-b011-2005-5b75-0412-f652-3152-53f1.dynamic-ip6.hinet.net. [2001:b011:2005:5b75:412:f652:3152:53f1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91476bb4sm59762255ad.83.2026.09.29.08.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:24:55 -0700 (PDT)
From: Yiwei Lin <s921975628@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Yiwei Lin <s921975628@gmail.com>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jon Maloy <jmaloy@redhat.com>,
	netdev@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] rbtree: update augmented data on the way down in rb_add_augmented_cached()
Date: Tue, 29 Sep 2026 23:24:38 +0800
Message-Id: <20260929152439.91443-4-s921975628@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929152439.91443-1-s921975628@gmail.com>
References: <20260929152439.91443-1-s921975628@gmail.com>
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
ancestors, and use it on the descent.  RB_DECLARE_CALLBACKS() derives
it from the RB_AUG() list, so every user of the template gets it for
free, and sched/eevdf, the only caller of the helper, needs no change.

The new node's augmented data must describe the node alone before the
call.  That was already required, since ->propagate() read it, and
sched/eevdf sets it up that way.

Measured with rbtree_test's cached augmented test switched to
rb_add_augmented_cached() (next patch), nnodes cached insert+delete,
median of 5 runs, for reference also the open-coded descent used by
augmented test 1.  Raspberry Pi 4 Model B (Cortex-A72, 1.8 GHz), arch
timer ticks (54 MHz):

    nnodes    open-coded      before       after
       100           459         500         442  (-11.6%)
     10000        182046      186144      180208   (-3.2%)
    100000       5533679     5711647     5579444   (-2.3%)

x86-64 KVM guest (Intel i7-13800H), cycles:

    nnodes    open-coded      before       after
       100          7657        7622        7059   (-7.4%)
     10000       4738075     5075847     4627462   (-8.8%)
    100000      75618429    79840335    71324700  (-10.7%)

The other rbtree_test numbers are unchanged and the augmented invariant
checks still pass on both.

Signed-off-by: Yiwei Lin <s921975628@gmail.com>
Assisted-by: LLM
---
 Documentation/core-api/rbtree.rst | 27 ++++++++++++++++++++++++---
 include/linux/rbtree_augmented.h  | 27 +++++++++++++++++++++++++--
 2 files changed, 49 insertions(+), 5 deletions(-)

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
index eac1d4edb9775..cc52cd91bcecc 100644
--- a/include/linux/rbtree_augmented.h
+++ b/include/linux/rbtree_augmented.h
@@ -30,6 +30,7 @@ struct rb_augment_callbacks {
 	void (*propagate)(struct rb_node *node, struct rb_node *stop);
 	void (*copy)(struct rb_node *old, struct rb_node *new);
 	void (*rotate)(struct rb_node *old, struct rb_node *new);
+	void (*merge)(struct rb_node *node, struct rb_node *new);
 };
 
 extern void __rb_insert_augmented(struct rb_node *node, struct rb_root *root,
@@ -62,6 +63,12 @@ rb_insert_augmented_cached(struct rb_node *node,
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
@@ -73,6 +80,7 @@ rb_add_augmented_cached(struct rb_node *node, struct rb_root_cached *tree,
 
 	while (*link) {
 		parent = *link;
+		augment->merge(parent, node);
 		if (less(node, parent)) {
 			link = &parent->rb_left;
 		} else {
@@ -82,7 +90,6 @@ rb_add_augmented_cached(struct rb_node *node, struct rb_root_cached *tree,
 	}
 
 	rb_link_node(node, parent, link);
-	augment->propagate(parent, NULL); /* suboptimal */
 	rb_insert_augmented_cached(node, tree, leftmost, augment);
 
 	return leftmost ? node : NULL;
@@ -168,6 +175,14 @@ RBNAME ## _compute_ ## n(RBSTRUCT *s, bool exit)			\
 #define RB_COMPUTE(n, RBNAME, RBSTRUCT, RBFIELD, x)			\
 	_RB_COMPUTE(n, RBNAME, RBSTRUCT, RBFIELD, RB_UNPACK x)
 
+/* fold @new, about to become a descendant of @node, into @node */
+#define __RB_MERGE(n, RBNAME, RBSTRUCT, RBFIELD, val, aug, fold)	\
+	node->aug = fold(node->aug, new->aug);
+#define _RB_MERGE(n, RBNAME, RBSTRUCT, RBFIELD, args)			\
+	__RB_MERGE(n, RBNAME, RBSTRUCT, RBFIELD, args)
+#define RB_MERGE(n, RBNAME, RBSTRUCT, RBFIELD, x)			\
+	_RB_MERGE(n, RBNAME, RBSTRUCT, RBFIELD, RB_UNPACK x)
+
 /*
  * Template for declaring augmented rbtree callbacks (generic multi fields)
  *
@@ -217,10 +232,18 @@ RBNAME ## _rotate(struct rb_node *rb_old, struct rb_node *rb_new)	\
 	RBNAME ## __copy(old, new);					\
 	RBNAME ## __compute(old, false);				\
 }									\
+static inline void							\
+RBNAME ## _merge(struct rb_node *rb, struct rb_node *rb_new)		\
+{									\
+	RBSTRUCT *node = rb_entry(rb, RBSTRUCT, RBFIELD);		\
+	RBSTRUCT *new = rb_entry(rb_new, RBSTRUCT, RBFIELD);		\
+	RB_FOR_EACH(RB_MERGE, RBNAME, RBSTRUCT, RBFIELD, RBAUG);	\
+}									\
 RBSTATIC const struct rb_augment_callbacks RBNAME = {			\
 	.propagate = RBNAME ## _propagate,				\
 	.copy = RBNAME ## _copy,					\
-	.rotate = RBNAME ## _rotate					\
+	.rotate = RBNAME ## _rotate,					\
+	.merge = RBNAME ## _merge					\
 };
 
 /*
-- 
2.34.1

