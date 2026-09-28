Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0304646983F;
	Mon, 28 Sep 2026 21:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790631464; cv=none; b=a+pEqSyjuoaXUgSqkOAvcSmMa0/GZhnmcOzMpemIw1MK4yJjlidGeSCIaZ9mWGll/xLFvHLXq5eUZiVJQ+CMfIdk168V7bxA68Zyl7yvqGMkJBn1iDvyxfRPOyJtHX4zyTzTKx1c0jdAwSAfukiIvXFdV3gcRU6rpK4fqrPYSK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790631464; c=relaxed/simple;
	bh=RSVjfugggLIGr2FGcMqBmKkoraQmnKwQRgkDJ9oPMlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HrUm3hxgFAnGxEs8n8XvEWQuqpPasyPb8bcXv/uikZEFhjcEzjAu59kNYdOVUkzElAlkoNHEA37XB0Yr+ICpH2BK3OKCMH1XnW6sTo+Ji/RySeTve9DB1StbmapIX9cID49cVG5HCWyye9oBhzUV2d6QzlHtYUaboZ+6xO3VNx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jhVLRPVl; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jhVLRPVl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vrzYt8jxcbX7/Huq2ReMlGAvqbQI+DVtSy3AHPTaBQ8=; b=jhVLRPVllI5P/dhCnzsA9aCMEC
	e3FV/+UwmN/wUpcuh5gsQkbG0r/GMx5uE81jZkkIkteX/MtloU1P8oBolGmsTXhph9Liw8IZkx2In
	6UagvWuoANnP0vnh+sqDgRu5Zxd3zGtAUqR8Y5xV8MQg+zxPoxbFuNlJJSpVcAo3rgUvilO330M6g
	RhcbmhwjKw/41pSSJbVIFXjt1vHE0maY7VW991H7U2CDQHFIMkcK5NrVvUC60tvyJvgECGgPVAji3
	Vaj6OVbW2RZURNxTrfb0+6Z0TPAM0dob3GJ4Q2mqFHwoPh80bwKj3laMtoCURmH8Vh0KfH4unMafG
	/4Lx1OxQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJ2X-00000008z3H-16ux;
	Mon, 28 Sep 2026 21:37:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 44ACF300754; Mon, 28 Sep 2026 23:37:36 +0200 (CEST)
Date: Mon, 28 Sep 2026 23:37:36 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Yiwei Lin <s921975628@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] rbtree: update augmented data on the way down in
 rb_add_augmented_cached()
Message-ID: <20260928213736.GA2947991@noisy.programming.kicks-ass.net>
References: <20260928122611.336351-1-s921975628@gmail.com>
 <20260928122611.336351-3-s921975628@gmail.com>
 <20260928133733.GP2009045@noisy.programming.kicks-ass.net>
 <20260928140513.GF4121620@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928140513.GF4121620@noisy.programming.kicks-ass.net>

On Mon, Sep 28, 2026 at 04:05:13PM +0200, Peter Zijlstra wrote:

> > And that is *very* close to being generalizable, obviating the need for
> > RBCOMPUTE. Does your LLM see a way to make that happen?
> 
> Perhaps by doing something like so?

This builds and boot, so it must be perfect, right ;-)

Assisted-by: Brain
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/rbtree_augmented.h | 153 +++++++++++++++++++++++++--------------
 kernel/sched/fair.c              |  69 ++----------------
 net/tipc/name_table.c            |   7 +-
 3 files changed, 108 insertions(+), 121 deletions(-)

diff --git a/include/linux/rbtree_augmented.h b/include/linux/rbtree_augmented.h
index d2fa1c41bfd2..9c1707aa83b2 100644
--- a/include/linux/rbtree_augmented.h
+++ b/include/linux/rbtree_augmented.h
@@ -15,6 +15,7 @@
 #include <linux/compiler.h>
 #include <linux/rbtree.h>
 #include <linux/rcupdate.h>
+#include <linux/args.h>
 
 /*
  * Please note - only struct rb_augment_callbacks and the prototypes for
@@ -86,6 +87,74 @@ rb_add_augmented_cached(struct rb_node *node, struct rb_root_cached *tree,
 	return leftmost ? node : NULL;
 }
 
+#define RB_FOR_EACH_1(what, RBNAME, RBSTRUCT, RBFIELD, x)	\
+	what(1, RBNAME, RBSTRUCT, RBFIELD, x)
+#define RB_FOR_EACH_2(what, RBNAME, RBSTRUCT, RBFIELD, x, ...)	\
+	what(2, RBNAME, RBSTRUCT, RBFIELD, x) RB_FOR_EACH_1(what, RBNAME, RBSTRUCT, RBFIELD, __VA_ARGS__)
+#define RB_FOR_EACH_3(what, RBNAME, RBSTRUCT, RBFIELD, x, ...)	\
+	what(3, RBNAME, RBSTRUCT, RBFIELD, x) RB_FOR_EACH_2(what, RBNAME, RBSTRUCT, RBFIELD, __VA_ARGS__)
+#define RB_FOR_EACH_4(what, RBNAME, RBSTRUCT, RBFIELD, x, ...)	\
+	what(4, RBNAME, RBSTRUCT, RBFIELD, x) RB_FOR_EACH_3(what, RBNAME, RBSTRUCT, RBFIELD, __VA_ARGS__)
+#define RB_FOR_EACH_5(what, RBNAME, RBSTRUCT, RBFIELD, x, ...)	\
+	what(5, RBNAME, RBSTRUCT, RBFIELD, x) RB_FOR_EACH_4(what, RBNAME, RBSTRUCT, RBFIELD, __VA_ARGS__)
+#define RB_FOR_EACH_6(what, RBNAME, RBSTRUCT, RBFIELD, x, ...)	\
+	what(6, RBNAME, RBSTRUCT, RBFIELD, x) RB_FOR_EACH_5(what, RBNAME, RBSTRUCT, RBFIELD, __VA_ARGS__)
+#define RB_FOR_EACH_7(what, RBNAME, RBSTRUCT, RBFIELD, x, ...)	\
+	what(7, RBNAME, RBSTRUCT, RBFIELD, x) RB_FOR_EACH_6(what, RBNAME, RBSTRUCT, RBFIELD, __VA_ARGS__)
+#define RB_FOR_EACH_8(what, RBNAME, RBSTRUCT, RBFIELD, x, ...)	\
+	what(8, RBNAME, RBSTRUCT, RBFIELD, x) RB_FOR_EACH_7(what, RBNAME, RBSTRUCT, RBFIELD, __VA_ARGS__)
+
+#define RB_FOR_EACH(action, RBNAME, RBSTRUCT, RBFIELD, ...)	\
+	CONCATENATE(RB_FOR_EACH_, COUNT_ARGS(__VA_ARGS__))(action, RBNAME, RBSTRUCT, RBFIELD, __VA_ARGS__)
+
+#define RB_AUG_FUNC(val, aug, cmp) (val(s), aug, cmp)
+#define RB_AUG(val, aug, cmp) (s->val, aug, cmp)
+#define RB_UNPACK(...) __VA_ARGS__
+
+#define __RB_INST(n, RBNAME, RBSTRUCT, RBFIELD, val, aug, cmp)		\
+static inline void							\
+RBNAME ## _copy_ ## n(RBSTRUCT *old, RBSTRUCT *new)			\
+{									\
+	new->aug = old->aug;						\
+}									\
+static inline bool							\
+RBNAME ## _compute_ ## n(RBSTRUCT *s, bool exit)			\
+{									\
+	TYPEOF_UNQUAL(s->aug) _old_aug = s->aug;			\
+	TYPEOF_UNQUAL(s->aug) _val = val;				\
+	struct rb_node *_node = &s->RBFIELD;				\
+	if (_node->rb_right) {						\
+		RBSTRUCT *_c = container_of(_node->rb_right, typeof(*s), RBFIELD); \
+		if (cmp(_c->aug, _val))				\
+			_val = _c->aug;					\
+	}								\
+	if (_node->rb_left) {						\
+		RBSTRUCT *_c = container_of(_node->rb_left, typeof(*s), RBFIELD); \
+		if (cmp(_c->aug, _val))				\
+			_val = _c->aug;					\
+	}								\
+	s->aug = _val;							\
+	return _old_aug == _val;					\
+}
+#define _RB_INST(n, RBNAME, RBSTRUCT, RBFIELD, args)			\
+	__RB_INST(n, RBNAME, RBSTRUCT, RBFIELD, args)
+#define RB_INST(n, RBNAME, RBSTRUCT, RBFIELD, x)			\
+	_RB_INST(n, RBNAME, RBSTRUCT, RBFIELD, RB_UNPACK x)
+
+#define __RB_COPY(n, RBNAME, RBSTRUCT, RBFIELD, val, aug, cmp)		\
+	RBNAME ## _copy_ ## n(old, new);
+#define _RB_COPY(n, RBNAME, RBSTRUCT, RBFIELD, args)			\
+	__RB_COPY(n, RBNAME, RBSTRUCT, RBFIELD, args)
+#define RB_COPY(n, RBNAME, RBSTRUCT, RBFIELD, x)			\
+	_RB_COPY(n, RBNAME, RBSTRUCT, RBFIELD, RB_UNPACK x)
+
+#define __RB_COMPUTE(n, RBNAME, RBSTRUCT, RBFIELD, val, aug, cmp)	\
+	ret &= RBNAME ## _compute_ ## n(node, exit);
+#define _RB_COMPUTE(n, RBNAME, RBSTRUCT, RBFIELD, args)			\
+	__RB_COMPUTE(n, RBNAME, RBSTRUCT, RBFIELD, args)
+#define RB_COMPUTE(n, RBNAME, RBSTRUCT, RBFIELD, x)			\
+	_RB_COMPUTE(n, RBNAME, RBSTRUCT, RBFIELD, RB_UNPACK x)
+
 /*
  * Template for declaring augmented rbtree callbacks (generic multi fields)
  *
@@ -93,18 +162,29 @@ rb_add_augmented_cached(struct rb_node *node, struct rb_root_cached *tree,
  * RBNAME:      name of the rb_augment_callbacks structure
  * RBSTRUCT:    struct type of the tree nodes
  * RBFIELD:     name of struct rb_node field within RBSTRUCT
- * RBCOPY:	name of function that copies the RBAUGMENTED datas
- * RBCOMPUTE:   name of function that recomputes the RBAUGMENTED datas
+ * RBAUG...:	list of RB_AUG() describing the aughmented data
  */
-
-#define RB_DECLARE_CALLBACKS_MULTI(RBSTATIC, RBNAME,			\
-			     RBSTRUCT, RBFIELD, RBCOPY, RBCOMPUTE)	\
+#define RB_DECLARE_CALLBACKS(RBSTATIC, RBNAME,				\
+			     RBSTRUCT, RBFIELD, RBAUG...)		\
+RB_FOR_EACH(RB_INST, RBNAME, RBSTRUCT, RBFIELD, RBAUG);			\
+static inline void							\
+RBNAME ## __copy(RBSTRUCT *old, RBSTRUCT *new)				\
+{									\
+	RB_FOR_EACH(RB_COPY, RBNAME, RBSTRUCT, RBFIELD, RBAUG);		\
+}									\
+static inline bool							\
+RBNAME ## __compute(RBSTRUCT *node, bool exit)				\
+{									\
+	bool ret = true;						\
+	RB_FOR_EACH(RB_COMPUTE, RBNAME, RBSTRUCT, RBFIELD, RBAUG);	\
+	return ret;							\
+}									\
 static inline void							\
 RBNAME ## _propagate(struct rb_node *rb, struct rb_node *stop)		\
 {									\
 	while (rb != stop) {						\
 		RBSTRUCT *node = rb_entry(rb, RBSTRUCT, RBFIELD);	\
-		if (RBCOMPUTE(node, true))				\
+		if (RBNAME ## __compute(node, true))			\
 			break;						\
 		rb = rb_parent(&node->RBFIELD);				\
 	}								\
@@ -114,15 +194,15 @@ RBNAME ## _copy(struct rb_node *rb_old, struct rb_node *rb_new)		\
 {									\
 	RBSTRUCT *old = rb_entry(rb_old, RBSTRUCT, RBFIELD);		\
 	RBSTRUCT *new = rb_entry(rb_new, RBSTRUCT, RBFIELD);		\
-	RBCOPY(new, old);						\
+	RBNAME ## __copy(old, new);					\
 }									\
 static void								\
 RBNAME ## _rotate(struct rb_node *rb_old, struct rb_node *rb_new)	\
 {									\
 	RBSTRUCT *old = rb_entry(rb_old, RBSTRUCT, RBFIELD);		\
 	RBSTRUCT *new = rb_entry(rb_new, RBSTRUCT, RBFIELD);		\
-	RBCOPY(new, old);						\
-	RBCOMPUTE(old, false);						\
+	RBNAME ## __copy(old, new);					\
+	RBNAME ## __compute(old, false);				\
 }									\
 RBSTATIC const struct rb_augment_callbacks RBNAME = {			\
 	.propagate = RBNAME ## _propagate,				\
@@ -130,26 +210,8 @@ RBSTATIC const struct rb_augment_callbacks RBNAME = {			\
 	.rotate = RBNAME ## _rotate					\
 };
 
-/*
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
-	new->RBAUGMENTED = old->RBAUGMENTED;				\
-}									\
-RB_DECLARE_CALLBACKS_MULTI(RBSTATIC, RBNAME,				\
-		     RBSTRUCT, RBFIELD, RBNAME ## _copy_single, RBCOMPUTE)
+#define RB_MAX(a, b) (a > b)
+#define RB_MIN(a, b) (a < b)
 
 /*
  * Template for declaring augmented rbtree callbacks,
@@ -159,34 +221,15 @@ RB_DECLARE_CALLBACKS_MULTI(RBSTATIC, RBNAME,				\
  * RBNAME:      name of the rb_augment_callbacks structure
  * RBSTRUCT:    struct type of the tree nodes
  * RBFIELD:     name of struct rb_node field within RBSTRUCT
- * RBTYPE:      type of the RBAUGMENTED field
- * RBAUGMENTED: name of RBTYPE field within RBSTRUCT holding data for subtree
- * RBCOMPUTE:   name of function that returns the per-node RBTYPE scalar
+ * RBTYPE:      type of the RBAUGMENTED field -- unused, assumed typeof(RBAUGMENTED)
+ * RBAUGMENTED: name of field within RBSTRUCT holding data for subtree
+ * RBVALUE:     name of function that returns the per-node RBTYPE scalar
  */
 
-#define RB_DECLARE_CALLBACKS_MAX(RBSTATIC, RBNAME, RBSTRUCT, RBFIELD,	      \
-				 RBTYPE, RBAUGMENTED, RBCOMPUTE)	      \
-static inline bool RBNAME ## _compute_max(RBSTRUCT *node, bool exit)	      \
-{									      \
-	RBSTRUCT *child;						      \
-	RBTYPE max = RBCOMPUTE(node);					      \
-	if (node->RBFIELD.rb_left) {					      \
-		child = rb_entry(node->RBFIELD.rb_left, RBSTRUCT, RBFIELD);   \
-		if (child->RBAUGMENTED > max)				      \
-			max = child->RBAUGMENTED;			      \
-	}								      \
-	if (node->RBFIELD.rb_right) {					      \
-		child = rb_entry(node->RBFIELD.rb_right, RBSTRUCT, RBFIELD);  \
-		if (child->RBAUGMENTED > max)				      \
-			max = child->RBAUGMENTED;			      \
-	}								      \
-	if (exit && node->RBAUGMENTED == max)				      \
-		return true;						      \
-	node->RBAUGMENTED = max;					      \
-	return false;							      \
-}									      \
-RB_DECLARE_CALLBACKS(RBSTATIC, RBNAME,					      \
-		     RBSTRUCT, RBFIELD, RBAUGMENTED, RBNAME ## _compute_max)
+#define RB_DECLARE_CALLBACKS_MAX(RBSTATIC, RBNAME, RBSTRUCT, RBFIELD,		\
+				 RBTYPE, RBAUGMENTED, RBVALUE)			\
+RB_DECLARE_CALLBACKS(RBSTATIC, RBNAME, RBSTRUCT, RBFIELD,			\
+		     RB_AUG_FUNC(RBVALUE, RBAUGMENTED, RB_MAX))
 
 
 #define	RB_RED		0
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index e707da7177df..967e71c15a24 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -999,71 +999,16 @@ static inline bool __entity_less(struct rb_node *a, const struct rb_node *b)
 	return entity_before(__node_2_se(a), __node_2_se(b));
 }
 
-static inline void __min_vruntime_update(struct sched_entity *se, struct rb_node *node)
+static inline bool __min_vruntime_cmp(u64 child_vruntime, u64 min_vruntime)
 {
-	if (node) {
-		struct sched_entity *rse = __node_2_se(node);
-
-		if (vruntime_cmp(se->min_vruntime, ">", rse->min_vruntime))
-			se->min_vruntime = rse->min_vruntime;
-	}
+	return vruntime_cmp(min_vruntime, ">", child_vruntime);
 }
 
-static inline void __min_slice_update(struct sched_entity *se, struct rb_node *node)
-{
-	if (node) {
-		struct sched_entity *rse = __node_2_se(node);
-		if (rse->min_slice < se->min_slice)
-			se->min_slice = rse->min_slice;
-	}
-}
-
-static inline void __max_slice_update(struct sched_entity *se, struct rb_node *node)
-{
-	if (node) {
-		struct sched_entity *rse = __node_2_se(node);
-		if (rse->max_slice > se->max_slice)
-			se->max_slice = rse->max_slice;
-	}
-}
-
-static inline void min_vruntime_copy(struct sched_entity *new, struct sched_entity *old)
-{
-	new->min_vruntime = old->min_vruntime;
-	new->min_slice = old->min_slice;
-	new->max_slice = old->max_slice;
-}
-
-/*
- * se->min_vruntime = min(se->vruntime, {left,right}->min_vruntime)
- */
-static inline bool min_vruntime_update(struct sched_entity *se, bool exit)
-{
-	u64 old_min_vruntime = se->min_vruntime;
-	u64 old_min_slice = se->min_slice;
-	u64 old_max_slice = se->max_slice;
-	struct rb_node *node = &se->run_node;
-
-	se->min_vruntime = se->vruntime;
-	__min_vruntime_update(se, node->rb_right);
-	__min_vruntime_update(se, node->rb_left);
-
-	se->min_slice = se->slice;
-	__min_slice_update(se, node->rb_right);
-	__min_slice_update(se, node->rb_left);
-
-	se->max_slice = se->slice;
-	__max_slice_update(se, node->rb_right);
-	__max_slice_update(se, node->rb_left);
-
-	return se->min_vruntime == old_min_vruntime &&
-	       se->min_slice == old_min_slice &&
-	       se->max_slice == old_max_slice;
-}
-
-
-RB_DECLARE_CALLBACKS_MULTI(static, min_vruntime_cb, struct sched_entity,
-		     run_node, min_vruntime_copy, min_vruntime_update);
+RB_DECLARE_CALLBACKS(static, min_vruntime_cb,
+		     struct sched_entity, run_node,
+		     RB_AUG(vruntime, min_vruntime, __min_vruntime_cmp),
+		     RB_AUG(slice, min_slice, RB_MIN),
+		     RB_AUG(slice, max_slice, RB_MAX));
 
 /*
  * Enqueue an entity into the rb-tree:
diff --git a/net/tipc/name_table.c b/net/tipc/name_table.c
index 6fda36ab1766..bed04a1f0fbd 100644
--- a/net/tipc/name_table.c
+++ b/net/tipc/name_table.c
@@ -88,10 +88,9 @@ struct tipc_service {
 	struct rcu_head rcu;
 };
 
-#define service_range_upper(sr) ((sr)->upper)
-RB_DECLARE_CALLBACKS_MAX(static, sr_callbacks,
-			 struct service_range, tree_node, u32, max,
-			 service_range_upper)
+RB_DECLARE_CALLBACKS(static, sr_callbacks,
+		     struct service_range, tree_node,
+		     RB_AUG(upper, max, RB_MAX));
 
 #define service_range_entry(rbtree_node)				\
 	(container_of(rbtree_node, struct service_range, tree_node))
