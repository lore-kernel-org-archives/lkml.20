Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495010;
	b=ikkE8coaOhwCDz8mqimamExjatutCp1mh59um4bkjf1hWM+gmlG8gYflx21/EaV209BQ
	 poslHNuE7K3Tj6uqwbYbQxNeOOE3auLZnNxbaKSKlQ3RxrntjpMdzHbPiE7d7XNvnb3m4
	 fFx8hFEu3fb+hs5gNnpXbsmIR6gEhRgyh23SopqHhXQXwce0GPCaGq5yuX0HVvXgx5X7J
	 g8z7TmOPrp+XAXdp88MCQFCG5AvKhXBwzI09+o8brEKjQmHiH5zCMVH0R+pKKAj4z22yT
	 EP8dpH8UJjxMijMNIGSq+JoLrI2isKyhdXNcJbYw3w1VmQp3CQLSnFLMcf2S2E0+pZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495010;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fKhNVS4HIbJOghQyFAYDyIQH4s/FReGVb6zBWdLmzR4=;
	b=C1WV4dmT8O0FwiVmSMDR0QuUYnww673vPWio4i7bYyRmTUUYVU9/ajSD0Ny6Z0syHTsi
	 dH6JH0AOd0PkBZkb1UVSCGIKGv4J57hZNwXX6g0elOOTS1mq9zJW/IVljlNZH/DpNYck1
	 0O6HEtaQa0ZBxY/IjzBnsHAXQlz+uvMg8HJi1/n6f6+zN8IqS267UwJnjfTAxVo2ctF5p
	 v5iCRw6xSXk0OCQqJrF88jnnTUujgLdXXrFz1YslBqfxfujMBIVNvho8OZReqkHSGjEbF
	 StNWAxh2kNbfoGasw+Ig3aCNxL/U6GGN6sF+zYd4P2Ya7GBEqhIv/0LeK+oG9kwqp+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VgtrlgrF;
	arc=none smtp.remote-ip=91.218.175.16
Received: from mta0.migadu.com (out-16.mta0.migadu.com [91.218.175.16])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328B0606A330
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 328B0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VgtrlgrF
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KG9+P7EeigIaTfG3TpucRpnUPoNln70sSanoxbchnvI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794495008; v=1; x=1795099808;
 b=VgtrlgrFSZRND/KG4Eiwkv/bvfUqhpJO9HtTOyyU2ZShdzTQGoTCcXtWQB9TKFwGv816ydHf
 aGyhKJmmL2LAxiswRs7ymGAmCsLKG1sQzMrmKpPJ+rOMkvowXZC9tc7FkFudeh8+IqvA09kIm8/
 bIaeCjR5iifzkXJK6jYinMXI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 58f4540b9f06cb52;
	Thu, 12 Nov 2026 14:50:06 +0000
X-Mizu-Trace-ID: 58f4540b9f06cb52
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: tj@kernel.org
Cc: void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	mingo@redhat.com,
	peterz@infradead.org,
	sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	cui.tao@linux.dev,
	Tao Cui <cuitao@kylinos.cn>
Subject: [PATCH 2/2] sched_ext: Block a retained donor before PI deboost routes it back to sched_ext
Date: Thu, 12 Nov 2026 22:49:35 +0800
Message-ID: <20261112144935.583937-3-cui.tao@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112144935.583937-1-cui.tao@linux.dev>
References: <20261112144935.583937-1-cui.tao@linux.dev>
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

From: Tao Cui <cuitao@kylinos.cn>

rt_mutex_setprio() is the only entry path into sched_ext that does not
block a retained donor: an ext task PI-boosted by an rt waiter can
block on a second kernel mutex while boosted, and on deboost is routed
back to sched_ext carrying the queued+blocked state that
scx_prepare_setscheduler() promises never happens; every PI cycle
hands the BPF scheduler a queued+blocked donor it never admitted.

Call scx_prepare_task_sched_change() before the sched_change guard when
the class change routes the task back to sched_ext, which performs the
missing sched_proxy_block_task() (plus an update_rq_clock() that is
harmless here: the clock was already advanced, so the second advance
only applies a small delta). The boost direction (ext -> rt) needs no
handling.

Fixes: be8be8acb268 ("sched_ext: Block proxy donors before taking control")
Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 kernel/sched/core.c    | 12 ++++++++++++
 kernel/sched/ext/ext.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f7a452123ef5..dcb16b006740 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7816,6 +7816,18 @@ void rt_mutex_setprio(struct task_struct *p, struct task_struct *pi_task)
 	if (prev_class != next_class)
 		queue_flag |= DEQUEUE_CLASS;
 
+	/*
+	 * PI boost can route @p out of sched_ext: policy stays SCHED_EXT but
+	 * __setscheduler_class() follows the effective rt prio, and rt/fair
+	 * may have retained @p on the rq as a blocked donor. Block it before
+	 * sched_change_begin() records the queued state, the same way the
+	 * other entry points into sched_ext do.
+	 */
+#ifdef CONFIG_SCHED_CLASS_EXT
+	if ((queue_flag & DEQUEUE_CLASS) && next_class == &ext_sched_class)
+		scx_prepare_task_sched_change(p);
+#endif
+
 	scoped_guard (sched_change, p, queue_flag) {
 		/*
 		 * Boosting condition are:
diff --git a/kernel/sched/ext/ext.h b/kernel/sched/ext/ext.h
index d32bc01071b0..1a699be25331 100644
--- a/kernel/sched/ext/ext.h
+++ b/kernel/sched/ext/ext.h
@@ -19,6 +19,7 @@ void scx_rq_activate(struct rq *rq);
 void scx_rq_deactivate(struct rq *rq);
 int scx_check_setscheduler(struct task_struct *p, int policy);
 void scx_prepare_setscheduler(struct task_struct *p, int policy);
+void scx_prepare_task_sched_change(struct task_struct *p);
 bool task_should_scx(int policy);
 bool scx_allow_ttwu_queue(const struct task_struct *p);
 bool __scx_allow_proxy_exec(const struct task_struct *p);
@@ -72,6 +73,7 @@ static inline void scx_rq_activate(struct rq *rq) {}
 static inline void scx_rq_deactivate(struct rq *rq) {}
 static inline int scx_check_setscheduler(struct task_struct *p, int policy) { return 0; }
 static inline void scx_prepare_setscheduler(struct task_struct *p, int policy) {}
+static inline void scx_prepare_task_sched_change(struct task_struct *p) {}
 static inline bool task_on_scx(const struct task_struct *p) { return false; }
 static inline bool scx_allow_ttwu_queue(const struct task_struct *p) { return true; }
 static inline bool scx_allow_proxy_exec(const struct task_struct *p) { return true; }
-- 
2.53.0

base-commit: 5b740a72b55c4267ba4d8010f17dde26b26f52d3
