Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A6A4C2277
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767340; cv=none; b=RsY4f+/aO7kIb3p/CiVdu43iHzbHTZkqyYzqV94el+Zp9QmzlUEot61jznkW5zbWHxlkh7zV032t+lcWZ6hb7yHcMAtR7xjfkh7LpnOUJjmgGaaq9H9AGUJmVkL6Eh5JNObgEjUK82B5OZ0ZJSliyBaFVb/Vb2x2AGAWnQh629Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767340; c=relaxed/simple;
	bh=jH4fgE6Eh+AoWDsiik4aSq8oBReD74YVwyHq7LJKG6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FxievM+uj/9Hzjxk97W6azhBemPYLXTd67JXP8qNYfls7436EKoOrYyhAe0XDX2BOzyfQR53JLwUVC1+7AXNtW8+naTnzSi7W+3aRmI6raHd260Jj4gtA4e0vEOT0VKRO3djVscRdbqBMg4wfyGdbN2G6CPpRufKjUcTxMtQVBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=gFZeTn6L; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="gFZeTn6L"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a003bd18e5so17956835e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790767336; x=1791372136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8o+T/NNspIao5W2Ou48Xi+FRL8HzoQJFnQ6vV4A9Rvg=;
        b=gFZeTn6Li8RNsOTWRZwJ1xm42BRzr5htcAvGRyntpWCQ+qUu4MWv0EjJj5n0kxYUj5
         l8PF9cMW0Z1/EVfrmQOcpwROFVqMFeEn80E1p5MIp++deKDSLd21iD9WyUjrzp2baRtB
         Miwr0Ad2gAYHcaA0R2zs78nXyLAuxIR3PTUaNkX2L7ZtM59kUDP4lsmlw2ljaAWUv+UF
         cJpwdSLFhsytEBd2ZsoSH1uR38PTgT4QQl3YVp7aD+M4Z3J/5gDN3iVe1FMwuLi6FCdH
         WSrPp5pqFQHsyQ+2DeoYPUDf3xUfTW+7x8I+CqJHSVjGKDXAR8OdZmLkAPcfgQf7PGiz
         4kpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767336; x=1791372136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8o+T/NNspIao5W2Ou48Xi+FRL8HzoQJFnQ6vV4A9Rvg=;
        b=A508mZx9bA/04IN/09dUt06izMe8ZkaDffJco7qrEYZXfsZq5P3s/DyVI5afnrAxAC
         BmHGqutkmEk0Kz2VoQOcqy34WLlPBb0ufZHJoJ/IvQZA0zztWKqbqEtPdii9rRILR8wg
         tpyOL08aDpt856wNCSq27iHGyEZlHR5GbOyDFkMO2ZksN3ADyzUuFiBZJWW4cFlKn0PS
         rrOEL6kLIdnORtqq5LfoASJjLScVDEoXL1hJDANl6o7HQ26RgHj1GUbJRwhdOfh0JX3U
         2E29yDRYanL1f57Ae+PuXAhIpRcsLj1lm8QCczgpScg5h8E4s+JPA27oLB19gdGmxKRb
         Bftg==
X-Gm-Message-State: AFuF++lHesNSECMxFSL93ADzPYNKbnQHtZQ/syhslikezTKen3e20MKY
	Mj3qTlEarbwSDhMNh6PqnXi+5BqgdvY2hHxiHAPR5G/hf8GlZ8/2AbDJUBWQxlJq9Nw=
X-Gm-Gg: AYBFou0GbOd+laHLsK41qvRqBMgBMT16AUcZkDOGaeKJUp4Q/Pw+6S5vsUQowtI3fqL
	AHWSybrKIzi0XUex/05B9y804UYK4gnTqQ7Rt+naEeoPoPgyAP32RtT59JFNBIPD4P5jVpIDTQr
	oYw7Irv76IvaIC++BP0dXI0FEthYu7xHLMtdE0UqGDY2rKuMaOh3XxsZyg93M7llifmNPYCGJCN
	hq80kpPCc6Shv8Hb+8oQEZHZTC0pIS24ZLuq73HbEpX8DdSo+zlX/ADaDrTOXdW7SO0avUEwY/F
	Nx1tLePIp1pWCUmO+OpIA0cckGr0ZgYyTgNqtEDabH1HllvNCGjI4b3eDxIEkbEITExaqvio0zX
	DHYszzbrL4om/RPCG88cbPia1hTZXxAqg96daPOvwxyKCtZyKZJSwFlFHyyHGgHD0OWMaauymaY
	M7HyaCgzrrlXOKdUyRpI5C7dC8+XKv1dU3oOLeM6EH/8xQXixsaU7/dkQ2l5pnX/9J0dUjM+lWu
	dZ+xUp1EtujaME/
X-Received: by 2002:a05:600c:1d2a:b0:49f:faa3:3ca2 with SMTP id 5b1f17b1804b1-4a01afebf68mr23163465e9.13.1790767335641;
        Wed, 30 Sep 2026 04:22:15 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.thefacebook.com ([2620:10d:c092:500::6:13b8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a019740c34sm34097095e9.9.2026.09.30.04.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:22:15 -0700 (PDT)
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
Subject: [PATCH v4 3/7] sched/numa: scan read-only file mappings in tiering mode
Date: Wed, 30 Sep 2026 07:22:02 -0400
Message-ID: <20260930112206.205083-4-gourry@gourry.net>
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

Commit 4591ce4f2d22 ("sched/numa: Do not trap hinting faults for
shared libraries") excludes file-backed read-only VMAs from NUMA
hint faulting to prevent east-west placement bouncing.

This filter hides hot file folios on slow memory from promotion.

Scan those VMAs when tiering is enabled, but make their scans promotion
only to retain the existing restriction. Keep the historical VMA
predicate unchanged for backport-ability.

Decide the walk type for each VMA from the balancing-mode snapshot
taken in task_numa_work(). A VMA gets a placement scan only when normal
balancing is enabled and it is not a read-only file mapping. Otherwise
the walk is promotion-only, and without tiering the VMA is skipped as
before.

On a host with 768 GB of DRAM and 256 GB of CXL memory running two
database services using ~430GB each, 169 MB of their shared 185 MB
main binary accumulated on CXL and was permanently stuck there.

With the change, the binary tier residency tracks its runtime hotness.

Fixes: c574bbe91703 ("NUMA balancing: optimize page placement for memory tiering system")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 kernel/sched/fair.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 3be18cf10eca..ab9afd3ad49b 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4128,22 +4128,21 @@ static bool vma_is_accessed(struct mm_struct *mm, struct vm_area_struct *vma)
 static void task_numa_work(struct callback_head *work)
 {
 	const unsigned int numab_mode = READ_ONCE(sysctl_numa_balancing_mode);
+	const bool tiering = numab_mode & NUMA_BALANCING_MEMORY_TIERING;
 	const bool balancing = numab_mode & NUMA_BALANCING_NORMAL;
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
-	if (!balancing)
-		cp_flags |= MM_CP_PROT_NUMA_PROMO_ONLY;
+	bool placement_scan;
 
 	WARN_ON_ONCE(p != container_of(work, struct task_struct, numa_work));
 
@@ -4231,13 +4230,22 @@ static void task_numa_work(struct callback_head *work)
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
+		placement_scan = balancing;
+		if (placement_scan && vma->vm_file) {
+			if ((vma->vm_flags & (VM_READ | VM_WRITE)) == VM_READ)
+				placement_scan = false;
+		}
+
+		if (!vma->vm_mm || (!placement_scan && !tiering)) {
 			trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_SHARED_RO);
 			continue;
 		}
@@ -4317,6 +4325,10 @@ static void task_numa_work(struct callback_head *work)
 			continue;
 		}
 
+		cp_flags = MM_CP_PROT_NUMA;
+		if (!placement_scan)
+			cp_flags |= MM_CP_PROT_NUMA_PROMO_ONLY;
+
 		do {
 			start = max(start, vma->vm_start);
 			end = ALIGN(start + (pages << PAGE_SHIFT), HPAGE_SIZE);
-- 
2.55.0

