Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069873E49F2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.69.130.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788538082; cv=none; b=Ew/ClqHUq9BUn7ut5gFVsVZk7KPDtM17Ejq3+G5rQB/Srmju/cFCUwrNFV5lWZmGtAFdEHpVeR9lVB0oCaa5TQ6bXPJJ+Cw2H7ZHzvnp697w/5eLuQCLfnK2CbiBIoi6C0pqg5XOPPv8dPmPvr/7p3UBX1cih68TW+w7a9u5khw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788538082; c=relaxed/simple;
	bh=nhiKumAHhpO4fJrNze7+Vk7fwTr7RXwMdq+K1R7SNH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fgMhuRK506aB00GK+v3khDqjLGrVZHcV3RjJa6LZ7Pyuo5V4d7f0qXECsZfuJiZBt459fYTjyvY68NSIg21AD3jJl1hBSRipZEoX7o5NudeNuuuz9MO2ua+BWDBSAD33QGqQ7opINX5ULcy1Me4soPSjnapgVof+P0mdfJdgGCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=ZtArIxs3; arc=none smtp.client-ip=158.69.130.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="ZtArIxs3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1788538058;
	bh=lradUNjQ28/3mgjgcohJ5akUg3r+w3Kdj2J+iydSJdo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZtArIxs36rzznKd2FiPR6bsMWG98lM6zzCRxyDLG0UFs6hz+gDG/jeNe3GW19Sreg
	 HfM5ADbXr7bwXq270tGwlDUvKC3sSf0adM1lTlD3PduSl08LkU2cLfBYiHLcqJpz7S
	 7Ksoy6hLprKYuabeX9dOqjX3xZGKcBhI0mcQImgvwYzcqhtCqSeSIqWVZrjYmIAsJU
	 So9KxR6oWF7scAXrAS7z51ONPjnWNpw284SGIYcTXHalDngJ0s2XiiRgMAs639pUKJ
	 tsM/fIiZNoo2ll2Kam2AW6MvqA+gJJFggCiX/0hKpBr26Ju3rzuc0gJnP8CXGxxnfX
	 Ur2hOcWYKlyNg==
Received: from compudjdev.. (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4hc1Zf3dnqzXNS;
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
Subject: [PATCH v22 08/10] lib/hpcc: Clarify accuracy range documentation
Date: Fri,  4 Sep 2026 12:07:20 -0400
Message-ID: <20260904160734.23445-9-mathieu.desnoyers@efficios.com>
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

Note that both Sashiko and Claude got it wrong with respect to what was
going on there. I took out pen and paper to draw the range situation,
and presented the result to Claude through ascii art, which solved the
matter. Having two LLMs misguided by the code, I decided to add a visual
representation of the approximation ranges to compare_delta() so anyone
reviewing this code won't fall into the same traps.

This change is documentation only.

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
 lib/percpu_counter_tree.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/lib/percpu_counter_tree.c b/lib/percpu_counter_tree.c
index cd71581f56bb..a8351c53d062 100644
--- a/lib/percpu_counter_tree.c
+++ b/lib/percpu_counter_tree.c
@@ -457,6 +457,32 @@ long percpu_counter_tree_precise_sum(struct percpu_counter_tree *counter)
 }
 EXPORT_SYMBOL_GPL(percpu_counter_tree_precise_sum);
 
+/*
+ * Each counter's approximation lies within [precise - under, precise + over]:
+ *
+ *                  approx_a range
+ *            <-----------+----------->
+ *          under_a       |       over_a
+ *                    precise_a
+ *                        |                          approx_b range
+ *                        |                    <-----------+----------->
+ *                        |                  under_b       |       over_b
+ *                        |                            precise_b
+ *                        |                                |
+ *                        |<------------ gap ------------->|
+ *  ----------------------+--------------------------------+-------------> values
+ *
+ * The two ranges are disjoint, and the comparison can return a definitive
+ * answer, only once the gap exceeds the two facing half-widths:
+ *
+ *   a below b:  gap > over_a + under_b   (a's upper edge, b's lower edge)
+ *   a above b:  gap > under_a + over_b   (a's lower edge, b's upper edge)
+ *
+ * When comparing against a plain value, the value has zero width, so the
+ * margins reduce to that single counter's under and over.
+ *
+ * accuracy_neg is used when delta < 0, and accuracy_pos is used when delta >= 0.
+ */
 static
 int compare_delta(long delta, unsigned long accuracy_neg, unsigned long accuracy_pos)
 {
@@ -494,6 +520,7 @@ int compare_delta(long delta, unsigned long accuracy_neg, unsigned long accuracy
  */
 int percpu_counter_tree_approximate_compare(struct percpu_counter_tree *a, struct percpu_counter_tree *b)
 {
+	/* See the range geometry above compare_delta(). */
 	return compare_delta(percpu_counter_tree_approximate_sum(a) - percpu_counter_tree_approximate_sum(b),
 			     a->approx_accuracy_range.over + b->approx_accuracy_range.under,
 			     a->approx_accuracy_range.under + b->approx_accuracy_range.over);
@@ -549,6 +576,7 @@ int percpu_counter_tree_precise_compare(struct percpu_counter_tree *a, struct pe
 	long delta = count_a - count_b;
 	int res;
 
+	/* See the range geometry above compare_delta(). */
 	res = compare_delta(delta,
 			    a->approx_accuracy_range.over + b->approx_accuracy_range.under,
 			    a->approx_accuracy_range.under + b->approx_accuracy_range.over);
-- 
2.43.0

