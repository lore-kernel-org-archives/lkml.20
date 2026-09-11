Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BA02836F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789085924; cv=none; b=WtBj/OkOZnzrbxOTcfbpwYHV/KC3XyZ1OnNbZtd5IyWbDFYFZ6gCsz3cY2eCSWj5YYLbPA1BPoyPQLCrFf7FGHjoxjWsMub3lt1lPXdPhJzmH5x9TNEn/jJE9AZT7H8nfoaesiLLFECMBmLdGGkVeTdqOb5xpBaDNV3zUeAnFIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789085924; c=relaxed/simple;
	bh=Egofb6FnPwJOzI2OGYLWyIi9uKbwLgCrzOqXLr2nxM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cTsOEXPFVr7PQi9I9/0PLSb1ACEMVsFDv865AGtjXRXhxDEv6cLFo03aYJgfhELkJxrbVCQUhlz48awxmSdNLn5MqXKBOIux5GrnVtP0tpud0Bu1Y+wMBx6OOq0uA7y9U0r16nGGqGDKjBP7Z1aq1D40jAI2tqz5nLmJd4k68pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=WhWxV6o4; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="WhWxV6o4"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-939949d9c33so31023085a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789085920; x=1789690720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sdb+na/h6ecDzLaWx78ptxSH3vM79ZXkyzQFAMwq7RI=;
        b=WhWxV6o4tedF4d1afpB6KR3vD1WhgVxoDVIdBhjDHlo9I1XaoAei587YIp82o1QGwC
         Z6LasDuv5mubK4t2ZnAuEbaqPvYWEVxwe+B38U1WbaW1CC+r2TldG4nwqfhzgL2LShuu
         +X65qViLESm3vimf5xzoPDKcga3QqlE4m96ldI44HJLA5+wCwvTMX/B0gTuTpetqtir+
         ztpAt58mAf0pK3X349znXMN4Gkc2ybgHv6fmD13dMe+f1flblJHJOPksxQc0P8mftoNJ
         JhQDAOgL5ZFnxf1Y3SLPPqaZRzqzY19mHyHGZ/BMZjAB7pCsm6sZ6Lvo91AJKphZtfB4
         O5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789085920; x=1789690720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sdb+na/h6ecDzLaWx78ptxSH3vM79ZXkyzQFAMwq7RI=;
        b=lo7fjSxcPL9jyEDhSlY++JSAk7dbiqkrYbrjWh4xmqhp6XainnswlUWvMnAQoKu53J
         +wAYjKfRLBwetBqMQ0TlR/3xIKfD5itN9uBzPIzX5dZsqf9560C0dDxn7qP6xH9UmGSG
         XTrddezh7IgIswM8nuoCIt+pVuN63gpjMmBVG9BDuzKMfdaymYgTLHuCBnVBSJfhuXMA
         OyNiVhfq3rRxpRFJ1yaj4caeD33Xa8dakBaCL4pSfL2HwXXWaAnhyZ9fCNo5gbVhw1k6
         FfAvu/7LCYYJ3yXCBiPJR33FaWzL1a2X+7UePXrCWMEkMVfz9f271aDx06kn8NofD5t6
         JdVg==
X-Gm-Message-State: AFuF++k4D8NoiQQwaGwCQJW9fxmSyyLN5pMSIpaw+2eMZAbTARlMI9gJ
	sFXStQ2Wr60wzQwoHWCGkH9XFLHY8bas9D5C1+blIyo05SIShkWyo2aptWJW7t1Op+g=
X-Gm-Gg: AYBFou0lvG6Ol6ePXk6dXdCPcqXLdBsAiru69/e1y6OeGqBxTFOdPafn7N0MVHcnxtB
	ZhSGKayVs7IdbXj8fqwApXetZt/j9cX2LsEYSp+AY6rSiopiXcr6NvMpgL9gL97VexzlljRePpi
	XVHY0CikDaVTc5SxKEsOG/egCDoCqiDWGqdgjuWNNK5cMXjqE6WpYdc/71kgF7dLKGM2lSANa8I
	XOC/zOxSHiSX/0ybvDIaAL2/+3e/oU90SluUz9fzfejMf23FOwQkwzmvJzbKklQ+TpDGcvkze5K
	URAbrttKiIp/pRc4BsC+IMyYK7+0Ek/MjZEa0ze+kG+a2qW5lXdhwtVEdS3EWVivHnKQXdL7dYo
	CTYxG2jyTZ1PIQULZ+OXIOPZ1IqIA9/8klJ91GVHEAHL2uCBr+gflSyCnt7VakIzoVbxhxBeBpe
	mAggUCPL2ghYp10B8PcGRYzHZMvFy9idyd7YUsuRmY6XUpw6jgefMVEkOBtuSmu1i/BSTl2lLTC
	D7/lBkbY0hegYXCaRBhBYBqO5IVZ4R9R7Z7+LMvJly6LmiidjKI6H57zDly
X-Received: by 2002:a05:620a:270c:b0:939:a3a0:9a70 with SMTP id af79cd13be357-939ea0a39e2mr191963485a.18.1789085920053;
        Thu, 10 Sep 2026 17:18:40 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80e4c36sm108896485a.40.2026.09.10.17.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 17:18:39 -0700 (PDT)
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
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	jannh@google.com,
	pfalcato@suse.de,
	osalvador@suse.de,
	hannes@cmpxchg.org,
	raghavendra.kt@amd.com,
	stable@vger.kernel.org
Subject: [PATCH v2 4/4] sched/numa: do not let VMA PID activity gate promotion
Date: Thu, 10 Sep 2026 20:18:26 -0400
Message-ID: <20260911001826.2109390-5-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911001826.2109390-1-gourry@gourry.net>
References: <20260911001826.2109390-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Gregory Price (Meta)" <gourry@gourry.net>

Commit fc137c0ddab2 ("sched/numa: enhance vma scanning logic")
skips VMAs without recent PID activity. Since only NUMA hint faults record
that activity, the filter can suppress the fault needed to promote hot
slow-tier memory.

In tiering mode, scan PID-inactive VMAs using promotion-only scans.
Reevaluate this choice whenever the scanner visits a VMA and pass it with
each protection walk.

Record socket-placement scans in prev_placement_scan_seq. Promotion-only
scans still update prev_scan_seq, but no longer postpone the starvation
fallback for placement scans.

On a host with 768 GB of DRAM and 256 GB of CXL memory running two roughly
430 GB database workloads, a large shmem VMA occupied each scan while 2,537
other VMAs covering 84 GB were skipped as inactive. A hot 20 GB hash table
remained entirely on CXL before this change and was split evenly between
DRAM and CXL afterwards.

Fixes: fc137c0ddab2 ("sched/numa: enhance vma scanning logic")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 include/linux/mm_types.h |  7 ++++++
 kernel/sched/fair.c      | 48 ++++++++++++++++++++++++++--------------
 2 files changed, 39 insertions(+), 16 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 5413bd10fff2..9f042d6ad465 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -803,6 +803,13 @@ struct vma_numab_state {
 	 * A VMA is not eligible for scanning if prev_scan_seq == numa_scan_seq
 	 */
 	int prev_scan_seq;
+
+	/*
+	 * MM scan sequence ID when the VMA was last scanned for placement.
+	 * The starvation horizon in vma_is_accessed() counts against this, so
+	 * promotion-only scans cannot postpone placement indefinitely.
+	 */
+	int prev_placement_scan_seq;
 };
 
 #ifdef __HAVE_PFNMAP_TRACKING
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index e636e8de53f1..6d1da13a2ef5 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4085,6 +4085,10 @@ static void reset_ptenuma_scan(struct task_struct *p)
 	p->mm->numa_scan_offset = 0;
 }
 
+/*
+ * Decide whether this VMA should be sampled for NUMA placement.  In addition
+ * to recent accesses, periodically allow a scan to avoid starvation.
+ */
 static bool vma_is_accessed(struct mm_struct *mm, struct vm_area_struct *vma)
 {
 	unsigned long pids;
@@ -4101,22 +4105,13 @@ static bool vma_is_accessed(struct mm_struct *mm, struct vm_area_struct *vma)
 	if (test_bit(hash_32(current->pid, ilog2(BITS_PER_LONG)), &pids))
 		return true;
 
-	/*
-	 * Complete a scan that has already started regardless of PID access, or
-	 * some VMAs may never be scanned in multi-threaded applications:
-	 */
-	if (mm->numa_scan_offset > vma->vm_start) {
-		trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_IGNORE_PID);
-		return true;
-	}
-
 	/*
 	 * This vma has not been accessed for a while, and if the number
 	 * the threads in the same process is low, which means no other
 	 * threads can help scan this vma, force a vma scan.
 	 */
 	if (READ_ONCE(mm->numa_scan_seq) >
-	   (vma->numab_state->prev_scan_seq + get_nr_threads(current)))
+	   (vma->numab_state->prev_placement_scan_seq + get_nr_threads(current)))
 		return true;
 
 	return false;
@@ -4142,7 +4137,7 @@ static void task_numa_work(struct callback_head *work)
 	unsigned int numab_mode = READ_ONCE(sysctl_numa_balancing_mode);
 	bool vma_pids_skipped;
 	bool vma_pids_forced = false;
-	bool promo_only;
+	bool accessed, scan_started, promo_only;
 
 	WARN_ON_ONCE(p != container_of(work, struct task_struct, numa_work));
 
@@ -4278,6 +4273,7 @@ static void task_numa_work(struct callback_head *work)
 			 * first scan:
 			 */
 			 vma->numab_state->prev_scan_seq = mm->numa_scan_seq - 1;
+			 vma->numab_state->prev_placement_scan_seq = mm->numa_scan_seq - 1;
 		}
 
 		/*
@@ -4307,17 +4303,30 @@ static void task_numa_work(struct callback_head *work)
 		}
 
 		/*
-		 * Do not scan the VMA if task has not accessed it, unless no other
-		 * VMA candidate exists.
+		 * The PID filter must not gate promotion.  Scan PID-inactive
+		 * VMAs in tiering mode using promotion-only scans.
 		 */
-		if (!vma_pids_forced && !vma_is_accessed(mm, vma)) {
+		accessed = vma_is_accessed(mm, vma);
+		scan_started = mm->numa_scan_offset > vma->vm_start;
+
+		if (!vma_pids_forced && !accessed && !scan_started &&
+		    !(numab_mode & NUMA_BALANCING_MEMORY_TIERING)) {
 			vma_pids_skipped = true;
 			trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_PID_INACTIVE);
 			continue;
 		}
+		if (!vma_pids_forced && !accessed &&
+		    !(numab_mode & NUMA_BALANCING_MEMORY_TIERING) &&
+		    scan_started)
+			trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_IGNORE_PID);
 
+		/*
+		 * In combined mode, only VMAs the task uses need placement
+		 * samples. Without tiering, every VMA reaching here does.
+		 */
 		promo_only = !(numab_mode & NUMA_BALANCING_NORMAL) ||
-			     vma_is_ro_file(vma);
+			     ((numab_mode & NUMA_BALANCING_MEMORY_TIERING) &&
+			      !accessed) || vma_is_ro_file(vma);
 
 		do {
 			start = max(start, vma->vm_start);
@@ -4345,8 +4354,15 @@ static void task_numa_work(struct callback_head *work)
 			cond_resched();
 		} while (end != vma->vm_end);
 
-		/* VMA scan is complete, do not scan until next sequence. */
+		/*
+		 * VMA scan is complete, do not scan until next sequence.  A
+		 * promotion-only scan reached the end of the VMA but did not
+		 * sample placement, so it does not count towards the starvation
+		 * horizon in vma_is_accessed().
+		 */
 		vma->numab_state->prev_scan_seq = mm->numa_scan_seq;
+		if (!promo_only)
+			vma->numab_state->prev_placement_scan_seq = mm->numa_scan_seq;
 
 		/*
 		 * Only force scan within one VMA at a time, to limit the
-- 
2.55.0

