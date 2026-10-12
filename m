Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3F032B126
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802392; cv=none; b=Md23I8xFH8k9WoehPgX5H/TIp2K0xxGSEeMUVmgck0t78rOyyMRGpCudU/0g15i89rJkmD0nXBZwuY9l5aRBea1rI4k0yLhyVYYg//ZdK7s1MM7hTR/AtGLTcUlnCKVk/NTxH42BOrl/SUV9OPgkWcr5S7CDdo0IWl2jEcbaLrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802392; c=relaxed/simple;
	bh=vQfVQu8ls9L92Vz9VoaSYDzxJD0qEr6yMbRn8kbUBxg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UKef8XyaABhtJOtSp096pNAOXxpGpih0ttVkwlnsUeNmr7GWg+pLa/c9s3rR6FaP/YVMFqT4uO19eUgQfRbWZoSbpuG6zxQGdpYhU/m4CKGEizLlScKY8ff9NNaz6jSOtlNTHdeAIXb8xUzVQI9qXic3C19n6sUu2P4oTCD/rFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OcRDjRl9; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OcRDjRl9"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2CBE1655;
	Mon, 12 Oct 2026 03:53:06 -0700 (PDT)
Received: from e128083.cambridge.arm.com (e128083.arm.com [10.0.130.70])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A617A3F66F;
	Mon, 12 Oct 2026 03:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791802390; bh=vQfVQu8ls9L92Vz9VoaSYDzxJD0qEr6yMbRn8kbUBxg=;
	h=From:To:Cc:Subject:Date:From;
	b=OcRDjRl9RqgGRaD3U/2BULBD9ZG7eWmVDaFgw+D/b9cbv3MMVDOy7sKCAHCG0fLFS
	 U0gX0PZfN5KdLZcKG8y/G5gEQFPIRWixb5eHKdwTApl5NTSIpHCGl0NZAHH9feEBwm
	 D5E5ESA85BlEm0OZj1QiIpNEzQjmsd1lGSywQp4E=
From: Elif Topuz <elif.topuz@arm.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org
Cc: dietmar.eggemann@arm.com,
	kprateek.nayak@amd.com,
	christian.loehle@arm.com,
	elif.topuz@arm.com
Subject: [PATCH] sched/eevdf: Remove redundant RUN_TO_PARITY check
Date: Mon, 12 Oct 2026 11:50:01 +0100
Message-Id: <20261012105001.131311-1-elif.topuz@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

update_protect_slice() is only called from wakeup_preempt_fair() when
RUN_TO_PARITY is enabled. Remove RUN_TO_PARITY check inside
update_protect_slice() and use cfs_rq_min_slice() directly.

Signed-off-by: Elif Topuz <elif.topuz@arm.com>
---
 kernel/sched/fair.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index b42a0ca2a69e..f493fa29aed6 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1133,13 +1133,8 @@ static inline void set_protect_slice(struct cfs_rq *cfs_rq, struct sched_entity
 static inline void update_protect_slice(struct cfs_rq *cfs_rq, struct sched_entity *se)
 {
 	u64 vruntime = min_vruntime(se->vruntime, avg_vruntime(cfs_rq));
-	u64 slice = normalized_sysctl_sched_base_slice;
-	u64 vprot;
-
-	if (sched_feat(RUN_TO_PARITY))
-		slice = cfs_rq_min_slice(cfs_rq);
-
-	vprot = min_vruntime(se->vprot, vruntime + calc_delta_fair(slice, se));
+	u64 slice = cfs_rq_min_slice(cfs_rq);
+	u64 vprot = min_vruntime(se->vprot, vruntime + calc_delta_fair(slice, se));
 
 	if (sched_feat(PREEMPT_SHORT) && slice != se->slice)
 		vprot = min_vruntime(vprot, ineligible_vruntime(cfs_rq));

base-commit: 4a3b51aab6e25244d97936aa65e6d5425adf98e1
-- 
2.34.1

