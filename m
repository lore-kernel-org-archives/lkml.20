Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453FA369D6E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.69.130.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931675; cv=none; b=aOsIcdnmVs8qpt24jrtZauYm3vim4lPgDLJzX06mJ5cKTCHnIDN6cA/wrDcGzb6X2YBszCiG9SapjoxaNa0xQhLDD5BhhzEG4K5FewmJrXdaXw0/wHQHchqAoTY6xqcQkn3awiWjD+5QhH64XRXx2ArDADUttGtAfmKWMBcoyxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931675; c=relaxed/simple;
	bh=E9d8N9EeeOpwm9M+PlRsmfUC4jVIvkf0iXl59EcBCFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KP7tRaZQ9wn3tgneQLkxQBzu2MsmS3FWZNIzq3QouOpECfpa1M3PUEelY7lUxWcDTo5vtS9iQZ+ihbAb1z9Z5f9XuiPOksIAqEmSMyZLn0cMBTosQuzR8W1OBEhpaaynyA3XvzI97Zhz9AkFZxXuavnXVlB7ykJsF9IepqV1Op8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=lAtZHNdY; arc=none smtp.client-ip=158.69.130.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="lAtZHNdY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1787931237;
	bh=TNUZtdikO0Z4HeeE4t3Hz9wtWi9KTEiLCEoF5STwecc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lAtZHNdYzqmEZRtKXcBDPdKbqSpCOuQ23B0JolKDdr1e9c+iW9u+hrOPo8EOXF0A8
	 nwQU7RZkE5wbEXiPx1hkliIZAuDkW14WdCAcB3nJvca55FfKfjji6mLBRWiZs1yCe8
	 baxN/Nu0U8QtEz9yYgIO8k1S0ZMgaFdvXmbLnIiDUnb1D+gSpesX/XX2UP6HFGew/U
	 JArQ0pjD+vnQfJuRVZFEnDLmN3gO0Vh3WddI+dlIQYdck/doB3pFm8CLzQlUk/ASPR
	 KPEDgo0ESAiNNuor5IweJkxdHWuvbRjn7cj7BB4KORPDL5PxMDgTdCL+fZtXA5uIgl
	 6CYj3e5GkvUYQ==
Received: from laura.localdomain (199-193-172-8.cpe.axion.ca [199.193.172.8])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4hWj912JJ1zTCZ;
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
Subject: [RFC PATCH 2/5] rseq: add per-task rseq operation state
Date: Fri, 28 Aug 2026 11:33:40 -0400
Message-ID: <20260828153349.8061-3-odion@efficios.com>
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

Add the task-side state for rseq operations: the rseq_event::rseq_op
state indicating operation processing is enabled for the task, and the
nr_ops counter in struct rseq_data. nr_ops is edge triggered: its 0<->1
transition enables/disables rseq_event::rseq_op and the user visible
RSEQ_CS_FLAG_RSEQ_OP_ENABLED flag. This makes so that only thread that
enable RSEQ operations through prctl takes a performance hit.

Include rseq_op in the sched-switch raise condition so pending operations
force a return through the rseq exit path, and declare the rseq_op_prctl()
entry point (with a CONFIG_RSEQ=n stub).

Signed-off-by: Olivier Dion <odion@efficios.com>
---
 include/linux/rseq.h       | 10 +++++++++-
 include/linux/rseq_types.h |  9 +++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/include/linux/rseq.h b/include/linux/rseq.h
index 7ef79b25e714..d1e33906d863 100644
--- a/include/linux/rseq.h
+++ b/include/linux/rseq.h
@@ -69,7 +69,9 @@ static __always_inline void rseq_sched_switch_event(struct task_struct *t)
 		 * was via interrupt from user space. ev->has_rseq does not have
 		 * to be evaluated here because rseq_v2() implies has_rseq.
 		 */
-		bool raise = ev->user_irq | ev->ids_changed;
+		bool raise = (ev->user_irq |
+			      ev->ids_changed |
+			      ev->rseq_op);
 
 		if (raise) {
 			ev->sched_switch = true;
@@ -172,6 +174,8 @@ static inline unsigned int rseq_alloc_align(void)
 	return 1U << get_count_order(offsetof(struct rseq, end));
 }
 
+int rseq_op_prctl(unsigned long arg2, unsigned long arg3);
+
 #else /* CONFIG_RSEQ */
 static inline bool rseq_v2(struct task_struct *t) { return false; }
 static inline void rseq_handle_slowpath(struct pt_regs *regs) { }
@@ -182,6 +186,10 @@ static inline void rseq_force_update(void) { }
 static inline void rseq_virt_userspace_exit(void) { }
 static inline void rseq_fork(struct task_struct *t, u64 clone_flags) { }
 static inline void rseq_execve(struct task_struct *t) { }
+static inline int rseq_op_prctl(unsigned long arg2, unsigned long arg3)
+{
+	return -ENOTSUPP;
+}
 #endif  /* !CONFIG_RSEQ */
 
 #ifdef CONFIG_DEBUG_RSEQ
diff --git a/include/linux/rseq_types.h b/include/linux/rseq_types.h
index 85739a63e85e..059292695c34 100644
--- a/include/linux/rseq_types.h
+++ b/include/linux/rseq_types.h
@@ -23,6 +23,7 @@ struct rseq;
  *			exit to user
  * @ids_changed:	Indicator that IDs need to be updated
  * @user_irq:		True on interrupt entry from user mode
+ * @rseq_op:		Rseq operation processing is enabled for the task
  * @has_rseq:		Greater than 0 if the task has a rseq pointer installed.
  *			Contains the RSEQ version number
  * @error:		Compound error code for the slow path to analyze
@@ -44,6 +45,7 @@ struct rseq_event {
 					u8	sched_switch;
 					u8	ids_changed;
 					u8	user_irq;
+					u8	rseq_op;
 				};
 			};
 
@@ -115,6 +117,7 @@ struct rseq_slice {
  * @event:	Storage for event management
  * @ids:	Storage for cached CPU ID and MM CID
  * @slice:	Storage for time slice extension data
+ * @nr_ops:	Number of registered rseq operations
  */
 struct rseq_data {
 	struct rseq __user		*usrptr;
@@ -125,6 +128,12 @@ struct rseq_data {
 #ifdef CONFIG_RSEQ_SLICE_EXTENSION
 	struct rseq_slice		slice;
 #endif
+	/*
+	 * Number of rseq operations registered for the task. Edge triggered:
+	 * the 0<->1 transition enables/disables rseq_event::rseq_op and the
+	 * RSEQ_CS_FLAG_RSEQ_OP_ENABLED user flag.
+	 */
+	u32				nr_ops;
 };
 
 #else /* CONFIG_RSEQ */
-- 
2.54.0

