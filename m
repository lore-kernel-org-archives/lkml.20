Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4513F369225
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.69.130.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931676; cv=none; b=UBudoo6tqSES0b9SgKKEfRPUsQ9UP6cHOTUwIEG7Aw5hHDUceXO8lhOthbtAxmUiQNuPETEwq68+ywxHuYlXkwkZKjASg5KQQAs2WJy/VWC5w+yB56btKeraUbaXgLVlFaV5LtUdXA7YN/BUGVoIfAN0OFH6p77ucCInVWcWUCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931676; c=relaxed/simple;
	bh=LxsOcjm6T6TGxVtZFKZeBX3WPoCIdhvpHW4CNWEtAgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=axYQ2d1xNdQ8TulwQMOGzH4Ga/oyJQXscLn7WFHBk3TRCh6fGnt+DWfvjJb4R/mApQNEluXTuNDPG8dLdyGrs7VFitMGaz2+CGLjD51fprOJLOeMD+s2+5uzvFLvfmFaoGXdZAi37YNOYCGyFsbe+HKeWau10ACNlOWdLaLAoQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=ePSdnMsJ; arc=none smtp.client-ip=158.69.130.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="ePSdnMsJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1787931238;
	bh=5V6XawWF2fwKJpYjSWTgOA6QLkuanYWwMg4glTCKIGo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ePSdnMsJjfJxlsSrF/SP7O0aBdutdmtpTUR55F64yIC8Z6jjeZvXMU1uDL0S6U2UB
	 QlmQ0Tz8SCp7C4xCS9ZVqZbRs0vxFM33VObmWDH0D1cJ8aB76i+yAi6DFK7LRMJKea
	 n9k5uoJa1mxo8K1YwRDM5x7rn5EjOvM7VQa6AtN8w9AdOoigJvsnZmMVBZNaA9BtIK
	 AUw4Sm5c0lEKrP9Okn2KRKV76SLbP0JLQaDLWl40/2bTa2UFYPGb8OfhYk2ecQuaKX
	 xAzFW1ToU3TZZBq+wTro1k/zSHVWx0Zs3GceANP96XM1gRpB42/PS34mpN6E9gc63u
	 6+ir0LFjKDnLg==
Received: from laura.localdomain (199-193-172-8.cpe.axion.ca [199.193.172.8])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4hWj916ySpzTCb;
	Fri, 28 Aug 2026 11:33:57 -0400 (EDT)
From: odion@efficios.com
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	David Matlack <dmatlack@google.com>,
	Marco Elver <elver@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Wei Liu <wei.liu@kernel.org>,
	Florian Weimer <fweimer@redhat.com>,
	Mathias Stearn <mathias@mongodb.com>,
	Chris Kennelly <ckennelly@google.com>,
	Blake Oler <blake.oler@mongodb.com>,
	Rich Felker <dalias@libc.org>,
	Matthew Wilcox <willy@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Carlos O'Donell <codonell@redhat.com>,
	Olivier Dion <odion@efficios.com>
Subject: [RFC PATCH 4/5] rseq: register and unregister operations via prctl
Date: Fri, 28 Aug 2026 11:33:42 -0400
Message-ID: <20260828153349.8061-5-odion@efficios.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260828153349.8061-1-odion@efficios.com>
References: <20260828153349.8061-1-odion@efficios.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Olivier Dion <odion@efficios.com>

Implement the PR_RSEQ_OP prctl. Registration splices a user-provided
pristine node into the head of the circular operation list, and
unregistration unsplices it after validating it is properly linked
between its neighbours; the kernel owns the node's next/prev links for
the lifetime of the registration. The 0<->1 nr_ops transition reflects
the enabled state into rseq_event::rseq_op and the user visible flag via
rseq_op_update_enabled().

Initialize the operation list sentinel as an empty self-pointing circular
list on rseq registration, and reset nr_ops / rseq_op state there.

Apply pending operations on the slow path and on signal delivery, and
factor the common "clear error and force SIGSEGV" fixup into
force_fault().

Signed-off-by: Olivier Dion <odion@efficios.com>
---
 kernel/rseq.c | 220 +++++++++++++++++++++++++++++++++++++++++++++++---
 kernel/sys.c  |   5 ++
 2 files changed, 212 insertions(+), 13 deletions(-)

diff --git a/kernel/rseq.c b/kernel/rseq.c
index e75e3a5e312c..a277c11dae99 100644
--- a/kernel/rseq.c
+++ b/kernel/rseq.c
@@ -253,17 +253,18 @@ static bool rseq_handle_cs(struct task_struct *t, struct pt_regs *regs)
 static void rseq_slowpath_update_usr(struct pt_regs *regs)
 {
 	/*
-	 * Preserve has_rseq and user_irq state. The generic entry code clears
-	 * user_irq on the way out, the non-generic entry architectures are not
-	 * setting user_irq.
+	 * Preserve has_rseq, rseq_op and user_irq state. The generic entry
+	 * code clears user_irq on the way out, the non-generic entry
+	 * architectures are not setting user_irq.
 	 */
 	const struct rseq_event evt_mask = {
 		.has_rseq	= RSEQ_HAS_RSEQ_VERSION_MASK,
+		.rseq_op	= true,
 		.user_irq	= true,
 	};
 	struct task_struct *t = current;
 	struct rseq_ids ids;
-	bool event;
+	bool event, should_fault = false;
 
 	if (unlikely(t->flags & PF_EXITING))
 		return;
@@ -300,7 +301,12 @@ static void rseq_slowpath_update_usr(struct pt_regs *regs)
 
 	ids.node_id = cpu_to_node(ids.cpu_id);
 
-	if (unlikely(!rseq_update_usr(t, regs, &ids))) {
+	if (unlikely(!rseq_update_usr(t, regs, &ids)))
+		should_fault = true;
+	else if (t->rseq.event.rseq_op && unlikely(!rseq_apply_ops(t)))
+		should_fault = true;
+
+	if (should_fault) {
 		/*
 		 * Clear the errors just in case this might survive magically, but
 		 * leave the rest intact.
@@ -329,8 +335,20 @@ void __rseq_handle_slowpath(struct pt_regs *regs)
 	rseq_slowpath_update_usr(regs);
 }
 
+static inline void force_fault(int sig)
+{
+	/*
+	 * Clear the errors just in case this might survive magically, but leave
+	 * the rest intact.
+	 */
+	current->rseq.event.error = 0;
+	force_sigsegv(sig);
+}
+
 void __rseq_signal_deliver(int sig, struct pt_regs *regs)
 {
+	bool should_fault = false;
+
 	rseq_stat_inc(rseq_stats.signal);
 
 	/*
@@ -339,14 +357,13 @@ void __rseq_signal_deliver(int sig, struct pt_regs *regs)
 	 * the interrupted context as after this point the instruction
 	 * pointer in @regs points to the signal handler.
 	 */
-	if (unlikely(!rseq_handle_cs(current, regs))) {
-		/*
-		 * Clear the errors just in case this might survive
-		 * magically, but leave the rest intact.
-		 */
-		current->rseq.event.error = 0;
-		force_sigsegv(sig);
-	}
+	if (unlikely(!rseq_handle_cs(current, regs)))
+		should_fault = true;
+	else if (current->rseq.event.rseq_op && unlikely(!rseq_apply_ops(current)))
+		should_fault = true;
+
+	if (should_fault)
+		force_fault(sig);
 
 	/*
 	 * In legacy mode, force the update of IDs before returning to user
@@ -436,6 +453,8 @@ static long rseq_register(struct rseq __user * rseq, u32 rseq_len, int flags, u3
 				rseqfl |= RSEQ_CS_FLAG_SLICE_EXT_ENABLED;
 		}
 	}
+	if (version > 1)
+		rseqfl |= RSEQ_CS_FLAG_RSEQ_OP_AVAILABLE;
 
 	scoped_user_write_access(rseq, efault) {
 		/*
@@ -458,8 +477,16 @@ static long rseq_register(struct rseq __user * rseq, u32 rseq_len, int flags, u3
 		 * registrations.
 		 */
 		if (version > 1) {
+			u64 sentinel = (u64)&rseq->rseq_op_list;
+
 			if (IS_ENABLED(CONFIG_RSEQ_SLICE_EXTENSION))
 				unsafe_put_user(0U, &rseq->slice_ctrl.all, efault);
+			/*
+			 * Initialize the rseq operation list sentinel as an
+			 * empty circular doubly-linked list pointing to itself.
+			 */
+			unsafe_put_user(sentinel, &rseq->rseq_op_list.next, efault);
+			unsafe_put_user(sentinel, &rseq->rseq_op_list.prev, efault);
 		}
 	}
 
@@ -474,6 +501,12 @@ static long rseq_register(struct rseq __user * rseq, u32 rseq_len, int flags, u3
 #ifdef CONFIG_RSEQ_SLICE_EXTENSION
 	current->rseq.slice.state.enabled = !!(rseqfl & RSEQ_CS_FLAG_SLICE_EXT_ENABLED);
 #endif
+	/*
+	 * A fresh registration starts with no operations, so operation
+	 * processing is disabled until the first one is registered.
+	 */
+	current->rseq.event.rseq_op = false;
+	current->rseq.nr_ops = 0;
 
 	/*
 	 * Ensure the cpu_id_start and cpu_id fields are updated before
@@ -887,3 +920,164 @@ device_initcall(rseq_slice_init);
 #else
 static void rseq_slice_ext_init(struct dentry *root_dir) { }
 #endif /* CONFIG_RSEQ_SLICE_EXTENSION */
+
+/*
+ * Reflect the operation enabled state into the user visible flags field.
+ * Called on the 0<->1 transition of nr_ops. The kill path is taken on fault
+ * because losing this update leaves user space and kernel state inconsistent.
+ */
+static int rseq_op_update_enabled(struct task_struct *t, bool enable)
+{
+	struct rseq __user *rseq = t->rseq.usrptr;
+	u32 rflags;
+
+	if (get_user(rflags, &rseq->flags))
+		return -EFAULT;
+
+	rflags &= ~RSEQ_CS_FLAG_RSEQ_OP_ENABLED;
+	rflags |= RSEQ_CS_FLAG_RSEQ_OP_AVAILABLE;
+	if (enable)
+		rflags |= RSEQ_CS_FLAG_RSEQ_OP_ENABLED;
+
+	if (put_user(rflags, &rseq->flags))
+		return -EFAULT;
+
+	t->rseq.event.rseq_op = enable;
+	return 0;
+}
+
+/*
+ * Register @node at the head of the circular doubly-linked operation list
+ * anchored by the kernel owned sentinel in struct rseq.
+ */
+static int rseq_op_register(struct task_struct *t, struct rseq_op_node __user *node)
+{
+	struct rseq_op_node __user *sentinel = &t->rseq.usrptr->rseq_op_list;
+	struct rseq_op_node __user *first;
+	u64 next, prev, first_addr;
+	u8 type, i;
+
+	if (t->rseq.nr_ops >= RSEQ_OP_LIST_LIMIT)
+		return -ENOSPC;
+
+	if (!IS_ALIGNED((unsigned long)node, __alignof__(struct rseq_op_node)))
+		return -EINVAL;
+	if (!access_ok(node, sizeof(*node)))
+		return -EFAULT;
+
+	/*
+	 * The node links are owned by the kernel. User space must present a
+	 * pristine node: next, prev and the reserved bytes all zeroed, and a
+	 * known operation type.
+	 */
+	if (get_user(next, &node->next) || get_user(prev, &node->prev) ||
+	    get_user(type, &node->type))
+		return -EFAULT;
+	if (next || prev)
+		return -EINVAL;
+	if (type >= RSEQ_OP_NR)
+		return -EINVAL;
+	for (i = 1; i < sizeof(node->reserved); i++) {
+		u8 r;
+
+		if (get_user(r, &node->reserved[i]))
+			return -EFAULT;
+		if (r)
+			return -EINVAL;
+	}
+
+	/* Splice the node in right after the sentinel. */
+	if (get_user(first_addr, &sentinel->next))
+		goto die;
+	first = (struct rseq_op_node __user *)first_addr;
+
+	if (put_user((u64)(unsigned long)first, &node->next) ||
+	    put_user((u64)(unsigned long)sentinel, &node->prev) ||
+	    put_user((u64)(unsigned long)node, &first->prev) ||
+	    put_user((u64)(unsigned long)node, &sentinel->next))
+		goto die;
+
+	t->rseq.nr_ops += 1;
+
+	if (t->rseq.nr_ops == 1)
+		return rseq_op_update_enabled(t, true) ? -EFAULT : 0;
+	return 0;
+die:
+	force_sig(SIGSEGV);
+	return -EFAULT;
+}
+
+/*
+ * Unregister @node from the operation list. The node links are validated
+ * against its neighbours to reject bogus or double unregistration.
+ */
+static int rseq_op_unregister(struct task_struct *t, struct rseq_op_node __user *node)
+{
+	struct rseq_op_node __user *prev, *next;
+	u64 prev_addr, next_addr, tmp;
+
+	if (!t->rseq.nr_ops)
+		return -ENOENT;
+
+	if (!IS_ALIGNED((unsigned long)node, __alignof__(struct rseq_op_node)))
+		return -EINVAL;
+	if (!access_ok(node, sizeof(*node)))
+		return -EFAULT;
+
+	if (get_user(next_addr, &node->next) || get_user(prev_addr, &node->prev))
+		return -EFAULT;
+	prev = (struct rseq_op_node __user *)prev_addr;
+	next = (struct rseq_op_node __user *)next_addr;
+
+	/* A registered node always has both links set. */
+	if (!prev || !next)
+		return -EINVAL;
+
+	/* Verify the node is properly linked between its neighbours. */
+	if (get_user(tmp, &prev->next))
+		goto die;
+	if (tmp != (u64)(unsigned long)node)
+		return -EINVAL;
+	if (get_user(tmp, &next->prev))
+		goto die;
+	if (tmp != (u64)(unsigned long)node)
+		return -EINVAL;
+
+	/* Unsplice and clear the node links so it can be reused. */
+	if (put_user(next_addr, &prev->next) ||
+	    put_user(prev_addr, &next->prev) ||
+	    put_user(0ULL, &node->next) ||
+	    put_user(0ULL, &node->prev))
+		goto die;
+
+	t->rseq.nr_ops -= 1;
+
+	if (t->rseq.nr_ops == 0)
+		return rseq_op_update_enabled(t, false) ? -EFAULT : 0;
+	return 0;
+die:
+	force_sig(SIGSEGV);
+	return -EFAULT;
+}
+
+int rseq_op_prctl(unsigned long arg2, unsigned long arg3)
+{
+	struct rseq_op_node __user *node = (struct rseq_op_node __user *)arg3;
+	struct task_struct *t = current;
+
+	if (!t->rseq.usrptr)
+		return -ENXIO;
+	if (!rseq_v2(t))
+		return -ENOTSUPP;
+	if (!node)
+		return -EINVAL;
+
+	switch (arg2) {
+	case PR_RSEQ_OP_REGISTER:
+		return rseq_op_register(t, node);
+	case PR_RSEQ_OP_UNREGISTER:
+		return rseq_op_unregister(t, node);
+	default:
+		return -EINVAL;
+	}
+}
diff --git a/kernel/sys.c b/kernel/sys.c
index df69bd71de03..494c91b03c3f 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2889,6 +2889,11 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 			return -EINVAL;
 		error = rseq_slice_extension_prctl(arg2, arg3);
 		break;
+	case PR_RSEQ_OP:
+		if (arg4 || arg5)
+			return -EINVAL;
+		error = rseq_op_prctl(arg2, arg3);
+		break;
 	case PR_GET_CFI:
 		if (arg2 != PR_CFI_BRANCH_LANDING_PADS)
 			return -EINVAL;
-- 
2.54.0

