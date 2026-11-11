Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.72.0.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794381611;
	b=FOH3hgmTuPs3Cw868hateQcks1rsTg0JdnsiqmXGjIuwAP/E0yc5zHHpMv3uSlVysKCx
	 0JZtZY/y4XnKqtBVRneVhTb/sAaibK5HakzG0c7db+N/Kj62VY9tM8Zl7lBpnjQD/eP0R
	 fND5hHWiufRQMTlqlBMZKylYM6KMK9ehOmky7aP0NoXKd0W+q7Jcvky/alr4aEOez77yr
	 A+kdBjPhyiD6U46wYLnhE4zTeiQWOCYGDfwucwkcLPMsNL/ae79h5q0FXPvf6Dg1Uqqi+
	 MOTJjAEcpGUKi77R4v9mLP+NFzo3bu1SHWHgJcWgIQz3kQrp80QeQVL5wcxmDcpir/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794381611;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=7xKN13ba3elef4uKonO//oUwuQOiPK/nOzNBD59pvYc=;
	b=PkYYaBO3rgb0XKEkPd4j2Bm2ALCuZzdk1mS58mEQOTJ4ONozBVncUqUu5RFJhCj1DTN+
	 2qceFeROyH4ZYBv73R3esjiWwRIDNXS98oXst0qo+FJDG8pmJEzzpVbHXSZUVf3TNs6G/
	 z9NYfAXF6mUeh5AmQufgU2Fl+mdkbDdk7Kmx/nUHGl6Al6Ms2s2PRBhG4UTbclr9BougU
	 8hJCkFsyMAEwfKyXe/3KOT2yZYsHvZX07V0y2yT8pGYsr/zPCddJl4e2VC1QNzp+6YL/L
	 M9Ro3OUmlBN5x1Sjgr8GJln1nqDc47WttlWP9a1AlyLH6kkJL8rZRNp9/xRSJQRjiSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gentwo.org;
	spf=pass smtp.mailfrom=gentwo.org;
	dkim=pass header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b=B2VKXOYa;
	arc=none smtp.remote-ip=62.72.0.81
Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2042606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2042606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b=B2VKXOYa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1794381003;
	bh=IemLnq5Lr2uv4Rd0QoLAMzZpB3bJsKDFhc/M+AFReJw=;
	h=From:Date:Subject:To:Cc:From;
	b=B2VKXOYaKN4ZqYt0qUxXCEbn4/dvynTcXIcm81BPjHxdUVW6yq+67nHVVagplbGfj
	 RGOFm6cV+vPK3I+4EYEYZ7tcTBgUUz78rLSrTik+ek/+QQ8GOjraxXLyIehs+2vdur
	 Y6Oi1xkHklXV0Lh6x9B7U2L8/xs3APG2PhMSMnIw=
Received: from sut02sys-r112.scc-lab.amperecomputing.com (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTPS id 452DB4006C;
	Tue, 10 Nov 2026 23:10:03 -0800 (PST)
From: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Date: Tue, 10 Nov 2026 23:09:59 -0800
Subject: [PATCH v2] sched/psi: Preserve PSI state on delayed dequeue
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-psi-delayed-deq-v2-1-17ac1688f0e9@gentwo.org>
X-B4-Tracking: v=1; b=H4sIAMYU9GoC/3WNwQrCMBBEf6Xs2Ug3JTZ68j+kh5Js0gVpalKip
 eTfjb17Gt7AvNkhUWRKcGt2iJQ5cZgryFMDZhpnT4JtZZCtvCC2UiyJhaXnuJGt+RJX1SnbO2e
 x01BXSyTHn8P4GCpPnNYQt+Mg46/978ooUGhjFfZGO1J49zSv73AO0cNQSvkCANHgHK8AAAA=
X-Change-ID: 20261102-psi-delayed-deq-9535d7ffd138
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>, 
 Shubhang Kaushik <shubhang@os.amperecomputing.com>, 
 "Christopher Lameter (Ampere)" <cl@gentwo.org>, 
 John Stultz <jstultz@google.com>, Johannes Weiner <hannes@cmpxchg.org>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, 
 "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794381003; l=2958;
 i=sh@gentwo.org; s=20251010; h=from:subject:message-id;
 bh=IemLnq5Lr2uv4Rd0QoLAMzZpB3bJsKDFhc/M+AFReJw=;
 b=vEL43Pet8Ft/YOa6/ldghbOAfZ8O/DO2WKvaBRF0PaxPag2gOZachBDtG/XyaoXLbF9+Wax5J
 /GWJee+XaeOCKGszbsg1CO7FiRZi6Hlt/zY3iFjHG09285i1tpP+u1N
X-Developer-Key: i=sh@gentwo.org; a=ed25519;
 pk=jc8YIRvxPSyJaBRe5y+a4N0RXKBUEcAh8+OFhlROXPY=

EEVDF can retain a blocked fair task as sched_delayed until it becomes
eligible for final removal.

On the initial sleep, psi_dequeue() does nothing because the task is
still TSK_ONCPU. psi_sched_switch(..., sleep=true) then converts the
task from runnable to sleeping, retaining TSK_IOWAIT and persistent
memory-stall state.

A delayed task can later be physically removed after it has switched
out via:

  wait_task_inactive()
    -> dequeue_task(DEQUEUE_SLEEP | DEQUEUE_DELAYED)

or:

  switching_from_fair()
    -> dequeue_task(DEQUEUE_SLEEP | DEQUEUE_DELAYED | DEQUEUE_NOCLOCK)

Commit c2ae8b0df2d1 ("sched/core: Fix psi_dequeue() for Proxy
Execution") made the DEQUEUE_SLEEP shortcut conditional on TSK_ONCPU
so that post-switch proxy-execution dequeues clear PSI state. However,
a delayed dequeue also occurs after the task switch, when its sleeping
PSI state has already been accounted by psi_sched_switch().

Consequently, psi_dequeue() clears TSK_IOWAIT for a still-sleeping
delayed task. A later wakeup attempts to clear TSK_IOWAIT again and can
trigger "psi: inconsistent task state".

Keep PSI state unchanged for DEQUEUE_DELAYED, as for DEQUEUE_SAVE.

Fixes: c2ae8b0df2d1 ("sched/core: Fix psi_dequeue() for Proxy Execution")
Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
---
Testing on 80-core Ampere Altra:
- On v7.4-rc1 (6628e7d4c6b2), switching a delayed direct-I/O task
  from SCHED_OTHER to SCHED_FIFO triggered:
  "psi: inconsistent task state".
- With the patch applied, the identical test emitted no PSI warning.

Changes in v2:
- Correct the Fixes tag to c2ae8b0df2d1 ("sched/core: Fix psi_dequeue()
  for Proxy Execution").
- Clarify that the regression was introduced when post-switch sleeping
  dequeues began clearing PSI state.

Link to v1: https://lore.kernel.org/r/20261102-psi-delayed-deq-v1-1-8cd517c8fe51@gentwo.org
---
 kernel/sched/stats.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
index ebe0a7765f98e733af9f576033a0f8da65757f08..3e3f5cf4524d281816b01ba8165905fd1cbefc87 100644
--- a/kernel/sched/stats.h
+++ b/kernel/sched/stats.h
@@ -164,8 +164,13 @@ static inline void psi_dequeue(struct task_struct *p, int flags)
 	if (static_branch_likely(&psi_disabled))
 		return;
 
-	/* Same runqueue, nothing changed for psi */
-	if (flags & DEQUEUE_SAVE)
+	/*
+	 * Saved dequeues retain task state across a dequeue/enqueue pair. A
+	 * delayed dequeue completes a prior sleep dequeue after
+	 * psi_sched_switch() accounted the runnable-to-sleeping transition.
+	 * In both cases, keep the task's PSI state unchanged.
+	 */
+	if (flags & (DEQUEUE_SAVE | DEQUEUE_DELAYED))
 		return;
 
 	/*

---
base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
change-id: 20261102-psi-delayed-deq-9535d7ffd138

Best regards,
-- 
Shubhang Kaushik (Ampere) <sh@gentwo.org>

