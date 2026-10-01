Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E300501F29
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862072; cv=none; b=c/vdm80B4d/i7RnA4nvwPZXjjjN7FQonVOo5fEx2rqGBemKBuBhPQCgmrCd6QOWiZzXq9283Xb+iklQB6KvidghnphEYQ4vTwYzjZLS2VnJLQDCbJVoxmn8/aXaJISt34MwED/pvMor+81y3N+X2jzdv1mpjVGAJLUkbmASjNNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862072; c=relaxed/simple;
	bh=E0GaXeivUTJMQh/Wn9FWBPqwvL1AjHLT8cHnnzlUR58=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KhbtdPdcjb/cm9/OramD8vPiISBc0B+u2reRUktPEnmARf5PFI7MdBWeoV1e1z6BqV5UtucS0cYl52/9qX8/zEFpdoge1Uv6rINiOoGRd8wecMSyl3l54+gEemcYWx1VS8ZBDptXIGAMFGhRewbae5cm6VQ5U4M0QE8rgKrSBK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fTcyDnFo; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fTcyDnFo"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BE20497;
	Thu,  1 Oct 2026 06:41:06 -0700 (PDT)
Received: from e127648.cambridge.arm.com (e127648.arm.com [10.0.130.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 08DA73F86F;
	Thu,  1 Oct 2026 06:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790862069; bh=E0GaXeivUTJMQh/Wn9FWBPqwvL1AjHLT8cHnnzlUR58=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fTcyDnFoKP6va8aAZxCSySQjAT6Qh3gB2UvtCyqq+3klMiDiBAp0a72on+cuwkqMR
	 Z71ZvupO0GBGLodptR8G264KPQjIADle4X+KffHs+Xp0/5f7VzgwSeF/uMRb7lsFCN
	 Eza8rnU/OX3m+AWEz9dYtvP+saQT9yeRLJLaLj7w=
From: Christian Loehle <christian.loehle@arm.com>
To: linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	kayracizmeci@gmail.com,
	kprateek.nayak@amd.com,
	elif.topuz@arm.com,
	sh@gentwo.org,
	Christian Loehle <christian.loehle@arm.com>
Subject: [PATCH v2 3/5] sched/eevdf: Cap protection when current has the shortest slice
Date: Thu,  1 Oct 2026 14:40:14 +0100
Message-Id: <20261001134016.3881268-4-christian.loehle@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261001134016.3881268-1-christian.loehle@arm.com>
References: <20261001134016.3881268-1-christian.loehle@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changing a task slice preserves its remaining request. With
PLACE_REL_DEADLINE, the deadline can therefore extend beyond the new
slice after sched_setattr() reduces it.

The protection calculation starts from that deadline for a fresh grant,
or from the existing boundary for an update. It only applies the slice
cap when another entity has a shorter slice. If current itself has the
shortest slice, protection can remain live for the remainder of the old
request.

Apply the slice bound for both fresh grants and updates, including when it
is current's own slice. Keep the earlier ineligibility boundary for the
PREEMPT_SHORT case when a shorter slice is competing.

Fixes: 82e9d0456e06 ("sched/fair: Avoid re-setting virtual deadline on 'migrations'")
Signed-off-by: Christian Loehle <christian.loehle@arm.com>
---
 kernel/sched/fair.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 3f881ded5457..15fa967273f6 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1134,15 +1134,13 @@ static inline void set_protect_slice(struct cfs_rq *cfs_rq, struct sched_entity
 	if (sched_feat(RUN_TO_PARITY))
 		slice = cfs_rq_min_slice(cfs_rq);
 
-	if (!update)
-		slice = min(slice, se->slice);
+	slice = min(slice, se->slice);
+	/* A preserved deadline can extend beyond the current slice. */
+	vprot = min_vruntime(vprot, vruntime + calc_delta_fair(slice, se));
 
 	/* If there are shorter slices than se's one */
-	if (update || slice != se->slice) {
-		vprot = min_vruntime(vprot, vruntime + calc_delta_fair(slice, se));
-		if (sched_feat(PREEMPT_SHORT) && slice != se->slice)
-			vprot = min_vruntime(vprot, ineligible_vruntime(cfs_rq));
-	}
+	if (sched_feat(PREEMPT_SHORT) && slice != se->slice)
+		vprot = min_vruntime(vprot, ineligible_vruntime(cfs_rq));
 
 	se->vprot = vprot;
 }
-- 
2.34.1
