Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE74F472F86
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767342; cv=none; b=u8bC2lkXvD6FtIQftcm/mz5Y0TfvCah6rspAkG7yjMGrXrIhsmt9Q8bqGmXE93RAVp2wtHroDw3uUi/nd6t6M2pzTr/29znZgur+kLgr3TlwDd71QsWJ+dq2pNX2G7w0jjmF9VCguUVmv9ee7nhDeOjy8jlcuig+yP8hb7dKPmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767342; c=relaxed/simple;
	bh=pu6FFbBILareARzEyGPou/u81aGWKV+xLm7GgZEuJws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NBk8wOeEKTYUaQGPPwWfHPqNsb79siPFHGvdPhMvzu4njfV10OEQw0+Z0zVDHuLyAFpwogd/ogaY8K2TS9phMfYM/mf/s+GXFUejNAO3SbExMtjWeR8BIAZpiu8vhpeggnicU/f7COq3Ll0Mn/oL+VeeFl3q+ntsUNhr0Hn8XFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=XcxRoyPf; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="XcxRoyPf"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso2645950f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790767338; x=1791372138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7fT8gMBRoh6f83banrddk6Bl4fUsBazwJRJAVzyteTg=;
        b=XcxRoyPfCU1pq+UGWrUwCl4Fw4siMiCm5i/uPDdbrQzJy+rztE798KCc9NU+Jh4s+8
         a0jLtwNN/b6qqLhFA8FGCSTU+pMzsGbl0ZxVH81jTPFxx9KMyyFeyyZZ8ZMDCsdZ1XCB
         6VKeid8p/7mXzL1hjSVp74Ki1mn+EunmRrtwA3koWhqPeQjM5KVaOoec3PRGonQMFZZT
         5mHYSXSg0IYx7PZOOYJnXNhPhGMb0SdMO0EiBbhWQeDpWRnd/euchKrGuCZEM6zeSOTe
         Eva7VfAus6kbywBlxl0ZiprpvlbEaJqLXfSJ95njJRILnkG7Fh/cAdhzR9RvvAwy+OcJ
         W5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767338; x=1791372138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7fT8gMBRoh6f83banrddk6Bl4fUsBazwJRJAVzyteTg=;
        b=PMtM8q6GGB/LNyOxTASciDcfan/qag5jsGprGHOvIuSDhBnFhxFYxC2rud9Dv3+aFH
         RIU/kPZj0uwRDv03/PT5SAMsxXxh9Fb/YmkAg1WG1axm5tRszte1ieEX1w+A1nt98gGs
         qd3BoykIx5kpx5LjhFEJFU6E+k7il6MNWCaX2/StzfY1mhNXcK9mcjpXQrp7HNqyr5zh
         08LdkiIMrQQPgUjSOzHkd4UE/scqQJzhb7cvQbb5Y//hkOxcF8a4xeosn8sZmqnzpyqi
         XOib0bLY72gHZaJe+wNYDPJUGK4ou+RJpv9RWQoslu1xHUXl3eDodWbGW67B0WbnhgoD
         Avhw==
X-Gm-Message-State: AFuF++nE3LeV++6Mx42IHOT5qBCRmPIzzGei6nX/hXMnWngr+7N0M3Z0
	lTXy3sD9pWLxQfPfAK43DUtZToE/oT4bRW2B4EsncMXJqzMZ7P/11knrpTWFnVPXJwA=
X-Gm-Gg: AYBFou31b5Wj64dfSPzoi0P1Z/3ppztvDtYJcGo8srQNou78dgJ23ZuhaQCGXtT7Vj/
	VZruT+1Bs8mL+zgDehRov8072x0LKsUJbcxkv2h2DPZInAjfI/BllC6CYtU1Z4dh/nbfqozVSW8
	Cj5YkIRLTi27b6Uf6dTmTHQZ+Wf3idflCQ0aXL90ehDWryG29L2XUUrMec3y0TIgSo1U9Q1HKNR
	HsKYvD1JA/VDIcregrKFWSNsNTRNQuOl0sxCncNgvDiz+GJXJZ5k95TcvU/KE6iApUh13Bvhsi1
	ppVOt6MVeplrC0gGp9X99XvTypyCV7MKatqUNOvJ4igKGVR6IXRg4/UtOmdr00mK0re7ansJpLb
	Lx7tV0V9wQuvjuzpYb7YHJUDyPq0rxXMjXbiKGfS/Dfa6pExqeGp8bq+dNccWvdnP1Dc1SVzsLy
	Cn0WjsnF/2FOq2rsuw9fVN1EbrU8WyfzXkp58oPHC91ARjTRx0TYFDM7AXNchIAR6UcBQvtIIuF
	KQmElqsGobdND+1
X-Received: by 2002:a05:600c:3ba6:b0:4a0:1a7f:2abb with SMTP id 5b1f17b1804b1-4a01addde33mr21170285e9.11.1790767337531;
        Wed, 30 Sep 2026 04:22:17 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.thefacebook.com ([2620:10d:c092:500::6:13b8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a019740c34sm34097095e9.9.2026.09.30.04.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:22:17 -0700 (PDT)
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
Subject: [PATCH v4 4/7] sched/numa: separate VMA placement from scan continuation
Date: Wed, 30 Sep 2026 07:22:03 -0400
Message-ID: <20260930112206.205083-5-gourry@gourry.net>
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

vma_is_accessed() returns true both when a VMA needs placement
(east-west) sampling and when a VMA is already mid-scan across
multiple scan windows.

Callers cannot distinguish placement eligibility from scan progress.

Rename the helper to vma_needs_placement_scan() and handle continuation
state in task_numa_work(). Record whether an in-progress VMA scan is
promotion-only so a scan resumed in a later scan window finishes with
the policy it started with. The zeroed initial state places no
restriction, so a resumed scan that finds freshly allocated NUMAB state
falls back to the default policy.

This separation allows PID-inactive VMAs to be scanned for promotion
without treating scan continuation as evidence of placement eligibility.
It is a prerequisite for the following fix and must accompany it when
backported.

Fixes: fc137c0ddab2 ("sched/numa: enhance vma scanning logic")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 include/linux/mm_types.h |  6 ++++++
 kernel/sched/fair.c      | 40 ++++++++++++++++++++++++----------------
 2 files changed, 30 insertions(+), 16 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 1bd3ca7bfff2..d0ac21d02c47 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -803,6 +803,12 @@ struct vma_numab_state {
 	 * A VMA is not eligible for scanning if prev_scan_seq == numa_scan_seq
 	 */
 	int prev_scan_seq;
+
+	/*
+	 * The in-progress scan of this VMA is promotion-only.
+	 * Resumed scans finish with the policy they started with.
+	 */
+	bool promo_only;
 };
 
 #ifdef __HAVE_PFNMAP_TRACKING
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index ab9afd3ad49b..3b30786ded3b 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4082,7 +4082,8 @@ static void reset_ptenuma_scan(struct task_struct *p)
 	p->mm->numa_scan_offset = 0;
 }
 
-static bool vma_is_accessed(struct mm_struct *mm, struct vm_area_struct *vma)
+static bool vma_needs_placement_scan(struct mm_struct *mm,
+		struct vm_area_struct *vma)
 {
 	unsigned long pids;
 	/*
@@ -4098,15 +4099,6 @@ static bool vma_is_accessed(struct mm_struct *mm, struct vm_area_struct *vma)
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
@@ -4130,6 +4122,7 @@ static void task_numa_work(struct callback_head *work)
 	const unsigned int numab_mode = READ_ONCE(sysctl_numa_balancing_mode);
 	const bool tiering = numab_mode & NUMA_BALANCING_MEMORY_TIERING;
 	const bool balancing = numab_mode & NUMA_BALANCING_NORMAL;
+	bool pid_scan_allowed, placement_due, scan_started;
 	unsigned long migrate, next_scan, now = jiffies;
 	struct task_struct *p = current;
 	struct mm_struct *mm = p->mm;
@@ -4316,15 +4309,29 @@ static void task_numa_work(struct callback_head *work)
 		}
 
 		/*
-		 * Do not scan the VMA if task has not accessed it, unless no other
-		 * VMA candidate exists.
+		 * Do not scan the VMA if a task has not accessed it, unless no other
+		 * VMA candidate exists. If a scan is already in-progress, finish it,
+		 * but track continuation separately from starting a new one.
 		 */
-		if (!vma_pids_forced && !vma_is_accessed(mm, vma)) {
-			vma_pids_skipped = true;
-			trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_PID_INACTIVE);
-			continue;
+		placement_due = vma_needs_placement_scan(mm, vma);
+		scan_started = mm->numa_scan_offset > vma->vm_start;
+		pid_scan_allowed = vma_pids_forced || placement_due;
+
+		if (!pid_scan_allowed) {
+			if (scan_started) {
+				trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_IGNORE_PID);
+			} else {
+				vma_pids_skipped = true;
+				trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_PID_INACTIVE);
+				continue;
+			}
 		}
 
+		/* Keep scan policy stable while processing a VMA in chunks. */
+		if (scan_started && vma->numab_state->promo_only)
+			placement_scan = false;
+
+		vma->numab_state->promo_only = !placement_scan;
 		cp_flags = MM_CP_PROT_NUMA;
 		if (!placement_scan)
 			cp_flags |= MM_CP_PROT_NUMA_PROMO_ONLY;
@@ -4357,6 +4364,7 @@ static void task_numa_work(struct callback_head *work)
 
 		/* VMA scan is complete, do not scan until next sequence. */
 		vma->numab_state->prev_scan_seq = mm->numa_scan_seq;
+		vma->numab_state->promo_only = false;
 
 		/*
 		 * Only force scan within one VMA at a time, to limit the
-- 
2.55.0

