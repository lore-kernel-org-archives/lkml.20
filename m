Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34624BAA0B;
	Thu, 15 Oct 2026 08:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051538; cv=none; b=TYBcWPfJ6SYivPWaEW5KdXsGMZ5Enpl6UI6qJMx92H/+Oan/UInFlM4ZRhAC9YJlG5Tku/ug5uxlYVVkgrjTEolJPmDedGxoeNkdrXZtrCANZltoP0JzbkcyBpGDkMHLFA3QLT31K8PlTnBeRIiPAxsPatqXj8E1XLc2LMkk7gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051538; c=relaxed/simple;
	bh=PuGxKvko7mPLiA5+MUqHfN2aBuXXNnuMf7aBvHsgBYE=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=I8ir429D3kopQ6cbu77631NwEBnOr2Z1zMh0ozdSoRev6CtTnVFsStPWBCGBQ4Xp/f6y/g9gGfhsso/cH05+G8fdzu96WbCWEgBJLo7QyJ5vD8J9N6kJFSo0E8cxwWgU41cEHvP/nFdkieZTZ1QEw7MayfMpzNuaT7l0QxP2hIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=njoh1jpb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hHV9JN7R; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="njoh1jpb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hHV9JN7R"
Date: Thu, 15 Oct 2026 08:05:33 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792051535;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MZ6ZmUCTloxTiMrvg5+j6I3oo456d3ZA4BpAjeautCg=;
	b=njoh1jpb9Xyxf9bV0H50tWsgFPo5bI3Vxg/p0p7pQMxVBN68V3NaWJXjduwpqfXiDYrWw1
	SXCAy/7Do+A6g8NFUbp8P1o8iRhmIwpYmp5eQ9OPSKrwEkBJyf0veqhV05vSekoPYe7Pgx
	o5yYlaeoO+/+r73gKc43vmOZDjAdIyEnG+7nOwEWX6v9G4lNdS0iSjOms/FHJi/Sj4WelE
	nX9H23TPGqA++Pai+uFyaM3rCaNbl8FqJ1tjxSEpCLn893KAsBA1xYpLvstbSzg0kPk44q
	S/XlSgoGem0TXtrnEy0ze9xNWPpXl4XMPC7ZXVlDuFQWTKRn5oNClDr8docIzw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792051535;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MZ6ZmUCTloxTiMrvg5+j6I3oo456d3ZA4BpAjeautCg=;
	b=hHV9JN7R9xZrsGDZb+4YzzFM5uyR3V+WB5uvuqGKIWo32bhlNeQDgiuw9uPqmssE/Z/L+v
	RLCzPxE9U5AhLQAg==
From: "tip-bot2 for Yiwei Lin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] rbtree: Update augmented data on the way down in
 rb_add_augmented_cached()
Cc: Yiwei Lin <s921975628@gmail.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261005093236.62702-4-s921975628@gmail.com>
References: <20261005093236.62702-4-s921975628@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205153329.2666988.8529835595618051362.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     cd047867ee5fc7c47cf9461c8a59c7117de9f680
Gitweb:        https://git.kernel.org/tip/cd047867ee5fc7c47cf9461c8a59c7117de=
9f680
Author:        Yiwei Lin <s921975628@gmail.com>
AuthorDate:    Mon, 05 Oct 2026 17:32:35 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Tue, 13 Oct 2026 13:51:27 +02:00

rbtree: Update augmented data on the way down in rb_add_augmented_cached()

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
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20261005093236.62702-4-s921975628@gmail.com
---
 Documentation/core-api/rbtree.rst | 27 ++++++++++++++++++++++++---
 include/linux/rbtree_augmented.h  | 27 +++++++++++++++++++++++++--
 2 files changed, 49 insertions(+), 5 deletions(-)

diff --git a/Documentation/core-api/rbtree.rst b/Documentation/core-api/rbtre=
e.rst
index cce80e1..210045f 100644
--- a/Documentation/core-api/rbtree.rst
+++ b/Documentation/core-api/rbtree.rst
@@ -257,8 +257,14 @@ When erasing a node, the user must call rb_erase_augment=
ed() instead of
 rb_erase(). rb_erase_augmented() calls back into user provided functions
 to update the augmented information on affected subtrees.
=20
-In both cases, the callbacks are provided through struct rb_augment_callback=
s.
-3 callbacks must be defined:
+Alternatively, rb_add_augmented_cached() performs the whole insertion into
+a cached tree: it walks down to the insertion point, merges the new node's
+augmented information into every node on that path, links the node and
+rebalances.  The new node's augmented information must already describe
+the node alone when it is called.
+
+In all cases, the callbacks are provided through struct rb_augment_callbacks.
+3 callbacks must be defined, plus a fourth one for rb_add_augmented_cached():
=20
 - A propagation callback, which updates the augmented value for a given
   node and its ancestors, up to a given stop point (or NULL to update
@@ -271,6 +277,10 @@ In both cases, the callbacks are provided through struct=
 rb_augment_callbacks.
   subtree to a newly assigned subtree root AND recomputes the augmented
   information for the former subtree root.
=20
+- A merge callback, which folds the augmented value of a node being inserted
+  into the augmented value of one of its future ancestors.  It is only used
+  by rb_add_augmented_cached().
+
 The compiled code for rb_erase_augmented() may inline the propagation and
 copy callbacks, which results in a large function, so each augmented rbtree
 user should have a single rb_erase_augmented() call site in order to limit
@@ -395,8 +405,19 @@ Insertion/removal are defined using the following augmen=
ted callbacks::
 	old->__subtree_last =3D compute_subtree_last(old);
   }
=20
+  static void augment_merge(struct rb_node *rb, struct rb_node *rb_new)
+  {
+	struct interval_tree_node *node =3D
+		rb_entry(rb, struct interval_tree_node, rb);
+	struct interval_tree_node *new =3D
+		rb_entry(rb_new, struct interval_tree_node, rb);
+
+	if (node->__subtree_last < new->__subtree_last)
+		node->__subtree_last =3D new->__subtree_last;
+  }
+
   static const struct rb_augment_callbacks augment_callbacks =3D {
-	augment_propagate, augment_copy, augment_rotate
+	augment_propagate, augment_copy, augment_rotate, augment_merge
   };
=20
   void interval_tree_insert(struct interval_tree_node *node,
diff --git a/include/linux/rbtree_augmented.h b/include/linux/rbtree_augmente=
d.h
index 5a336ac..b9fc1be 100644
--- a/include/linux/rbtree_augmented.h
+++ b/include/linux/rbtree_augmented.h
@@ -30,6 +30,7 @@ struct rb_augment_callbacks {
 	void (*propagate)(struct rb_node *node, struct rb_node *stop);
 	void (*copy)(struct rb_node *old, struct rb_node *new);
 	void (*rotate)(struct rb_node *old, struct rb_node *new);
+	void (*merge)(struct rb_node *node, struct rb_node *new);
 };
=20
 extern void __rb_insert_augmented(struct rb_node *node, struct rb_root *root,
@@ -62,6 +63,12 @@ rb_insert_augmented_cached(struct rb_node *node,
 	rb_insert_augmented(node, &root->rb_root, augment);
 }
=20
+/*
+ * Insert @node into the leftmost cached augmented tree @tree.
+ *
+ * The augmented data of @node must already describe @node alone; it is
+ * merged into every ancestor on the way down through augment->merge().
+ */
 static __always_inline struct rb_node *
 rb_add_augmented_cached(struct rb_node *node, struct rb_root_cached *tree,
 			bool (*less)(struct rb_node *, const struct rb_node *),
@@ -73,6 +80,7 @@ rb_add_augmented_cached(struct rb_node *node, struct rb_roo=
t_cached *tree,
=20
 	while (*link) {
 		parent =3D *link;
+		augment->merge(parent, node);
 		if (less(node, parent)) {
 			link =3D &parent->rb_left;
 		} else {
@@ -82,7 +90,6 @@ rb_add_augmented_cached(struct rb_node *node, struct rb_roo=
t_cached *tree,
 	}
=20
 	rb_link_node(node, parent, link);
-	augment->propagate(parent, NULL); /* suboptimal */
 	rb_insert_augmented_cached(node, tree, leftmost, augment);
=20
 	return leftmost ? node : NULL;
@@ -177,6 +184,14 @@ RBNAME ## _compute_ ## n(RBSTRUCT *s, bool exit)			\
 #define RB_COMPUTE(n, RBNAME, RBSTRUCT, RBFIELD, x)			\
 	_RB_COMPUTE(n, RBNAME, RBSTRUCT, RBFIELD, RB_UNPACK x)
=20
+/* fold @new, about to become a descendant of @node, into @node */
+#define __RB_MERGE(n, RBNAME, RBSTRUCT, RBFIELD, val, aug, fold)	\
+	node->aug =3D fold(node->aug, new->aug);
+#define _RB_MERGE(n, RBNAME, RBSTRUCT, RBFIELD, args)			\
+	__RB_MERGE(n, RBNAME, RBSTRUCT, RBFIELD, args)
+#define RB_MERGE(n, RBNAME, RBSTRUCT, RBFIELD, x)			\
+	_RB_MERGE(n, RBNAME, RBSTRUCT, RBFIELD, RB_UNPACK x)
+
 /*
  * Template for declaring augmented rbtree callbacks (generic multi fields)
  *
@@ -226,10 +241,18 @@ RBNAME ## _rotate(struct rb_node *rb_old, struct rb_nod=
e *rb_new)	\
 	RBNAME ## __copy(old, new);					\
 	RBNAME ## __compute(old, false);				\
 }									\
+static inline void							\
+RBNAME ## _merge(struct rb_node *rb, struct rb_node *rb_new)		\
+{									\
+	RBSTRUCT *node =3D rb_entry(rb, RBSTRUCT, RBFIELD);		\
+	RBSTRUCT *new =3D rb_entry(rb_new, RBSTRUCT, RBFIELD);		\
+	RB_FOR_EACH(RB_MERGE, RBNAME, RBSTRUCT, RBFIELD, RBAUG);	\
+}									\
 RBSTATIC const struct rb_augment_callbacks RBNAME =3D {			\
 	.propagate =3D RBNAME ## _propagate,				\
 	.copy =3D RBNAME ## _copy,					\
-	.rotate =3D RBNAME ## _rotate					\
+	.rotate =3D RBNAME ## _rotate,					\
+	.merge =3D RBNAME ## _merge					\
 };
=20
 /*
