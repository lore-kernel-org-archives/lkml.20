Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.72.0.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793689495;
	b=iODPqZWVZDgjsTjnxAv8B+YyXPDyPXh2XnyqzznqcYcHdAVO/rzSEQDgV2C/goOBYaEK
	 U9j287QH5lznTDTGxQHJrmupSdlTRJNaTqxFK5OQu8d6s5YqVkgoWpghr2CH1Ci2VNjJe
	 vzODFiWsKOJ9LqmBIMBRhBU9Z+hqhMbDtHs/JzeV1415YwpN90rOxcjFkP4W+aEdl3uzJ
	 3mQbEoxmgpZV8LA1eUwaxuKGbb+AXmCfiA2T1v3L5wazumYC6e4KHBZePN7J6JfaGoJPk
	 yAw/46ytMmFHD3mfCz4Dpc8N4eopy8D3pQd6095CqfT1HJDGBSMo0A/Kt8kwrKi6Nrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793689495;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=2i4AbQJIcxVSnxZuDJ9IAYJ447/NvfakJraxqMm1d54=;
	b=e9MqmmMfJoNsqXmt8LhinzmClRwib0gBV2AdmMvzN+NhpHD2P+w8G8ki/w3G+iRybOqa
	 09MZHHGci+jD1Z31/jmboZEBXVwa+wN/rQIbziSkwqJkN+728z3VWyLKzYNs8dUnDSWM3
	 S6PHihF7NrvevQeaEpRlGWchmapOowJDLpdBdYPLvTFKbgEJbZVbKI5JUXdRa44BQkwrg
	 S+eWr9Mer3ulpMscORXksiPIjzPp3yz/HQUSUYIWVglKUmzLJjsPUQLSNTSyVaDVzBNYn
	 XIAWjtHy3hv+KsSpHwE0Plgexv0llZRAn4S0nVUDozb6XaY7hOqCJFngzxEYBn14g3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gentwo.org;
	spf=pass smtp.mailfrom=gentwo.org;
	dkim=pass header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b=IVsYXFo1;
	arc=none smtp.remote-ip=62.72.0.81
Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5FE606A332
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD5FE606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b=IVsYXFo1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1793688861;
	bh=0i6JAvfjXBnezc8zdtewSYVb/9ebxu20LcimXtClFqg=;
	h=From:Date:Subject:To:Cc:From;
	b=IVsYXFo1S9tsBiwxymf8Z/GjD3VU5k5XHIceOPVM8r8j6PsTEk3Ev5kmRrjJ0Ru1K
	 oTRC16zNJDJikeb3761kHNUW6PqbmJV9jW+MPozmbBoCP8vrlzJRF9BjgDH5C7vm7h
	 5b5KcjJldrFUR1g/C4gxT9spwe0WT4Sv6JZ8SCmA=
Received: from sut02sys-r112.scc-lab.amperecomputing.com (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTPS id 957EA4021E;
	Mon, 02 Nov 2026 22:54:21 -0800 (PST)
From: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Date: Mon, 02 Nov 2026 22:54:11 -0800
Subject: [PATCH] sched/psi: Preserve PSI state on delayed dequeue
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
Message-Id: <20261102-psi-delayed-deq-v1-1-8cd517c8fe51@gentwo.org>
X-B4-Tracking: v=1; b=H4sIABKF6WoC/x2MywqAIBAAfyX2nOADe/1KdJB2rYWwUohC+vek0
 zCHmQyJIlOCocoQ6eLEeyii6grm1YWFBGNx0FI3SkktjsQCaXMPYeEpemsstt6jMh2U6ojk+f6
 P4/S+HzMhkyhhAAAA
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
 John Stultz <jstultz@google.com>
Cc: linux-kernel@vger.kernel.org, 
 "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793688861; l=2509;
 i=sh@gentwo.org; s=20251010; h=from:subject:message-id;
 bh=0i6JAvfjXBnezc8zdtewSYVb/9ebxu20LcimXtClFqg=;
 b=A016vOBxmwCstj0OZS695kjmyDbQ51Sco5TonpeuIpP58ozVgGr0ZrXvvYZEqOEeWUDoqDLRn
 +nnJdjodGU8CqixdPMzn2Coxe/e54hftKGJCi8zwV3xgyeU70XR8daO
X-Developer-Key: i=sh@gentwo.org; a=ed25519;
 pk=jc8YIRvxPSyJaBRe5y+a4N0RXKBUEcAh8+OFhlROXPY=

EEVDF can retain a blocked fair task as sched_delayed until it becomes
eligible for final removal.

On the initial sleep, psi_dequeue() does nothing because the task is
still TSK_ONCPU. psi_sched_switch(..., sleep=true) then converts the
task from runnable to sleeping, retaining TSK_IOWAIT and persistent
memory-stall state.

A delayed task can later be physically removed while still asleep via:

  wait_task_inactive()
    -> dequeue_task(DEQUEUE_SLEEP | DEQUEUE_DELAYED)

or:

  switching_from_fair()
    -> dequeue_task(DEQUEUE_SLEEP | DEQUEUE_DELAYED | DEQUEUE_NOCLOCK)

psi_dequeue() currently clears all PSI flags, including TSK_IOWAIT,
even though the task remains asleep. This prematurely ends its
sleep-pressure accounting. On wakeup, psi_enqueue() expects to clear
the retained TSK_IOWAIT state.

DEQUEUE_DELAYED only completes the previously accounted sleep dequeue.
Keep PSI state unchanged for it, as for DEQUEUE_SAVE.

Fixes: f5aaff7bfa11 ("sched/core: Dequeue PSI signals for blocked tasks that are delayed")
Fixes: b7ca5743a260 ("sched/core: Tweak wait_task_inactive() to force dequeue sched_delayed tasks")
Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
---
Testing on 80-core Ampere Altra:
- On v7.4-rc1 baseline, switching a delayed direct-I/O task from
  SCHED_OTHER to SCHED_FIFO triggered: "psi: inconsistent task state"
- With this patch applied, the identical test emitted no PSI warning.
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
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-psi-delayed-deq-9535d7ffd138

Best regards,
-- 
Shubhang Kaushik (Ampere) <sh@gentwo.org>

