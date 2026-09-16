Received: from mta0.migadu.com (out-72.mta0.migadu.com [91.218.175.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A804E66A7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568151; cv=none; b=c/cZ7Vo9LA9r4RnWhKZT1i6aVo1zibLXh2ahBdncGGk4Ur30/CVsAPwEGXJFlwj5XqdVzUyDFuZoPP2R3X5PvgyNyylez527Crjcy7g5pPRqI3leHaJEinANtmyaIIjCOiwTifPbCYn8esKJw/WMRrLRdJh03TQiHgemMpJQR3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568151; c=relaxed/simple;
	bh=XGTWEaDzNpuMgA649ZU6U+Ygn1N3n6JYVUIY797KpXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nsAePZyiBts3bDNiAzrNqje3Q9QHSkjhObXcLJ1bMDXbAgLE1Sok1tfYJPX+ssZAGnl4F9F2lh6c8bZ/3PIDiiGOCx5tdU08PmQjWbkKRQTs6mDpXRLKH/PXPZwlaBEfC7JlESg+u0nV4HUzQldGPvZEW7NpnT4AXZRSoJRwpXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JReDEV5B; arc=none smtp.client-ip=91.218.175.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JReDEV5B"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XGTWEaDzNpuMgA649ZU6U+Ygn1N3n6JYVUIY797KpXM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789568145; v=1; x=1790172945;
 b=JReDEV5BkWoL7wnLMRbT+5rBFYfDNzSyvJF/4F/1ZYNVxEqdTz9fK4Pdsd5LMwaqVj1SvxdT
 dDI6AdYKkke3NttbqLf69r07ZVr1l8OAH/Qvvx88rdXW/0ebYtITlC5ITapx0FC0y85S1LKXwwU
 UR1T/Z/t1k2yYtcxoAQA7gaU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 833f698a47890152;
	Wed, 16 Sep 2026 14:15:45 +0000
X-Mizu-Trace-ID: 833f698a47890152
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: tglx@kernel.org,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	linux-kernel@vger.kernel.org,
	mingo@kernel.org
Cc: hannes@cmpxchg.org,
	shakeel.butt@linux.dev,
	riel@surriel.com,
	kernel-team@meta.com,
	Usama Arif <usama.arif@linux.dev>
Subject: [PATCH] tick/nohz: Remove redundant IRQ save/restore
Date: Wed, 16 Sep 2026 07:15:30 -0700
Message-ID: <20260916141530.3423310-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---
 kernel/time/tick-sched.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index 6c3fea3867139..c8f2c4a503b08 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -738,14 +738,11 @@ bool tick_nohz_tick_stopped_cpu(int cpu)
  */
 static void tick_nohz_update_jiffies(ktime_t now)
 {
-	unsigned long flags;
+	/* Reached only from irq_enter_rcu(), i.e. hard interrupt entry. */
+	lockdep_assert_irqs_disabled();
 
 	__this_cpu_write(tick_cpu_sched.idle_waketime, now);
-
-	local_irq_save(flags);
 	tick_do_update_jiffies64(now);
-	local_irq_restore(flags);
-
 	touch_softlockup_watchdog_sched();
 }
 
-- 
2.53.0-Meta

