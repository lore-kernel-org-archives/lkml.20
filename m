Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103963D171C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 20:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791492418; cv=none; b=udVCFE7Z8zKgSNMDtb3ffW3+dGWSHNYJ+j8iy3mUm9NFBMkK3XlbgGIm1MAMsiTqYR07Vhin8KRC8YpKolZyUR/tnw0k03ObnxHyhmFXVZE1YxzYa7gFld1Pir6nQehP2MJHD5of2d3sAwAhn93YsSekswBSj9IYBnJFlbrQqME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791492418; c=relaxed/simple;
	bh=8pVDE6gKB5Gw0t6qxjwvlekmFJOu3ZyamWouP1sB23Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uITnjfoquiFYHb68pCjPjf7RGAtC97kruQUW28UpjP2cyzKUc22XZvoExijCdPkPPkIV2J6V9vf95cH9+Ud4dqpOQRtQNble+s298asePeB9MH64mOQq3u10HOvHEDDCHu11AwXMHCXEJCqvs1PoZPXzD9wupR8LvOuf1YCGUNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GRKpZR+w; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GRKpZR+w"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so25613075e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 13:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791492415; x=1792097215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9mZZmE9NIEQo+14wGuifnEY8q83z61KsgfZ3VlGz8po=;
        b=GRKpZR+wtqMyuWdaS4shgY+syit9fRW1J4UVnzYtjILszQ/NVsd6QPWdy/byQ1JeGh
         qxJgKRj0wG8c5MNEBxOoZU27gZHJotN6eLrb7+5oDLAkDFNc0sZ7TDW8gcHOaeps/KmR
         0RYfjMtQ/h/sCYMfhmdp0hvE6JIBLh6w5hg95Zz5VGt9lkrKkh/6IZfh4GXqva/UNQLi
         T8fKMlwFBcKEaRSWufS9dn+gZv0G3zat/db/Xl4ECmcQfNNwLgZgiRQVP412+xQeMnAW
         M7tScduXguQTGZr1xdNpcJWBb8Sl/gNPDqtOCFWGbqq6YNe6gzCAze7Kw58csN5E/Hbf
         1eJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791492415; x=1792097215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9mZZmE9NIEQo+14wGuifnEY8q83z61KsgfZ3VlGz8po=;
        b=LtUxIWndCIGGIWcdR3tskRqnvVA23Y601nvj58Gtef18OuKhOp9yaKE831YLQGV0DQ
         TN0KJ4OFLvGWUTHP7OI472Ycyb2EFZT+sLk4pZ/0RRw1S0MqelY022sFN0N0Br7m8d1O
         oXWGTUZiXf3uVVKMp7b9q8YynfZqu2LZgc+GwJ7IbmePSkqDT6dN0ONJj4jmgfNmy2OI
         L+UbfjHhzIQsMTUVnApJgEkx14SL3AYpUdOJtph0LtJPhAQwYA+3Z9mQv4X9UxoRIwfW
         y6p2KW5AYKaRFp6KGQOH7cR2ohoVvJcNjIS0jg5CCdAUWxPfdiRotpbKnKhsVZznZx3j
         2fEQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4JSxYa0ls7mQtokQPD9aPwBBc7xtLMyFe8vqjHJYPd3hTfs12qvy7/Prgs8nzH/Wgo9qmqVt9rd8f+Q8=@vger.kernel.org
X-Gm-Message-State: AFuF++mAypfoiGFvpoATMZaCoSC5GqhtguaspMOsrcfUeADq4YSx+6tQ
	sb2ko+5Pl2mrdb6bc4u56StUn4uaOBAI1xH9+OG9Zf05BRH50Fvtwbnh
X-Gm-Gg: AYBFou2kmfDRb30DJd5Gxlztp9fKlE6/J3L24Wvy6gbLU4nTsfg32JLg/HqtkUrcGcu
	ykrxDpgPPTEmkkUi2c3AZSZtMP34svPyuCJhbSNkVS7UeyteKvyHu+JLoC2qrTQ3TZ4mKF3ftnQ
	WlTeXHH661M5C8conU1k0ktSwyy1i6sp1TJK9AZK/ZYUDdzJnTnrzOO7ViOM49/LgVezp+STdx1
	j2hKWvS1xW5ZF5AKsuNfIKvk8P3+ASwEaauANqGmuavPLd5tK6MnYZ59ksJTzyBE368WkN8iN/+
	g9VoiqqXoHiNUBG52DX3Mc1PUc3fXgoIKh+RHRuOm7HprOp1RsaHQhWWSwZ6St+yhmpYqmYFFvM
	HAKzkby3wd4zSJljzuH6A7NHV2lyuEqjLJOC04hGKh1IfpjzmvjWDbe3Erz+IZQlYS6/HacS4vj
	JSXZ7ILKPq0sEYoVqQaPpprYyIq0yQ/vZGQAqF0wGF9FscC0N+Bqo9x/mrL7sD/ngl+b/xHK+ye
	91CRVKp7n6asJRjIv22Y34FReTK8jr8LWrC4pCMTggg0MPOpG9Q9CO/r6U6KlJi72A8hncg4cv8
	z9tALg==
X-Received: by 2002:a05:600c:a00e:b0:4a0:1a18:b742 with SMTP id 5b1f17b1804b1-4a1800d3de4mr132110965e9.2.1791492414594;
        Thu, 08 Oct 2026 13:46:54 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abdaa5sm154528f8f.35.2026.10.08.13.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 13:46:53 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Andy Lutomirski <luto@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [RFC PATCH] entry: Account the deferred hrtimer rearm as hardirq context for lockdep
Date: Fri,  9 Oct 2026 01:46:49 +0500
Message-ID: <20261008204649.62265-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On a desktop debug kernel (PROVE_LOCKING, KASAN, LOCKDEP_CHAINS_BITS=19)
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

Fixes: 15dd3a948855 ("hrtimer: Push reprogramming timers into the interrupt return path")
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---
Not touched, and a question for you: the rearm in hrtick_schedule_exit()
also stacks chains on the preempted task's locks, under the runqueue lock.
Chains with hrtimer_bases.lock under the runqueue lock, this rearm among
them, were 4.9% of the pool in the boot above. Should it get the same
treatment?

Tested on x86_64 only (Ryzen 9 7950X), PREEMPT_DYNAMIC. Not tested on
PREEMPT_RT or on the other architectures that use generic entry with
HRTIMER_REARM_DEFERRED.

Method: tree 0c2669a9f4a1 plus local fixes, the same .config
(LOCKDEP_CHAINS_BITS=19, LOCKDEP_BITS=16) and gcc 16.2.1 for both kernels,
built with and without this patch. Each kernel booted fresh and sat at the
login screen with sleep inhibited; a full kernel build (make clean,
make -j32) started at 600 s of uptime, and /proc/lockdep_chains and
/proc/lockdep_stats were read at 3600 s. One run per kernel.

                                                       without    with
lock chains                                              97283   81257
chain hlocks used                                       603921  485100
hrtimer_bases.lock on held-lock stacks outside the
  scheduler (the shape above)                            13266       4
  their chain hlocks                                     96187      12
hrtimer_bases.lock under the runqueue lock (untouched)    5208    4665
hardirq chains starting with hrtimer_bases.lock             11      11
direct dependencies                                      36118   34332
deferred rearms in 2 s (hrtimer_rearm with deferred=1)     534     578

A chain is counted in the third row when it is in process or softirq
context, hrtimer_bases.lock sits on a non-empty held-lock stack with no
scheduler lock in it, nothing or one sequence count follows it, and
debugobjects' obj_hash lock never follows hrtimer_bases.lock on that same
stack (that would be the stack's own hrtimer_start()/hrtimer_cancel()).

The four left with the patch:

  cpu_hotplug_lock -> hrtimer_bases.lock [-> &____s->seqcount#2]
  &dev->mutex -> cpu_hotplug_lock -> hrtimer_bases.lock [-> &____s->seqcount#2]

Beyond the removed chains, the total dropped by another 2764 chains
(2.8%); one pair of runs does not separate that from run-to-run spread,
the untouched runqueue-lock row moved by 10% between the two runs.

Peter suggested looking for such patterns in lockdep_chains here:
https://lore.kernel.org/all/20250310112315.GS16878@noisy.programming.kicks-ass.net/

 include/linux/irq-entry-common.h | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 0bb6c03481fa..521cc30cef08 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -468,6 +468,21 @@ static inline void irqentry_exit_to_kernel_mode_preempt(struct pt_regs *regs,
 		irqentry_exit_cond_resched();
 }
 
+/*
+ * The deferred hrtimer rearm is the tail of the timer interrupt, moved to the
+ * interrupt return path so that it runs after a possible reschedule. By now
+ * irq_exit_rcu() has left lockdep's hardirq context. Re-enter it for the
+ * rearm, so that the hrtimer base lock and the timekeeping sequence count are
+ * not chained onto the locks held by the interrupted context, which would add
+ * new lock chains for every lock stack an interrupt hits.
+ */
+static __always_inline void irqentry_hrtimer_rearm_deferred(void)
+{
+	lockdep_hardirq_enter();
+	hrtimer_rearm_deferred();
+	lockdep_hardirq_exit();
+}
+
 /**
  * irqentry_exit_to_kernel_mode_after_preempt - Establish trace, lockdep and RCU state
  * @regs:	Pointer to current's pt_regs
@@ -491,7 +506,7 @@ irqentry_exit_to_kernel_mode_after_preempt(struct pt_regs *regs, irqentry_state_
 		 */
 		if (state.exit_rcu) {
 			instrumentation_begin();
-			hrtimer_rearm_deferred();
+			irqentry_hrtimer_rearm_deferred();
 			/* Tell the tracer that IRET will enable interrupts */
 			trace_hardirqs_on_prepare();
 			lockdep_hardirqs_on_prepare();
@@ -502,7 +517,7 @@ irqentry_exit_to_kernel_mode_after_preempt(struct pt_regs *regs, irqentry_state_
 		}
 
 		instrumentation_begin();
-		hrtimer_rearm_deferred();
+		irqentry_hrtimer_rearm_deferred();
 		/* Covers both tracing and lockdep */
 		trace_hardirqs_on();
 		instrumentation_end();
-- 
2.56.0

