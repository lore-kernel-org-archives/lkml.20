Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7785425F99F
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987075; cv=none; b=G9boPbptnnyI9MofZyK5UoE7mJ+1XJoVqCTnAr2/xcfcxE1SRMS/SEx6Rs4HpNFYrGsEDx4BWyLOq7Yiv14BxeveH/Vqwezt9u5GFah5dOOtVoQGBswn+yzWV/+/+aP9nh9OM8uOZmgoQuXyOcIreDUi/txQsyGofMTW4KYgQ20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987075; c=relaxed/simple;
	bh=LHNt0q8ITEJWpeoIOMFW4aGpkmBnNFsIk7DmHwVsRcw=;
	h=Date:From:To:Cc:Subject:Message-Id:Mime-Version:Content-Type; b=HJ4VDAm3AXzmreXiFWx8y/fTmGusryldFMPJOCvXOTFwriNXn3HX89F5utmRxNgN8zB4XzxawwrC8ZhIEeUYHj6eJ+FkYnKOQ6pfxf2jC9Lfvf23xJHHWffVgnT+JphDJ3t2eus5JpI76ukS3IPLwbyPJmPX/Yc+8c2HmQE4f8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=INDdHu0o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="INDdHu0o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2B41F000FF;
	Sat,  3 Oct 2026 00:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790987072;
	bh=aKa+6vV6kkTqtq9G2KZj/NeNI4iyajbFnzjmlwkUFPQ=;
	h=Date:From:To:Cc:Subject;
	b=INDdHu0op5saSf6BpebXK/5RQpbmmWu1S9sAri7PiGmmCQ7oLajhiqBBre6m4lx6L
	 w9VuH7ffB8p633s4wgGtgApOC9UN80A8RocsfQXiGtOt2J7YzB1327SbpX4ML1Uebc
	 BHs2esF+oyBKD6VYwH4JuGt+Cwy0dgJBNjc1tM6rP0uro0EqTvSJ/yAvjHBanc+Leh
	 AhblQAJycB960PnV4bAdUbP/4zwygaLe1V82AdqTBbGNBiXbyZC325lCik2kw0OZ1e
	 rtD5lW3DLE+52mCHZiDRnDK1bd3302KMpy3d75RWfsSMU03wWTw0tuu9DIII4168id
	 ECokhRULSR8VQ==
Date: Sat, 3 Oct 2026 09:24:28 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Leon Hwang <leon.hwang@linux.dev>, Masami Hiramatsu (Google)
 <mhiramat@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] probes: Fixes for v7.3-rc5
Message-Id: <20261003092428.77fca44f8fa79bf95a1711c1@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Linus,

Probes fixes for v7.3-rc5:

- fprobe: Use guard(rcu_sched_notrace) and check rcu_is_watching():
   Exit handlers early if !rcu_is_watching() to prevent potential
   use-after-free during unregistration in idle/quiescent states. Switch
   to guard(rcu_sched_notrace) to avoid fast-path lockdep overhead and
   recursion while ensuring safe grace period synchronization.

- kprobes: Skip disarmed probes when checking optkprobe overlap:
   Continue past disarmed or unprepared probes in get_optimized_kprobe()
   to find active optimized probes. This avoids overwriting active jump
   displacements which can lead to panic.


Please pull the latest probes-fixes-v7.3-rc5 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
probes-fixes-v7.3-rc5

Tag SHA1: 6306ca9d4f07bccf04980b6a4031476e36037f3b
Head SHA1: 7a39c732a22ec4a369af9e19fbe3d666ec83eec4


Leon Hwang (1):
      kprobes: Skip disarmed probes when checking optkprobe overlap

Masami Hiramatsu (Google) (1):
      fprobe: Use guard(rcu_sched_notrace) and check rcu_is_watching()

----
 kernel/kprobes.c      |  8 +++++---
 kernel/trace/fprobe.c | 26 ++++++++++++++++----------
 2 files changed, 21 insertions(+), 13 deletions(-)
---------------------------
diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index 4edd8ca5c657..e787e4948c8b 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -496,14 +496,16 @@ static bool kprobe_queued(struct kprobe *p)
 static struct kprobe *get_optimized_kprobe(kprobe_opcode_t *addr)
 {
 	int i;
-	struct kprobe *p = NULL;
+	struct kprobe *p;
 	struct optimized_kprobe *op;
 
 	/* Don't check i == 0, since that is a breakpoint case. */
-	for (i = 1; !p && i < MAX_OPTIMIZED_LENGTH / sizeof(kprobe_opcode_t); i++)
+	for (i = 1; i < MAX_OPTIMIZED_LENGTH / sizeof(kprobe_opcode_t); i++) {
 		p = get_kprobe(addr - i);
+		/* A disabled probe can have prepared, but inactive, optinsns. */
+		if (!p || !kprobe_optready(p) || kprobe_disarmed(p))
+			continue;
 
-	if (p && kprobe_optready(p)) {
 		op = container_of(p, struct optimized_kprobe, kp);
 		if (arch_within_optimized_kprobe(op, addr))
 			return p;
diff --git a/kernel/trace/fprobe.c b/kernel/trace/fprobe.c
index 9f2d98181779..da286619c5d8 100644
--- a/kernel/trace/fprobe.c
+++ b/kernel/trace/fprobe.c
@@ -47,6 +47,10 @@ static struct rhltable fprobe_ip_table;
 static DEFINE_MUTEX(fprobe_mutex);
 static struct fgraph_ops fprobe_graph_ops;
 
+DEFINE_LOCK_GUARD_0(rcu_sched_notrace,
+		    rcu_read_lock_sched_notrace(),
+		    rcu_read_unlock_sched_notrace())
+
 static u32 fprobe_node_hashfn(const void *data, u32 len, u32 seed)
 {
 	return hash_ptr(*(unsigned long **)data, 32);
@@ -329,16 +333,14 @@ static void fprobe_ftrace_entry(unsigned long ip, unsigned long parent_ip,
 	struct fprobe *fp;
 	int bit;
 
+	if (!rcu_is_watching())
+		return;
+
 	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
 		return;
 
-	/*
-	 * ftrace_test_recursion_trylock() disables preemption, but
-	 * rhltable_lookup() checks whether rcu_read_lcok is held.
-	 * So we take rcu_read_lock() here.
-	 */
-	rcu_read_lock();
+	guard(rcu_sched_notrace)();
 	head = rhltable_lookup(&fprobe_ip_table, &ip, fprobe_rht_params);
 
 	rhl_for_each_entry_rcu(node, pos, head, hlist) {
@@ -353,7 +355,6 @@ static void fprobe_ftrace_entry(unsigned long ip, unsigned long parent_ip,
 		else
 			__fprobe_handler(ip, parent_ip, fp, fregs, NULL);
 	}
-	rcu_read_unlock();
 	ftrace_test_recursion_unlock(bit);
 }
 NOKPROBE_SYMBOL(fprobe_ftrace_entry);
@@ -567,10 +568,13 @@ static int fprobe_fgraph_entry(struct ftrace_graph_ent *trace, struct fgraph_ops
 	struct fprobe *fp;
 	int used, ret;
 
+	if (!rcu_is_watching())
+		return 0;
+
 	if (WARN_ON_ONCE(!fregs))
 		return 0;
 
-	guard(rcu)();
+	guard(rcu_sched_notrace)();
 	head = rhltable_lookup(&fprobe_ip_table, &func, fprobe_rht_params);
 	reserved_words = 0;
 	rhl_for_each_entry_rcu(node, pos, head, hlist) {
@@ -665,13 +669,16 @@ static void fprobe_return(struct ftrace_graph_ret *trace,
 	int size, curr;
 	int size_words;
 
+	if (!rcu_is_watching())
+		return;
+
 	fgraph_data = (unsigned long *)fgraph_retrieve_data(gops->idx, &size);
 	if (WARN_ON_ONCE(!fgraph_data))
 		return;
 	size_words = SIZE_IN_LONG(size);
 	ret_ip = ftrace_regs_get_instruction_pointer(fregs);
 
-	preempt_disable_notrace();
+	guard(rcu_sched_notrace)();
 
 	curr = 0;
 	while (size_words > curr) {
@@ -687,7 +694,6 @@ static void fprobe_return(struct ftrace_graph_ret *trace,
 		}
 		curr += size;
 	}
-	preempt_enable_notrace();
 }
 NOKPROBE_SYMBOL(fprobe_return);
 

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
