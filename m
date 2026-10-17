Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4F4484252
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 12:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792241965; cv=none; b=Dc2opu/s/RXsfWqNdXG4Pb3ISbmfGMYuYa3fNmUhav4NbwBV2+QOI+HmG9nRRpfS0TjXHOnXzpwnIIGpdZn1r9YucXfQf52qjPJMGoJkX9FGEV6UZ3RXJmLp30/C4Jz3ZD1Mo+0h13UBIkeG1K/Ca+TCytlObBDbGEatBOoIHpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792241965; c=relaxed/simple;
	bh=48uB7IGKpkpPCEvmyztH4UXSJo0EOIsaf8f/ZbYTrD0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ARVBpp5o7ibANyPLF1y5Q36mwb8fdJzL74g/J3MWW+otP4YOf2RU/yQeVzl/1QGKxQboNCZOI9LyJUhHlcdvMGuiyiJ0+fPkl9b65cB7fOeffHgI09GqYuHc6OYWQvvXjxN0prQPywqerZUyaTb6SUmoGAgWSllnrQxFBPfAuZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=AQK3aa2/; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="AQK3aa2/"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792241952; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=hd1Oxli6U0B3gYK0ArhS5z5Om/LUuZunLMles1SU4Dw=;
	b=AQK3aa2/mN7PoI8oVgNns13o6fsqFUkdF8iWiy7PkzFqYeJagFb0JBhSMnGQumEZUebJF4qBAqrbJ6wU0/zJenOP2JkMr1GkFpXF2cb6KXRmCqozVDpysoLGa6qdqtlfgH5igd5VIna7BIfs6kwJ9Uho+xNMW8AhHHnseDib7As=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R701e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=peng_wang@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0XCxJhRw_1792241950;
Received: from localhost(mailfrom:peng_wang@linux.alibaba.com fp:SMTPD_---0XCxJhRw_1792241950 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 17 Oct 2026 20:59:11 +0800
From: Peng Wang <peng_wang@linux.alibaba.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Peng Wang <peng_wang@linux.alibaba.com>,
	Peter Zijlstra <peterz@infradead.org>,
	He Rongguang <herongguang@linux.alibaba.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tick/nohz: Requeue kicks flushed outside hardirq context
Date: Sat, 17 Oct 2026 20:59:00 +0800
Message-ID: <43668cf88d976084e2865ec07dea82b64ad402ba.1792240863.git.peng_wang@linux.alibaba.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A remote nohz kick can be flushed from task context after idle exit
has checked tick dependencies. If polling suppressed the IPI, the empty
callback is consumed without an IRQ exit to reevaluate the tick. A newly
set dependency can then leave the non-idle tick stopped until another
interrupt arrives.

Requeue the work locally when it runs outside hardirq context on an
online CPU. This raises the IRQ needed for the existing tick reevaluation
path. Skip offline CPUs whose pending work is being drained during
teardown.

Fixes: 4b44a21dd640 ("irq_work, smp: Allow irq_work on call_single_queue")
Fixes: a5183862e76f ("tick/nohz: Conditionally restart tick on idle exit")
Co-developed-by: He Rongguang <herongguang@linux.alibaba.com>
Signed-off-by: He Rongguang <herongguang@linux.alibaba.com>
Signed-off-by: Peng Wang <peng_wang@linux.alibaba.com>
---
 kernel/time/tick-sched.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index 6c3fea386713..87e2a7a87526 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -402,7 +402,12 @@ static bool can_stop_full_tick(int cpu, struct tick_sched *ts)
 
 static void nohz_full_kick_func(struct irq_work *work)
 {
-	/* Empty, the tick restart happens on tick_nohz_irq_exit() */
+	/*
+	 * Remote irq_work may be flushed from task context. Force an IRQ
+	 * exit to reevaluate the tick unless this CPU is going offline.
+	 */
+	if (!in_hardirq() && cpu_online(smp_processor_id()))
+		irq_work_queue(work);
 }
 
 static DEFINE_PER_CPU(struct irq_work, nohz_full_kick_work) =

base-commit: 70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
-- 
2.47.0

