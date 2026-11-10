Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323107;
	b=Ht0t15ML7bYl8F2EcD4wGv/2T9J/Dx5g22jMg0CW4ficgU5ji0YhmDha1waKTXOyzuCL
	 6iBCzGUDwmfGuMqWWWVMbYnKlA40boCDAncAQcR51NKNrDbPl+VQ40aMYiYUJ1cRaWuGg
	 nA1/NRWCFidxZXnMFiiNxVr51FsF2dRX3x87fvK1mTO0dsXKkwlrBElkziaJ7uVAj2WKd
	 SPv4OjM1AH9DJg8Q9h0pDxzvnPxjK4v+chFxjMxvRNxNuqSyPM9COLQw2K/TjKk4uw07z
	 a7TE1s3NRRrInynNBL6T/ZfvEK3O0EEHv3EDj0bmds5CKrKB2g3K8s9q1uDSDZzJ8nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vcLnXutpVbgBdRb5uPCtaaSlCuask7xhgkuh3/sjzDQ=;
	b=tNE6lInbDK6KukxftYaEfSj0DvvRfL5F0AMwainDj/8PJuDYQJKiqnFZoX1Q8WPDaj/4
	 lBucOggdirSNle5Xoh6OFos61n4AS2SXh61+9UZ/B61njPQiGl6dv+Jqa/1h9sTZuRrR/
	 HtVl3asNXUfThCorO/8bkwKvTOM05HZozXKfjIFKtyDooUxvfLMOi2+UezUdVVj2Y3JmU
	 pe+0kDYUkilBrKd+VWhB7rmC9TqSLXVANa8JryyLLWfW6QSZQlYTTfVjhL9Z10/zUfteb
	 skD0ErIu9kpKenYpFLqRYmdlHsQll159VNbct0OpS/RRg5kJbdFvh5EF12sBk0JPzZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=sioczII3;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3327E60A3822
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3327E60A3822
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=sioczII3
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91ccfb88e4dso25531146d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794323105; x=1794927905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vcLnXutpVbgBdRb5uPCtaaSlCuask7xhgkuh3/sjzDQ=;
        b=sioczII3hTUQZckfVJTQnnHZNDPdBNV4fGCDJFuHDnZQxhMDtmwU57dGzCEirg3nwc
         Zn/uheulWHmcKDEcGnlMbBFRc2lcDZHZK9y//bkPHo0EnudexzVVQ8CyCkA+qgD+Plfg
         tdMimwN1JR5bNCUonBXquutCZWo03ZcgZaw7qVa3HUFMzzEhiCp6wmW3IlaLTfsP/njU
         YR2Rph87syURqU0clZQpSIEbVWyIFJEijgTuWffoySh5BMBGcQJCYmwlUEZ8Ic0zIIME
         EefenyYhnrauilT9mPNhoxOkkfhpndS7U0VP5KoX9hDGVRMxL4BXKWikpiX6X+mn8OET
         MjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323105; x=1794927905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vcLnXutpVbgBdRb5uPCtaaSlCuask7xhgkuh3/sjzDQ=;
        b=D1pqgJWxWtV4DfBGGeOZrOljdCtwAEWjlRQbpfwTMILjjqzLyxH1xVZo9mB6J0ACvZ
         f7vHTkpOo72xENK79cLArv9SYDw5v4PKxhIlESg7giIwPBnPS6a3Imq/4rwnfyVxXWep
         RMKSMqfT7nzl3oK820KX5NQ6C4ds+lf0Mf7u7oRRMofG3ceI3vEmUrFA3V1K6NGR8aFf
         PZ9H24sWJXATM+jaf3ctxvMCo0TQQ/XvvmquTJ8sv7ONlvU3DwUVk8pDGBgukSG2CEwj
         anSps1OGjMiPrkI0OXP47v2HNwxbkMbf4DAMUoEehNCPojqxjJy9GR/NOJuydMJBx1GO
         smtQ==
X-Gm-Message-State: APuU4Z+Y4zqIys1FBghofN9E/crH+ny/dh6si3Pc/Ty7iC6L1Hb3oERC
	7gleG6EU8KMly4px8Xna1PjDZ8+OoD7odSNlWS6iFHTNmQQdKMGjRswHKp3WVkzvrRM=
X-Gm-Gg: AYBFou3v8/JSi2TgGvNCR6yYn+saX2gnu4ryRZg5D79/rcXoDAG55EJ+FO/Mh7az0Bp
	CcBEY+N+JysOadekbkiB/rimuF9m/68eW5RgzkW3xNUBufiJvB/3oivSYZKO1krDNmbyFzWqh60
	jr2PD+iS6ZAMJC8NfIbAyiLiwbBs6Oox+Ce702tertAVtd37XXi/b3GKiLe3qunnW8dSqUclY+k
	rvTPzQav/ZiX94h6aT3oPFnCSL2uQzHGNR52nB7TL/FuZBjwDhZ/AbF8UfEwFzdXTQf+f+uN3L+
	jYa29eGxeIkjj/A7a9ZggxEMLhDCncNmdyZKtCFSNpd7KZBfZqJPrX7cFsBd/VhAHuXsVD2Cy7n
	d3i2EODNsKW5A/8LXTM0Ul1wZsZmqEEHn+3+h7ScoVl1RhnVr9B4EZfM24YqlOSs/ikP1DbVSrI
	jnXzbbQ+G+FxtzRSSaT/WA4FjIVGOQot0hZLvGimpgKfx7uN9c7VgHNZUmCHGObjvFtNDIH5a+s
	YmirLIhiiNGMPZEudiMzGq9+M8yh/lmd/C9z6leUvE+/TBbzof8xtHDcPpVtlLh5PfxKHvuiqSQ
	49UhA/jKas/non/83zUliYWOOPUPTrOBA8JvzC07zmEC4lYkdeGdHuYDH/0QJGpgkzCBX8iC/lF
	A6NYZUyDQg7+FuMwoXB9ajGNLOZGzlkuz6WIQ
X-Received: by 2002:a05:6214:858c:10b0:91e:73ca:c74d with SMTP id 6a1803df08f44-91eef82dc27mr36514096d6.38.1794323104914;
        Tue, 10 Nov 2026 07:05:04 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef031c7dasm22902406d6.1.2026.11.10.07.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:05:04 -0800 (PST)
From: "Gregory Price (Meta)" <gourry@gourry.net>
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
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@techsingularity.net,
	mingo@kernel.org,
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
	osalvador@suse.de,
	raghavendra.kt@amd.com,
	stable@vger.kernel.org
Subject: [PATCH v5 5/7] sched/numa: scan PID-inactive VMAs for promotion
Date: Tue, 10 Nov 2026 10:04:44 -0500
Message-ID: <20261110150446.2452975-6-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110150446.2452975-1-gourry@gourry.net>
References: <20261110150446.2452975-1-gourry@gourry.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 include/linux/mm_types.h |  7 +++++++
 kernel/sched/fair.c      | 31 +++++++++++++++++++++++++------
 2 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 045b47f4b0463..94350132d1803 100644
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
index 778ba0ed34fe8..279bf12b74b64 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4249,7 +4249,7 @@ static bool vma_needs_placement_scan(struct vm_area_struct *vma)
 	 * threads can help scan this vma, force a vma scan.
 	 */
 	if (READ_ONCE(mm->numa_scan_seq) >
-	   (vma->numab_state->prev_scan_seq + get_nr_threads(current)))
+	   (vma->numab_state->prev_placement_scan_seq + get_nr_threads(current)))
 		return true;
 
 	return false;
@@ -4423,7 +4423,8 @@ static void task_numa_work(struct callback_head *work)
 			 * to prevent VMAs being skipped prematurely on the
 			 * first scan:
 			 */
-			 vma->numab_state->prev_scan_seq = mm->numa_scan_seq - 1;
+			vma->numab_state->prev_scan_seq = mm->numa_scan_seq - 1;
+			vma->numab_state->prev_placement_scan_seq = mm->numa_scan_seq - 1;
 		}
 
 		/*
@@ -4456,10 +4457,13 @@ static void task_numa_work(struct callback_head *work)
 		 * Do not scan the VMA if a task has not accessed it, unless no other
 		 * VMA candidate exists. If a scan is already in-progress, finish it,
 		 * but track continuation separately from starting a new one.
+		 *
+		 * The PID filter must not gate promotion. Allow PID-inactive VMAs
+		 * to proceed when memory tiering is enabled.
 		 */
 		placement_due = vma_needs_placement_scan(vma);
 		scan_started = mm->numa_scan_offset > vma->vm_start;
-		pid_scan_allowed = vma_pids_forced || placement_due;
+		pid_scan_allowed = tiering || vma_pids_forced || placement_due;
 
 		if (!pid_scan_allowed) {
 			if (scan_started) {
@@ -4471,9 +4475,18 @@ static void task_numa_work(struct callback_head *work)
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
@@ -4506,8 +4519,14 @@ static void task_numa_work(struct callback_head *work)
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
2.53.0-Meta

