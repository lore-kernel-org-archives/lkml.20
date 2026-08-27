Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAA43B19CA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787817810; cv=none; b=q0WEz1GHAKkN3DGCaKjClsURojqiI5d2Clv9LyRymeQfJIgFSkfctqdK6Zx6tBTCCCp9lzoe3ZQMgKgwObkUc6ELskzSyRFPKfTe2Gqzo4PnPurnZeFyYJyoRyNyHvXQBAUoqq22OLsk3867JgTYVMJIAnsPO2JkGq4eO6J7AJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787817810; c=relaxed/simple;
	bh=Zdm/9OhuKXURwmuva46EGS2IiJYa1OUwatIY2sDygiI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q0myR+0ARihv/W1aoY7nt5lrB+iUyA9kIcllMdiOsnVVOLa/ZwgYI+aWHNA4p1dE0I0ErckyzOHRjSML5Nci8VJ62FCoih+R+dfCb2R2MQzWTJDBKNgJNpIzxaydkfkouijOe1mklSpod0I2jbPYsF5C5ZaP8f19wnyGjyrY/RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=iqdLhEa6; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="iqdLhEa6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=s1
	4LnE/KG5CDXurRq71r7qAYyw4OGoAsQQMyrb+w7OI=; b=iqdLhEa6TuhTZEjngx
	SXyJhCrtS/FZsVcvEXY1nnvffQQGkLmD0aGvt7jhjZ0WaGCKzn7p58S+4JXoCKcu
	XxhfL7mw9Ob76PiHgkh/fFw+j0982gZxwqX4sgtttTkkkWcvmPMb34Xclwc13H4T
	9m3OF1ooDdkB0cXu7aNG+n/Uc=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDXX93w7o9qLqydRQ--.57527S2;
	Thu, 27 Aug 2026 16:01:53 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched/core: Fix overflow in resched latency warning threshold
Date: Thu, 27 Aug 2026 16:01:52 +0800
Message-ID: <20260827080152.2544683-1-sh_def@163.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXX93w7o9qLqydRQ--.57527S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxury3GF1xJr15GFWUWFWxZwb_yoW5uFyDpF
	98ZrWUAr4xKw4jq3ySkw12kF1rGw47JrWxWFZ8ZrWxAryrKrySqryqva43tr4YkrWjkFW3
	uFW7W342kw4jyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbkuxUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6RF21WqP7vFwIQAA3w

On 32-bit kernels, latency_warn_ms * NSEC_PER_MSEC is evaluated
using 32-bit signed arithmetic because NSEC_PER_MSEC is a long. Values
above 2147 ms can therefore overflow before the result is compared with
the u64 resched latency, causing the warning threshold to be
miscomputed. Depending on the wrapped value, warnings can be
suppressed or triggered too early.

The debugfs latency_warn_ms knob is exposed through
debugfs_create_u32(), but the underlying variable is currently an int.
Values above INT_MAX can therefore be stored with a negative signed
interpretation. The boot parameter parser similarly uses a signed type
even though the debugfs interface exposes the setting as unsigned.

Use an unsigned int consistently, parse the boot parameter with
kstrtouint(), and convert the millisecond value to u64 nanoseconds
before multiplication.

This only affects the latency warning diagnostic and does not change
scheduling decisions.

Fixes: c006fac556e4 ("sched: Warn on long periods of pending need_resched")
Signed-off-by: Hui Su <sh_def@163.com>
---
 kernel/sched/core.c  | 12 +++++++-----
 kernel/sched/sched.h |  2 +-
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f78275192036..0b1edbc13da1 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -180,7 +180,7 @@ __read_mostly unsigned int sysctl_sched_features =
  * If sysctl_resched_latency_warn_once is set, only one warning will be shown
  * per boot.
  */
-__read_mostly int sysctl_resched_latency_warn_ms = 100;
+__read_mostly unsigned int sysctl_resched_latency_warn_ms = 100;
 __read_mostly int sysctl_resched_latency_warn_once = 1;
 
 /*
@@ -5719,7 +5719,8 @@ unsigned long long task_sched_runtime(struct task_struct *p)
 
 static u64 cpu_resched_latency(struct rq *rq)
 {
-	int latency_warn_ms = READ_ONCE(sysctl_resched_latency_warn_ms);
+	unsigned int latency_warn_ms = READ_ONCE(sysctl_resched_latency_warn_ms);
+	u64 latency_warn_ns;
 	u64 resched_latency, now = rq_clock(rq);
 	static bool warned_once;
 
@@ -5740,7 +5741,8 @@ static u64 cpu_resched_latency(struct rq *rq)
 
 	rq->ticks_without_resched++;
 	resched_latency = now - rq->last_seen_need_resched_ns;
-	if (resched_latency <= latency_warn_ms * NSEC_PER_MSEC)
+	latency_warn_ns = (u64)latency_warn_ms * NSEC_PER_MSEC;
+	if (resched_latency <= latency_warn_ns)
 		return 0;
 
 	warned_once = true;
@@ -5750,9 +5752,9 @@ static u64 cpu_resched_latency(struct rq *rq)
 
 static int __init setup_resched_latency_warn_ms(char *str)
 {
-	long val;
+	unsigned int val;
 
-	if ((kstrtol(str, 0, &val))) {
+	if (kstrtouint(str, 0, &val)) {
 		pr_warn("Unable to set resched_latency_warn_ms\n");
 		return 1;
 	}
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index e656c7059bf8..0abea8f64148 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3150,7 +3150,7 @@ extern __read_mostly unsigned int sysctl_sched_migration_cost;
 
 extern unsigned int sysctl_sched_base_slice;
 
-extern int sysctl_resched_latency_warn_ms;
+extern unsigned int sysctl_resched_latency_warn_ms;
 extern int sysctl_resched_latency_warn_once;
 
 extern unsigned int sysctl_sched_tunable_scaling;
-- 
2.54.0

