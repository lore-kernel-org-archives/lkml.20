Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC20563293;
	Tue, 29 Sep 2026 19:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790708403; cv=none; b=BwWD/9ZQl//aFBkVgxKy/1l0tNdcBfmckhzyz4kgJY1J0YmJTu5l31TSnzQUczvBQ9dD2JmcGZcTK7I3TF6mi0TNPXsaf/MZn7DvMsPaBt/K/Rf2LvIL7PEwCYzfg9OnL5ZlYrqhPQ6D/+fRQFizjkB6glQVQIY4aKNt5EdB6cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790708403; c=relaxed/simple;
	bh=+izprwPS4VViTTF43V2iEiNwcWExGpT4rkZa4NxnRUU=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=mXqWHI9+Nu6OQIxaU14kEKKMf/k7E2CpZd9/IKJeRhIVswhKqfQJNU58wv/xIv2hqi9oYYdGPGzaUrKNdBS/nup4jSIyXqsZBI5mdLlout7yukGcPLPYK8aejTVC/fXDEsZ0/TITZCaCu8Bx52kajl5M8q6Sm5XDvmiLxni81jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MDXaKg7v; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AZU6Ek8G; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MDXaKg7v";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AZU6Ek8G"
Date: Tue, 29 Sep 2026 18:59:57 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790708399;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ywLYG8yZvapa2wxatty8afZNOZZibm+AixAOzveNX4I=;
	b=MDXaKg7v5lhFgs84tDl9Behvlf3iRAU7BOBi9wzKTuebVBk5UNObdTFCgJ2pRW8Au8hOTR
	qpZz+bh/V+HQqJ5+CF7/n/hKkv4rIqCRt0Rv0aQbIRESLq8fxD4r1SnCKN9WJGSKon0ies
	RzejbFAJ6u+pKxN5B+CWZkmb5xZuump7tXJQafzE04ww5ymeZYnnCCP2I+AUNMnTHLwpd/
	rcim3ojUmeGm0Vk1BrTapHvipQ/djlNhfx+IJe7u4IQeiHhwntht5zAAwWMgNY4dmNex2X
	0fZHuez5uE73soBO0rIAFiLeBJMyi++F7/O4aEgQH3T5/zY0Smw4+rZBVkgJPA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790708399;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ywLYG8yZvapa2wxatty8afZNOZZibm+AixAOzveNX4I=;
	b=AZU6Ek8G8rjBpxtM324lYs9MYeOLxOKT67utDRs13p6CL9aDCMaos9Y734HfKWDbACTdXo
	CK5OYZ4Rmbg7rsAQ==
From: "tip-bot2 for Usama Arif" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: timers/nohz] tick/nohz: Remove redundant local_irq_save()/restore()
Cc: Usama Arif <usama.arif@linux.dev>, Thomas Gleixner <tglx@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260916141530.3423310-1-usama.arif@linux.dev>
References: <20260916141530.3423310-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179070839710.3910103.2039686812981886696.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/nohz branch of tip:

Commit-ID:     75990fb534e858ac61ae7651c4695e0905a04443
Gitweb:        https://git.kernel.org/tip/75990fb534e858ac61ae7651c4695e0905a=
04443
Author:        Usama Arif <usama.arif@linux.dev>
AuthorDate:    Wed, 16 Sep 2026 07:15:30 -07:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 29 Sep 2026 20:55:51 +02:00

tick/nohz: Remove redundant local_irq_save()/restore()

tick_nohz_update_jiffies() is only reached through tick_irq_enter() from
hard interrupt entry, where local interrupts are already disabled.

tick_do_update_jiffies64() requires interrupts to be disabled. The
local_irq_save()/local_irq_restore() pair around it therefore provides no
additional interrupt exclusion.

Remove it and assert the caller invariant instead.

On x86-64, this avoids the redundant RFLAGS save, CLI, saved-IF test and
conditional branch on the tick-stopped path.

On a 252-CPU host running a Thrift RPC service, tick_irq_enter() ran
165,116 times/s out of 212-244k interrupts/s. Only calls with
TS_FLAG_STOPPED reach the optimized path, so this is an upper bound on
its execution rate.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
Link: https://patch.msgid.link/20260916141530.3423310-1-usama.arif@linux.dev
---
 kernel/time/tick-sched.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index 6c3fea3..c8f2c4a 100644
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
