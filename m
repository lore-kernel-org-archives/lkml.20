Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21552493D2D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101784; cv=none; b=CcCnYODSoS/dFIORnH50I3lvl4H7e7Rsepij4GpnU2WKxobo0WPkVd4f5pJkEigHj/c1HWemomv3gF6yZsrwVgCZzNXUu+5ZCdyHVSotvEjIf2sK2bM1bqrROrpnShg375iO+lVp1D/h1ey7eVlCEW86HdK0dZ9yjE+ABzCnNM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101784; c=relaxed/simple;
	bh=k4NugTQESVNugUzaMMuu3OYQl8Um++AA2GKnIZL6+Sk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NqAzwl3irvLTyykXpjEPMayem5b/Hq2rUlnt6wJLRCenHRStLq0mlEZ0ORVHeP/Z59SU6B5BxFX1kh3g94i90Jk6YmjwrI8VM371Wmt2Vu9D6jnM9p6iBzfUptxBiVh8EydnfydlCJkXMytpYQBKDu7S/vi7SLdD0ZV+xlnetzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=iIAb+tlh; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="iIAb+tlh"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93a0299c787so15808485a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790101781; x=1790706581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=axWZscC+v0nVIusaiMTv07a6IEIvhtM/ylITkcHKQpY=;
        b=iIAb+tlh2BOcjhJcOrzMjhd4U8PGcMXr/VmEIkt0r/qX5dYnOCBBBz+L3fbUg8b9ko
         aEl/h9+uN5s/pgSDqerKUIYiUsGJCMwkAqi8EBWWYd91ImqART76LVXn3CIJekS/eRhS
         eXR66VE+rQeXqgUobSYlX4psLSDyOPa5x8GeHpyZnYT96liwR+cB6MhFd08gqdWVPsUD
         tEcDVkqF9kvEqUzt7NoGueZ8ZmeEkQccVnLFGGP/AG8ullsb6DV4q8eleFXScAYg7f0m
         PvWRw1lGqwXWYQGefToMK30D5anbpG2YeLJ97UTK5jB+EZ9FQ0wAXXyuUVmWNB3wHA6F
         t1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101781; x=1790706581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=axWZscC+v0nVIusaiMTv07a6IEIvhtM/ylITkcHKQpY=;
        b=kCCvX142rVDnWwHsIe5FfZLBLEx0qr7//e267DVs+FAKUZysQilR91yZ4eZFEs1rdw
         bXvpyCTZJ4Vb5ck5gy21r+xOT7kQ+nqWDmEjs4z+raKalHsieJCHrPFrTncxEy0hhgpa
         LxUBNYmNBly4e1O8Cb4toyjgrgYuRPGM/nVb3odp8A8MU6psVE0X0dwQJx+IrhBcdsfl
         bBXJuG+KK708mbGMdc3JHWiklLMvGk3IyzyvZqclmQrFyWU99frym2WIccUwU38dWRCf
         KMvwW63Hmm0ZIua4Yz1Vz79i3qR8zaQ9XQaMQGsXhlXn9E5gFKPj9zk3wP74jC5XEFOC
         31Ag==
X-Gm-Message-State: AFuF++kCGwyjg2SKTZQtbDyzU95Qadc1gmihy7ZjG6QtuaEnJEc/xhOG
	gA/dQjrMsO4RinZhxyOsB8FjL0nD9FeAIYyiMOqBV73CxPzYc60pyqPIaGKyZ1qM5OA=
X-Gm-Gg: AYBFou16Ua6QiVBQWz0BkH0zArrrC08W425drmdieIDJG+ao+KziLJixtagCEnfUvdu
	GXrjIVXOzOD3IkDIhqwNCp5M65sMkBH7iR4VudD9yWzRBP8Wbd0TJb7IWkESVXMhkKhB9XxYL0i
	zqwVzvJ7mbGQh7Kl0V2SzOvhcFFwdG4kmJYgYgVDweI4bqLDfVe600Lf9w4HFH02ORfkVw5kEBD
	xXtmfFCKjJvtMW5sViiL/xxQkOrDuscCiMJSd+TUgVSYU4Ve8NTUXDc0eJG/RYqEvsga3gA15r/
	RqxELIYpWcQzD+9ndsJX7CDa/xgQDodKQ+2nYWxSUR35nyFCxmUceG/YNcgAe6dYIKtAyzUcjOz
	M1d7F3nDpu2/BsrlIAvaE+CVaH0k1HQd8Lw4AWBue+1M+dmmlMOye3DYGfi3QvAECIuVQjxHBSN
	fRmGT9lrWb8uv1PLhzO3rS3J3qOdlTjE/gSj91+x+ulANVRyzNAODEwGnWG5aNLBodZUk6KCJnx
	mJq7Hf2HDyf44ebNiv1RPE5VbSle8nlBv7Nd/KfdiBusHpy6cLaTVCNoHuXsmhWfBahpno=
X-Received: by 2002:a05:620a:1d02:b0:93b:d7a3:45de with SMTP id af79cd13be357-93c252538f6mr36699785a.71.1790101780908;
        Tue, 22 Sep 2026 11:29:40 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c24889ac9sm37130085a.27.2026.09.22.11.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:29:40 -0700 (PDT)
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
Subject: [PATCH v3 5/7] sched/numa: scan PID-inactive VMAs for promotion
Date: Tue, 22 Sep 2026 14:29:26 -0400
Message-ID: <20260922182928.2199090-6-gourry@gourry.net>
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

Commit fc137c0ddab2 ("sched/numa: enhance vma scanning logic") skips
VMAs without recent PID activity. Since only NUMA hint faults record
that activity, the filter can suppress the fault needed to promote hot
slow-tier memory.

Let memory tiering bypass the PID scan filter. In combined mode, use the
placement decision to restrict top-tier sampling to VMAs that need it,
while inactive VMAs still receive promotion-only scans.

Track the last completed placement scan separately from scans of any
kind. Promotion-only scans still update prev_scan_seq, but do not
advance the placement-starvation horizon.

On a host with 768 GB of DRAM and 256 GB of CXL memory, one large shmem
VMA consumed most scanning activity, while 2,537 other VMAs covering
84 GB were skipped as inactive. One stand-out result: a hot 20 GB hash
table ended up trapped entirely on CXL and drove CXL bandwidth
utilization beyond sustainable levels - resulting in a large regression.

With this series, the hot hash table ends up split evenly between DRAM
and CXL, tier residency tracked runtime load, and CXL bandwidth
utilization drops from 45GB/s (maxed) to 5-10GB/s, while DRAM bandwidth
utilization increases from ~200GB/s to 250GB/s+, resulting in major
throughput improvements for the database workload.

Fixes: fc137c0ddab2 ("sched/numa: enhance vma scanning logic")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:gpt-5
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 include/linux/mm_types.h |  7 +++++++
 kernel/sched/fair.c      | 26 +++++++++++++++++++++-----
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index fd35db969bc94..dcca3ead9db59 100644
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
 	/* Preserve placement-scan eligibility during an in-progress scan. */
 	bool placement_scan;
 };
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index a2849e72c4e26..412c72084a63d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4097,7 +4097,7 @@ static bool vma_needs_placement_scan(struct mm_struct *mm,
 	 * threads can help scan this vma, force a vma scan.
 	 */
 	if (READ_ONCE(mm->numa_scan_seq) >
-	   (vma->numab_state->prev_scan_seq + get_nr_threads(current)))
+	   (vma->numab_state->prev_placement_scan_seq + get_nr_threads(current)))
 		return true;
 
 	return false;
@@ -4267,7 +4267,8 @@ static void task_numa_work(struct callback_head *work)
 			 * to prevent VMAs being skipped prematurely on the
 			 * first scan:
 			 */
-			 vma->numab_state->prev_scan_seq = mm->numa_scan_seq - 1;
+			vma->numab_state->prev_scan_seq = mm->numa_scan_seq - 1;
+			vma->numab_state->prev_placement_scan_seq = mm->numa_scan_seq - 1;
 		}
 
 		/*
@@ -4300,10 +4301,13 @@ static void task_numa_work(struct callback_head *work)
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
@@ -4315,10 +4319,16 @@ static void task_numa_work(struct callback_head *work)
 			}
 		}
 
-		/* Keep scan policy stable while processing a VMA in chunks.*/
+		/*
+		 * Keep scan policy stable while processing a VMA in chunks.
+		 * A fault in one chunk can make a VMA placement-eligible. Keep a
+		 * promotion-only decision sticky for the rest of a partial scan.
+		 */
 		placement_scan &= numab_mode & NUMA_BALANCING_NORMAL;
 		if (scan_started)
 			placement_scan &= vma->numab_state->placement_scan;
+		else if (tiering)
+			placement_scan &= placement_due;
 
 		vma->numab_state->placement_scan = placement_scan;
 		cp_flags = MM_CP_PROT_NUMA;
@@ -4351,8 +4361,14 @@ static void task_numa_work(struct callback_head *work)
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
 		vma->numab_state->placement_scan = false;
 
 		/*
-- 
2.53.0-Meta

