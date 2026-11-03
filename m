Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793728725;
	b=zT6IsmjLRXKMRtngHCCGDioFrYGT1YZoI7y+jfZOa75BGP8D50qMdBngbDXmqM/cHkq1
	 ORxB9QcV/2ofzOtNs5zmIhLDMb133Q1gnNN8VM2ZaVzjFFT1tgrr0K5v/3CoujvWe6fzY
	 oMfhZZC5AcE4s52ep4kxUsyjr8m2QcUxUF85YEyJunpuGd65hbNRMi+qTkb47NZw9HBTw
	 ENAE/G6zFeoObojpmb72WebgKry2eYTlUGO7mT0dHVCivtJKbShVzaGGkS6V9dyIWrRcK
	 KeoOIa8CyfNhMTq5QRsFnDsRSsRDO4PziBw4T82dJFNqoEAMR31MOnMSeobopnH+Biw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=PElxI0aYTQe7EyopaZuArpxV8n0ScCes61k5/emAHuk=;
	b=a5I3sAzatDa4x500mfN7UxSxPwklJEs5dStIHuC5CfkMkA/brYcFBcp+XmPFsjWD+RPJ
	 uKGn8/muMx35NF3rqdqysd4JPbyT+a4a6IheUY64QQurMFpDoISV4rXSeb3m5nSEWG8a6
	 8i9qCiQlGC1XgOuwnXkyi7+rsu+bPyoW3Rw08xpD3bmrOyJHZ6PRjiOD+Vz0oNws1etGw
	 uFUeg2qSqry0/XKWMCl4WAkVl8zrToptBq0hvmUzBigBfNJTD1SzYZUQsp4RGlzzvda4Q
	 UM2WU/9bx1akmR6gQ6XYrQtHwyZU93rDu2eYmd0i0/tLNEG5pQA4O2kLMVmgTFLGmGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0iMPh/WP";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B504D606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B504D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0iMPh/WP
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36661f953e4so6732425eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793728724; x=1794333524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PElxI0aYTQe7EyopaZuArpxV8n0ScCes61k5/emAHuk=;
        b=0iMPh/WPjxqV5uoKPvI4vwhDncTSqaRmwcWFHV7NdZS/iITtkwufMIJa+5PfwfFisB
         dgg/jP2TTAUmdvOFygojVZh8NcS9OjMMpoPy9TyECJuOv71nbPo8PUd+rp7RMjzVXk2Y
         IhXOwB5zYhNrJlPJ0OD8KQUnkSaaDoM7zSH3tjzWj6fQawxUzEozsqP411NMGtt26V+Q
         DY+iNdphHkOSzh1nu4DZuNCOZEZtU0tEe00RizbGEk7dUug7o3xMedBpc8zX6IfvWT5o
         UGPtRvm3LjKkFH0iaxnhkenYtmjgV5CwMA97cr3KZimoMs7eaGDLdnixmyxeZ5rXG6iC
         dMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728724; x=1794333524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PElxI0aYTQe7EyopaZuArpxV8n0ScCes61k5/emAHuk=;
        b=aLgH/0zb+F97mGi81AGpmW78k5HY0IdtvfRfQlP4kW8p5Ko+axsl6z99Y6wTxbgbCM
         Tbu1a9e/igJSBMkVbs5ZRbaxdtg8tYR9QHa06bSmNjRw6eZ766iTlkIBf4el4xxTcl2G
         gEWqX7jfB+VWJ0S35ARNMGNZxlpn7DufzeennybLEy07n9inywL/Sp0tA/EI49pxWhiI
         aSG74JgfsPC/4fSRFwMF5dmL8knmbUT/9HReNjB4kBz97GQPibGwUmKdkF2RZxSxljJl
         Ir3gPwQ21wJqVcfxkDFkGLqjQu9WepOlGqPwDNa01WfjAIsQExpz8dxP2lEHqfscApD0
         2tjw==
X-Gm-Message-State: APuU4Z8Au02nK//pfUFERBxQIGniUiA8p7/X5WLswtYLLuHl7gPH4WO5
	ymPyXK8AQfkbiLiXRdGwUjEaDlH9O0wAfOxcBOeYBkhhIckEQ4e7kn1l
X-Gm-Gg: AYBFou1I+oXudxPBcGhL668MLCNGGYORTxmMFDDeNyXGDHvBqhstsWEkDFr6AqXwqVY
	0u6ojsUDSbCRuwUKYjOqSdboA+21hSljFvr4u0tOQibEX+S2Rbi0qjYR7TgAZUlgzj2sECkkefP
	dcUWhLM5HZhpZNH6pGihheGbxgDTZz1aRy/AQIuk2V8lq7z7llrfYiNdRdRzn4R1uL7sDJ004Pp
	CHqR7ypAeK5ybproI4SRYP8/cr5hMyVDfHe+tNvGnL8Y9rp/YwOGv2cFVoiZ5VfRK0MN7/u0cwn
	ZP1q/3cRwpBLhL1GpOEJaqPtI2hW8nINPBznCywaBup0OwegiV4Wn9F6lDqtYtBFcpM8vWOAd3n
	BGdKuWxjtZiNu93jVKycl0oSUuNh4pdf8iAxPLwCd0cryxhchkJwc3HrT0bdvWwqntfMvG5CakS
	JSosV4fO5OUAa3ruMUHkWjePbRwNAEoirHSdBwqp7amyyPpyGDK1xfTc+Y8W04nfnoNe0F5WQ4i
	ysIsbb7B/v2xbMf/wTohGq6Bev2JXnzez0wrkler4NPougoX3UXV15vNnOfHGdp1j2+jXCLD0gL
	Gwhmiq372YyEItvFX7Nj8kMOm+uXuZPY0dYr9Mm2qtUP47FWcrbGTl3Lj7XnKRv5wJPX1b+gu8q
	wlg==
X-Received: by 2002:a05:7301:7e14:b0:367:363f:6fe4 with SMTP id 5a478bee46e88-36a423f6947mr18594964eec.32.1793728723530;
        Tue, 03 Nov 2026 09:58:43 -0800 (PST)
Received: from Terra.tail0ac356.ts.net ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42952e1csm52256902eec.20.2026.11.03.09.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:58:42 -0800 (PST)
From: Weiming Shi <bestswngs@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	co+bba0c6b49150bef3@bugs.sh,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] ftrace: Wait for graph readers before releasing operations
Date: Tue,  3 Nov 2026 09:58:30 -0800
Message-ID: <20261103175832.3374540-1-bestswngs@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

unregister_ftrace_graph() removes an operation from the graph array before
returning. A graph callback may already hold the operation or its filter,
however, while the caller can release them as soon as unregistration
completes.

This can happen without a hash update failure. For example, consider three
graph operations with identical filters where one also enables PID
filtering. Removing that operation leaves the manager hashes unchanged, so
an in-flight fgraph_pid_func() may call gops->saved_func after unregister
has cleared it.

Graph callbacks run with preemption disabled and may run while RCU is not
watching. Separate removing the operation from graph dispatch from waiting
for callbacks that may still be using it. Keep unregister_ftrace_graph()
synchronous by performing both steps, and require internal users of the
split interface to pair every successful removal with a reader wait.

For fprobes, unpublish the graph operation and release its slot
synchronously, then queue the reader waits and filter release. This keeps
the waits out of unregister_fprobe_async(). Flush the work before reusing
the shared graph operation.

Disable fprobe return dispatch before unpublishing the operation and check
that state inside the callback's RCU critical section. Re-enable dispatch
only after graph registration succeeds, so a return callback cannot use a
released fprobe while cleanup is pending.

Cc: stable@vger.kernel.org
Fixes: df3ec5da6a1e ("function_graph: Add pid tracing back to function graph tracer")
Reported-by: <co+bba0c6b49150bef3@bugs.sh>
Assisted-by: LLM
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 kernel/trace/fgraph.c          | 47 +++++++++++++++++++++++++++++++---
 kernel/trace/fprobe.c          | 21 ++++++++++++---
 kernel/trace/ftrace_internal.h |  2 ++
 3 files changed, 62 insertions(+), 8 deletions(-)

diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
index ed455b535..14733f519 100644
--- a/kernel/trace/fgraph.c
+++ b/kernel/trace/fgraph.c
@@ -1420,13 +1420,26 @@ int register_ftrace_graph(struct fgraph_ops *gops)
 	return ret;
 }
 
-void unregister_ftrace_graph(struct fgraph_ops *gops)
+/**
+ * unregister_ftrace_graph_start - unpublish a function graph operation
+ * @gops: graph operation to remove
+ *
+ * Remove @gops from graph dispatch, release its array slot, and update the
+ * graph and subop state. Existing graph callbacks may still be using @gops
+ * after this returns.
+ *
+ * Return: true if @gops was unpublished. The caller must then invoke
+ * unregister_ftrace_graph_finish() exactly once before releasing @gops or its
+ * filter, even if the subop hash update failed.
+ */
+bool unregister_ftrace_graph_start(struct fgraph_ops *gops)
 {
 	int command = 0;
+	bool removed = false;
 
 	if (WARN_ONCE(!(gops->ops.flags & FTRACE_OPS_FL_GRAPH),
 		      "function graph ops unregistered without registering"))
-		return;
+		return false;
 
 	guard(mutex)(&ftrace_lock);
 
@@ -1440,7 +1453,8 @@ void unregister_ftrace_graph(struct fgraph_ops *gops)
 	if (fgraph_lru_release_index(gops->idx) < 0)
 		goto out;
 
-	fgraph_array[gops->idx] = &fgraph_stub;
+	WRITE_ONCE(fgraph_array[gops->idx], &fgraph_stub);
+	removed = true;
 
 	ftrace_graph_active--;
 
@@ -1460,7 +1474,32 @@ void unregister_ftrace_graph(struct fgraph_ops *gops)
 		unregister_pm_notifier(&ftrace_suspend_notifier);
 		unregister_trace_sched_switch(ftrace_graph_probe_sched_switch, NULL);
 	}
-	gops->saved_func = NULL;
  out:
 	gops->ops.flags &= ~FTRACE_OPS_FL_GRAPH;
+	return removed;
+}
+
+/**
+ * unregister_ftrace_graph_finish - wait for readers of an unpublished operation
+ * @gops: graph operation previously unpublished by unregister_ftrace_graph_start()
+ *
+ * Wait for existing graph readers, then clear the saved callback. This may
+ * sleep. The caller may release @gops and its filter after this returns.
+ */
+void unregister_ftrace_graph_finish(struct fgraph_ops *gops)
+{
+	/*
+	 * The graph callbacks run with preemption disabled and may run while
+	 * RCU is not watching. Wait for both kinds of readers before the
+	 * caller can release the graph ops or its filter.
+	 */
+	synchronize_rcu_tasks_rude();
+	synchronize_rcu_tasks();
+	gops->saved_func = NULL;
+}
+
+void unregister_ftrace_graph(struct fgraph_ops *gops)
+{
+	if (unregister_ftrace_graph_start(gops))
+		unregister_ftrace_graph_finish(gops);
 }
diff --git a/kernel/trace/fprobe.c b/kernel/trace/fprobe.c
index da286619c..c53ad37a0 100644
--- a/kernel/trace/fprobe.c
+++ b/kernel/trace/fprobe.c
@@ -14,9 +14,11 @@
 #include <linux/rhashtable.h>
 #include <linux/slab.h>
 #include <linux/sort.h>
+#include <linux/workqueue.h>
 
 #include <asm/fprobe.h>
 
+#include "ftrace_internal.h"
 #include "trace.h"
 
 #define FPROBE_IP_HASH_BITS 8
@@ -279,6 +281,14 @@ static struct fgraph_ops fprobe_graph_ops = {
 static int nr_fgraph_fprobes;
 /* Is fprobe_graph_ops registered? */
 static bool fprobe_graph_registered;
+static void fprobe_graph_cleanup_workfn(struct work_struct *work);
+static DECLARE_WORK(fprobe_graph_cleanup_work, fprobe_graph_cleanup_workfn);
+
+static void fprobe_graph_cleanup_workfn(struct work_struct *work)
+{
+	unregister_ftrace_graph_finish(&fprobe_graph_ops);
+	ftrace_free_filter(&fprobe_graph_ops.ops);
+}
 
 /* Add @addrs to the ftrace filter and register fgraph if needed. */
 static int fprobe_graph_add_ips(unsigned long *addrs, int num)
@@ -286,6 +296,7 @@ static int fprobe_graph_add_ips(unsigned long *addrs, int num)
 	int ret;
 
 	lockdep_assert_held(&fprobe_mutex);
+	flush_work(&fprobe_graph_cleanup_work);
 
 	ret = ftrace_set_filter_ips(&fprobe_graph_ops.ops, addrs, num, 0, 0);
 	if (ret)
@@ -297,7 +308,7 @@ static int fprobe_graph_add_ips(unsigned long *addrs, int num)
 			ftrace_free_filter(&fprobe_graph_ops.ops);
 			return ret;
 		}
-		fprobe_graph_registered = true;
+		WRITE_ONCE(fprobe_graph_registered, true);
 	}
 	return 0;
 }
@@ -305,9 +316,9 @@ static int fprobe_graph_add_ips(unsigned long *addrs, int num)
 static void __fprobe_graph_unregister(void)
 {
 	if (fprobe_graph_registered) {
-		unregister_ftrace_graph(&fprobe_graph_ops);
-		ftrace_free_filter(&fprobe_graph_ops.ops);
-		fprobe_graph_registered = false;
+		WRITE_ONCE(fprobe_graph_registered, false);
+		if (unregister_ftrace_graph_start(&fprobe_graph_ops))
+			schedule_work(&fprobe_graph_cleanup_work);
 	}
 }
 
@@ -679,6 +690,8 @@ static void fprobe_return(struct ftrace_graph_ret *trace,
 	ret_ip = ftrace_regs_get_instruction_pointer(fregs);
 
 	guard(rcu_sched_notrace)();
+	if (!READ_ONCE(fprobe_graph_registered))
+		return;
 
 	curr = 0;
 	while (size_words > curr) {
diff --git a/kernel/trace/ftrace_internal.h b/kernel/trace/ftrace_internal.h
index 3235470e6..abb7776a2 100644
--- a/kernel/trace/ftrace_internal.h
+++ b/kernel/trace/ftrace_internal.h
@@ -52,6 +52,8 @@ static inline int ftrace_shutdown_subops(struct ftrace_ops *ops, struct ftrace_o
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 extern int ftrace_graph_active;
+bool unregister_ftrace_graph_start(struct fgraph_ops *gops);
+void unregister_ftrace_graph_finish(struct fgraph_ops *gops);
 # ifdef CONFIG_DYNAMIC_FTRACE
 extern void fgraph_update_pid_func(void);
 # else
-- 
2.56.0

