Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.107
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495002;
	b=4pMQPbHxQmXnpt/1C4JvOIFgr6XeNJyCZXAwZMHeHy3u2ONvNtY7pY09k1mBMoHm3wME
	 AfQ2kxzKLdNQ47B/vAY/0jvbm1YDbJxQsC51IAzg3FpXfSL2r6Qd/leQXhp3rZAxQhlBs
	 ExxXJRSPLpTGNywk3e8KUybxFUuyHsK8VeDw8ZHT/cV7jNgtd2UPkxjzxInixXvSYCDUC
	 8OCwmGwu/D2fJ6YXeH3KIVSTiTXZxsKvVMIRl+AN2gNfUMdJnbd6P5I7FjOGyXSaxxs/e
	 SdBq5+7SNrMATAw0bEm03I6qgikbwFNid0LMXfo6saj6vp/2ah7w6b7OWdivv3h+HMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495002;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LdP00xaRudb52/LsBw7dU8aWxZVXiu8lJBJmgivD284=;
	b=t7RAXhYqt5Rm6C/nDI0TffKSod4TA2QZ/7ihTnceGpU39cG7K/+3HTysAQfPtOfcAYBN
	 Aj38GEpeXiKECMH6piODfbvQQl+mSni+DrTjnbhinQXeZChfhbmouGrlL6kA+R3rhj7Jh
	 gd8X9B184e1VrSPsLz9FECY6IBTxkD25apq88zmPN9Df774akp6aT6y1l89qO94QBtNsB
	 qwx/H7Vwu7tcIPoHQwsAV16vHLFlWkwjgQiavGlqB2KDN1Ea5l76sXhuOSw/xUuwRdJzm
	 qYRUJpTZOAh9Sa/FIGHl9xU+qGpZIIyJeNO3UhFj7dVe34kkn6igtFwmFiJMo5A7X5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xcIwmSyT;
	arc=none smtp.remote-ip=95.215.58.107
Received: from mta1.migadu.com (out-107.mta1.migadu.com [95.215.58.107])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E00606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6E00606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xcIwmSyT
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VR44OXmMFC5Ziuz2RAZRy7KzJEZP4oWMUQ30NNHSlsk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794494999; v=1; x=1795099799;
 b=xcIwmSyTjhIjxHb3LrVUVNylcyg0sc2pTEcm8nd0tKL7PKZZZLxSNtrkVXXF0XBoaGXGvNQ4
 2St2569UEGCMghATDJyou+hx806TEXBVqzbTkN6w6yqBkWsSni4HtURw3qmw9pc8XE28n6yQFST
 whWlJ2UzumtDKNDpGJ1L87Tw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 72b595bf3f24a98d;
	Thu, 12 Nov 2026 14:49:59 +0000
X-Mizu-Trace-ID: 72b595bf3f24a98d
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
Subject: [PATCH 1/2] sched/core: Pass ENQUEUE_RQ_SELECTED on initial enqueue
Date: Thu, 12 Nov 2026 22:49:34 +0800
Message-ID: <20261112144935.583937-2-cui.tao@linux.dev>
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

select_task_rq() sets WF_RQ_SELECTED and ttwu_do_activate() maps it to
ENQUEUE_RQ_SELECTED so enqueue_task_scx() knows whether ops.select_cpu()
ran. wake_up_new_task() also calls select_task_rq() but activates the
new task without the flag, so on the fork path ops.enqueue() never sees
SCX_ENQ_CPU_SELECTED and SCX_EV_SELECT_CPU_FALLBACK never counts a
fork-path fallback: a misbehaving select_cpu() leaves no trace in the
counters, and schedulers testing SCX_ENQ_CPU_SELECTED run a redundant
select_cpu_dfl() on tasks select_cpu() already placed.

Set ENQUEUE_RQ_SELECTED on the initial enqueue when select_task_rq() was
called, matching the wakeup path. Only sched_ext consumes the flag.

Fixes: 9b671793c7d9 ("sched_ext, scx_qmap: Add and use SCX_ENQ_CPU_SELECTED")
Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 kernel/sched/core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 04b62c16fa8c..f7a452123ef5 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5016,6 +5016,7 @@ void wake_up_new_task(struct task_struct *p)
 	struct rq_flags rf;
 	struct rq *rq;
 	int wake_flags = WF_FORK;
+	int en_flags = ENQUEUE_NOCLOCK | ENQUEUE_INITIAL;
 
 	raw_spin_lock_irqsave(&p->pi_lock, rf.flags);
 	WRITE_ONCE(p->__state, TASK_RUNNING);
@@ -5029,11 +5030,13 @@ void wake_up_new_task(struct task_struct *p)
 	 */
 	p->recent_used_cpu = task_cpu(p);
 	__set_task_cpu(p, select_task_rq(p, task_cpu(p), &wake_flags));
+	if (wake_flags & WF_RQ_SELECTED)
+		en_flags |= ENQUEUE_RQ_SELECTED;
 	rq = __task_rq_lock(p, &rf);
 	update_rq_clock(rq);
 	post_init_entity_util_avg(p);
 
-	activate_task(rq, p, ENQUEUE_NOCLOCK | ENQUEUE_INITIAL);
+	activate_task(rq, p, en_flags);
 	trace_sched_wakeup_new(p);
 	wakeup_preempt(rq, p, wake_flags);
 	if (p->sched_class->task_woken) {
-- 
2.53.0

base-commit: 5b740a72b55c4267ba4d8010f17dde26b26f52d3
