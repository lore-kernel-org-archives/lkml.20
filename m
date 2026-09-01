Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E576949CF2B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 18:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.69.130.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788287366; cv=none; b=uxxUkrk8tW8kWxy5VKYuhB01RU6470NYvFL2vleG0cN0Hia3l9omV1PlNsEbjlVnwfOz3xfBuvMwX+fCuVlMQnsOEjtWl+fSNgprzhlpIBRVfEyg0Uwr7uVbrCL3GqG0SnIJ7ReHhXNtcXWGKZQDdbPwSsaEEbw7h0cRS6ljlmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788287366; c=relaxed/simple;
	bh=FRBzQuF9NKvbTxzaWx4pzpaKcPAZeQr1CV0FO/0Fhpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YBFG78+HpSz28TUq2+sjOZs2MV7NHj8cO72wjU+eUtNyRw2e+0TppARXQqevgv0MdIddMH7roYg4JWr7HeaMOxqFS4jho5NVM7uKaHgU6hpKYFwNRk0fIus92VzTv6pyREpVky7re44lfzz4e8MA6q2kUXt9RmRqdLa6SWS7a7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=qggSTP/b; arc=none smtp.client-ip=158.69.130.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="qggSTP/b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1788287351;
	bh=Tup5QvhrUxBuHbOp/mUBjVWrl1apXEgoVpX9q/lsPY8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qggSTP/bMcWpRasG0WnaP9ws1YJFtVdzjObT99OSRwUR65maTBgJBaqTOQbc0wDeL
	 25QqSwuqF/o9a+SL8TEJBKSUiAxdk+MbcNlDACdQ+9N6JHsHeDThh8N/Wp/FmRu2sY
	 1Qwi/Bh+MvObtuU9Xt7CHHgq5+e4MGXlVSRPAQR2KE66n8bnwbXbG5lz5aq/fF71LQ
	 GaLUslwndIoe4WqGLpRYkP//V8t6vrVPKiocXYPyq1xESgzxyGl7wNA23o6WCons/D
	 9lIZ6nPcfP8LZl7OYaG8cLoQVBn9IN5QmlDsFxZwiOkO4QY4X9vx7tnkR4HROZwP6l
	 cscrNHFYhbIrA==
Received: from compudjdev.. (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4hZDsM00XdzW6M;
	Tue, 01 Sep 2026 14:29:10 -0400 (EDT)
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
Subject: [PATCH v21 6/6] lib: inline percpu_counter_tree_items_size with boot-safety sentinel
Date: Tue,  1 Sep 2026 14:28:51 -0400
Message-ID: <20260901182857.26690-7-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901182857.26690-1-mathieu.desnoyers@efficios.com>
References: <20260901182857.26690-1-mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the out-of-line percpu_counter_tree_items_size() function with a
static inline that loads the __ro_after_init variable
__percpu_counter_tree_items_size directly. This eliminates a function
call on paths that compute mm_struct flexible array layout offsets.

Initialize the variable to SIZE_MAX as a sentinel value, and add a
WARN_ON_ONCE check in the inline accessor to catch any accidental use
before percpu_counter_tree_subsystem_init() sets the real value based on
nr_cpu_ids. An early misuse would produce an absurd offset that triggers
the warning with a stack trace pointing at the offending caller, rather
than silently computing wrong memory offsets.

percpu_counter_tree_subsystem_init() sets the variable to the runtime
value immediately after deriving counter_config from nr_cpu_ids,
before calculate_accuracy_topology(). After boot, __ro_after_init moves
the variable into read-only memory.

On !CONFIG_SMP, the existing inline returning 0 is unchanged and
requires no sentinel.

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
 include/linux/percpu_counter_tree.h | 19 ++++++++++++++++++-
 lib/percpu_counter_tree.c           | 24 ++++++++----------------
 2 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/include/linux/percpu_counter_tree.h b/include/linux/percpu_counter_tree.h
index 3e8a820e2d1d..4095acdc879b 100644
--- a/include/linux/percpu_counter_tree.h
+++ b/include/linux/percpu_counter_tree.h
@@ -101,7 +101,24 @@ struct percpu_counter_tree {
 	} approx_accuracy_range;
 };
 
-size_t percpu_counter_tree_items_size(void);
+extern size_t __percpu_counter_tree_items_size __ro_after_init;
+
+/*
+ * percpu_counter_tree_items_size - Query the size required for counter tree items.
+ *
+ * Query the size of the memory area required to hold the counter tree
+ * items. This depends on the hardware topology and is invariant after
+ * boot.
+ *
+ * Return: Size required to hold tree items.
+ */
+static inline
+size_t percpu_counter_tree_items_size(void)
+{
+	WARN_ON_ONCE(__percpu_counter_tree_items_size == SIZE_MAX);
+	return __percpu_counter_tree_items_size;
+}
+
 int percpu_counter_tree_init_many(struct percpu_counter_tree *counters, struct percpu_counter_tree_level_item *items,
 				  unsigned int nr_counters, unsigned long batch_size, gfp_t gfp_flags);
 int percpu_counter_tree_init(struct percpu_counter_tree *counter, struct percpu_counter_tree_level_item *items,
diff --git a/lib/percpu_counter_tree.c b/lib/percpu_counter_tree.c
index 5c8fc2dcdc16..cfa5b04e05d7 100644
--- a/lib/percpu_counter_tree.c
+++ b/lib/percpu_counter_tree.c
@@ -653,22 +653,9 @@ void percpu_counter_tree_set(struct percpu_counter_tree *counter, long v)
 }
 EXPORT_SYMBOL_GPL(percpu_counter_tree_set);
 
-/*
- * percpu_counter_tree_items_size - Query the size required for counter tree items.
- *
- * Query the size of the memory area required to hold the counter tree
- * items. This depends on the hardware topology and is invariant after
- * boot.
- *
- * Return: Size required to hold tree items.
- */
-size_t percpu_counter_tree_items_size(void)
-{
-	if (!nr_cpus_order)
-		return 0;
-	return counter_config->nr_items * sizeof(struct percpu_counter_tree_level_item);
-}
-EXPORT_SYMBOL_GPL(percpu_counter_tree_items_size);
+/* Initialize to SIZE_MAX to catch early boot misuses. */
+size_t __percpu_counter_tree_items_size __ro_after_init = SIZE_MAX;
+EXPORT_SYMBOL_GPL(__percpu_counter_tree_items_size);
 
 static void __init calculate_accuracy_topology(void)
 {
@@ -697,6 +684,11 @@ int __init percpu_counter_tree_subsystem_init(void)
 		return -1;
 	}
 	counter_config = &per_nr_cpu_order_config[nr_cpus_order];
+	if (!nr_cpus_order)
+		__percpu_counter_tree_items_size = 0;
+	else
+		__percpu_counter_tree_items_size = counter_config->nr_items *
+			sizeof(struct percpu_counter_tree_level_item);
 	calculate_accuracy_topology();
 	return 0;
 }
-- 
2.43.0

