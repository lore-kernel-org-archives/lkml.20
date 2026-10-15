Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A129C4BF93C;
	Thu, 15 Oct 2026 08:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051540; cv=none; b=Da8GplxT+41mnbOin0x/KHSgBLFX5TvjDEh2eU4M8VL7Mq+PxQt0XeuR9yJn+JYehAlnyoWJH5X67NugwgQhd/jNpri7WvYH+ZynG4WJG9/brZ1lW+abmQcv9m2zsuxCql6umKW8uwF2HAJPJXDIjT/L4j4TFm9Le830394g0mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051540; c=relaxed/simple;
	bh=chp9HjTPPvDLezaZs2qx/T/Kk9db71jYUbU3CTzejGo=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=htoyD/7G71syB9tXXGdmuhd5KVlzaTdux/yvEVekXQDYq0QLg3xamOLzMb2M6VzaPbDs4vquf8UsPpxRid6qHwdkfHFOnBQ0lqXTVcuqKBCf3RzfOEM5F56Lj4BQf+rQgKwjqVvFbE1lLhHCBoSpc58H/aomGPltqiD4J3+EJ+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kQMMWyjT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9z6HHjUQ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kQMMWyjT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9z6HHjUQ"
Date: Thu, 15 Oct 2026 08:05:34 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792051536;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FEDm4RgiD4on636zSoIXE3Lj0HTqXt0kLknbfPMzmGg=;
	b=kQMMWyjTLbCFcn1rN3YeG5iF8X1s16SsZDFyGvkbIE1Vd1WZ+IkcU2+6X/8VbjnNME/fHk
	vxWaUwClbBUuLh16UzGrs8bzYLs1eVsBOuMcYIm5csrIRz3vvGzW19n043GgTrynQbbrEn
	aX09vO8jeAAzjeIsW/BkWYit8/EjmyW/achx15MzVhXXuuxPSllS09lNWolM3SLz+nBKHe
	zs7rocqFhOZq1N/3b84oXfM9Okud6VIUUkIifVqZeqpTtj7PzqHvMArKporE0OJWYndzwo
	oiFY/pJeQLu/JWVS2BphQAD0OJekXX41z2XMCmScSTkfV9KwvUBZPiGhxGxnJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792051536;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FEDm4RgiD4on636zSoIXE3Lj0HTqXt0kLknbfPMzmGg=;
	b=9z6HHjUQmaOV1E62EMJ05Cpe7XFZUAOcB5I1fSuRcoGCSrBV+HKsuEUI/itxr2oAgba/XR
	2aIxkloXoXSfbRBA==
From: "tip-bot2 for Peter Zijlstra (Intel)" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/core] rbtree: Declare augmented callbacks per field with RB_AUG()
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Yiwei Lin <s921975628@gmail.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261005093236.62702-3-s921975628@gmail.com>
References: <20261005093236.62702-3-s921975628@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205153497.2666988.15880770949613368283.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     c2c620f4345c50006af90c37fd104fed8e9dea14
Gitweb:        https://git.kernel.org/tip/c2c620f4345c50006af90c37fd104fed8e9=
dea14
Author:        Peter Zijlstra (Intel) <peterz@infradead.org>
AuthorDate:    Mon, 05 Oct 2026 17:32:34 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Tue, 13 Oct 2026 13:51:27 +02:00

rbtree: Declare augmented callbacks per field with RB_AUG()

RB_DECLARE_CALLBACKS_MULTI() asks its user for a function that copies
the augmented fields and one that recomputes them from the children,
with the early-exit protocol of ->propagate() hand-coded in the latter.
sched/eevdf, its only user, needs five helpers for three fields.

Describe each augmented field instead: RB_AUG(val, aug, fold) names the
per-node value, the member holding the subtree aggregate and how two
aggregates combine (min, max, a sum, ...).  RB_AUG_FUNC() takes a
function for the per-node value.  The template then generates, per
field, a recompute that works on a local and stores once, and a copy,
and combines them into the callbacks; the early exit is the AND of the
per-field results.

RB_DECLARE_CALLBACKS() is the only template left.
RB_DECLARE_CALLBACKS_MAX() becomes RB_AUG_FUNC(RBVALUE, RBAUGMENTED,
max) in a wrapper, with its RBCOMPUTE argument renamed to RBVALUE,
since it returns the per-node scalar and is a different thing from the
RBCOMPUTE of the generic template it used to build on.
RB_DECLARE_CALLBACKS_MULTI() goes away.

sched/eevdf shrinks to a wrapping-safe min() for min_vruntime and
three RB_AUG() lines.

No functional change intended.

[yiwei: take a fold(a, b) instead of a "replace?" compare so that sums
 and counts can be expressed too, which also lets min()/max() replace
 RB_MIN()/RB_MAX(); wrapped the lines over 100 columns]
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Yiwei Lin <s921975628@gmail.com>
Assisted-by: LLM
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://lore.kernel.org/r/20260928213736.GA2947991@noisy.programming.ki=
cks-ass.net
Link: https://patch.msgid.link/20261005093236.62702-3-s921975628@gmail.com
---
 include/linux/rbtree_augmented.h | 174 ++++++++++++++++++++----------
 kernel/sched/fair.c              |  70 +-----------
 2 files changed, 126 insertions(+), 118 deletions(-)

diff --git a/include/linux/rbtree_augmented.h b/include/linux/rbtree_augmente=
d.h
index d2fa1c4..5a336ac 100644
--- a/include/linux/rbtree_augmented.h
+++ b/include/linux/rbtree_augmented.h
@@ -15,6 +15,8 @@
 #include <linux/compiler.h>
 #include <linux/rbtree.h>
 #include <linux/rcupdate.h>
+#include <linux/args.h>
+#include <linux/minmax.h>
=20
 /*
  * Please note - only struct rb_augment_callbacks and the prototypes for
@@ -86,6 +88,95 @@ rb_add_augmented_cached(struct rb_node *node, struct rb_ro=
ot_cached *tree,
 	return leftmost ? node : NULL;
 }
=20
+#define RB_FOR_EACH_1(what, RBNAME, RBSTRUCT, RBFIELD, x)		\
+	what(1, RBNAME, RBSTRUCT, RBFIELD, x)
+
+#define RB_FOR_EACH_2(what, RBNAME, RBSTRUCT, RBFIELD, x, ...)		\
+	what(2, RBNAME, RBSTRUCT, RBFIELD, x)				\
+	RB_FOR_EACH_1(what, RBNAME, RBSTRUCT, RBFIELD, __VA_ARGS__)
+
+#define RB_FOR_EACH_3(what, RBNAME, RBSTRUCT, RBFIELD, x, ...)		\
+	what(3, RBNAME, RBSTRUCT, RBFIELD, x)				\
+	RB_FOR_EACH_2(what, RBNAME, RBSTRUCT, RBFIELD, __VA_ARGS__)
+
+#define RB_FOR_EACH_4(what, RBNAME, RBSTRUCT, RBFIELD, x, ...)		\
+	what(4, RBNAME, RBSTRUCT, RBFIELD, x)				\
+	RB_FOR_EACH_3(what, RBNAME, RBSTRUCT, RBFIELD, __VA_ARGS__)
+
+#define RB_FOR_EACH_5(what, RBNAME, RBSTRUCT, RBFIELD, x, ...)		\
+	what(5, RBNAME, RBSTRUCT, RBFIELD, x)				\
+	RB_FOR_EACH_4(what, RBNAME, RBSTRUCT, RBFIELD, __VA_ARGS__)
+
+#define RB_FOR_EACH_6(what, RBNAME, RBSTRUCT, RBFIELD, x, ...)		\
+	what(6, RBNAME, RBSTRUCT, RBFIELD, x)				\
+	RB_FOR_EACH_5(what, RBNAME, RBSTRUCT, RBFIELD, __VA_ARGS__)
+
+#define RB_FOR_EACH_7(what, RBNAME, RBSTRUCT, RBFIELD, x, ...)		\
+	what(7, RBNAME, RBSTRUCT, RBFIELD, x)				\
+	RB_FOR_EACH_6(what, RBNAME, RBSTRUCT, RBFIELD, __VA_ARGS__)
+
+#define RB_FOR_EACH_8(what, RBNAME, RBSTRUCT, RBFIELD, x, ...)		\
+	what(8, RBNAME, RBSTRUCT, RBFIELD, x)				\
+	RB_FOR_EACH_7(what, RBNAME, RBSTRUCT, RBFIELD, __VA_ARGS__)
+
+#define RB_FOR_EACH(action, RBNAME, RBSTRUCT, RBFIELD, ...)		\
+	CONCATENATE(RB_FOR_EACH_, COUNT_ARGS(__VA_ARGS__))		\
+		(action, RBNAME, RBSTRUCT, RBFIELD, __VA_ARGS__)
+
+/*
+ * One augmented field: @val is the node's own contribution (a member for
+ * RB_AUG(), a function of the node for RB_AUG_FUNC()), @aug the member
+ * holding the aggregate over the subtree, and @fold(a, b) combines two
+ * aggregates: min, max, a sum, ...  It must be commutative and associative.
+ */
+#define RB_AUG_FUNC(val, aug, fold) (val(s), aug, fold)
+#define RB_AUG(val, aug, fold) (s->val, aug, fold)
+#define RB_UNPACK(...) __VA_ARGS__
+
+#define __RB_INST(n, RBNAME, RBSTRUCT, RBFIELD, val, aug, fold)		\
+static inline void							\
+RBNAME ## _copy_ ## n(RBSTRUCT *old, RBSTRUCT *new)			\
+{									\
+	new->aug =3D old->aug;						\
+}									\
+static inline bool							\
+RBNAME ## _compute_ ## n(RBSTRUCT *s, bool exit)			\
+{									\
+	TYPEOF_UNQUAL(s->aug) _old_aug =3D s->aug;			\
+	TYPEOF_UNQUAL(s->aug) _val =3D val;				\
+	struct rb_node *_node =3D &s->RBFIELD;				\
+	if (_node->rb_right) {						\
+		RBSTRUCT *_c =3D container_of(_node->rb_right, typeof(*s), RBFIELD); \
+		_val =3D fold(_val, _c->aug);				\
+	}								\
+	if (_node->rb_left) {						\
+		RBSTRUCT *_c =3D container_of(_node->rb_left, typeof(*s), RBFIELD); \
+		_val =3D fold(_val, _c->aug);				\
+	}								\
+	if (exit && _old_aug =3D=3D _val)					\
+		return true;						\
+	s->aug =3D _val;							\
+	return false;							\
+}
+#define _RB_INST(n, RBNAME, RBSTRUCT, RBFIELD, args)			\
+	__RB_INST(n, RBNAME, RBSTRUCT, RBFIELD, args)
+#define RB_INST(n, RBNAME, RBSTRUCT, RBFIELD, x)			\
+	_RB_INST(n, RBNAME, RBSTRUCT, RBFIELD, RB_UNPACK x)
+
+#define __RB_COPY(n, RBNAME, RBSTRUCT, RBFIELD, val, aug, fold)		\
+	RBNAME ## _copy_ ## n(old, new);
+#define _RB_COPY(n, RBNAME, RBSTRUCT, RBFIELD, args)			\
+	__RB_COPY(n, RBNAME, RBSTRUCT, RBFIELD, args)
+#define RB_COPY(n, RBNAME, RBSTRUCT, RBFIELD, x)			\
+	_RB_COPY(n, RBNAME, RBSTRUCT, RBFIELD, RB_UNPACK x)
+
+#define __RB_COMPUTE(n, RBNAME, RBSTRUCT, RBFIELD, val, aug, fold)	\
+	ret &=3D RBNAME ## _compute_ ## n(node, exit);
+#define _RB_COMPUTE(n, RBNAME, RBSTRUCT, RBFIELD, args)			\
+	__RB_COMPUTE(n, RBNAME, RBSTRUCT, RBFIELD, args)
+#define RB_COMPUTE(n, RBNAME, RBSTRUCT, RBFIELD, x)			\
+	_RB_COMPUTE(n, RBNAME, RBSTRUCT, RBFIELD, RB_UNPACK x)
+
 /*
  * Template for declaring augmented rbtree callbacks (generic multi fields)
  *
@@ -93,18 +184,29 @@ rb_add_augmented_cached(struct rb_node *node, struct rb_=
root_cached *tree,
  * RBNAME:      name of the rb_augment_callbacks structure
  * RBSTRUCT:    struct type of the tree nodes
  * RBFIELD:     name of struct rb_node field within RBSTRUCT
- * RBCOPY:	name of function that copies the RBAUGMENTED datas
- * RBCOMPUTE:   name of function that recomputes the RBAUGMENTED datas
+ * RBAUG...:	list of RB_AUG() describing the augmented data
  */
-
-#define RB_DECLARE_CALLBACKS_MULTI(RBSTATIC, RBNAME,			\
-			     RBSTRUCT, RBFIELD, RBCOPY, RBCOMPUTE)	\
+#define RB_DECLARE_CALLBACKS(RBSTATIC, RBNAME,				\
+			     RBSTRUCT, RBFIELD, RBAUG...)		\
+RB_FOR_EACH(RB_INST, RBNAME, RBSTRUCT, RBFIELD, RBAUG)			\
+static inline void							\
+RBNAME ## __copy(RBSTRUCT *old, RBSTRUCT *new)				\
+{									\
+	RB_FOR_EACH(RB_COPY, RBNAME, RBSTRUCT, RBFIELD, RBAUG);		\
+}									\
+static inline bool							\
+RBNAME ## __compute(RBSTRUCT *node, bool exit)				\
+{									\
+	bool ret =3D true;						\
+	RB_FOR_EACH(RB_COMPUTE, RBNAME, RBSTRUCT, RBFIELD, RBAUG);	\
+	return ret;							\
+}									\
 static inline void							\
 RBNAME ## _propagate(struct rb_node *rb, struct rb_node *stop)		\
 {									\
 	while (rb !=3D stop) {						\
 		RBSTRUCT *node =3D rb_entry(rb, RBSTRUCT, RBFIELD);	\
-		if (RBCOMPUTE(node, true))				\
+		if (RBNAME ## __compute(node, true))			\
 			break;						\
 		rb =3D rb_parent(&node->RBFIELD);				\
 	}								\
@@ -114,15 +216,15 @@ RBNAME ## _copy(struct rb_node *rb_old, struct rb_node =
*rb_new)		\
 {									\
 	RBSTRUCT *old =3D rb_entry(rb_old, RBSTRUCT, RBFIELD);		\
 	RBSTRUCT *new =3D rb_entry(rb_new, RBSTRUCT, RBFIELD);		\
-	RBCOPY(new, old);						\
+	RBNAME ## __copy(old, new);					\
 }									\
 static void								\
 RBNAME ## _rotate(struct rb_node *rb_old, struct rb_node *rb_new)	\
 {									\
 	RBSTRUCT *old =3D rb_entry(rb_old, RBSTRUCT, RBFIELD);		\
 	RBSTRUCT *new =3D rb_entry(rb_new, RBSTRUCT, RBFIELD);		\
-	RBCOPY(new, old);						\
-	RBCOMPUTE(old, false);						\
+	RBNAME ## __copy(old, new);					\
+	RBNAME ## __compute(old, false);				\
 }									\
 RBSTATIC const struct rb_augment_callbacks RBNAME =3D {			\
 	.propagate =3D RBNAME ## _propagate,				\
@@ -131,27 +233,6 @@ RBSTATIC const struct rb_augment_callbacks RBNAME =3D {	=
		\
 };
=20
 /*
- * Template for declaring augmented rbtree callbacks (generic single field)
- *
- * RBSTATIC:    'static' or empty
- * RBNAME:      name of the rb_augment_callbacks structure
- * RBSTRUCT:    struct type of the tree nodes
- * RBFIELD:     name of struct rb_node field within RBSTRUCT
- * RBAUGMENTED: name of field within RBSTRUCT holding data for subtree
- * RBCOMPUTE:   name of function that recomputes the RBAUGMENTED data
- */
-
-#define RB_DECLARE_CALLBACKS(RBSTATIC, RBNAME,				\
-			     RBSTRUCT, RBFIELD, RBAUGMENTED, RBCOMPUTE)	\
-static inline void							\
-RBNAME ## _copy_single(RBSTRUCT *new, RBSTRUCT *old)			\
-{									\
-	new->RBAUGMENTED =3D old->RBAUGMENTED;				\
-}									\
-RB_DECLARE_CALLBACKS_MULTI(RBSTATIC, RBNAME,				\
-		     RBSTRUCT, RBFIELD, RBNAME ## _copy_single, RBCOMPUTE)
-
-/*
  * Template for declaring augmented rbtree callbacks,
  * computing RBAUGMENTED scalar as max(RBCOMPUTE(node)) for all subtree node=
s.
  *
@@ -159,34 +240,15 @@ RB_DECLARE_CALLBACKS_MULTI(RBSTATIC, RBNAME,				\
  * RBNAME:      name of the rb_augment_callbacks structure
  * RBSTRUCT:    struct type of the tree nodes
  * RBFIELD:     name of struct rb_node field within RBSTRUCT
- * RBTYPE:      type of the RBAUGMENTED field
- * RBAUGMENTED: name of RBTYPE field within RBSTRUCT holding data for subtree
- * RBCOMPUTE:   name of function that returns the per-node RBTYPE scalar
+ * RBTYPE:      type of the RBAUGMENTED field -- unused, assumed typeof(RBAU=
GMENTED)
+ * RBAUGMENTED: name of field within RBSTRUCT holding data for subtree
+ * RBVALUE:     name of function that returns the per-node RBTYPE scalar
  */
=20
-#define RB_DECLARE_CALLBACKS_MAX(RBSTATIC, RBNAME, RBSTRUCT, RBFIELD,	      \
-				 RBTYPE, RBAUGMENTED, RBCOMPUTE)	      \
-static inline bool RBNAME ## _compute_max(RBSTRUCT *node, bool exit)	      \
-{									      \
-	RBSTRUCT *child;						      \
-	RBTYPE max =3D RBCOMPUTE(node);					      \
-	if (node->RBFIELD.rb_left) {					      \
-		child =3D rb_entry(node->RBFIELD.rb_left, RBSTRUCT, RBFIELD);   \
-		if (child->RBAUGMENTED > max)				      \
-			max =3D child->RBAUGMENTED;			      \
-	}								      \
-	if (node->RBFIELD.rb_right) {					      \
-		child =3D rb_entry(node->RBFIELD.rb_right, RBSTRUCT, RBFIELD);  \
-		if (child->RBAUGMENTED > max)				      \
-			max =3D child->RBAUGMENTED;			      \
-	}								      \
-	if (exit && node->RBAUGMENTED =3D=3D max)				      \
-		return true;						      \
-	node->RBAUGMENTED =3D max;					      \
-	return false;							      \
-}									      \
-RB_DECLARE_CALLBACKS(RBSTATIC, RBNAME,					      \
-		     RBSTRUCT, RBFIELD, RBAUGMENTED, RBNAME ## _compute_max)
+#define RB_DECLARE_CALLBACKS_MAX(RBSTATIC, RBNAME, RBSTRUCT, RBFIELD,		\
+				 RBTYPE, RBAUGMENTED, RBVALUE)			\
+RB_DECLARE_CALLBACKS(RBSTATIC, RBNAME, RBSTRUCT, RBFIELD,			\
+		     RB_AUG_FUNC(RBVALUE, RBAUGMENTED, max))
=20
=20
 #define	RB_RED		0
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 5c98d8d..a58d513 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -999,71 +999,17 @@ static inline bool __entity_less(struct rb_node *a, con=
st struct rb_node *b)
 	return entity_before(__node_2_se(a), __node_2_se(b));
 }
=20
-static inline void __min_vruntime_update(struct sched_entity *se, struct rb_=
node *node)
+/* min() for wrapping vruntimes */
+static inline u64 __min_vruntime(u64 a, u64 b)
 {
-	if (node) {
-		struct sched_entity *rse =3D __node_2_se(node);
-
-		if (vruntime_cmp(se->min_vruntime, ">", rse->min_vruntime))
-			se->min_vruntime =3D rse->min_vruntime;
-	}
-}
-
-static inline void __min_slice_update(struct sched_entity *se, struct rb_nod=
e *node)
-{
-	if (node) {
-		struct sched_entity *rse =3D __node_2_se(node);
-		if (rse->min_slice < se->min_slice)
-			se->min_slice =3D rse->min_slice;
-	}
-}
-
-static inline void __max_slice_update(struct sched_entity *se, struct rb_nod=
e *node)
-{
-	if (node) {
-		struct sched_entity *rse =3D __node_2_se(node);
-		if (rse->max_slice > se->max_slice)
-			se->max_slice =3D rse->max_slice;
-	}
-}
-
-static inline void min_vruntime_copy(struct sched_entity *new, struct sched_=
entity *old)
-{
-	new->min_vruntime =3D old->min_vruntime;
-	new->min_slice =3D old->min_slice;
-	new->max_slice =3D old->max_slice;
+	return vruntime_cmp(a, "<", b) ? a : b;
 }
=20
-/*
- * se->min_vruntime =3D min(se->vruntime, {left,right}->min_vruntime)
- */
-static inline bool min_vruntime_update(struct sched_entity *se, bool exit)
-{
-	u64 old_min_vruntime =3D se->min_vruntime;
-	u64 old_min_slice =3D se->min_slice;
-	u64 old_max_slice =3D se->max_slice;
-	struct rb_node *node =3D &se->run_node;
-
-	se->min_vruntime =3D se->vruntime;
-	__min_vruntime_update(se, node->rb_right);
-	__min_vruntime_update(se, node->rb_left);
-
-	se->min_slice =3D se->slice;
-	__min_slice_update(se, node->rb_right);
-	__min_slice_update(se, node->rb_left);
-
-	se->max_slice =3D se->slice;
-	__max_slice_update(se, node->rb_right);
-	__max_slice_update(se, node->rb_left);
-
-	return se->min_vruntime =3D=3D old_min_vruntime &&
-	       se->min_slice =3D=3D old_min_slice &&
-	       se->max_slice =3D=3D old_max_slice;
-}
-
-
-RB_DECLARE_CALLBACKS_MULTI(static, min_vruntime_cb, struct sched_entity,
-		     run_node, min_vruntime_copy, min_vruntime_update);
+RB_DECLARE_CALLBACKS(static, min_vruntime_cb,
+		     struct sched_entity, run_node,
+		     RB_AUG(vruntime, min_vruntime, __min_vruntime),
+		     RB_AUG(slice, min_slice, min),
+		     RB_AUG(slice, max_slice, max));
=20
 /*
  * Enqueue an entity into the rb-tree:
