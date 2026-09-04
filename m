Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604E249B1E8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.69.130.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788538084; cv=none; b=fdbFYaFbv6wJps9UKocf2ZaGU5TSZr6XivoeLuBv6H2/DmNhNEAXkU1DVyfsXVBFPTQ8g4Udo4JT4Er4f17JMPve3iW62NZI6BzfnLti/tVpPhTZDuAkBoCKr/u5szS7ibv7xDuGPkDGXNEgLX8yxZUbeATXAMzqYYJ4LrLShlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788538084; c=relaxed/simple;
	bh=vUk2Qy+wWuwkPKXrWW5oqDWUEunpPdYcZyIzmWzLvHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HgzxXkQHeB+em0dNxUoe9dFvs3OZ0jWw9vorCztOnCVTnab+QlpywC5wgsfkmV0cNHnMGTvMYJfCZwQKgmRLDmfI2vN86YroPhXeFHovvmNUR92Kyz99tmhLhGCj9Qqim8X/zrsg8PuSnklWmLCgNcKUteJE7AckgpjWTZZI/tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=u41Mh3jE; arc=none smtp.client-ip=158.69.130.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="u41Mh3jE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1788538058;
	bh=f61pjVNcG3vfV4ruWkC/0g9a79TuVBC5x25qutrEOrw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u41Mh3jEJRteYmwrd/a6v5pGZjWY66A+h8ipRzrmzS3bE2DGea24bwVQTv/7LmmnP
	 5jdwHYRjYfuTMJTkWkcdSUiYquVshrj5KNIbsFdDpAGxIm67v3HqzwTYBOlNW5CqeT
	 H+jDSf1VbWmEF1odRRacFujOa1TEP8CVcqMX9gLgN1/oMHHI4YVPxvIDfUQRVHZy8P
	 0wwbWkTGHByec34uO88Kq9m4bj6ORAL74aDmWok6qzSLF1l12ORYa54kCd5TMWDcrp
	 CQ7xLAgUhYcjnxoCAAyV+TBGUp+KNJlfzNEf3HrW+oJuWPW+K+nyM3y5S/RHoigJTS
	 vTrJw3/XHN9wA==
Received: from compudjdev.. (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4hc1Zf2MC5zXNR;
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
Subject: [PATCH v22 07/10] lib/hpcc: Document that accuracy is a property of settled counters
Date: Fri,  4 Sep 2026 12:07:19 -0400
Message-ID: <20260904160734.23445-8-mathieu.desnoyers@efficios.com>
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

This change is documentation only. The bound describes a settled tree;
the two-counter comparisons read their operands independently. No code
change.

I considered and rejected the preempt_disable() proposed by Sashiko and
an alternative dual pre/post counters design.

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
 Documentation/core-api/percpu-counter-tree.rst |  4 ++++
 include/linux/percpu_counter_tree.h            | 10 +++++++---
 lib/percpu_counter_tree.c                      |  6 ++++--
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/Documentation/core-api/percpu-counter-tree.rst b/Documentation/core-api/percpu-counter-tree.rst
index 196da056e7b4..bb13e28bef11 100644
--- a/Documentation/core-api/percpu-counter-tree.rst
+++ b/Documentation/core-api/percpu-counter-tree.rst
@@ -43,6 +43,10 @@ This allows reading an approximated value at the root, which has a
 bounded accuracy (minimum/maximum possible precise sum range) determined
 by the tree topology.
 
+The bounded accuracy is a property of the settled tree. While updates are
+in flight the transient error can exceed it, bounded by the number of
+updaters and their increment size.
+
 Use Cases
 =========
 
diff --git a/include/linux/percpu_counter_tree.h b/include/linux/percpu_counter_tree.h
index 4095acdc879b..d593806b4ab2 100644
--- a/include/linux/percpu_counter_tree.h
+++ b/include/linux/percpu_counter_tree.h
@@ -93,7 +93,8 @@ struct percpu_counter_tree {
 	 * The "under" accuracy is larger than the "over" accuracy because the negative range of a
 	 * two's complement signed integer is one unit larger than the positive range. This delta
 	 * is summed for each tree item, which leads to a significantly larger "under" accuracy range
-	 * compared to the "over" accuracy range.
+	 * compared to the "over" accuracy range. The accuracy range is a bound on a settled counter:
+	 * one with no update in progress.
 	 */
 	struct {
 		unsigned long under;
@@ -169,6 +170,8 @@ long percpu_counter_tree_approximate_sum(struct percpu_counter_tree *counter)
  * slightly larger than the "over" range.
  * Those values are derived from the hardware topology and the counter tree batch size.
  * They are invariant for a given counter tree.
+ * The bounds describe a settled counter: one with no update in progress.
+ * An update in flight between its per-CPU increment and its carry propagation is not covered.
  * Using this function should not be typically required, see the following functions instead:
  * * percpu_counter_tree_approximate_compare(),
  * * percpu_counter_tree_approximate_compare_value(),
@@ -341,8 +344,9 @@ long percpu_counter_tree_precise_sum_positive(struct percpu_counter_tree *counte
  * @precise_min: Minimum possible value for precise sum (output).
  * @precise_max: Maximum possible value for precise sum (output).
  *
- * Calculate the minimum and maximum precise values for a given
- * approximation and (under, over) accuracy range.
+ * Calculate the minimum and maximum precise values for a given approximation
+ * and (under, over) accuracy range. The accuracy range is a bound on a settled
+ * tree: one with no update in progress.
  *
  * The range of the approximation as a function of the precise sum is expressed as:
  *
diff --git a/lib/percpu_counter_tree.c b/lib/percpu_counter_tree.c
index cfa5b04e05d7..cd71581f56bb 100644
--- a/lib/percpu_counter_tree.c
+++ b/lib/percpu_counter_tree.c
@@ -483,7 +483,8 @@ int compare_delta(long delta, unsigned long accuracy_neg, unsigned long accuracy
  * answer if the counters are found to be either less than or greater
  * than the other. However, if the approximated comparison returns
  * 0, the counters respective sums are found to be within the two
- * counters accuracy range.
+ * counters accuracy range. The two counters are read independently;
+ * the result is not an atomic snapshot of both.
  *
  * Return:
  * * %0		- Counters @a and @b do not differ by more than the sum of their respective
@@ -532,7 +533,8 @@ EXPORT_SYMBOL_GPL(percpu_counter_tree_approximate_compare_value);
  * As an optimization, it uses the approximate counter comparison
  * to quickly compare counters which are far apart. Only cases where
  * counter sums are within the accuracy range require precise counter
- * sums.
+ * sums. The two counters are read independently; the result is not an
+ * atomic snapshot of both.
  *
  * Return:
  * * %0		- Counters are equal.
-- 
2.43.0

