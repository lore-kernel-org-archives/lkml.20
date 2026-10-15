Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E59049C4BE;
	Thu, 15 Oct 2026 08:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051529; cv=none; b=S9Pa7au1f/hZeYxe3aO1nfr/v51iPm8RvlWyhCTwOHGLRtF45FAafig7ZOdmVwYOFuNE2MyCIuRKr7224nOYX55dUsQ5EFtLjykrmzQ1SxBAy/whfEb5q6v2mMuee2mt1FCOAQ+hM+erYOyG+to26N7mm8/r0ahc0EkJI5NGs9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051529; c=relaxed/simple;
	bh=nt6J0g3YyAjUo9+VEnUQgbe2TcvNUnDbnJuZxyx62Rw=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=CDy5xiCRC5KbjqysN8BRtGHzJO7D4zc+eX1I0usl3Pm4oAXFzdFo2/SK3bUaKz9aA/l2rTjO9crApdIeXkmbsKoTZ0oOiyQEbCMq9MjJDSYxBwgam96jLnvIv5pnD4g+JX5VX89DdFtjpflZ+mDLI1aCYwZR3HMV8vg7EtJsj44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vz/WdROL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rNFxlBEa; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vz/WdROL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rNFxlBEa"
Date: Thu, 15 Oct 2026 08:05:23 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792051525;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DjRJ40QHPxxSnWe6EsZFDqkHjtMzVrak+7zBkLuffxo=;
	b=vz/WdROLLN3FqsXRTDse9vLV+LvO3jD2gXIW2X/C96a7m9D44xrLYGhX1lQy2U9s5tgu92
	i85moT9Gv9thJWG2jOE0N+vV+J4ZYPWynV1ONVJB+toaNZtLyubwlKl09qhlizp/wkJyxY
	kxX4sRFJMMQ31raaNU2Z0oiw51/ggx1J2LLb7OoPjfKqK/nsoXnddYb1i8nB8/4jlO8jij
	WOy9yoZwzk8xNt0NtzT0kxEb+IcZ7Ma3dKXY3ZbPgMCLO2+z1xD27wcZDvJVUpyVu2Ryhx
	WjnnlNkQcojGHzixWLGR8TmJ4M5HIqEjs7vkNWlkvXUUXojNZhz+8DXavR8RXA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792051525;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DjRJ40QHPxxSnWe6EsZFDqkHjtMzVrak+7zBkLuffxo=;
	b=rNFxlBEav9g1ZT3FrjeXa9QnFG2eijzi6fEPcCi8rAlhsnBg0cmd+eFiM1wdqYeerUXWZ8
	R/mUwTcEzC6y7oBQ==
From: "tip-bot2 for Mikhail Gavrilov" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: locking/urgent] entry: Account the deferred hrtimer rearm as
 hardirq context for lockdep
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261013071318.33300-1-mikhail.v.gavrilov@gmail.com>
References: <20261013071318.33300-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205152337.2666988.12596092623916858900.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the locking/urgent branch of tip:

Commit-ID:     7cbaa0f4579f48e92639c6abb761fdef8fbade47
Gitweb:        https://git.kernel.org/tip/7cbaa0f4579f48e92639c6abb761fdef8fb=
ade47
Author:        Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
AuthorDate:    Tue, 13 Oct 2026 12:13:18 +05:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 14 Oct 2026 15:11:48 +02:00

entry: Account the deferred hrtimer rearm as hardirq context for lockdep

On a desktop debug kernel (PROVE_LOCKING, KASAN, LOCKDEP_CHAINS_BITS=3D19)
lockdep switches itself off after about two days of uptime with
"BUG: MAX_LOCKDEP_CHAIN_HLOCKS too low!", and locking is not validated
until the next reboot. In the last such boot the pool ran out after 46.6
hours, and a fifth of it, 533509 of 2621431 chain hlocks in 63838 of
344717 chains, had been created by the deferred hrtimer rearm on return
from interrupt.

Make lockdep account that rearm as part of the timer interrupt it
belongs to.

Commit 15dd3a948855
("hrtimer: Push reprogramming timers into the interrupt return path")
moved the reprogramming of the clock event device out of the timer
interrupt into the interrupt return path. On return to kernel mode
irqentry_exit_to_kernel_mode_after_preempt() performs it after
irq_exit_rcu() has already left lockdep's hardirq context. lockdep
therefore records hrtimer_bases.lock and the timekeeper sequence count
as taken by the interrupted context, on top of the locks that context
holds, and every distinct held-lock stack an interrupt hits adds two
lock chains. When the rearm runs from irq_enter_rcu() or
__irq_exit_rcu() it is still inside lockdep's hardirq context, and there
the same acquisitions reuse one pair of chains.

The dependencies recorded on the return path are "lock held with
interrupts enabled -> hrtimer_bases.lock". Such a lock is hardirq-unsafe
and hrtimer_bases.lock is hardirq-safe, so a path in the reverse
direction is already reported by the irq-safety checks without these
edges.

Re-enter lockdep's hardirq context around the rearm on the kernel return
path. The return to user mode path holds no locks and is left alone, as
is the rearm in __schedule(), which runs under the runqueue lock.

With the same kernel tree, configuration and workload, one hour of
uptime including a full kernel build, the chains of this shape, with
hrtimer_bases.lock and optionally the timekeeper sequence count on top
of a held-lock stack outside the scheduler, go from 13266 (96187 chain
hlocks, 15.9% of those in use) to 4. Those 4 come from clock_was_set(),
which takes cpus_read_lock() and each CPU's hrtimer_bases.lock and reads
the clock under it.

Fixes: 15dd3a948855 ("hrtimer: Push reprogramming timers into the interrupt r=
eturn path")
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20261013071318.33300-1-mikhail.v.gavrilov@gmai=
l.com
---
 include/linux/irq-entry-common.h | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-commo=
n.h
index 0bb6c03..c74b5c8 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -468,6 +468,25 @@ static inline void irqentry_exit_to_kernel_mode_preempt(=
struct pt_regs *regs,
 		irqentry_exit_cond_resched();
 }
=20
+/*
+ * The deferred hrtimer rearm is the tail of the timer interrupt, moved to t=
he
+ * interrupt return path so that it runs after a possible reschedule. By now
+ * irq_exit_rcu() has left lockdep's hardirq context. Re-enter it for the
+ * rearm, so that the hrtimer base lock and the timekeeping sequence count a=
re
+ * not chained onto the locks held by the interrupted context, which would a=
dd
+ * new lock chains for every lock stack an interrupt hits.
+ *
+ * The rearm on return to user mode needs no such annotation: no locks are
+ * held there, so it uses the same lock chains as the rearm in hardirq
+ * context.
+ */
+static __always_inline void irqentry_hrtimer_rearm_deferred(void)
+{
+	lockdep_hardirq_enter();
+	hrtimer_rearm_deferred();
+	lockdep_hardirq_exit();
+}
+
 /**
  * irqentry_exit_to_kernel_mode_after_preempt - Establish trace, lockdep and=
 RCU state
  * @regs:	Pointer to current's pt_regs
@@ -491,7 +510,7 @@ irqentry_exit_to_kernel_mode_after_preempt(struct pt_regs=
 *regs, irqentry_state_
 		 */
 		if (state.exit_rcu) {
 			instrumentation_begin();
-			hrtimer_rearm_deferred();
+			irqentry_hrtimer_rearm_deferred();
 			/* Tell the tracer that IRET will enable interrupts */
 			trace_hardirqs_on_prepare();
 			lockdep_hardirqs_on_prepare();
@@ -502,7 +521,7 @@ irqentry_exit_to_kernel_mode_after_preempt(struct pt_regs=
 *regs, irqentry_state_
 		}
=20
 		instrumentation_begin();
-		hrtimer_rearm_deferred();
+		irqentry_hrtimer_rearm_deferred();
 		/* Covers both tracing and lockdep */
 		trace_hardirqs_on();
 		instrumentation_end();
