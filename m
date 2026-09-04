Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC9251D500
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788546023; cv=none; b=jRiijq/XMmDblEyuNhUnAgbxxW2gjJAmuNeL3fwEJj7iNahenGer8hBdx29j/sPjHqlAtUOq2sba3rGf62AWarLSyJpAkYb36n7BhstkT4FCNB6dJ/70fbd/2heUaNpGdOwLsYiX87nfZpwg74MvXlFE3OkUgGVYqS/NcLYau3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788546023; c=relaxed/simple;
	bh=sRMAupkd+/z8tPz3CPJ9c9jvDKH4MQCfdZ1Wr8kL6Bo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PzbK21aQ+5uKRrY4cLg4K3kyYy81wP8mZ2eKFEKieLRVm03XpykaMSoJjNArSqdikITfxvbH72zvOeBJwfT83Y3uW3s1qrkaNJ29gcRCLauRR+MfPU5spLlYrlmL93BL2c3AYz3RULaX5tGE3uYjoS2gafXCSuHDrCxXMAyXKBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=pKoF4lDb; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="pKoF4lDb"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92ed19f4d60so134423285a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 11:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788546020; x=1789150820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GSRixT7jynn3gCypVDydAS92P1PrLhM0zXSgAeyy22g=;
        b=pKoF4lDbTnokPdaBIm1CyUlldv+Ql80dF8EZqy55hQYHUuXlyan1FzO9rAlwxBXnqV
         aRYDKyrC08/LsQZgAkd4+zYUGMGsb2u0Sq3ue306afzbJ2iwXxkOPDpLyOXz6ZTY+8N4
         UT9UnPd1jwT22onjHMf2rkrxrnHJG3dRAGeq4F9qzEPKIhirEL4HewpriAOnDnhsRMkq
         AT+QUd6m5lnUBycNrWcQ+Dk8ds8Uy+RPz/yZ/fNsHzqjJQl87ZV+MyAJyNeZ5ggkVede
         XCarp4zVfl4no06t6w+ArvrhLaWcIAB4HbjDyZZZakqLmwhGp/8SJ7afrObCWQlIP/MU
         w5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788546020; x=1789150820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GSRixT7jynn3gCypVDydAS92P1PrLhM0zXSgAeyy22g=;
        b=PGk376OZFOBVMD9BX6hRZQ2vZJE2EATKCzWKeVze8WxEB1dHGaEMTAExzP34L1+dsh
         bwZCs771kHWiz56szHXkRBImRHSUE8NXqCaRtQ45w+tckLqv/1X/PEovClHCahIAV/9x
         8StAoOGqoAsLa3U3sQKJzOCKrznYM7or6eqQKbadkCSA5Kjh8Je9zqMOpY+bJsbe3Vu3
         d36VfOd04lzB7Wql4h3ihGHG0bJ6yKfeS4tin3SQ58Jq3bO9xFfdZyBkRP03hbV+gYae
         f1kitqaIcm+ct6IN6BC0SnDa7o5w0bE+4DBh+Hb+f3jGAleO6xv3Cp54Pj/AnQ4EShA7
         bVWA==
X-Gm-Message-State: AFuF++mhAYGz8p/zaCMjP3yTFPqwi061DKf72r+2oIanCMn3mYMZqIqJ
	biFE24SW4qA1bPmJKUSaRHyK/isWEJPcHpRuGHfo7qRVy0LcKNHbxJ0BVesRGI9Y49c=
X-Gm-Gg: AYBFou13/oM/UrUuz5edUBwkCGbzla4Mn7MeyNaRLDfMUg8CIVU9LshNhvTnQ89aTpR
	O0L0EpsS/ne/69oasMUn2xP3RnjPGSkTIS4iB3IFOdsD78fCEWa6B/TJtjvPT8ADRguHdwxsLlw
	cnkByCr4PDLEr+kVMxhHeGFgJx5ZZS4P6EyYpd9LK6u2ZppB2sKou+vxpoXrPYuEh8M9b97bDB9
	4CUosRoRiLcblyPHqGhBPWU961hcMBrW9RhouSmNk6JrqZRfK0ayzV1UXbWRktgSqMRtOKKd60H
	TPIjm2BDCE3HXZJrcRJ8bBUebgkMOalT4FYMMlAdUtfse2RKfN6whSRCA+eaROPIKfj0yp1LI4w
	kxu+CwIvr/LK2+Fg/Dqdm1mHRHV+KDnqx/uK3CUIeoOs+W8pMR3qivt8QLA3EDZveiwNo/eWZ7+
	cZ89md5zoOZFVDUmij50Ztt+46DbDhRwzRjcI3xJGMjENEet8vFXIUmUY3X00rIywtM6ZLoeeQ/
	GqhGRrbAH7vdPuFo1LV9bBW2iCmjdfmOiw9XhvRqwDxgOYvrE7T77cHcBaaYWU=
X-Received: by 2002:a05:620a:63c8:b0:939:8d2:325d with SMTP id af79cd13be357-939817398b7mr507496985a.21.1788546020031;
        Fri, 04 Sep 2026 11:20:20 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93982db6a95sm207374585a.9.2026.09.04.11.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:20:19 -0700 (PDT)
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
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	raghavendra.kt@amd.com,
	shy828301@gmail.com,
	baolin.wang@linux.alibaba.com,
	osalvador@suse.de
Subject: [PATCH 2/2] sched/numa: scan read-only file mappings in tiering mode
Date: Fri,  4 Sep 2026 14:20:06 -0400
Message-ID: <20260904182006.1562449-3-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904182006.1562449-1-gourry@gourry.net>
References: <20260904182006.1562449-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

task_numa_work() refuses to scan any read-only file-backed mapping:

  if (vma->vm_file &&
      (vma->vm_flags & (VM_READ|VM_WRITE)) == (VM_READ)) {
          trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_SHARED_RO);
          continue;
  }

commit 4591ce4f2d22 ("sched/numa: Do not trap hinting faults for shared
libraries") added this because such pages are expected to be cache
replicated and bounce between accessor nodes, so:

  If we are never going to migrate the page, it is overhead for no gain

Memory tiering broke that premise.  A slow tier folio is promoted on
hint fault based on hotness, so these can migrate now - they just never
get the chance, because the VMA is never scanned.

Observed on a 768G DRAM + 256G CXL host running a ~430G database service:

  91% of its main binary (169M of 185M) accumulated on CXL.

After this patch the binary's tier residency tracked runtime load.

Scan these VMAs with the slow_only restriction. Only non-toptier folios
are made hint-faultable, so the scan never marks a toptier folio in a
read-only file mapping in any mode.  A page already on the fast tier costs
nothing, and a page on the slow tier costs one hint fault, which is what
buys the promotion.

That fault is not free of placement effect: a successful promotion reports
its toptier destination node to task_numa_fault(), so it lands in
numa_faults[] like any other promotion.  Only the set of VMAs that can
produce one changes.

Fixes: c574bbe91703 ("NUMA balancing: optimize page placement for memory tiering system")
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
Assisted-by: Claude:claude-opus-5
---
 kernel/sched/fair.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 990af0e45d69..5c5c80b17649 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4075,6 +4075,11 @@ static void reset_ptenuma_scan(struct task_struct *p)
 	p->mm->numa_scan_offset = 0;
 }
 
+static bool vma_is_ro_file(struct vm_area_struct *vma)
+{
+	return vma->vm_file && (vma->vm_flags & (VM_READ | VM_WRITE)) == VM_READ;
+}
+
 static bool vma_is_accessed(struct mm_struct *mm, struct vm_area_struct *vma)
 {
 	unsigned long pids;
@@ -4211,6 +4216,8 @@ static void task_numa_work(struct callback_head *work)
 	}
 
 	for (; vma; vma = vma_next(&vmi)) {
+		bool ro_file;
+
 		if (!vma_migratable(vma) || !vma_policy_mof(vma) ||
 			is_vm_hugetlb_page(vma) || (vma->vm_flags & VM_MIXEDMAP)) {
 			trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_UNSUITABLE);
@@ -4222,9 +4229,16 @@ static void task_numa_work(struct callback_head *work)
 		 * migrated as it is expected they are cache replicated. Avoid
 		 * hinting faults in read-only file-backed mappings or the vDSO
 		 * as migrating the pages will be of marginal benefit.
+		 *
+		 * Tiering still wants them.  A read-only mapping strands just
+		 * as much on the slow tier as any other, so scan it for slow
+		 * tier folios alone.  Nothing on the top tier is marked here,
+		 * in any mode.
 		 */
+		ro_file = vma_is_ro_file(vma);
 		if (!vma->vm_mm ||
-		    (vma->vm_file && (vma->vm_flags & (VM_READ|VM_WRITE)) == (VM_READ))) {
+		    (ro_file && !(sysctl_numa_balancing_mode &
+				  NUMA_BALANCING_MEMORY_TIERING))) {
 			trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_SHARED_RO);
 			continue;
 		}
@@ -4302,7 +4316,7 @@ static void task_numa_work(struct callback_head *work)
 		 * VMA can cause others to become "permanently unaccessed" if a scan
 		 * cycle is consumed entirely by the large VMA.
 		 */
-		vma->numab_state->slow_only = false;
+		vma->numab_state->slow_only = ro_file;
 		if (!vma_pids_forced && !vma_is_accessed(mm, vma)) {
 			if (!(sysctl_numa_balancing_mode &
 			      NUMA_BALANCING_MEMORY_TIERING)) {
-- 
2.55.0

