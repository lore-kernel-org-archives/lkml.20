Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BEC376BD9
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789832005; cv=none; b=jw9FPw4fwGZYR3bUAGFPWcwASpm1met0L6eT3g1WEZ19JjS2i9wyZxOkD32Xt6ulEqwk7S3u3r5gMcj3f7BF5GptwD078OA5GlLSWzl7fxQJ0xDVgcdmHTiLgohetxCffBriUB8QXuI5r9DZo1P8e+RpC80XjZA7T8kFZNgnohE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789832005; c=relaxed/simple;
	bh=fSLjp9PCAeeWI5fi/xmCC4mmKJpQyCbjPZDGivwgKbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VNYSs+Adj63+w1X3dOG7zo2W+x0wYfy56vUbUESUaj8Rnj2RUkdBvayvZ9H0EjRRQkAp26AVzL3t09eVewbW1mbsPogXiHb/fBIFBE2J7U5w5ifV/6bxZvUPMRVw1vmkLdHpdlFaeIVP7JJ639SA70K3xmIAgkWOZ0v74cA8DMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=hLw3i2WZ; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="hLw3i2WZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=5x
	If1mA/UAJH4l3O47PGY2+xpGPAj2H8pvknPUuvApw=; b=hLw3i2WZi7j6cKyUTE
	Cvg0KABEY3dWXqNAxt4JpPZc8PRBE+nrKgHFxPP00RV66yacvaY+KzC0OtiGdQx8
	BJp2uklEu55zz8dEiodwXgOw6EKmIK6n7E0YMpbk6jinFshW+dpSdb592ZpfV28+
	wwmktifrx7hgcTEPJJS9My13I=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wCnAW7oqq5qTSbRBQ--.10319S2;
	Sat, 19 Sep 2026 23:31:52 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Mikhail Zaslonko <zaslonko@linux.ibm.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Daniel Bristot de Oliveira <bristot@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] sched/deadline: Fix divide-by-zero in DL bandwidth accounting
Date: Sun, 20 Sep 2026 00:31:49 +0900
Message-ID: <20260919153150.2618403-2-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919153150.2618403-1-sh_def@163.com>
References: <20260919153150.2618403-1-sh_def@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCnAW7oqq5qTSbRBQ--.10319S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur1xKF4rAw43JrWUJF13urg_yoW8ZFWxpF
	ykGa4UJw4qv348Xa95Aw47GFyFv3yktayaqrnxGws3uF1Fyw18K3Z0kw4Sqrn5t3s5CF4a
	yr4jvr4xKa90yw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07US0PDUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwgorimququo3-QAA3n

During CPU hot-unplug, a CPU can be cleared from cpu_active_mask before it
is marked offline. This can leave a window where dl_bw_cpus() returns zero
for a root domain with no remaining active CPU.

DL bandwidth paths can pass this zero CPU count to __dl_sub() and
__dl_add(), which then divide by zero while distributing the bandwidth
update to active runqueues.

This is not specific to the DL server debugfs path. Mikhail Zaslonko
reported the same failure on s390x through sched_setscheduler(), where
task_non_contending() reached __dl_sub() with no active CPU in the root
domain. Other DL bandwidth paths use the same helpers.

Keep updating dl_bw::total_bw when the CPU count is zero, but skip
__dl_update(), since there are no active runqueues to receive an extra_bw
adjustment. This avoids the division by zero in all callers while retaining
the existing total_bw update.

Fixes: daec57983670 ("sched/deadline: Reclaim bandwidth not used by dl tasks")
Reported-by: Mikhail Zaslonko <zaslonko@linux.ibm.com>
Link: https://lore.kernel.org/r/c52c9e8c-260e-49a4-a88e-229e0795d07b@linux.ibm.com
Suggested-by: Mikhail Zaslonko <zaslonko@linux.ibm.com>
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Su <sh_def@163.com>
---
 kernel/sched/deadline.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 0663c00c41c0..840240cff7b9 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -193,14 +193,16 @@ static inline
 void __dl_sub(struct dl_bw *dl_b, u64 tsk_bw, int cpus)
 {
 	dl_b->total_bw -= tsk_bw;
-	__dl_update(dl_b, (s32)tsk_bw / cpus);
+	if (cpus)
+		__dl_update(dl_b, (s32)tsk_bw / cpus);
 }
 
 static inline
 void __dl_add(struct dl_bw *dl_b, u64 tsk_bw, int cpus)
 {
 	dl_b->total_bw += tsk_bw;
-	__dl_update(dl_b, -((s32)tsk_bw / cpus));
+	if (cpus)
+		__dl_update(dl_b, -((s32)tsk_bw / cpus));
 }
 
 static inline bool
-- 
2.55.0

