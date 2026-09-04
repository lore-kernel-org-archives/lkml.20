Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E073EC683
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.69.130.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788538081; cv=none; b=XXjNacnSnDzeQnst8jgFWRCxsObggtCJvUCVJCkgUv1Ub/2oAu7dZnyP15lpkCoKX9ulfKJFDjiwCtlLS927pg440jVAnAuT3PorXhn2ebqjlvBTJlTOkSsEj3S5jr2rDs/r+d5tW7pYKN/Noy8xr/yo4qFpE8f8e1hn32zYgFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788538081; c=relaxed/simple;
	bh=baOAvP7RiN6IFCgsRNzYX4lPYV0J17aJKHFqE+wtHTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MyTb0+7PqSmPLdqagQgfRNQLA5vWeqH8vJu6FxNmOo6+pI4lMkFFf5GPyPtTMgGkSbHW5qWB9b9tQurBUsuSglveJJVxdLeYazXvEYEYYixRIghm0Vet99t94nkOaE1tY/U72m0ynjk9v7j5ULgBBxtzUt6sjQDpfoRGATYYWd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=wCfgFlTr; arc=none smtp.client-ip=158.69.130.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="wCfgFlTr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1788538058;
	bh=GFrBGotQmUFPk7Hx6MxhQ//71RXmwImDPFS9Iw0UAsM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wCfgFlTrbJPjdAcgG+nlLqQIYCEOi18LXYFjG4sdjtoD9r3ycBDcKFXnBwxiB6yDm
	 nRi+nE7vTEVoXinUKEwDsB9WQXjs3xyUsf6soQ27ieg8+U0j7NYvcq2aAuE6TlZMbd
	 yi73XpBkuXv1qliojg9bKREXw/3UdcB2bmNKiDZA33cQ+bFnxD4R0wzgg8Xa1n741e
	 dQ/EBC2e2YlP7Nb29YGFNQCpu1X5qbexT6KPbH5o+1OXCia+8RBvEWpJkuTE0CjtdS
	 1IomSsc/kAtjEavizxiiwtA9TJjL09xwGfhdoq5+/5LPeDj6KjQuQxyuwrkAomm0E5
	 9H0/jjaWhbosQ==
Received: from compudjdev.. (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4hc1Zf4svrzWWY;
	Fri, 04 Sep 2026 12:07:38 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Martin Liu <liumartin@google.com>,
	David Rientjes <rientjes@google.com>,
	christian.koenig@amd.com,
	Shakeel Butt <shakeel.butt@linux.dev>,
	SeongJae Park <sj@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Sweet Tea Dorminy <sweettea-kernel@dorminy.me>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Wei Yang <richard.weiyang@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Yu Zhao <yuzhao@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Aboorva Devarajan <aboorvad@linux.ibm.com>,
	David Carlier <devnexen@gmail.com>,
	Josh Law <objecting@objecting.org>,
	linux-mm@kvack.org
Subject: [PATCH v22 09/10] lib/hpcc: Introduce wrapped delta helper
Date: Fri,  4 Sep 2026 12:07:21 -0400
Message-ID: <20260904160734.23445-10-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904160734.23445-1-mathieu.desnoyers@efficios.com>
References: <20260904160734.23445-1-mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Answer a report from Sashiko at:
https://sashiko.dev/#/patchset/20260901182857.26690-1-mathieu.desnoyers@efficios.com

Document that the comparison between counters is on the wrapped
difference. It is valid only when the two counters differ by less than
LONG_MAX, and results are undefined beyond that.

Introduce a wrapped_delta() static inline helper to perform this
subtraction on unsigned types, which define the subtraction across
overflow, and use it in the comparison API.

I've reflowed some kdocs comments that were around the addition of new
sentences about wrapped difference.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Dennis Zhou <dennis@kernel.org>
Cc: Tejun Heo <tj@kernel.org>
Cc: Christoph Lameter <cl@linux.com>
Cc: Martin Liu <liumartin@google.com>
Cc: David Rientjes <rientjes@google.com>
Cc: christian.koenig@amd.com
Cc: Shakeel Butt <shakeel.butt@linux.dev>
Cc: SeongJae Park <sj@kernel.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Liam R. Howlett <liam@infradead.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Vlastimil Babka <vbabka@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Wei Yang <richard.weiyang@gmail.com>
Cc: David Hildenbrand <david@kernel.org>
Cc: Miaohe Lin <linmiaohe@huawei.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Yu Zhao <yuzhao@google.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Aboorva Devarajan <aboorvad@linux.ibm.com>
Cc: David Carlier <devnexen@gmail.com>
Cc: Josh Law <objecting@objecting.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
---
 .../core-api/percpu-counter-tree.rst          |  3 +
 lib/percpu_counter_tree.c                     | 81 ++++++++++++-------
 2 files changed, 55 insertions(+), 29 deletions(-)

diff --git a/Documentation/core-api/percpu-counter-tree.rst b/Documentation/core-api/percpu-counter-tree.rst
index bb13e28bef11..878cbd85304c 100644
--- a/Documentation/core-api/percpu-counter-tree.rst
+++ b/Documentation/core-api/percpu-counter-tree.rst
@@ -72,6 +72,9 @@ a set. A first pass compares the approximated values, and then a second
 pass only needs the precise sum for counter trees which are within the
 possible precise sum range of the counter tree chosen by the first pass.
 
+Because the comparison is on the wrapped difference, it is not transitive:
+ordering is undefined over a set of counters spanning more than LONG_MAX.
+
 Functions and structures
 ========================
 
diff --git a/lib/percpu_counter_tree.c b/lib/percpu_counter_tree.c
index a8351c53d062..26bfe183a882 100644
--- a/lib/percpu_counter_tree.c
+++ b/lib/percpu_counter_tree.c
@@ -457,6 +457,17 @@ long percpu_counter_tree_precise_sum(struct percpu_counter_tree *counter)
 }
 EXPORT_SYMBOL_GPL(percpu_counter_tree_precise_sum);
 
+/*
+ * The comparison between counters is on the wrapped difference. It is valid
+ * only when the two counters differ by less than LONG_MAX, and results are
+ * undefined beyond that.
+ */
+static inline
+long wrapped_delta(long a, long b)
+{
+	return (long)((unsigned long)a - (unsigned long)b);
+}
+
 /*
  * Each counter's approximation lies within [precise - under, precise + over]:
  *
@@ -504,13 +515,15 @@ int compare_delta(long delta, unsigned long accuracy_neg, unsigned long accuracy
  * @a: First counter to compare.
  * @b: Second counter to compare.
  *
- * Evaluate an approximate comparison of two counter trees.
- * This approximation comparison is fast, and provides an accurate
- * answer if the counters are found to be either less than or greater
- * than the other. However, if the approximated comparison returns
- * 0, the counters respective sums are found to be within the two
- * counters accuracy range. The two counters are read independently;
- * the result is not an atomic snapshot of both.
+ * Evaluate an approximate comparison of two counter trees. This approximation
+ * comparison is fast, and provides an accurate answer if the counters are
+ * found to be either less than or greater than the other. However, if the
+ * approximated comparison returns 0, the counters respective sums are found to
+ * be within the two counters accuracy range. The two counters are read
+ * independently; the result is not an atomic snapshot of both.
+ * The comparison between counters is on the wrapped difference. It is valid
+ * only when the two counters differ by less than LONG_MAX, and results are
+ * undefined beyond that.
  *
  * Return:
  * * %0		- Counters @a and @b do not differ by more than the sum of their respective
@@ -521,7 +534,8 @@ int compare_delta(long delta, unsigned long accuracy_neg, unsigned long accuracy
 int percpu_counter_tree_approximate_compare(struct percpu_counter_tree *a, struct percpu_counter_tree *b)
 {
 	/* See the range geometry above compare_delta(). */
-	return compare_delta(percpu_counter_tree_approximate_sum(a) - percpu_counter_tree_approximate_sum(b),
+	return compare_delta(wrapped_delta(percpu_counter_tree_approximate_sum(a),
+					   percpu_counter_tree_approximate_sum(b)),
 			     a->approx_accuracy_range.over + b->approx_accuracy_range.under,
 			     a->approx_accuracy_range.under + b->approx_accuracy_range.over);
 }
@@ -537,6 +551,9 @@ EXPORT_SYMBOL_GPL(percpu_counter_tree_approximate_compare);
  * answer if the counter is found to be either less than or greater
  * than the value. However, if the approximated comparison returns
  * 0, the value is within the counter accuracy range.
+ * The comparison between counters is on the wrapped difference. It is valid
+ * only when @v and the counter differ by less than LONG_MAX, and results are
+ * undefined beyond that.
  *
  * Return:
  * * %0		- The value @v is within the accuracy range of the counter.
@@ -545,7 +562,7 @@ EXPORT_SYMBOL_GPL(percpu_counter_tree_approximate_compare);
  */
 int percpu_counter_tree_approximate_compare_value(struct percpu_counter_tree *counter, long v)
 {
-	return compare_delta(v - percpu_counter_tree_approximate_sum(counter),
+	return compare_delta(wrapped_delta(v, percpu_counter_tree_approximate_sum(counter)),
 			     counter->approx_accuracy_range.under,
 			     counter->approx_accuracy_range.over);
 }
@@ -556,12 +573,14 @@ EXPORT_SYMBOL_GPL(percpu_counter_tree_approximate_compare_value);
  * @a: First counter to compare.
  * @b: Second counter to compare.
  *
- * Evaluate a precise comparison of two counter trees.
- * As an optimization, it uses the approximate counter comparison
- * to quickly compare counters which are far apart. Only cases where
- * counter sums are within the accuracy range require precise counter
- * sums. The two counters are read independently; the result is not an
- * atomic snapshot of both.
+ * Evaluate a precise comparison of two counter trees. As an optimization, it
+ * uses the approximate counter comparison to quickly compare counters which
+ * are far apart. Only cases where counter sums are within the accuracy range
+ * require precise counter sums. The two counters are read independently; the
+ * result is not an atomic snapshot of both.
+ * The comparison between counters is on the wrapped difference. It is valid
+ * only when the two counters differ by less than LONG_MAX, and results are
+ * undefined beyond that.
  *
  * Return:
  * * %0		- Counters are equal.
@@ -573,7 +592,7 @@ int percpu_counter_tree_precise_compare(struct percpu_counter_tree *a, struct pe
 	long count_a = percpu_counter_tree_approximate_sum(a),
 	     count_b = percpu_counter_tree_approximate_sum(b);
 	unsigned long accuracy_a, accuracy_b;
-	long delta = count_a - count_b;
+	long delta = wrapped_delta(count_a, count_b);
 	int res;
 
 	/* See the range geometry above compare_delta(). */
@@ -597,7 +616,7 @@ int percpu_counter_tree_precise_compare(struct percpu_counter_tree *a, struct pe
 	}
 	if (accuracy_b < accuracy_a) {
 		count_a = percpu_counter_tree_precise_sum(a);
-		res = compare_delta(count_a - count_b,
+		res = compare_delta(wrapped_delta(count_a, count_b),
 				    b->approx_accuracy_range.under,
 				    b->approx_accuracy_range.over);
 		if (res)
@@ -606,7 +625,7 @@ int percpu_counter_tree_precise_compare(struct percpu_counter_tree *a, struct pe
 		count_b = percpu_counter_tree_precise_sum(b);
 	} else {
 		count_b = percpu_counter_tree_precise_sum(b);
-		res = compare_delta(count_a - count_b,
+		res = compare_delta(wrapped_delta(count_a, count_b),
 				    a->approx_accuracy_range.over,
 				    a->approx_accuracy_range.under);
 		if (res)
@@ -614,9 +633,10 @@ int percpu_counter_tree_precise_compare(struct percpu_counter_tree *a, struct pe
 		/* Precise sum of second counter is required. */
 		count_a = percpu_counter_tree_precise_sum(a);
 	}
-	if (count_a - count_b < 0)
+	delta = wrapped_delta(count_a, count_b);
+	if (delta < 0)
 		return -1;
-	if (count_a - count_b > 0)
+	if (delta > 0)
 		return 1;
 	return 0;
 }
@@ -627,11 +647,13 @@ EXPORT_SYMBOL_GPL(percpu_counter_tree_precise_compare);
  * @counter: Counter to compare.
  * @v: Value to compare.
  *
- * Evaluate a precise comparison of a counter tree against a given value.
- * As an optimization, it uses the approximate counter comparison
- * to quickly identify whether the counter and value are far apart.
- * Only cases where the value is within the counter accuracy range
- * require a precise counter sum.
+ * Evaluate a precise comparison of a counter tree against a given value. As
+ * an optimization, it uses the approximate counter comparison to quickly
+ * identify whether the counter and value are far apart. Only cases where the
+ * value is within the counter accuracy range require a precise counter sum.
+ * The comparison between counters is on the wrapped difference. It is valid
+ * only when @v and the counter differ by less than LONG_MAX, and results are
+ * undefined beyond that.
  *
  * Return:
  * * %0		- The value @v is equal to the counter.
@@ -640,10 +662,10 @@ EXPORT_SYMBOL_GPL(percpu_counter_tree_precise_compare);
  */
 int percpu_counter_tree_precise_compare_value(struct percpu_counter_tree *counter, long v)
 {
-	long count = percpu_counter_tree_approximate_sum(counter);
+	long count = percpu_counter_tree_approximate_sum(counter), delta;
 	int res;
 
-	res = compare_delta(v - count,
+	res = compare_delta(wrapped_delta(v, count),
 			    counter->approx_accuracy_range.under,
 			    counter->approx_accuracy_range.over);
 	/* The values are distanced enough for an accurate approximated comparison. */
@@ -652,9 +674,10 @@ int percpu_counter_tree_precise_compare_value(struct percpu_counter_tree *counte
 
 	/* Precise sum is required. */
 	count = percpu_counter_tree_precise_sum(counter);
-	if (v - count < 0)
+	delta = wrapped_delta(v, count);
+	if (delta < 0)
 		return -1;
-	if (v - count > 0)
+	if (delta > 0)
 		return 1;
 	return 0;
 }
-- 
2.43.0

