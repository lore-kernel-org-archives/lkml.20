Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB25490BF7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101780; cv=none; b=qT1L6Axuj3P0dt8ft4Ql7w+aY15EYwWjSoXdfL4DIUcowrOdogEhPhDDdwctKjJXrN17C2Nl+m+n5NyVUGTIczakQOOt/KculBFTiuySXxiQmaP25O42S7tX0kar7lOKzLEU7QbCDbS6ZOBLjbguicEWsV0S++FS8iFD0r7Yggk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101780; c=relaxed/simple;
	bh=GheSuOituCPdrEAFObtrvIwVgE1xHij2yZfuS4AU0v0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=js+nJwpYbWH4ysM3p2CxYa77W32hxREOUcknaRw42yfjUIgN3dXuHkm8ABeZyk6p3owJB4eC10i7DPpMDcEsMGgQsKeboO5HtcZscI6XBD7zNNpO67aXlbUPA6G8jFO6E0Le3DlLPBKKzse8ktWWLOfJt/MtxM751jV7rTcKUgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=N6HOwn19; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="N6HOwn19"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93a0fb2f9efso5946285a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790101777; x=1790706577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1HZmb4EJkk3UUTgAceH+rUT2N1g6qzeO8Xgy2w+ERPg=;
        b=N6HOwn19eqW+60+jCqY99oqqiOLfRC4xlpuboPicOa607w6hq2Y29o+IqoPLTe2rbY
         hMUnzfAJQR6SKk4lp1DbHQQPHubwD7vTAys3x9E9Fafitp9HOM8O4ktQE1w9SjV5CLFE
         vaWX+Zmmf0HlPshyr09HgIBO4kI09LCBbFjd/TWKSl4l6MOAsKKJfFB8oNEyoq/eEx/F
         OE6cMK6mped1jkQ9e4xlk5pzSjWAX6mSsMlkp5H7OYpKuomOAFWJ+d8qCMnlaelTIuls
         JJS9d0vUqAFhyzzHzOIcBMbDkMqgQH2fIR7lHy7auhny62qpmwEis0o4KCDKAXzuDmee
         Lylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101777; x=1790706577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1HZmb4EJkk3UUTgAceH+rUT2N1g6qzeO8Xgy2w+ERPg=;
        b=LswmnIHf6OM/lJUxOd5E9lKkP8S2OW7iemln6D3/aIxpfhG1zFDNfPN8nFFHORn9Kc
         X7PB3slCYNaKEQpkpNAAo8jlTc11n52zA4x5a66MyTvgWvTlOquNrBv0JF4Ud/JSFDfh
         ywt6Kz3yzTCJMXakWCmhTCC5bLUxLhZKb+gKkrs0Jc4mqUqVMLIoGtHRMtojQbagneGb
         ydLm5MYHFR1vxunPzMb+zb3uMYYRWSykeolsCErtvt41K4DRSswOrqOq96zEQzywMWn6
         VepJp6UHtR2KiQEKkQOtDi0yvtnUJA0eZSOkpilBvVq6k4fTf6Da7y8971TwqRvSedSy
         9OUA==
X-Gm-Message-State: AFuF++mDyJcDjUoRN67k7l4gRXkjNXgX1I8zrTOVPORq5R4FR/eDfrsW
	Bk7gDptQtjAsicCh1dwP0Ays6LsP7i71ySIiG48YBlInLdtBWvPOlmnwOXjGDXaguNGuvWDw2rq
	B4ZWIfCE=
X-Gm-Gg: AYBFou22+yqYC7W7lN8oOL/UDadw/5tQlvRF3iPr0/bA9GsUdATOefQqGCyKy1sj0Nr
	hHXzwGebmBkw8wJaotZNgrMcOZjlPAb+Ux0FfUCHOwy8bhndesmn/FYW+U0STHksZQ826jpVk3H
	O2XPLlerrjRI/Ug2A9cxs1ahu5JOLRvuaimEtf4xCdhqNvrN6jPVWUVetep9SgHR4rJNCWMGCQF
	lXYvLa5B3HEUDctvpxmL9ZBNW1tEAhlBjC2ujPLHRTTIdxDjrk1Iy+6TSotel1+tTO2bajMs2BD
	QCju1GRcZahZ8jf1ZXJQxysvjzs/C2ERjofP+SUres9AeBE1ryeRsttwFtrlZiaoMnZWQyq1bik
	GgRbYihxyCTSrjjRV9ZeDuLUmftVefQkWRgTTyxSa+6+kPa10z1aPaRaFvl2lXHWUvvU1MAIpQ2
	l6HyTfa1u5cwWLeDtGH6fUIYDDH+1OYqFI0WrrKJw63cpFbhW6FetFCXF7UnYFwgGbNpLaR9LO0
	HHg14uXrmzMlpiJONat2+5sEp5uSJKuUxbYnijRa3uep9js8h5GTrSsN46j
X-Received: by 2002:a05:620a:370f:b0:939:a9d4:7023 with SMTP id af79cd13be357-93c17e32171mr566886685a.10.1790101777045;
        Tue, 22 Sep 2026 11:29:37 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c24889ac9sm37130085a.27.2026.09.22.11.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:29:36 -0700 (PDT)
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
	hannes@cmpxchg.org,
	shy828301@gmail.com,
	raghavendra.kt@amd.com,
	stable@vger.kernel.org
Subject: [PATCH v3 3/7] sched/numa: scan read-only file mappings in tiering mode
Date: Tue, 22 Sep 2026 14:29:24 -0400
Message-ID: <20260922182928.2199090-4-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922182928.2199090-1-gourry@gourry.net>
References: <20260922182928.2199090-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Gregory Price (Meta)" <gourry@gourry.net>

Commit 4591ce4f2d22 ("sched/numa: Do not trap hinting faults for
shared libraries") excludes file-backed read-only VMAs from NUMA
hint faulting to prevent east-west placement bouncing.

This filter hides hot file folios on slow memory from promotion.

Scan those VMAs when tiering is enabled, but make their scans promotion
only to retains the existing restriction. Keep the historical VMA
predicate unchanged for backport-ability.

Read the balancing mode once per task_numa_work() invocation and build
the protection flags for each VMA from that snapshot. This keeps the PTE
and PMD paths on the same policy for an entire protection walk (which
may be split across multiple scanning periods).

On a host with 768 GB of DRAM and 256 GB of CXL memory running two
database services using ~430GB each, 169 MB of their shared 185 MB
main binary accumulated on CXL before permanently stuck there.

With the change, the binary tier residency tracks its runtime hotness.

Fixes: c574bbe91703 ("NUMA balancing: optimize page placement for memory tiering system")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 kernel/sched/fair.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index dc78d24ed8bc0..8a4687f67d82f 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4119,21 +4119,21 @@ static bool vma_is_accessed(struct mm_struct *mm, struct vm_area_struct *vma)
  */
 static void task_numa_work(struct callback_head *work)
 {
+	const unsigned int numab_mode = READ_ONCE(sysctl_numa_balancing_mode);
+	const bool tiering = numab_mode & NUMA_BALANCING_MEMORY_TIERING;
 	unsigned long migrate, next_scan, now = jiffies;
 	struct task_struct *p = current;
 	struct mm_struct *mm = p->mm;
 	u64 runtime = p->se.sum_exec_runtime;
 	struct vm_area_struct *vma;
-	unsigned long cp_flags = MM_CP_PROT_NUMA;
+	unsigned long cp_flags;
 	unsigned long start, end;
 	unsigned long nr_pte_updates = 0;
 	long pages, virtpages;
 	struct vma_iterator vmi;
 	bool vma_pids_skipped;
 	bool vma_pids_forced = false;
-
-	if (!(READ_ONCE(sysctl_numa_balancing_mode) & NUMA_BALANCING_NORMAL))
-		cp_flags |= MM_CP_PROT_NUMA_PROMO_ONLY;
+	bool placement_scan;
 
 	WARN_ON_ONCE(p != container_of(work, struct task_struct, numa_work));
 
@@ -4221,13 +4221,19 @@ static void task_numa_work(struct callback_head *work)
 		}
 
 		/*
-		 * Shared library pages mapped by multiple processes are not
-		 * migrated as it is expected they are cache replicated. Avoid
-		 * hinting faults in read-only file-backed mappings or the vDSO
-		 * as migrating the pages will be of marginal benefit.
+		 * Shared library pages mapped by multiple processes are limited
+		 * to south->north migrations as it is expected they are cache
+		 * replicated. The benefit of east-west migration in this case
+		 * is at best marginal and may be harmful due to TLB/cache
+		 * invalidation.
+		 *
+		 * Allow promotion as a cold page incurring many cache-misses
+		 * under cache pressure can drive considerable bandwidth.
 		 */
-		if (!vma->vm_mm ||
-		    (vma->vm_file && (vma->vm_flags & (VM_READ|VM_WRITE)) == (VM_READ))) {
+		placement_scan = !(vma->vm_file &&
+			(vma->vm_flags & (VM_READ | VM_WRITE)) == VM_READ);
+
+		if (!vma->vm_mm || (!placement_scan && !tiering)) {
 			trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_SHARED_RO);
 			continue;
 		}
@@ -4307,6 +4313,11 @@ static void task_numa_work(struct callback_head *work)
 			continue;
 		}
 
+		placement_scan &= numab_mode & NUMA_BALANCING_NORMAL;
+		cp_flags = MM_CP_PROT_NUMA;
+		if (!placement_scan)
+			cp_flags |= MM_CP_PROT_NUMA_PROMO_ONLY;
+
 		do {
 			start = max(start, vma->vm_start);
 			end = ALIGN(start + (pages << PAGE_SHIFT), HPAGE_SIZE);
-- 
2.53.0-Meta

