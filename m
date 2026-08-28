Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45275369D60
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.69.130.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931676; cv=none; b=rk0uMjdq2qPHSaPGSGrxVdjjM0jyiA7y42nV8UXLtAC+tzikbOXWc143XMPqLqiJcIyEhWADKV0GltFwuU1B2hW7ukife0nE8kc9JZbCBy4SqsJ9ZGP51cB6IaO0ZtbM/VeGzXh6Zgy8UL54jWlfjSG7XYaRRP1UhTk430FmnzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931676; c=relaxed/simple;
	bh=WNns8viny/2WJbIUPFjH3LBFLJG7s3VzHGVJtwZZrak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u9UzE2VVbxQuPTUq4c5FrH4ptSC1qqEK1CkXmJo1VrQ7c6B+TII8l1uAc343dwzQxFOsnJu2YWUl2yV1sjrIuFbEunphdKJdQF8Af+5MFyeDggNBc5omIoYLFRqvZN9fQCGXXOY/A9eR1chJIHWysgwX4ysDzTjqS3icVHxymq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=XMOorbxQ; arc=none smtp.client-ip=158.69.130.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="XMOorbxQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1787931237;
	bh=dkAdbX6C4yV4urrZ88atFWLuos5sbXNdTh5kny1Q5wo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XMOorbxQxhymAlJAXFWkMFvHaEFMYNpKdUPEuiSC5hd2o2JwqffHxIsqWE7fzTn5a
	 9ZdaetYF0XpR+fBpRQE2hHYenw/oce1HcYxq16zIzgde5CyR/OBnmlVhLjUn6OG75I
	 dGN/0F7SgGnDO7h0PUxKfAxMdiaMTjEjs+l2GHcsR5oKHBKxO/hKJJ/Tgl9In6xS7n
	 3jDXWn+qSi/htPl/HzuB/E9Nl5e5P/u3pVOklpgr8aqVYig59AOp+mIIpPvJBTxcg0
	 4GFu4ZYyeHvk/Y3hC8xhlyWi2ZRPhcphTvExZlN9pkPmcQon6gfRYExe55kWI3Nmln
	 zM7lWmQQLVhOg==
Received: from laura.localdomain (199-193-172-8.cpe.axion.ca [199.193.172.8])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4hWj914mh1zSNW;
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
Subject: [RFC PATCH 3/5] rseq: apply operations on exit to user space
Date: Fri, 28 Aug 2026 11:33:41 -0400
Message-ID: <20260828153349.8061-4-odion@efficios.com>
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

Add rseq_apply_ops(), which walks the task's circular operation list on
return to user space and applies each operation.

Wire the walk into rseq_exit_user_update() for both the ids-unchanged
and ids-changed paths, gated on rseq_event::rseq_op. Since operation
processing is a persistent per-task state rather than a one-shot event,
introduce rseq_clear_one_shot_events() which preserves the rseq_op bit
when clearing events on the way out.

len, src and dst are re-read from user memory and re-validated on every
application, since user space may change them after registration. A
broken ABI contract will fault the process.

Signed-off-by: Olivier Dion <odion@efficios.com>
---
 include/linux/rseq_entry.h | 157 +++++++++++++++++++++++++++++++++++--
 1 file changed, 152 insertions(+), 5 deletions(-)

diff --git a/include/linux/rseq_entry.h b/include/linux/rseq_entry.h
index ed9da6e41a2a..df083b0ee14a 100644
--- a/include/linux/rseq_entry.h
+++ b/include/linux/rseq_entry.h
@@ -247,6 +247,137 @@ static __always_inline bool rseq_grant_slice_extension(unsigned long ti_work, un
 #define rseq_slice_clear_user(rseq, efault) do { } while (0)
 #endif /* !CONFIG_RSEQ_SLICE_EXTENSION */
 
+/*
+ * Validate and perform a single reset word operation: reset @dst to *@src,
+ * or to zero when @src is 0. @len, @src and @dst come from user memory and
+ * are re-validated on every application, since user space may have changed
+ * them since registration. A broken ABI contract returns false, which faults
+ * the process.
+ */
+static __always_inline bool rseq_op_reset_word(u64 src, u64 dst, u32 len,
+					       void __user *node)
+{
+	if (unlikely(!IS_ALIGNED(dst, len) || (src && !IS_ALIGNED(src, len)))) {
+		pr_info_ratelimited("rseq: bad operation alignment len=%u src=%llx dst=%llx from %p\n",
+				len, src, dst, node);
+		return false;
+	}
+
+	switch (len) {
+	case 4: {
+		u32 __user *udst = (u32 __user *)dst;
+		u32 v = 0;
+
+		if (src) {
+			u32 __user *usrc = (u32 __user *)src;
+
+			scoped_user_read_access(usrc, efault)
+				unsafe_get_user(v, usrc, efault);
+		}
+		scoped_user_write_access(udst, efault)
+			unsafe_put_user(v, udst, efault);
+		return true;
+	}
+	case 8: {
+		u64 __user *udst = (u64 __user *)dst;
+		u64 v = 0;
+
+		if (src) {
+			u64 __user *usrc = (u64 __user *)src;
+
+			scoped_user_read_access(usrc, efault)
+				unsafe_get_user(v, usrc, efault);
+		}
+		scoped_user_write_access(udst, efault)
+			unsafe_put_user(v, udst, efault);
+		return true;
+	}
+	default:
+		pr_info("rseq: bad operation length=%u from %p\n", len, node);
+		return false;
+	}
+efault:
+	pr_info("rseq: fault while applying operation from %p\n", node);
+	return false;
+}
+
+static __always_inline bool rseq_apply_ops(struct task_struct *t)
+{
+	struct rseq __user *rseq = t->rseq.usrptr;
+	struct rseq_op_node __user *sentinel = &rseq->rseq_op_list;
+	struct rseq_op_node __user *node;
+	unsigned int limit = RSEQ_OP_LIST_LIMIT;
+	u64 next;
+
+	WARN_ONCE(!t->rseq.event.rseq_op, "rseq operations not enabled");
+
+	scoped_user_read_access(sentinel, efault)
+		unsafe_get_user(next, &sentinel->next, efault);
+
+	node = (struct rseq_op_node __user *)next;
+
+	while (node != sentinel && limit--) {
+		u8 type;
+
+		scoped_user_read_access(node, efault) {
+			unsafe_get_user(type, &node->type, efault);
+			unsafe_get_user(next, &node->next, efault);
+		}
+
+		switch (type) {
+		case RSEQ_OP_RESET: {
+			struct rseq_op_reset __user *op =
+				(struct rseq_op_reset __user *)node;
+			u64 src, dst;
+			u32 len;
+
+			scoped_user_read_access(op, efault) {
+				unsafe_get_user(src, &op->src, efault);
+				unsafe_get_user(dst, &op->dst, efault);
+				unsafe_get_user(len, &op->len, efault);
+			}
+
+			if (!rseq_op_reset_word(src, dst, len, node))
+				return false;
+			break;
+		}
+		case RSEQ_OP_RESET_WITH_STRIDE_CPUID: /* fall through */
+		case RSEQ_OP_RESET_WITH_STRIDE_MMCID: {
+			struct rseq_op_reset_with_stride __user *op =
+				(struct rseq_op_reset_with_stride __user *)node;
+			u64 src, dst, dst_stride;
+			u32 len, index;
+
+			scoped_user_read_access(op, efault) {
+				unsafe_get_user(src, &op->src, efault);
+				unsafe_get_user(dst, &op->dst, efault);
+				unsafe_get_user(dst_stride, &op->dst_stride, efault);
+				unsafe_get_user(len, &op->len, efault);
+			}
+			index = (type == RSEQ_OP_RESET_WITH_STRIDE_CPUID) ?
+				t->rseq.ids.cpu_id : t->rseq.ids.mm_cid;
+			dst += dst_stride * index;
+
+			if (!rseq_op_reset_word(src, dst, len, node))
+				return false;
+
+			break;
+		}
+		default:
+			pr_info("rseq: bad operation type=%u from %p\n",
+				type, node);
+			return false;
+		}
+
+		node = (struct rseq_op_node __user *)next;
+	}
+
+	return node == sentinel;
+efault:
+	pr_info("rseq: fault while walking operation list\n");
+	return false;
+}
+
 bool rseq_debug_update_user_cs(struct task_struct *t, struct pt_regs *regs, unsigned long csaddr);
 
 static __always_inline void rseq_note_user_irq_entry(void)
@@ -632,6 +763,10 @@ static __always_inline bool rseq_exit_user_update(struct pt_regs *regs, struct t
 			if (unlikely(!rseq_update_user_cs(t, regs, csaddr)))
 				return false;
 		}
+
+		if (t->rseq.event.rseq_op && !rseq_apply_ops(t))
+			return false;
+
 		return true;
 	}
 
@@ -642,11 +777,22 @@ static __always_inline bool rseq_exit_user_update(struct pt_regs *regs, struct t
 		.node_id = cpu_to_node(cpu),
 	};
 
-	return rseq_update_usr(t, regs, &ids);
+	if (!rseq_update_usr(t, regs, &ids))
+		return false;
+
+	if (t->rseq.event.rseq_op && !rseq_apply_ops(t))
+		return false;
+
+	return true;
 efault:
 	return false;
 }
 
+static __always_inline void rseq_clear_one_shot_events(struct rseq_event *ev)
+{
+	ev->events &= (struct rseq_event){ .rseq_op = true }.events;
+}
+
 static __always_inline bool __rseq_exit_to_user_mode_restart(struct pt_regs *regs)
 {
 	struct task_struct *t = current;
@@ -674,8 +820,9 @@ static __always_inline bool __rseq_exit_to_user_mode_restart(struct pt_regs *reg
 		if (unlikely(!rseq_exit_user_update(regs, t)))
 			return true;
 	}
-	/* Clear state so next entry starts from a clean slate */
-	t->rseq.event.events = 0;
+	/* Clear one-shot events so next entry starts from a clean slate */
+	rseq_clear_one_shot_events(&t->rseq.event);
+
 	return false;
 }
 
@@ -730,7 +877,7 @@ static __always_inline void rseq_syscall_exit_to_user_mode(void)
 	/* Needed to remove the store for the !lockdep case */
 	if (IS_ENABLED(CONFIG_LOCKDEP)) {
 		WARN_ON_ONCE(ev->sched_switch);
-		ev->events = 0;
+		rseq_clear_one_shot_events(ev);
 	}
 }
 
@@ -747,7 +894,7 @@ static __always_inline void rseq_irqentry_exit_to_user_mode(void)
 	 * interrupt did not result in a schedule and therefore the
 	 * rseq processing could not clear it.
 	 */
-	ev->events = 0;
+	rseq_clear_one_shot_events(ev);
 }
 
 void __rseq_debug_syscall_return(struct pt_regs *regs);
-- 
2.54.0

