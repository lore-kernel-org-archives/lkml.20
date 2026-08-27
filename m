Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F851A6811
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787824850; cv=none; b=Zj/b4r+dTFeTjDUaSdIwgDu8AYfjOnqXiWfJN48zhPHVqI/8XKNx81e4QuRpejK0p6nqeyhSzkxD2iI+Yy4wzlb/394CWhEmqCxeftUaKBjZ1O/132RkfS+nFBqYIfHYUaBfRNu7Ajuy7542V8nD75hRDLPguN8QeGIwaa0g2n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787824850; c=relaxed/simple;
	bh=V3qfSQEBDjZ+wvPPffA1L/pWv5HeogPnHXUyZc3up38=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dr1C0+1VPUj95AE49UBKGR0I2MtOm/P0INB8FkUOWBJ39QNGJtUJmUmOVlV1/RpOYINwJH5d39yDLzkRwaUYI11m9cSqVIjBfMlhaRlSelb1KmMM0x7S27lZ+gJ7spG8ACg5juDd5mqfL8bFRuvcoP+TQ8qIRTdI6wz4Dv2s3MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=iE2Lkr/i; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="iE2Lkr/i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ID
	RmnAlRZ3QW0jlNcC0H9vIDptX8jekvDfksyreteLw=; b=iE2Lkr/i8SPjlH09VJ
	ZCTC20EccfOOHg/0SFPgWXBSF1kVgBluIq7LcB5qOmmjhRu2SqSmabLVL9EGtqSW
	OxXnVC5RmBiSyqgH2XXjgV12kh5c2lsocH3j0Ti2PQHQjzGXaKqoGtg24JhLQHt5
	v09wE83hyT+0KmCDJ4WykTy20=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDX339mCpBqwzltRg--.62755S2;
	Thu, 27 Aug 2026 17:59:03 +0800 (CST)
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
Subject: [PATCH] sched/numa: Fix time unit mismatch in scan staggering
Date: Thu, 27 Aug 2026 17:59:02 +0800
Message-ID: <20260827095902.2645166-1-sh_def@163.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDX339mCpBqwzltRg--.62755S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw1xAw15Zrykur43Ar1xuFg_yoW8ur1kpF
	Z5Kw45Aw47X3yj934I9an7urWfW393Xw47WF47CFZ2q34UWr9Igr1093W3Xw4jkr4ruF4I
	qayYqFy3Gw4qyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbmiiUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6gdauWqQCmfXDwAA3B

init_numa_balancing() stores node_stamp in nanoseconds, but
task_scan_max() and numa_scan_period are in milliseconds. The existing
min_t() compares task_scan_max() in milliseconds with a nanosecond
value, so it can initialize node_stamp far too small and defeat
staggering for new threads sharing an mm.

For example, with the default scan periods and two mm users, the
intended stagger is 2000 ms. The existing code instead computes a
60000 ns delay; after adding the two-tick offset, node_stamp is about
2.06 ms with HZ=1000.

Moreover, min_t() and delay use unsigned int, so nanosecond values above
UINT_MAX are truncated. On 32-bit systems, the multiplication can also
overflow before the value is converted.

Compare the delay in milliseconds using u64 and convert to nanoseconds
after the minimum is selected. This preserves the intended cap and keeps
node_stamp in the unit consumed by task_tick_numa().

This prevents NUMA balancing scans from being concentrated for
multithreaded workloads and avoids shortening the initial stagger
through integer truncation.

Fixes: 137844759843 ("sched/numa: Stagger NUMA balancing scan periods for new threads")
Signed-off-by: Hui Su <sh_def@163.com>
---
 kernel/sched/fair.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 6d881e530f89..6924cf3b3a67 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4413,12 +4413,11 @@ void init_numa_balancing(u64 clone_flags, struct task_struct *p)
 	 * already by arch_dup_task_struct but stagger when scans start.
 	 */
 	if (mm) {
-		unsigned int delay;
+		u64 delay_ms;
 
-		delay = min_t(unsigned int, task_scan_max(current),
-			current->numa_scan_period * mm_users * NSEC_PER_MSEC);
-		delay += 2 * TICK_NSEC;
-		p->node_stamp = delay;
+		delay_ms = (u64)current->numa_scan_period * mm_users;
+		delay_ms = min_t(u64, delay_ms, task_scan_max(current));
+		p->node_stamp = delay_ms * NSEC_PER_MSEC + 2 * TICK_NSEC;
 	}
 }
 
-- 
2.54.0

