Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1C1447808
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758084; cv=none; b=K/IO9A1ouHNxlVMlDS2FXV09VPiOEDbCxSfbfPYsiaAaqmp41fpX7M02MBzlV5iWwsgoRcNYVctxSH3rRZN0HV66caOO3hsC5Wxx5LHSI7wK+LoyqXW9YjhddWDIFnWOUpCGhEQuP0DSnz3P1bz3lRElDB/3tbhuc1TdvX6FUzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758084; c=relaxed/simple;
	bh=aGDcjbT5mudRTA/zDukmSoOG1WRI2umKItJ+Ohrpt7c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WI7V03g5U1LgcdwJUogmcsPPge58ShRIlIC8Lu938XiqrGEtpSfV3SFssAon2KZi8EmpLHBkqUhvNocmkwKJijSP27iSPvs///MziW+vPMTXKtsK9MxYKHSiMzgEXRgp5iNQi4bKrSBX3JzainojivtL3MO5ZJ+hOfiWN3JUKFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=LgcWiyVT; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LgcWiyVT"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B3841477;
	Wed, 30 Sep 2026 01:47:58 -0700 (PDT)
Received: from e127648.arm.com (unknown [10.57.52.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 13E193F85F;
	Wed, 30 Sep 2026 01:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790758081; bh=aGDcjbT5mudRTA/zDukmSoOG1WRI2umKItJ+Ohrpt7c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LgcWiyVTuTRJi+WymEE0JbACDXrHmB1PhUYrW6WEgLBDIOk71Wj5BlI8PMMuFtgd2
	 ZNoVZ0kh1CHgxH+qm1J+I1tHWuiZYkzHBgW01FkYbuUnUJehlOAh32uG9L0FFioMw4
	 POGGjL5tPJol654ovGgM6/YkE8vfGwVoKz3EZ+r4=
From: Christian Loehle <christian.loehle@arm.com>
To: linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	kayracizmeci@gmail.com,
	Christian Loehle <christian.loehle@arm.com>
Subject: [PATCH 1/2] sched/eevdf: Cap protection when current has the shortest slice
Date: Wed, 30 Sep 2026 09:47:37 +0100
Message-Id: <dd46b8eddbd760b4d5f2cb7d0eb5027bf70fad32.1790756779.git.christian.loehle@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1790756779.git.christian.loehle@arm.com>
References: <cover.1790756779.git.christian.loehle@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changing a task's slice does not discard its remaining request. With
PLACE_REL_DEADLINE, the preserved deadline can therefore extend beyond
the new slice after sched_setattr() reduces it.

set_protect_slice() starts from that deadline and only applies the slice
cap when another entity has a shorter slice. If current itself has the
shortest slice, a later pick can protect it for the remainder of the old
request. update_curr() then need not request another selection when a
competitor becomes eligible.

For a preserved deadline d beyond the new virtual slice vslice:

           v                 v + vslice                  d
           |---------------------|----------------------|
    old:   |<---------------- protection -------------->|
    new:   |<---- protection --->|

Commit aae2a33ea662 ("sched/eevdf: Ensure that vprot will never go above a
min slice") caps protection even when the ineligibility boundary is later,
but leaves this slice == se->slice case uncovered.

Apply the minimum-slice cap unconditionally, including when it is
current's own slice. Keep the earlier ineligibility boundary for the
PREEMPT_SHORT case when a shorter slice is competing. This preserves the
outstanding request while limiting protection at each fresh pick.

Fixes: 82e9d0456e06 ("sched/fair: Avoid re-setting virtual deadline on 'migrations'")
Signed-off-by: Christian Loehle <christian.loehle@arm.com>
---
 kernel/sched/fair.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 85bf02570473..868c3911337a 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1128,13 +1128,12 @@ static inline void set_protect_slice(struct cfs_rq *cfs_rq, struct sched_entity
 		slice = cfs_rq_min_slice(cfs_rq);
 
 	slice = min(slice, se->slice);
+	/* A preserved deadline can extend beyond the current slice. */
+	vprot = min_vruntime(vprot, se->vruntime + calc_delta_fair(slice, se));
 
 	/* If there are shorter slices than se's one */
-	if (slice != se->slice) {
-		vprot = min_vruntime(vprot, se->vruntime + calc_delta_fair(slice, se));
-		if (sched_feat(PREEMPT_SHORT))
-			vprot = min_vruntime(vprot, ineligible_vruntime(cfs_rq));
-	}
+	if (sched_feat(PREEMPT_SHORT) && slice != se->slice)
+		vprot = min_vruntime(vprot, ineligible_vruntime(cfs_rq));
 
 	se->vprot = vprot;
 }
