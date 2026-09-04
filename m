Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18B151A759
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788546021; cv=none; b=PfEji1OjUV2cRz7S0wlFJzKX/QSxFc/Q/lL5VSbOwx2MV6CLiW0jW61f1hgenvFOB98mHccIctuB0xTE6GkwI7OegJhdbNHaZROhhNabCzF6ZrYvW37oJtvt6oNDJGGlxQn45dXClFVhGG0vfviErESFZUMJcwZDDephpQAxlKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788546021; c=relaxed/simple;
	bh=DJOU1m53y2E4/TLdlgmhdCS/oFkXY5aFxDtOM6g4YSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N0KByqDeck9JJxdS5jMLeFHIlquEIHzQtT2XGOBH7CjynlX+ANdo1Krkxo7IQq7LVxp1omzvZFEXt1Zky7ycvJgOyJRMNZ95ssKoPPdT5UiNI9TxCl+meHIQk4KVeb11wOrf8WaSf/TPkcICTh6iC+2dTDV6qfsPvlzQZ2TNn+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=FS0EUrKx; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="FS0EUrKx"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9397e2994dcso113502985a.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 11:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788546018; x=1789150818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p8Z4JBi3sjE2KlaCLrWKRkykHYLdYdycFQqiI4ckxMI=;
        b=FS0EUrKx3TIwUxcSqoKuByIJtaSUPXh1iqRG1vqhbp9T2md1RsJyE3O2MCOFof4lYK
         Sfinz6B3x3YrRZAN6ae+tK4IqfurMQ2k7HLHtN+UT6Q+cTx/JCCfivaxGFp22Yr42IMz
         UQlrPfs+FWQB9p3UKpC7Ol1LW5fqGCyc6U7sOawmbPaMJfRb5rfZccgMXvfFWV/FioWR
         0QNDNAMzHJ2ZfoOZ8Uj8RTOUri3HoitZd6l5pksfOYBpo65AU+jSFMz7caODvDVrGcxW
         pqXC5XotwPJswvqFf1ycRPXGe8z2QwI9VFwRZqeLGFzBVfjqQhRsib4LFUXqA59ayRP0
         +xUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788546018; x=1789150818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p8Z4JBi3sjE2KlaCLrWKRkykHYLdYdycFQqiI4ckxMI=;
        b=ijwQbKDiiUKJVwR4gwVxhDtAF4ilvWZY9im27eD6+4Nb4TbwQ3F9WuWjzpp9ITQhYV
         kcKSgP/0T2gFyGZAwSsScyu++/vQK4VlaYkLTRD95xCBREJoNx84cQokomOc5OAoSuxp
         rytbH3OI2Cqwjv2pjODN2YgMSp0T8P72TfOa8q5bopiInoZjAwe81aKvGV0IJumf+P0v
         4JgWssNIv6szcqFGQucxmP76KRNYguwO44gl9/lg3TzdMgjVQE10wqeO5I1HichEC6c2
         CmtIRMuayQtrJDPPsAS2q71vJIR1xg6UIm6BGMrSS2N7FblcXlesuG67X5+YVeUqO2ya
         M1sA==
X-Gm-Message-State: AFuF++ldDfwAAk2QuFsNMNGQ3Hvo7/3p1IWhSUWxwUJ4aFSrkIeESy5i
	aQatU6WSd3IwowZ+2fK0iS2BkcuKr1VrjrfeYV7OAyb+C+3c795Wc3SxmAJxhhz7yuc=
X-Gm-Gg: AYBFou2KAbTow+dNSsj3k6pf41DtxlSqbO4tVgODSwuCLxwtQM8/Nj0C1J96bymRPL9
	ybg1QURpf5aeQVKgRFyboe6ylET4/If2EPhL8EEiCh+htb/0S08w3d9JUvdrdZlcXfJNBO9hTsy
	EpZN42M0ZCyn3oWpA5cCe/9sj+8qgGRX87NNMwuf0OcNykRzy03jM0/Po4QGYAt+RBbXF8nAMdG
	0g9Rgkujm/LAQlcb0j4BXOiSOpNBTod4VbFIdX3oT7600RZfTF8eXpS07YxBttoUij8PbQjOIMw
	kfLZFnjSg5T7pQxhw7gXB0KAxVYE7jLXLfAAFyCF2h9MU7jE8vFa2IkiHodihu/PBFsVF2NoWl3
	/tPH59iqlJorxiOqOgCQArgvbVh9jgx1VtzlYE+FS0f694ubeLDRTxdhJ7RezWxQoBiQZFB4gIS
	xVVeSKI8UUsVDu6PTY5HmLHmpCCQ9Xn8AVJLus5aVCth3VwmwZHdaITjn0MEWZmCS6c2In7tGSH
	mn9iIBH9zpJqiur5pg9ZjZtdfSI01OVeX3LtnYnF9ZNfL5VbQ==
X-Received: by 2002:a05:620a:2715:b0:939:8a03:f7e3 with SMTP id af79cd13be357-9398a03ff25mr362976385a.6.1788546018205;
        Fri, 04 Sep 2026 11:20:18 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93982db6a95sm207374585a.9.2026.09.04.11.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:20:17 -0700 (PDT)
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
Subject: [PATCH 1/2] sched/numa: do not let the per-VMA PID filter gate promotion
Date: Fri,  4 Sep 2026 14:20:05 -0400
Message-ID: <20260904182006.1562449-2-gourry@gourry.net>
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

task_numa_work() will not scan a VMA that vma_is_accessed() rejects:

  if (!vma_pids_forced && !vma_is_accessed(mm, vma)) {
      vma_pids_skipped = true;
      trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_PID_INACTIVE);
      continue;
  }

vma_is_accessed() wants the scanning thread's hash bit in
vma->numab_state->pids_active[].  Those bits have one setter,
vma_set_access_pid_bit(), called on a NUMA hint fault.

The PROT_NONE scan is the only source of hint faults, so a VMA the
task has not hint-faulted looks untouched - preventing new scans
from causing faults for potentially hours or days.

The existing escape mechanisms do not solve this problem:

  numa_scan_offset      - rescues only the VMA holding the scan cursor

  get_nr_threads()      - the horizon from commit f22cde4371f3
                          ("sched/numa: Fix the vma scan starving issue")
                          costs nr_threads scan sequences, which
                          can be incredibly large.

  vma_pids_forced retry - fires only at the end of the VMA list, and then
                          scans exactly one VMA

Observed effect in the following environment:

  - 768G DRAM + 256G CXL Host
  - two ~430GB highly-threaded database workload
  - a single large (300GB+) shmem/tmpfs VMA in each workload
  - numa_balancing = 2   (default tuning)

In this environment, the large shmem VMAs held the cursor for 100% of a
scan, while 84G across 2537 other VMAs were skipped due to "inactivity".

Among them, a 20G hash table ended up 100% on CXL.  After this patch it
was consistently split 50:50 between DRAM and CXL.

Scan the rejected VMAs, looking only at folios on non-toptier nodes.
Promotion candidates then come from the whole address space, while toptier
folios are only marked where vma_is_accessed() already allowed it, so
top-tier marking is unchanged in every mode.

A restricted scan reaches the end of the VMA but may not completely scan
it, so it leaves prev_scan_seq alone.  Setting it there would permanently
disarm the get_nr_threads() horizon above.

Before this change:

  DRAM Bandwidth utilization dropped from 200GB/s to 150GB/s
  CXL Bandwidth utilization increased from 5GB/s to 45GB/s (capped)
  Request Latency increases from 800us to 5ms tracked with CXL bandwidth

After this change:

  DRAM Bandwidth maintains between 200GB/s and 250GB/s
  CXL Bandwidth maintains at ~7-10GB/s
  Request Latency hovers between 800us-2ms tracked with request load.

commit d230991493b5 ("mm: mempolicy: fix automatic numa balancing for shmem")
surfaced this issue when it fixed shmem numa balance scanning.

Fixes: fc137c0ddab2 ("sched/numa: enhance vma scanning logic")
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
Assisted-by: Claude:claude-opus-5
---
 include/linux/mm_types.h |  7 +++++++
 kernel/sched/fair.c      | 25 ++++++++++++++++++++-----
 mm/mempolicy.c           |  9 +++++----
 3 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 5413bd10fff2..d986fcab9c8f 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -803,6 +803,13 @@ struct vma_numab_state {
 	 * A VMA is not eligible for scanning if prev_scan_seq == numa_scan_seq
 	 */
 	int prev_scan_seq;
+
+	/*
+	 * Set by the scanner for the duration of a scan of this VMA when only
+	 * folios on non-toptier nodes should be made NUMA hintable, because
+	 * the scanning task has not accessed the VMA recently.
+	 */
+	bool slow_only;
 };
 
 #ifdef __HAVE_PFNMAP_TRACKING
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 6d881e530f89..990af0e45d69 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4297,11 +4297,20 @@ static void task_numa_work(struct callback_head *work)
 		/*
 		 * Do not scan the VMA if task has not accessed it, unless no other
 		 * VMA candidate exists.
+		 *
+		 * Force-scan only slow-tier folios when in tiering mode, as a large
+		 * VMA can cause others to become "permanently unaccessed" if a scan
+		 * cycle is consumed entirely by the large VMA.
 		 */
+		vma->numab_state->slow_only = false;
 		if (!vma_pids_forced && !vma_is_accessed(mm, vma)) {
-			vma_pids_skipped = true;
-			trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_PID_INACTIVE);
-			continue;
+			if (!(sysctl_numa_balancing_mode &
+			      NUMA_BALANCING_MEMORY_TIERING)) {
+				vma_pids_skipped = true;
+				trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_PID_INACTIVE);
+				continue;
+			}
+			vma->numab_state->slow_only = true;
 		}
 
 		do {
@@ -4329,8 +4338,14 @@ static void task_numa_work(struct callback_head *work)
 			cond_resched();
 		} while (end != vma->vm_end);
 
-		/* VMA scan is complete, do not scan until next sequence. */
-		vma->numab_state->prev_scan_seq = mm->numa_scan_seq;
+		/*
+		 * VMA scan is complete, do not scan until next sequence.
+		 * A restricted scan reached the end of the VMA but may not
+		 * have completely scanned it - it must not disarm the sequence
+		 * counting horizon in vma_is_accessed() for this VMA.
+		 */
+		if (!vma->numab_state->slow_only)
+			vma->numab_state->prev_scan_seq = mm->numa_scan_seq;
 
 		/*
 		 * Only force scan within one VMA at a time, to limit the
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index ce10ce437464..e3fe08c4f109 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -887,11 +887,12 @@ bool folio_can_map_prot_numa(struct folio *folio, struct vm_area_struct *vma,
 		return false;
 
 	/*
-	 * Skip scanning top tier node if normal numa
-	 * balancing is disabled
+	 * Skip scanning top tier node if normal numa balancing is disabled,
+	 * or if the scanner only wants promotion candidates out of this VMA.
 	 */
-	if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) &&
-	    node_is_toptier(nid))
+	if (node_is_toptier(nid) &&
+	    (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) ||
+	     (vma->numab_state && vma->numab_state->slow_only)))
 		return false;
 
 	if (folio_use_access_time(folio))
-- 
2.55.0

