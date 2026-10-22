Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792691719;
	b=N7diohTfnirOi1kFdhx+/jPKCh8jx4CU0zi6DWs4WAWpnbydugE5NFLdGLSb2fiBtUjR
	 OmHC84WDauIDrVU1tJ0lKo7YsXlXxfgLDqLFpWnNfwGiT+qQ4mLF5dbmMuyxebBIJbr+g
	 uqJMst4W3f78IBP07CoeLKw3mFzpOaqZmTzUh2h8L4jQVxrxYABR7VId+atxRi7IthFxn
	 I07WDG72Y/STS4OXLuMWFj6+H2kAR8rn+hg/NgiBwXbRePbK0M1/5FEtLy9FOwhMjB+vN
	 2LArLiqD4WQ9Aqr8L12YbG5tdWY0XZWHzq9X3CKVirqcv9ACjYUMeKKxfSvJCXb0qWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691719;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KGUhYCJDvd/JSGH3seDFzWnqo3cr2tfSlUjpqUoYi5A=;
	b=w+6yaoMbAnQD508dupMV3UeU1SPAwaZY90NCDYWfDess3o+dFk7v2N2sosVkDZazziag
	 Ku8DxaClGsj85g7skTkz8iUbtomn7u1Tx1OJuhF8aKGsXB9ppzyCZgdcHwF547V/40QE8
	 O7G4SihOEQhFjIAxap8GZQTy9TNBeYb3K+b7vLYiPD/xQrWsRNV3/qLwmXJpiKRT+kk5J
	 aoffuGb0e1FB+Bkx+KrgGtOKUDKs8Slt/ZF7qw6+865TKkD5VOCIvL06SPC7GWD8ne0r4
	 jjxwFHrzKLn1ZnNdMtMV8z7AnIJV/yF/o2Ai/RPSOw/As2O2GcrphvVAxdZk8W0HvKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=L+o9jDBn;
	arc=none smtp.remote-ip=115.124.30.130
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C611606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C611606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=L+o9jDBn
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792691710; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=KGUhYCJDvd/JSGH3seDFzWnqo3cr2tfSlUjpqUoYi5A=;
	b=L+o9jDBnKR9s1D3jJHoZkQj+qdxzxzgSJ+RKpetDTqD6TeUgauZrznZTns0jLLREkGXUe+XvNzpe1VBnf8lNqlpXp5M3MqffSB7gkWci2D6xIlMXlj4T9C/bMXn2HF5GAsAWwc4hFFNf6HqBULWM0PwqGme/rPBC7bhY03wr6xw=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R731e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=peng_wang@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XDJnipT_1792691708;
Received: from localhost(mailfrom:peng_wang@linux.alibaba.com fp:SMTPD_---0XDJnipT_1792691708 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 23 Oct 2026 01:55:09 +0800
From: Peng Wang <peng_wang@linux.alibaba.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	He Rongguang <herongguang@linux.alibaba.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] tick/nohz: Reevaluate the tick for kicks flushed outside hardirq
Date: Fri, 23 Oct 2026 01:54:57 +0800
Message-ID: <20261022175500.15940-1-peng_wang@linux.alibaba.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <atofid9HivdbUuj2@localhost.localdomain>
References: <atofid9HivdbUuj2@localhost.localdomain>
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

The nohz full kick relies on IRQ exit to reevaluate the tick. However,
a remote kick can also be flushed from task context without an IRQ
exit guaranteed to follow. If a tick dependency is set or an earlier
timer is queued after the idle-exit reevaluation, the required tick
update can be delayed until another interrupt.

Reevaluate the tick directly from the callback outside hardirq context.
Keep the existing IRQ-exit handling for hardirq callbacks. The offline
flush remains harmless because tick_sched_timer_dying() has already
cleared TS_FLAG_NOHZ.

Fixes: 4b44a21dd640 ("irq_work, smp: Allow irq_work on call_single_queue")
Fixes: a5183862e76f ("tick/nohz: Conditionally restart tick on idle exit")
Suggested-by: Frederic Weisbecker <frederic@kernel.org>
Co-developed-by: He Rongguang <herongguang@linux.alibaba.com>
Signed-off-by: He Rongguang <herongguang@linux.alibaba.com>
Signed-off-by: Peng Wang <peng_wang@linux.alibaba.com>
---
Changes in v2:
- Reevaluate the tick directly outside hardirq instead of requeueing,
  as suggested by Frederic.
- Use the full update for both dependencies and timer deadlines. Keep
  IRQ-exit handling for hardirq callbacks and the existing NOHZ guard
  for CPU teardown.

v1: https://lore.kernel.org/all/43668cf88d976084e2865ec07dea82b64ad402ba.1792240863.git.peng_wang@linux.alibaba.com/

 kernel/time/tick-sched.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index 6c3fea386713..ece2c21cec84 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -400,9 +400,13 @@ static bool can_stop_full_tick(int cpu, struct tick_sched *ts)
 	return true;
 }
 
+static void tick_nohz_full_update_tick(struct tick_sched *ts);
+
 static void nohz_full_kick_func(struct irq_work *work)
 {
-	/* Empty, the tick restart happens on tick_nohz_irq_exit() */
+	/* Task-context flushes may not be followed by an IRQ exit. */
+	if (!in_hardirq())
+		tick_nohz_full_update_tick(this_cpu_ptr(&tick_cpu_sched));
 }
 
 static DEFINE_PER_CPU(struct irq_work, nohz_full_kick_work) =

base-commit: 70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
-- 
2.47.3

