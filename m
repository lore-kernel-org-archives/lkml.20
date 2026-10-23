Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792767070;
	b=jExdk8LwZLADI2IYCELO9V3Xq9VW+KGibaNJD2NNNjPNgtQYvhzYdPqAvzo/g0cqB+dq
	 bYJsivG/AmDpORzVC+jpnzacSGZMvSDHVG9JaKZZipYvGC16y1T0pxvd35rXOgeugrYjf
	 N33kWjjfQDFDGuWqZMH/3tzAzJJx9sskEXnB/N9S4kxkkkxLNTWSuSgaDd9oxO8VOKn2P
	 Xai2QbvnkzzytOy7oUW6byt8N1F9uyM8xVgHnhMrbbpm/Q13Oqy7irMWqhMhbPv10Ny0i
	 Lvf2iVIfsfdCv3+2LxooyOIp9VCo9PT/dx2LIMtvHpq97m+mKYXndJCsllwknvgj6ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792767070;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZzD6m32TC69GldP7y7Fozv/XK4xKiLA9ZTNtNAyFDB4=;
	b=lar4MD9gWc7d8jBWRzN0e5mMhjTZdfJhMzGDPXS0CIYNwjodMK0bK1UnKhREvOM6hu0+
	 3LfECJx2rEMFFrAhFv9LUcuT2uu8EFZAQ2Bfv5jb4HLox2HYtu7LX5z5YbxKvI10m1mdC
	 pC8CK7MQrxcYQui4kWd0aQ8Kaq5pEl5lhpagTaIa1nVB97zsNtop+w1IugHU7upwJN2hn
	 p4E2SHCd4iKE2/LPfIPMLLU3s6QniYkQoZqkQthQHwnGuUQpgRnlS0xj5tIJ0hVlHStxb
	 AQYA4RbcSzhdwqMQv9ow323TgwQshTHZFzsIitjo+jePxjtESrHsSFKEMHzMXGvbSxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=SKXUqZOH;
	arc=none smtp.remote-ip=115.124.30.100
Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6DC606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF6DC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=SKXUqZOH
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792767065; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=ZzD6m32TC69GldP7y7Fozv/XK4xKiLA9ZTNtNAyFDB4=;
	b=SKXUqZOHyHPJNgBLg5sl3kvHWAoLb+hoelUu5i9ketlqM+TUe9w5waB4hMcN8qedDIJEetiflc8R/wd+UTf0c5df0BqTkEOyWn2//szsA4189zNh4I0LV4J9JFw+69bus0dW24vPtOvjdziwcTfRFz+oqJ9kGACnkPpFsPLwHCg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=peng_wang@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XDMLI41_1792767064;
Received: from localhost(mailfrom:peng_wang@linux.alibaba.com fp:SMTPD_---0XDMLI41_1792767064 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 23 Oct 2026 22:51:05 +0800
From: Peng Wang <peng_wang@linux.alibaba.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	He Rongguang <herongguang@linux.alibaba.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] tick/nohz: Reevaluate the tick for kicks flushed outside hardirq
Date: Fri, 23 Oct 2026 22:51:00 +0800
Message-ID: <20261023145101.8217-1-peng_wang@linux.alibaba.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <atthrrwRchO2FL8g@localhost.localdomain>
References: <atthrrwRchO2FL8g@localhost.localdomain>
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
Changes in v3:
- Add WARN_ON_ONCE() checks for a non-nohz_full CPU and for a
  task-context callback still marked idle, as requested by Frederic.

v2: https://lore.kernel.org/all/20261022175500.15940-1-peng_wang@linux.alibaba.com/

 kernel/time/tick-sched.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index 6c3fea386713..baa3ac9b48f8 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -400,9 +400,21 @@ static bool can_stop_full_tick(int cpu, struct tick_sched *ts)
 	return true;
 }
 
+static void tick_nohz_full_update_tick(struct tick_sched *ts);
+
 static void nohz_full_kick_func(struct irq_work *work)
 {
-	/* Empty, the tick restart happens on tick_nohz_irq_exit() */
+	struct tick_sched *ts = this_cpu_ptr(&tick_cpu_sched);
+
+	if (WARN_ON_ONCE(!tick_nohz_full_cpu(smp_processor_id())))
+		return;
+
+	/* Task-context flushes may not be followed by an IRQ exit. */
+	if (!in_hardirq()) {
+		if (WARN_ON_ONCE(tick_sched_flag_test(ts, TS_FLAG_INIDLE)))
+			return;
+		tick_nohz_full_update_tick(ts);
+	}
 }
 
 static DEFINE_PER_CPU(struct irq_work, nohz_full_kick_work) =

base-commit: 70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
-- 
2.47.3

