Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4EF47DF98;
	Fri,  2 Oct 2026 09:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933601; cv=none; b=lRzlJ0/Hnj5WFST3anKbfHW+q5/SOugNT8di0QDSRAb/pNAv49UZzTfxa6UUbnG+/mTIrzLY+rVMSSA/aAYs7XdtrwazBrlM8RgxJHpcD413krL5MLx0B7Fa2Tv6SAiWKLYhTuRsfbMokvVMSTxgPKzxL0Vf1BavqKhnDwDYEEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933601; c=relaxed/simple;
	bh=l4dnwZtPD3RZvi7s1nRU8RQv5hTWnIq4wpIybAZH6co=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=mW75dUm4pNludE2rjr65sMy79ixpY1Q3Aoz6ol/x+uiGHQyYdqtARl1mIVTvNmsfvqY6TtaECCLDwW4zkVPVeE3RCFP0zPKQ+XQmvzokqQDdh2wA0wmGN3XsszXHsMrblTTCCYRyjTmFjz8vjuJdGGzLm6N+Hea0QrQiQxKAP0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fopaLwzI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=chaqNBye; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fopaLwzI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="chaqNBye"
Date: Fri, 02 Oct 2026 09:33:16 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790933598;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fPlJjm81mX1eQFdq0oZY4UhfU8+OWWQmiK+svK75jzQ=;
	b=fopaLwzIaINrN0vtNVvssD9DnV3TlcUu8cCvD+/wlzbf7vMV98XzPDrawhTDtKw9+0D3E/
	PYhIsy6uabiINyGP99HUPBHZn5fkrRiheEM6v6HJvd08AAPLDl0OZorGBSLKb4AypjxblX
	uImr1oP5YDPd1ask/+t7Lz0SfYFSGItX37M2aBeqnvIk5PDkBSuZtSqmP1qwsyDSYouqvX
	JP/kQUsBkL81fL/6LnqCtWWm7JU6dYXrSydaJW2IiEzQZ78Dl8vqYJRyaK/YPs6ngM/ge7
	BaQQEtw7L5sUjhCWYlod8PGeNaMUYmHiZKtkkoCwlt9ud3YviWss17ofOCkbKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790933598;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fPlJjm81mX1eQFdq0oZY4UhfU8+OWWQmiK+svK75jzQ=;
	b=chaqNByeX8WBwa28wuMqtrG5pkforOeRQoWYLiHMFKcFQM+vJEI1W2mQH7TvlKYbaNtOW9
	dWP4Q557/QjvZwCA==
From: "tip-bot2 for Sechang Lim" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched: Set TIF_NEED_RESCHED before calling
 __trace_set_need_resched()
Cc: Sechang Lim <rhkrqnwk98@gmail.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Andrea Righi <arighi@nvidia.com>, Gabriele Monaco <gmonaco@redhat.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260630084750.2792851-1-rhkrqnwk98@gmail.com>
References: <20260630084750.2792851-1-rhkrqnwk98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179093359691.3910103.6115289419988551033.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     53bc5c556b82a3ca32b62ba349c4511f91526b9f
Gitweb:        https://git.kernel.org/tip/53bc5c556b82a3ca32b62ba349c4511f915=
26b9f
Author:        Sechang Lim <rhkrqnwk98@gmail.com>
AuthorDate:    Tue, 30 Jun 2026 08:47:37=20
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Thu, 01 Oct 2026 14:00:34 +02:00

sched: Set TIF_NEED_RESCHED before calling __trace_set_need_resched()

set_tsk_need_resched() tests TIF_NEED_RESCHED, calls
__trace_set_need_resched() if the flag is clear, then sets it via
set_tsk_thread_flag().  A BPF raw_tp program attached to
sched_set_need_resched executes synchronously inside __bpf_trace_run().
On return, __bpf_trace_run() drops the RCU lock with
rcu_read_unlock_migrate(), which on the preempt-or-BH-disabled path
calls set_need_resched_current() -> set_tsk_need_resched() again.

set_tsk_thread_flag() follows the tracepoint call, so every re-entrant
frame sees TIF_NEED_RESCHED clear and calls __trace_set_need_resched()
again:

  BUG: TASK stack guard page was hit at ffffc9001224ff98
  Oops: stack guard page: 0000 [#1] SMP KASAN PTI
  RIP: 0010:__bpf_trace_sched_set_need_resched_tp+0x1c/0x190
  Call Trace:
   trace_sched_set_need_resched_tp+0x110/0x130
   set_tsk_need_resched include/linux/sched.h:2076
   set_need_resched_current include/linux/sched.h:2094
   rcu_read_unlock_special+0x43a/0x440
   __rcu_read_unlock+0x9e/0x120
   rcu_read_unlock_migrate+0xa9/0x240
   __bpf_trace_run+0x131/0x180
   bpf_trace_run3+0x333/0x430
   __bpf_trace_sched_set_need_resched_tp+0x13a/0x190
   trace_sched_set_need_resched_tp+0x110/0x130
   set_tsk_need_resched include/linux/sched.h:2076
   ...

__resched_curr() has the same ordering, firing the tracepoint before
setting the flag via set_ti_thread_flag() or set_nr_and_not_polling().
Fix it for consistency.

Replace the separate test_tsk_thread_flag() + set_tsk_thread_flag() pair
in set_tsk_need_resched() with test_and_set_tsk_thread_flag().  In
__resched_curr(), move the tracepoint call after the flag is set in
each path.

Fixes: adcc3bfa8806 ("sched: Adapt sched tracepoints for RV task model")
Signed-off-by: Sechang Lim <rhkrqnwk98@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Andrea Righi <arighi@nvidia.com>
Acked-by: Gabriele Monaco <gmonaco@redhat.com>
Link: https://patch.msgid.link/20260630084750.2792851-1-rhkrqnwk98@gmail.com
---
 include/linux/sched.h | 5 ++---
 kernel/sched/core.c   | 7 +++++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 48639b0..7b91cae 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2105,10 +2105,9 @@ static inline int test_tsk_thread_flag(struct task_str=
uct *tsk, int flag)
=20
 static inline void set_tsk_need_resched(struct task_struct *tsk)
 {
-	if (tracepoint_enabled(sched_set_need_resched_tp) &&
-	    !test_tsk_thread_flag(tsk, TIF_NEED_RESCHED))
+	if (!test_and_set_tsk_thread_flag(tsk, TIF_NEED_RESCHED) &&
+	    tracepoint_enabled(sched_set_need_resched_tp))
 		__trace_set_need_resched(tsk, TIF_NEED_RESCHED);
-	set_tsk_thread_flag(tsk,TIF_NEED_RESCHED);
 }
=20
 static inline void clear_tsk_need_resched(struct task_struct *tsk)
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 23677d7..71d3c94 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1196,6 +1196,7 @@ static void __resched_curr(struct rq *rq, int tif)
 {
 	struct task_struct *curr =3D rq->curr;
 	struct thread_info *cti =3D task_thread_info(curr);
+	bool need_ipi;
 	int cpu;
=20
 	lockdep_assert_rq_held(rq);
@@ -1212,15 +1213,17 @@ static void __resched_curr(struct rq *rq, int tif)
=20
 	cpu =3D cpu_of(rq);
=20
-	trace_sched_set_need_resched_tp(curr, cpu, tif);
 	if (cpu =3D=3D smp_processor_id()) {
 		set_ti_thread_flag(cti, tif);
 		if (tif =3D=3D TIF_NEED_RESCHED)
 			set_preempt_need_resched();
+		trace_sched_set_need_resched_tp(curr, cpu, tif);
 		return;
 	}
=20
-	if (set_nr_and_not_polling(cti, tif)) {
+	need_ipi =3D set_nr_and_not_polling(cti, tif);
+	trace_sched_set_need_resched_tp(curr, cpu, tif);
+	if (need_ipi) {
 		if (tif =3D=3D TIF_NEED_RESCHED)
 			smp_send_reschedule(cpu);
 	} else {
