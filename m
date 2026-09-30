Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF7E4C7538
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767343; cv=none; b=NaPQrQ98r6fM7x040ozIVuZbpAW4LNu65n94dLUTD3VuM/ysXTt6yU6pSPWF6aBC7LtNzu33syCH9e0JaaKdvrv3p1YoLFyhZ7zeMDdNKc57bXXt+WjMl3zu03Jg7FG1iDW8x1UXSNqwlCA54MJBQu3bUK4EIdW/eTM6TdFC3l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767343; c=relaxed/simple;
	bh=CSyJQhsEPCGuTuD2sAljNgb03Y2I/ENeKn61q3BXVcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MG3z9lIpBXd22FVfuxHNv0O1+fFF2hM7+C/16Npkg67QKIno0lzgD2yPFuWX2Fig87v1w2q78QAXptkAHB3y1ZkyJI6Q80+vfHr9ZdRhza1qarq5fpBcvPUp18SKHgPBfSSYzhjzRixDP0r/X52WC1KL4250xouONnvW7qPEuc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=KIlZn2p/; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="KIlZn2p/"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso48637475e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790767339; x=1791372139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M5sOdqBpRiTst4ZBC1jadPK4tdAEyGxAhe4Ruk8ZbG8=;
        b=KIlZn2p/Mz0iuOovEa4ZpDkMeg2+cX8r5/23L8YfJ2G0nG9LT0436VAM2c26IjbRGC
         XZsS5nKfECwUnb8pz2NQnwmP5HH+SCP7aZzqIXtvaccMtV4khj3YPZA66BqF3EfbCkQP
         0Zfyid+hN9YHzJS8vx7H8ohMeKVZlzuS0PyZeqb7+C/MOkX38n59EZi7r4aKIf2sWz7I
         bvjrRggmjvS/P7oEPy+yTM3UbOu2MdqXBuNsQ7puVfO+nT/fTpURTibI8zpJX9rEWqhQ
         FIWgs/KulRe5j7HHqzha7l7Cmj9bdob9bRNcgMFUkzYZSZ4s8wMrPq4n5fVERogz5i78
         XDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767339; x=1791372139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M5sOdqBpRiTst4ZBC1jadPK4tdAEyGxAhe4Ruk8ZbG8=;
        b=F/pa1OxMUWdADf6d9d6jsAMb8TPr5SUL2DqGCmUKvhqHLiSZsYXq4W9Wexfx4VJvX4
         9os8EoBP4y2tlwU4XXt85S7KJS+hrUNa3BXfSjkvAigzdhZKOwPm2Oq7O3733Osa7lal
         BFdqlVzwyfXkj+kFclNzPiae1mbPFNf4xftecb6Tvm5Q5vkDWB20NmpyR22nN9Rv4QO8
         OjXs4zMpzsGdEmMSnd4MOLmjcKE462wFGT+s3q76FxBN+mGzSYt81JgVPyWK1zEHWH2Q
         UzVDPEh/yhVbI+ZnglaetEDZz1woelBOlAgAZSR7eyut+1nljcr0/yGK3XefEKRUodV8
         PgwA==
X-Gm-Message-State: AFuF++lp1odef2JE3YzTOvLRBm5rR+9c0DWcjEEvggEDMFs4JY9dcpeK
	Bit8DUZQLjk4jOIctPiXS2I+ADWnIkcWwqk7ZI8gdvJviVsJbQ35dwnxfC2ICZkDXwE=
X-Gm-Gg: AYBFou2Y8nTz8EtnZzsnmLJxnqeTQBrCopu5lkR15LbeXOPsP+SIz07qwkMfZqhD1P0
	rb3EE6bDShYhh6fVfU7nZAOS066aHuTz6tAoLShGEdS++6SnJOFy3AAffwwxtYYRLw92f4W+TwM
	rNpwWcNO4PPlkRGEzsFkMkCI4dTLRyjNddAiEXOkHdFTgCtNnuHEkXgjkm04rVDuRLwJl3zBprg
	T+XOB1EyEhlx9wF8ipMrHjRoZ0sGlANtrk8GReHD+4V2MS2aUD2Mrq/De96WGxeTfaVKOtFxL08
	rxjCv7GNchprDgzU3FoJWYwtTDSFvzFv74nlaAa6LkD1Jk0aar2FbHh2TSkrBYYSQIbEl9iwzEh
	dJMQGtttAodGy/YKpBmzm1U5QwcKdWt6EMyN7gmIFdHn4g58tmlrEaQelgmPrB9lvan7omsTpfR
	xfg/XKMCMNU1sXxNM8d5yQbldrEsbcLueMfEEhkb1FDAzyhtNev2DOyqc71Po9M4W2QnAGbKNKr
	kLLjpA8VNxMoYoLe/peG+05EMw=
X-Received: by 2002:a05:600c:6206:b0:49f:eddb:bcb1 with SMTP id 5b1f17b1804b1-4a01b11cb33mr18611185e9.25.1790767339469;
        Wed, 30 Sep 2026 04:22:19 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.thefacebook.com ([2620:10d:c092:500::6:13b8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a019740c34sm34097095e9.9.2026.09.30.04.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:22:19 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	gourry@gourry.net,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	matthew.brost@intel.com,
	byungchul@sk.com,
	apopple@nvidia.com,
	jannh@google.com,
	pfalcato@suse.de,
	hannes@cmpxchg.org,
	shy828301@gmail.com,
	osalvador@suse.de,
	raghavendra.kt@amd.com,
	stable@vger.kernel.org
Subject: [PATCH v4 5/7] sched/numa: scan PID-inactive VMAs for promotion
Date: Wed, 30 Sep 2026 07:22:04 -0400
Message-ID: <20260930112206.205083-6-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930112206.205083-1-gourry@gourry.net>
References: <20260930112206.205083-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Gregory Price (Meta)" <gourry@gourry.net>

Commit fc137c0ddab2 ("sched/numa: enhance vma scanning logic") skips
VMAs without recent PID activity. Since only NUMA hint faults record
that activity, the filter can suppress the fault needed to promote hot
slow-tier memory.

Let memory tiering bypass the PID scan filter. In combined mode, use the
placement decision to restrict top-tier sampling to VMAs that need it,
while inactive VMAs still receive promotion-only scans.

Make this decision only when a VMA scan starts. placement_due is
evaluated for the current task, and a partially scanned VMA is usually
resumed by a different thread, so re-evaluating it for each chunk would
demote in-progress placement scans and starve large VMAs of placement
sampling in multi-threaded processes.

Track the last completed placement scan separately from scans of any
kind. Promotion-only scans still update prev_scan_seq, but do not
advance the placement-starvation horizon.

On a host with 768 GB of DRAM and 256 GB of CXL memory, one large shmem
VMA consumed most scanning activity, while 2,537 other VMAs covering
84 GB were skipped as inactive. One stand-out result: a hot 20 GB hash
table ended up trapped entirely on CXL and drove CXL bandwidth
utilization beyond sustainable levels - resulting in a large regression.

With this series, the hot hash table ends up split evenly between DRAM
and CXL, tier residency tracks runtime load, and CXL bandwidth
utilization drops from 45GB/s (maxed) to 5-10GB/s, while DRAM bandwidth
utilization increases from ~200GB/s to 250GB/s+, resulting in major
throughput improvements for the database workload.

Fixes: fc137c0ddab2 ("sched/numa: enhance vma scanning logic")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 include/linux/mm_types.h |  7 +++++++
 kernel/sched/fair.c      | 31 +++++++++++++++++++++++++------
 2 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index d0ac21d02c47..86cd12a61755 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -804,6 +804,13 @@ struct vma_numab_state {
 	 */
 	int prev_scan_seq;
 
+	/*
+	 * MM scan sequence ID when the VMA was last scanned for placement.
+	 * The starvation horizon in vma_needs_placement_scan() counts against
+	 * this, so promotion-only scans cannot postpone placement indefinitely.
+	 */
+	int prev_placement_scan_seq;
+
 	/*
 	 * The in-progress scan of this VMA is promotion-only.
 	 * Resumed scans finish with the policy they started with.
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 3b30786ded3b..6002882b9d30 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4105,7 +4105,7 @@ static bool vma_needs_placement_scan(struct mm_struct *mm,
 	 * threads can help scan this vma, force a vma scan.
 	 */
 	if (READ_ONCE(mm->numa_scan_seq) >
-	   (vma->numab_state->prev_scan_seq + get_nr_threads(current)))
+	   (vma->numab_state->prev_placement_scan_seq + get_nr_threads(current)))
 		return true;
 
 	return false;
@@ -4279,7 +4279,8 @@ static void task_numa_work(struct callback_head *work)
 			 * to prevent VMAs being skipped prematurely on the
 			 * first scan:
 			 */
-			 vma->numab_state->prev_scan_seq = mm->numa_scan_seq - 1;
+			vma->numab_state->prev_scan_seq = mm->numa_scan_seq - 1;
+			vma->numab_state->prev_placement_scan_seq = mm->numa_scan_seq - 1;
 		}
 
 		/*
@@ -4312,10 +4313,13 @@ static void task_numa_work(struct callback_head *work)
 		 * Do not scan the VMA if a task has not accessed it, unless no other
 		 * VMA candidate exists. If a scan is already in-progress, finish it,
 		 * but track continuation separately from starting a new one.
+		 *
+		 * The PID filter must not gate promotion. Allow PID-inactive VMAs
+		 * to proceed when memory tiering is enabled.
 		 */
 		placement_due = vma_needs_placement_scan(mm, vma);
 		scan_started = mm->numa_scan_offset > vma->vm_start;
-		pid_scan_allowed = vma_pids_forced || placement_due;
+		pid_scan_allowed = tiering || vma_pids_forced || placement_due;
 
 		if (!pid_scan_allowed) {
 			if (scan_started) {
@@ -4327,9 +4331,18 @@ static void task_numa_work(struct callback_head *work)
 			}
 		}
 
-		/* Keep scan policy stable while processing a VMA in chunks. */
-		if (scan_started && vma->numab_state->promo_only)
+		/*
+		 * Keep scan policy stable while processing a VMA in chunks.
+		 * placement_due is evaluated for the current task, and a
+		 * different thread will usually resume the scan. Finish an
+		 * in-progress scan with the policy it started with.
+		 */
+		if (scan_started) {
+			if (vma->numab_state->promo_only)
+				placement_scan = false;
+		} else if (tiering && !placement_due) {
 			placement_scan = false;
+		}
 
 		vma->numab_state->promo_only = !placement_scan;
 		cp_flags = MM_CP_PROT_NUMA;
@@ -4362,8 +4375,14 @@ static void task_numa_work(struct callback_head *work)
 			cond_resched();
 		} while (end != vma->vm_end);
 
-		/* VMA scan is complete, do not scan until next sequence. */
+		/*
+		 * VMA scan is complete, do not scan until next sequence.
+		 * A promotion-only scan did not cover top-tier folios, so it
+		 * does not count towards the placement-scan starvation check.
+		 */
 		vma->numab_state->prev_scan_seq = mm->numa_scan_seq;
+		if (placement_scan)
+			vma->numab_state->prev_placement_scan_seq = mm->numa_scan_seq;
 		vma->numab_state->promo_only = false;
 
 		/*
-- 
2.55.0

