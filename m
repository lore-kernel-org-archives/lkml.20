Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576279;
	b=O/n5wUYz3jcfQS/eSPMqCs6tTqkVS1FpkafpnF/92o/kYRWdiBJox+U+uDB4t7zKc6VQ
	 rz29dty05lBOP/zAyu5b+oBV3XQ82pcXmtu8KhPdN3xDEiKlTlrm7LjCW1KhaWmP/7dmj
	 8T9GDj6AcMEN9r/+5BcJ2bZ+NzEKbi1skbO+/kPXxxVMDKMd0r9yQKPSQLV1lhl4I2z2z
	 0txaF7xBXWBNXJVfCMpewzQQRHCnokyV95Kz4iFA0rUett9qhOyBMQ7qquqmFmBEAyrjQ
	 o/us/4Bd6DQ9eF2epS98eJa8CX11eTG+KMoMNyi6AMFzgPDZO5SNCJ22+OXntmtrfRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576279;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:References:
	 Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=z9l0pxKmuPSF3QVZJavNS65CzGqJm47C8xONk53R4I0=;
	b=kQyO1mxsUEcWJUIPFYsAkUC+YmndmLXi6ZI1jSiKiCB3bT3UkTfvzKpriztQSzOxbdLD
	 fdbKyom57CU5BJp4FwSXp+CZQrrn4E+8GOjKXo5xtjW70DuHlMMHYKvqH1bgjN8HRU6R/
	 cOQYgkY6KNLuHsJfABSjGAZCGy0wZg9hsZLx4CeWV4B+anUlkB3isZUJOUO87dBwpWk91
	 Ni3t1UdVsu8cVN9vmFrIcHEJoh7SK/+6wMTOSLTnzUlj8/Uwx1U1i9YZYhtaYENyQd86I
	 IGz5WdIbJtWN0SN1rSZ3PoYGSwaiRy4yO0IbemaZvHYJi9wyj+Fw4WpJ/BBm8M1EVPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mp5MA7YE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6BD606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mp5MA7YE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B67231F000C9;
	Wed, 21 Oct 2026 09:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792576278;
	bh=z9l0pxKmuPSF3QVZJavNS65CzGqJm47C8xONk53R4I0=;
	h=Date:From:To:Cc:Subject:References;
	b=Mp5MA7YEkOYGE1K1alvDWt1qZ5X7TewySB/FKjLbJ8UYXqGIFLLHYXsC8RBtndkAn
	 mUGZlxh7YPDwX/YhCakOT4CU4dK9f2buxvZXp1ErQfnW6frJT89YqQfN9g4QdvcJL4
	 FVIWzEhoVo6bDwwK4pPyJbjlJdjINtVo91BXhBm5EsJ3twz0b8qKlmnb78HJ0h5rhN
	 1AO2qi0L+aRMfbcikyOo/zqOWuxA3Zw6RknMK8W8UkABv/dtNCerlA3OXm0P9FRZ1S
	 8CU5NdeRcw+3lULxkLadc03//L0HV/PZJnbgWPCEI/qUJZGCfndDlK/HEWHiewRN90
	 x/fAvOag3fvIg==
Date: Wed, 21 Oct 2026 11:51:15 +0200
From: Thomas Gleixner <tglx@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [GIT pull] timers/nohz for v7.4-rc1
References: <179257622431.804100.15107946105101279363.tglx@fw13>
Message-ID: <179257622916.804100.17004121923108744629.tglx@fw13>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Linus,

please pull the latest timers/nohz branch from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-nohz-2026=
-10-20

up to:  d305927765cf: tick/nohz: Avoid unused timekeeping_max_deferment() cal=
ls


Updates for the tick/NOHZ machinery:

  - Add the BLOCK_SOFTIRQ to the hotplug safe local softirq pending mask to
    prevent false positive error messages. A BLOCK_SOFTIRQ can be pending
    when a CPU goes offline as the subsequent cleanup will take care of the
    outstanding completions.

  - Remove a few redundant invocations of local_irq_save/restore() and
    timekeeping_max_deferment() to speed up the NOHZ idle transitions.


Thanks,

	tglx

------------------>
Usama Arif (2):
      tick/nohz: Remove redundant local_irq_save()/restore()
      tick/nohz: Avoid unused timekeeping_max_deferment() calls

Wang Shuaiwei (1):
      tick/nohz: Add BLOCK_SOFTIRQ to the hotplug safe mask


 include/linux/interrupt.h |  6 ++++--
 kernel/time/tick-sched.c  | 30 ++++++++++++++----------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index 3bf969ad8fe0..52bb684090c0 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -573,9 +573,11 @@ enum
  * _ IRQ_POLL: irq_poll_cpu_dead() migrates the queue
  *
  * _ (HR)TIMER_SOFTIRQ: (hr)timers_dead_cpu() migrates the queue
+ *
+ * _ BLOCK_SOFTIRQ: blk_softirq_cpu_dead() completes the remaining requests
  */
-#define SOFTIRQ_HOTPLUG_SAFE_MASK (BIT(TIMER_SOFTIRQ) | BIT(IRQ_POLL_SOFTIRQ=
) |\
-				   BIT(HRTIMER_SOFTIRQ) | BIT(RCU_SOFTIRQ))
+#define SOFTIRQ_HOTPLUG_SAFE_MASK (BIT(TIMER_SOFTIRQ) | BIT(BLOCK_SOFTIRQ) |\
+				   BIT(IRQ_POLL_SOFTIRQ) | BIT(HRTIMER_SOFTIRQ) | BIT(RCU_SOFTIRQ))
=20
=20
 /* map softirq index to softirq name. update 'softirq_to_name' in
diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index 6c3fea386713..a7893a079a83 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -738,14 +738,11 @@ bool tick_nohz_tick_stopped_cpu(int cpu)
  */
 static void tick_nohz_update_jiffies(ktime_t now)
 {
-	unsigned long flags;
+	/* Reached only from irq_enter_rcu(), i.e. hard interrupt entry. */
+	lockdep_assert_irqs_disabled();
=20
 	__this_cpu_write(tick_cpu_sched.idle_waketime, now);
-
-	local_irq_save(flags);
 	tick_do_update_jiffies64(now);
-	local_irq_restore(flags);
-
 	touch_softlockup_watchdog_sched();
 }
=20
@@ -819,7 +816,7 @@ u64 get_jiffies_update(unsigned long *basej)
  */
 static ktime_t tick_nohz_next_event(struct tick_sched *ts, int cpu)
 {
-	u64 basemono, next_tick, delta, expires;
+	u64 basemono, next_tick, expires;
 	unsigned long basejiff;
 	int tick_cpu;
=20
@@ -859,8 +856,7 @@ static ktime_t tick_nohz_next_event(struct tick_sched *ts=
, int cpu)
 	 * If the tick is due in the next period, keep it ticking or
 	 * force prod the timer.
 	 */
-	delta =3D next_tick - basemono;
-	if (delta <=3D (u64)TICK_NSEC) {
+	if (next_tick - basemono <=3D (u64)TICK_NSEC) {
 		/*
 		 * We've not stopped the tick yet, and there's a timer in the
 		 * next period, so no point in stopping it either, bail.
@@ -876,17 +872,19 @@ static ktime_t tick_nohz_next_event(struct tick_sched *=
ts, int cpu)
 	 * the sleep time to the timekeeping 'max_deferment' value.
 	 * Otherwise we can sleep as long as we want.
 	 */
-	delta =3D timekeeping_max_deferment();
 	tick_cpu =3D READ_ONCE(tick_do_timer_cpu);
 	if (tick_cpu !=3D cpu &&
-	    (tick_cpu !=3D TICK_DO_TIMER_NONE || !tick_sched_flag_test(ts, TS_FLAG_=
DO_TIMER_LAST)))
-		delta =3D KTIME_MAX;
-
-	/* Calculate the next expiry time */
-	if (delta < (KTIME_MAX - basemono))
-		expires =3D basemono + delta;
-	else
+	    (tick_cpu !=3D TICK_DO_TIMER_NONE || !tick_sched_flag_test(ts, TS_FLAG_=
DO_TIMER_LAST))) {
 		expires =3D KTIME_MAX;
+	} else {
+		expires =3D timekeeping_max_deferment();
+
+		/* Calculate the next expiry time */
+		if (expires < (KTIME_MAX - basemono))
+			expires +=3D basemono;
+		else
+			expires =3D KTIME_MAX;
+	}
=20
 	ts->timer_expires =3D min_t(u64, expires, next_tick);
=20

