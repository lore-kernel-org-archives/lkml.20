Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA853D955D;
	Mon, 28 Sep 2026 14:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604322; cv=none; b=d84wfd0gzuNw0tumeGUaF8YOeuF0CHAy+o9PDkH9G+U80lY0FuZLfJx8IxMZzpNBRV/CB4ryFNIqOwKQsZ+WK68agjpJc5uea8Nr9AeKPAJkXxElT94Qmg50dKO7BoivRSi2pbUdHOJ7zyenCWza9hWXzBDO9EEnri/dX8a3H7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604322; c=relaxed/simple;
	bh=I7cy32qE3mCi1LUnKEYbF81UVxFwlh+gqR/Gi8LW8ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CY7UyqIrEHDK7UyPyk7RDJOKxibNESe1Ky43GoLybM6GTTgfHse1iTllWlRbgc9MUJ3BP9CLIdgWEbrKhE0l0+gEbNiSpbl9OMiqgrtWFZcr43fgmdFfqQ6ryO7JMGB1X7XmFiZLcd/0wi2QLK/FD2gBQ7IMP3y4iA7fnDZd5w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FpWeQOSd; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FpWeQOSd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FCHe8gudcxkgAqU1pJw+MjYpxYs8TRLpsK3Msg47LyU=; b=FpWeQOSdWekJYUCR1qI1m4/AT6
	n3hSkR7gomKDULlCi3sFg7XkK9Ur5EiFcxji8yXCAubec40G0cGDPLikJKmX9J10Q+/APklSEKyXN
	IkmX3+J6qzZWgwFGvtWyylG2kEcOmRAvj2pRR0Ot7AOuIOGWFnnvyJqLcsXJmtEjQXXiXMCg4I4F9
	+eglSzWu2SC5gvoycaCFkRdEETpcJwGCOM65/qfXGgcsn4dFQxnQup19vdw8qwlUv+yQabNnerDmb
	fR84pJS43ChI50bfBRDoad3gM5y2zZCjA1gskiUIIwMTdWpF8YpAffTSUMGnbJ7viRnjv7pwcceav
	ipfUs7dw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBByj-000000073bh-2KM9;
	Mon, 28 Sep 2026 14:05:13 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1D8DC3008BF; Mon, 28 Sep 2026 16:05:13 +0200 (CEST)
Date: Mon, 28 Sep 2026 16:05:13 +0200
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
Message-ID: <20260928140513.GF4121620@noisy.programming.kicks-ass.net>
References: <20260928122611.336351-1-s921975628@gmail.com>
 <20260928122611.336351-3-s921975628@gmail.com>
 <20260928133733.GP2009045@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928133733.GP2009045@noisy.programming.kicks-ass.net>

On Mon, Sep 28, 2026 at 03:37:33PM +0200, Peter Zijlstra wrote:
> On Mon, Sep 28, 2026 at 08:26:10PM +0800, Yiwei Lin wrote:
> 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 7455a83a6a990..60db4624b9897 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -1066,9 +1066,20 @@ static inline bool min_vruntime_update(struct sched_entity *se, bool exit)
> >  	       se->max_slice == old_max_slice;
> >  }
> >  
> > +/*
> > + * Fold @new's subtree data into @se, for each @se on @new's insertion path.
> > + */
> > +static inline void
> > +min_vruntime_merge(struct sched_entity *se, struct sched_entity *new)
> > +{
> > +	__min_vruntime_update(se, &new->run_node);
> > +	__min_slice_update(se, &new->run_node);
> > +	__max_slice_update(se, &new->run_node);
> > +}
> >  
> 
> So min_vruntime_update() can be written in terms of this helper like:
> 
> static inline bool min_vruntime_update(struct sched_entity *se, bool exit)
> {
> 	u64 old_min_vruntime = se->min_vruntime;
> 	u64 old_min_slice = se->min_slice;
> 	u64 old_max_slice = se->max_slice;
> 	struct rb_node *node = &se->run_node;
> 
> 	se->min_vruntime = se->vruntime;
> 	se->min_slice = se->slice;
> 	se->max_slice = se->slice;
> 
> 	min_vruntime_merge(se, node->rb_right);
> 	min_vruntime_merge(se, node->rb_left);
> 
> 	return se->min_vruntime == old_min_vruntime &&
> 	       se->min_slice == old_min_slice &&
> 	       se->max_slice == old_max_slice;
> }
> 
> And that is *very* close to being generalizable, obviating the need for
> RBCOMPUTE. Does your LLM see a way to make that happen?

Perhaps by doing something like so?

diff --git a/include/linux/rbtree_augmented.h b/include/linux/rbtree_augmented.h
index d2fa1c41bfd2..c4cf5160aa17 100644
--- a/include/linux/rbtree_augmented.h
+++ b/include/linux/rbtree_augmented.h
@@ -15,6 +15,7 @@
 #include <linux/compiler.h>
 #include <linux/rbtree.h>
 #include <linux/rcupdate.h>
+#include <linux/args.h>
 
 /*
  * Please note - only struct rb_augment_callbacks and the prototypes for
@@ -86,6 +87,20 @@ rb_add_augmented_cached(struct rb_node *node, struct rb_root_cached *tree,
 	return leftmost ? node : NULL;
 }
 
+#define FOR_EACH_1(what, x)       what(x)
+#define FOR_EACH_2(what, x, ...)  what(x) FOR_EACH_1(what, __VA_ARGS__)
+#define FOR_EACH_3(what, x, ...)  what(x) FOR_EACH_2(what, __VA_ARGS__)
+#define FOR_EACH_4(what, x, ...)  what(x) FOR_EACH_3(what, __VA_ARGS__)
+#define FOR_EACH_5(what, x, ...)  what(x) FOR_EACH_4(what, __VA_ARGS__)
+#define FOR_EACH_6(what, x, ...)  what(x) FOR_EACH_5(what, __VA_ARGS__)
+#define FOR_EACH_7(what, x, ...)  what(x) FOR_EACH_6(what, __VA_ARGS__)
+#define FOR_EACH_8(what, x, ...)  what(x) FOR_EACH_7(what, __VA_ARGS__)
+
+#define FOR_EACH(action, ...) \
+	CONCATENATE(FOR_EACH_, COUNT_ARGS(__VA_ARGS__))(action, __VA_ARGS__)
+
+#define COPY_VAL(x) new->x = old->x;
+
 /*
  * Template for declaring augmented rbtree callbacks (generic multi fields)
  *
@@ -93,12 +108,12 @@ rb_add_augmented_cached(struct rb_node *node, struct rb_root_cached *tree,
  * RBNAME:      name of the rb_augment_callbacks structure
  * RBSTRUCT:    struct type of the tree nodes
  * RBFIELD:     name of struct rb_node field within RBSTRUCT
- * RBCOPY:	name of function that copies the RBAUGMENTED datas
  * RBCOMPUTE:   name of function that recomputes the RBAUGMENTED datas
+ * RBAUG...:	field names within RBSTRUCT holding data for the subtree
  */
 
 #define RB_DECLARE_CALLBACKS_MULTI(RBSTATIC, RBNAME,			\
-			     RBSTRUCT, RBFIELD, RBCOPY, RBCOMPUTE)	\
+			     RBSTRUCT, RBFIELD, RBCOMPUTE, RBAUG...)	\
 static inline void							\
 RBNAME ## _propagate(struct rb_node *rb, struct rb_node *stop)		\
 {									\
@@ -110,18 +125,23 @@ RBNAME ## _propagate(struct rb_node *rb, struct rb_node *stop)		\
 	}								\
 }									\
 static inline void							\
+RBNAME ## __copy(RBSTRUCT *new, RBSTRUCT *old)				\
+{									\
+	FOR_EACH(COPY_VAL, RBAUG);					\
+}									\
+static inline void							\
 RBNAME ## _copy(struct rb_node *rb_old, struct rb_node *rb_new)		\
 {									\
 	RBSTRUCT *old = rb_entry(rb_old, RBSTRUCT, RBFIELD);		\
 	RBSTRUCT *new = rb_entry(rb_new, RBSTRUCT, RBFIELD);		\
-	RBCOPY(new, old);						\
+	RBNAME ## __copy(new, old);					\
 }									\
 static void								\
 RBNAME ## _rotate(struct rb_node *rb_old, struct rb_node *rb_new)	\
 {									\
 	RBSTRUCT *old = rb_entry(rb_old, RBSTRUCT, RBFIELD);		\
 	RBSTRUCT *new = rb_entry(rb_new, RBSTRUCT, RBFIELD);		\
-	RBCOPY(new, old);						\
+	RBNAME ## __copy(new, old);					\
 	RBCOMPUTE(old, false);						\
 }									\
 RBSTATIC const struct rb_augment_callbacks RBNAME = {			\
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index e707da7177df..cc4cd3565268 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1061,9 +1061,8 @@ static inline bool min_vruntime_update(struct sched_entity *se, bool exit)
 	       se->max_slice == old_max_slice;
 }
 
-
 RB_DECLARE_CALLBACKS_MULTI(static, min_vruntime_cb, struct sched_entity,
-		     run_node, min_vruntime_copy, min_vruntime_update);
+		     run_node, min_vruntime_update, min_vruntime, min_slice, max_slice)
 
 /*
  * Enqueue an entity into the rb-tree:
