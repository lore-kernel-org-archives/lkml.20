Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216524;
	b=wgLrsBd3kip7LFbLeVqJ/S1D/v1SEZzM9mUsysISijUWXi8PUr/KRiXnQLBueE6gcD7u
	 PT3mXS92zy0SuFmV5IRDyKNiBA7dARrVnYizUZUUqhvPz8T0mdp+5QaiUedxwpq5fd7E/
	 tpIXIgpvT1vgQ3f71VyhRzR8HcwFpMGlf3IGq7TrM7qlzoFNPa49CF0MiofXZJELd4dcQ
	 tthyrguyyzefcWeBQWJbzowkIgc6GEUoxKtlY7j7LY33lNl/ndZh2Kn3tvICCR/G2qQog
	 bltuXFbj6L2Acmd8UXUWc9lYr6ihdX+IFbPgmIiCRjXQ2uSFXp04xM3Foa13yqihWeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216524;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=bqnUcOXvkNxRJOtjh/xyKqJY+sFUhAeM33T81xCOkN8=;
	b=IuFbArEGIEFJ01tsTiOuHqZb7D7umUZFiOrUvriw/KGpTKjBV82l29TKiK9TA1kAAF2n
	 c1KztVaj5c3V8rn0QqZxbtFTC+gk0Adezed2y1v3ntf9jIMYpwoKleQ5ab7W7T12Bl8QM
	 IV3at+SD15hrUaJyv0uYe/NUiylttwUg6q29wdmWIFapInUj+d4ek12OCFow5EFp8Sd6c
	 09dPMM59khtMd535fV8djKACrOfTJgKmWcNSZOYUmMfTNEB2ySEpr9zyfzH/YvurujIso
	 8cfs+MHUICS1+VVqbmTwzu+F2DUM0DMS245k+zBcFFGIV34/3HyEULzb5wlaeVxuiTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=os4mFDj5;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Rv67L7xh;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD62606D825;
	Mon,  9 Nov 2026 09:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BD62606D825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=os4mFDj5;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Rv67L7xh
Date: Mon, 09 Nov 2026 09:28:41 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794216522;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bqnUcOXvkNxRJOtjh/xyKqJY+sFUhAeM33T81xCOkN8=;
	b=os4mFDj573M1pXTTZqjLVwlZbgAI35YdJqmIyVef+QZeAt5g+aEE8HzWypd8WdCDiuEFSm
	cDGDEvith2RUfQmRLCQAsUu6vx+g1k3d2CYI4jAv1Vw0LZb1fQgdBbDlJcAD9MNJDGnRT6
	vSG0Nh9GZluHNY++/nH93F/vlw8K+LR7b38Po5UkkiO97RwkiUWGgrvyh27sdR5/URF8C3
	dEPqpsXh/2+p0wNZNwWlk7bnTMJKqcOxIwyoMxiix6sfg35Lr2pF6Qm2rJAoAp1C2N06S7
	QDrK7kdPI4kUgMMavz7t25E9lW796G9InO/C0kTcQSzmv1KjYrcAhfhjykyhIg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794216522;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bqnUcOXvkNxRJOtjh/xyKqJY+sFUhAeM33T81xCOkN8=;
	b=Rv67L7xh4H39f0Tq8C3KnAYqM8FFo1Ad4NDz1O/doUpCl0LIzLInQd+0oG7AOJ8VrTzfcF
	M1SLyC/GWeTutdCw==
From: "tip-bot2 for Aaron Tomlin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/fair: Use list_for_each_entry_rcu() in
 print_cfs_stats()
Cc: "sashiko-bot" <sashiko-bot@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261030151307.768523-6-atomlin@atomlin.com>
References: <20261030151307.768523-6-atomlin@atomlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421652101.2093942.9625580162018115151.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     288818eea3f001bf4cfbd209b9b601618e2968ea
Gitweb:        https://git.kernel.org/tip/288818eea3f001bf4cfbd209b9b601618e2=
968ea
Author:        Aaron Tomlin <atomlin@atomlin.com>
AuthorDate:    Fri, 30 Oct 2026 11:13:06 -04:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:23:59 +01:00

sched/fair: Use list_for_each_entry_rcu() in print_cfs_stats()

In print_cfs_stats(), rq->leaf_cfs_rq_list is traversed locklessly under
RCU using for_each_leaf_cfs_rq_safe(), which expands to
list_for_each_entry_safe(). Although rq->leaf_cfs_rq_list is modified
using list_add_rcu(), list_for_each_entry_safe() is a non-RCU iteration
macro that dereferences pointer links without READ_ONCE() and pre-fetches
the next pointer without memory ordering guarantees.

Without READ_ONCE(), the compiler is free to re-fetch pointers or reorder
instructions. As a result, a lockless reader can observe a newly inserted
cfs_rq's pointer before its internal fields are fully visible, leading to
reading uninitialised data or dereferencing invalid pointers.

Furthermore, in the core scheduler, cfs_rq structures are embedded in
struct task_group and are enqueued/dequeued dynamically on each CPU's
leaf_cfs_rq_list during task wakeups and throttling. Because this occurs
in atomic fast paths under rq->lock, deferring list deletion with an RCU
grace period or allocating dynamic proxy nodes is not feasible. While the
underlying task_group/cfs_rq memory backing each node is safely reclaimed
via call_rcu() (i.e., sched_free_group_rcu()), immediate node
re-insertion can modify cfs_rq->next while print_cfs_stats() is
executing locklessly. Under continuous list churn, lockless readers
could experience backward jumps, resulting in unbounded list traversal
inside the RCU read-side critical section and triggering an RCU CPU
stall warning.

Address this by:
    1.  Introducing for_each_leaf_cfs_rq_rcu(), which expands to
        list_for_each_entry_rcu(). This enforces READ_ONCE() and proper
        data-dependency ordering on all architectures during list
        traversal

    2.  Using guard(rcu)() to ensure the backing task_group/cfs_rq
        memory remains valid throughout traversal

    3.  Capping the lockless list traversal with a per-CPU
        circuit-breaker ceiling. This represents a generous upper bound
        for active leaf cfs_rqs on an individual core while guaranteeing
        loop termination and preventing RCU stalls under list churn

    4.  Emitting an explicit truncation notice if the ceiling is ever
        reached, ensuring transparency in debugfs

Fixes: 039ae8bcf7a5 ("sched/fair: Fix O(nr_cgroups) in the load balancing pat=
h")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20261030151307.768523-6-atomlin@atomlin.com
---
 kernel/sched/debug.c | 39 ++-------------------------------
 kernel/sched/fair.c  | 33 ++++++++++++++++++++++++----
 kernel/sched/sched.h | 51 +++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 83 insertions(+), 40 deletions(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index a22d646..b291595 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -11,17 +11,6 @@
 #include <linux/log2.h>
 #include "sched.h"
=20
-/*
- * This allows printing both to /sys/kernel/debug/sched/debug and
- * to the console
- */
-#define SEQ_printf(m, x...)			\
- do {						\
-	if (m)					\
-		seq_printf(m, x);		\
-	else					\
-		pr_cont(x);			\
- } while (0)
=20
 /*
  * Ease the printing of nsec fields:
@@ -927,38 +916,16 @@ static void print_cfs_group_stats(struct seq_file *m, i=
nt cpu, struct task_group
 #endif /* CONFIG_FAIR_GROUP_SCHED */
=20
 #ifdef CONFIG_CGROUP_SCHED
-static DEFINE_SPINLOCK(sched_debug_lock);
-static char group_path[PATH_MAX];
+DEFINE_SPINLOCK(sched_debug_lock);
+char sched_debug_group_path[PATH_MAX];
=20
-static void task_group_path(struct task_group *tg, char *path, int plen)
+void task_group_path(struct task_group *tg, char *path, int plen)
 {
 	if (autogroup_path(tg, path, plen))
 		return;
=20
 	cgroup_path(tg->css.cgroup, path, plen);
 }
-
-/*
- * Only 1 SEQ_printf_task_group_path() caller can use the full length
- * group_path[] for cgroup path. Other simultaneous callers will have
- * to use a shorter stack buffer. A "..." suffix is appended at the end
- * of the stack buffer so that it will show up in case the output length
- * matches the given buffer size to indicate possible path name truncation.
- */
-#define SEQ_printf_task_group_path(m, tg, fmt...)			\
-{									\
-	if (spin_trylock(&sched_debug_lock)) {				\
-		task_group_path(tg, group_path, sizeof(group_path));	\
-		SEQ_printf(m, fmt, group_path);				\
-		spin_unlock(&sched_debug_lock);				\
-	} else {							\
-		char buf[128];						\
-		char *bufend =3D buf + sizeof(buf) - 3;			\
-		task_group_path(tg, buf, bufend - buf);			\
-		strcpy(bufend - 1, "...");				\
-		SEQ_printf(m, fmt, buf);				\
-	}								\
-}
 #endif
=20
 static void
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 395f0b3..d4cc0ca 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -423,6 +423,10 @@ static inline void assert_list_leaf_cfs_rq(struct rq *rq)
 	list_for_each_entry_safe(cfs_rq, pos, &rq->leaf_cfs_rq_list,	\
 				 leaf_cfs_rq_list)
=20
+#define for_each_leaf_cfs_rq_rcu(rq, cfs_rq)				\
+	list_for_each_entry_rcu(cfs_rq, &(rq)->leaf_cfs_rq_list,	\
+				leaf_cfs_rq_list)
+
 /* Do the two (enqueued) entities belong to the same group ? */
 static inline struct cfs_rq *
 is_same_group(struct sched_entity *se, struct sched_entity *pse)
@@ -479,6 +483,9 @@ static inline void assert_list_leaf_cfs_rq(struct rq *rq)
 #define for_each_leaf_cfs_rq_safe(rq, cfs_rq, pos)	\
 		for (cfs_rq =3D &rq->cfs, pos =3D NULL; cfs_rq; cfs_rq =3D pos)
=20
+#define for_each_leaf_cfs_rq_rcu(rq, cfs_rq)	\
+		for (cfs_rq =3D &rq->cfs; cfs_rq; cfs_rq =3D NULL)
+
 static inline struct sched_entity *parent_entity(struct sched_entity *se)
 {
 	return NULL;
@@ -15969,14 +15976,32 @@ DEFINE_SCHED_CLASS(fair) =3D {
 #endif
 };
=20
+#define SCHED_DEBUG_MAX_ITER 4096
+#define SCHED_DEBUG_TRUNCATED_MSG \
+	"stats truncated at " __stringify(SCHED_DEBUG_MAX_ITER) " iterations\n"
+
 void print_cfs_stats(struct seq_file *m, int cpu)
 {
-	struct cfs_rq *cfs_rq, *pos;
+	struct cfs_rq *cfs_rq;
+	int max_iter =3D SCHED_DEBUG_MAX_ITER;
=20
-	rcu_read_lock();
-	for_each_leaf_cfs_rq_safe(cpu_rq(cpu), cfs_rq, pos)
+	guard(rcu)();
+	for_each_leaf_cfs_rq_rcu(cpu_rq(cpu), cfs_rq) {
+		if (--max_iter < 0) {
+			SEQ_printf(m, "\n");
+			if (IS_ENABLED(CONFIG_FAIR_GROUP_SCHED)) {
+				SEQ_printf_task_group_path(m, cfs_rq_tg(cfs_rq),
+							   "cfs_rq[%d]:%s ... "
+							   SCHED_DEBUG_TRUNCATED_MSG,
+							   cpu);
+			} else {
+				SEQ_printf(m, "cfs_rq[%d]: "
+					   SCHED_DEBUG_TRUNCATED_MSG, cpu);
+			}
+			break;
+		}
 		print_cfs_rq(m, cpu, cfs_rq);
-	rcu_read_unlock();
+	}
 }
=20
 #ifdef CONFIG_NUMA_BALANCING
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index d5e1933..a4df59c 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -777,6 +777,18 @@ struct cfs_rq {
 #endif /* CONFIG_FAIR_GROUP_SCHED */
 };
=20
+#ifdef CONFIG_FAIR_GROUP_SCHED
+static inline struct task_group *cfs_rq_tg(struct cfs_rq *cfs_rq)
+{
+	return cfs_rq->tg;
+}
+#else
+static inline struct task_group *cfs_rq_tg(struct cfs_rq *cfs_rq)
+{
+	return NULL;
+}
+#endif
+
 #ifdef CONFIG_SCHED_CLASS_EXT
 /* scx_rq->flags, protected by the rq lock */
 enum scx_rq_flags {
@@ -3519,6 +3531,45 @@ extern struct sched_entity *__pick_root_entity(struct =
cfs_rq *cfs_rq);
 extern struct sched_entity *__pick_first_entity(struct cfs_rq *cfs_rq);
 extern struct sched_entity *__pick_last_entity(struct cfs_rq *cfs_rq);
=20
+/*
+ * This allows printing both to /sys/kernel/debug/sched/debug and
+ * to the console
+ */
+#define SEQ_printf(m, x...)			\
+do {						\
+	if (m)					\
+		seq_printf(m, x);		\
+	else					\
+		pr_cont(x);			\
+} while (0)
+
+#ifdef CONFIG_CGROUP_SCHED
+extern spinlock_t sched_debug_lock;
+extern char sched_debug_group_path[PATH_MAX];
+extern void task_group_path(struct task_group *tg, char *path, int plen);
+
+#define SEQ_printf_task_group_path(m, tg, fmt...)			\
+{									\
+	if (spin_trylock(&sched_debug_lock)) {				\
+		task_group_path(tg, sched_debug_group_path, sizeof(sched_debug_group_path)=
); \
+		SEQ_printf(m, fmt, sched_debug_group_path);		\
+		spin_unlock(&sched_debug_lock);				\
+	} else {							\
+		char buf[128];						\
+		char *bufend =3D buf + sizeof(buf) - 3;			\
+		task_group_path(tg, buf, bufend - buf);			\
+		strscpy(bufend - 1, "...", sizeof("..."));		\
+		SEQ_printf(m, fmt, buf);				\
+	}								\
+}
+#else
+static inline void
+SEQ_printf_task_group_path(struct seq_file *m, struct task_group *tg,
+			   const char *fmt, ...)
+{
+}
+#endif
+
 extern bool sched_debug_verbose;
=20
 extern void print_cfs_stats(struct seq_file *m, int cpu);
