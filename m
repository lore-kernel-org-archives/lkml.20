Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323104;
	b=WRfi7YbY4SttBY7fG+YA65CTMC4zljf/OWLk/3i00KnglZfJZf53KdGXQ8AbcfdCAXSd
	 cdZcB5q9joB8/VY3X/1hBMSyNr13x4vgZj69IMx3SnxFLtvEo2tsMhAKDvkvbHy9wjhYu
	 hEFhlUxJw4zzEx++5/9yxO71LCRHXlWTgmknoWqV9kINsHcXeUR2oRZ2ailAEtdj3E64C
	 wy/tC7SjnSpOeGcqsz0yTaIafEeBmoQtzKS9gwUwDzOqTe4Q2Pta45WiGwISgWsJtSWsk
	 iEWQyLsZpp8ncfXOOMmk4FNCFSp4PMseIFjcyCTpZsF6qkZ0/Hl8J2PujVYQPHgXJMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cFWhcWmrWDGG0gIid6Q78OLBS0KZGvC/qqEABqibX+0=;
	b=VdVRtD1fsbHa2tkYeu0/vMdHXEMfisID2tC02cw9qqDQ8UY925DlI9j0z84HOFxbnwyM
	 wbRd9spee8CvX+gtAj8tYVvkUfqMSk8IX31b3WMSwdigOOHDbDYQHFV6UqL/6vQ0MHIeh
	 fWS0RGk1J0LZCUN2OF4Gn/ieETOMhi4jOQIrrJoFX8kGtQNwA6kWMRr0aAop5XSj9R/Iy
	 ZpioVS9mEizKN4l4Ooonjc2f/Yzqdg3ZAqxeYg3J1SsdnE9kXYyfY9Fh6AjRrWwpIVWJO
	 BwGszb3FE/uuO8r/GsVsDq2ncTkaOd5XKEAQONDI9ApppKGoK1Bt5qV6cV4go21qqRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=fr7GAV9F;
	arc=none smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C59160A380C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:05:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C59160A380C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=fr7GAV9F
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-99c0c1d07feso904126241.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794323103; x=1794927903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cFWhcWmrWDGG0gIid6Q78OLBS0KZGvC/qqEABqibX+0=;
        b=fr7GAV9FySFoHEuaJCdStSWCkUK6oxURNzf7H/KujVCqLcO3wYY7XpsHrY96YRB1uX
         WvTWm1sWav92iDR747bbS03XiZx4MhkOr6S1gg6AZGefO2sqUan93w8BJ0J2cAIF4tpx
         70q+HL5dO7NkILnu3bDTxW/JAwgWYP5UMJh2mh5oNVKW59jZyU6aPLoUCOePP/Yd4OXV
         WJNzf2DDnn6Pa547kzyiQcZYf6pOvKdFSmdKn04MazjpCfSPw0EH4PWZ291qWkdOAxoj
         TSL8pgEZlzlL7cN9RCdZ3DhqIajgN4JcbCHV3pYrfaOU4W8X2jEyZPAz64SsGXJ/1iEO
         LZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323103; x=1794927903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cFWhcWmrWDGG0gIid6Q78OLBS0KZGvC/qqEABqibX+0=;
        b=Yf4wH/ER6nJg3gYqVq+8PZi9snK6/BlZvZJ1HxCQNbGH9yDwx6pKBmylQ4ewumDQHa
         fD/UmpJaU4RdotWWO2gjN9/GCAzKxrAqrl+py/0WRfJ4gOBlmDk8IXf8jcojmPIwGQ7q
         VkDQU7apLDISs81UiRNzfCxqD3ha2nHNMBbrXQyI+RVgmqmvsP6e9QMFgrgF7F/5PUYn
         J/Q+Yjn9uoFKcy0sA+aUwv0HChSPtH0wzzxBT25+lv2JY8q8HkqI8c8aoiXx6IMViqDG
         edmLNjVI+Nh2lVP3/6ySKLinKCg9d6+GmGehs7z271wgcSkexZPs9AmKo36skzWr4zXX
         wcMw==
X-Gm-Message-State: APuU4Z/cipm63nJQ/K+7tpqfK7+E8Ap7a38KnzuP3oe0ki1lIgt3Szm3
	bU5M4Z1XxEZCsvtR9OkNimvryCObRi1jV1huD7KU2HT4+lrmhNLtWuo7ON45Lh6oILo=
X-Gm-Gg: AYBFou35CXPH+EFu0b/gCQc3n+TAVD3wFf+clPhE8izE6ilrPAdQJ60RFQ+Cj8HUov6
	9fSuwqdcT72bf6tcBIbW9JjiUhIaMBPuce4DyiGzBTIfFvgqzT93A0d0EvMcA42aCsYmFLI7uzG
	SQwpojPpcuqE0i4KzG8jovVvCgGW2gFSKwHBle+aPB95abTOS3e4J0/3zMhNXpdnHZLfgdQWYiE
	yVxtiAyYUwDxkWc2TbOlmMszmGcEHx/YvzAW2lR8kcxYR6v5AlqOlW5CHsqpEUjZ/Lzf4PBcT2E
	rcfhMmaqQL5uAB9IBS1ELIdzu/JczkRHeXw9UHJyf3kwEPPziiYUtlqvTaWu0NObm4ASIHFwR4w
	7uE6LKcq1wQyCLkcBC0f+EBoK/sJGgC4FezBEpGTro5DbvqjESWScQcKnnCE4E6MuS80Tg03Y+N
	D+ArPnvtnMXVSngcUzjDmWc9DG4mR5XTpd6e8uWLDBt0wVXtOk22Xo3MDG0UBgLX6Ffq5gVO9Lx
	H+1XyFElW4t8EzH7XLIFCmGLlY5n3RIrNmm+IHyakBiE8CE+7xqy24hk6+mbEtro+IgFnv2+U5n
	9NI6A2PUH+7w8nqvhRjrR67aRrT/ImrvVT6SMxyzTshnkXBAHeNOoNJR6dCmrDoV1+Iv8feMep4
	08QyDHjekRY52M/U=
X-Received: by 2002:a05:6122:32ce:b0:5ea:b972:1403 with SMTP id 71dfb90a1353d-5ee0cf152b1mr999596e0c.3.1794323102986;
        Tue, 10 Nov 2026 07:05:02 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef031c7dasm22902406d6.1.2026.11.10.07.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:05:02 -0800 (PST)
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
Subject: [PATCH v5 4/7] sched/numa: separate VMA placement from scan continuation
Date: Tue, 10 Nov 2026 10:04:43 -0500
Message-ID: <20261110150446.2452975-5-gourry@gourry.net>
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

NUMA hint faults always target the faulting CPU's node, which is
top-tier by definition (any node with a CPU is top-tier), so a low-tier
folio can only be promoted, never migrated between slow tiers.

Fixes: fc137c0ddab2 ("sched/numa: enhance vma scanning logic")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 include/linux/mm_types.h |  6 ++++++
 kernel/sched/fair.c      | 40 ++++++++++++++++++++++++----------------
 2 files changed, 30 insertions(+), 16 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 1ed35d258d2e3..045b47f4b0463 100644
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
index c0b7271f1bce8..778ba0ed34fe8 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4226,8 +4226,9 @@ static void reset_ptenuma_scan(struct task_struct *p)
 	p->mm->numa_scan_offset = 0;
 }
 
-static bool vma_is_accessed(struct mm_struct *mm, struct vm_area_struct *vma)
+static bool vma_needs_placement_scan(struct vm_area_struct *vma)
 {
+	struct mm_struct *mm = vma->vm_mm;
 	unsigned long pids;
 	/*
 	 * Allow unconditional access first two times, so that all the (pages)
@@ -4242,15 +4243,6 @@ static bool vma_is_accessed(struct mm_struct *mm, struct vm_area_struct *vma)
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
@@ -4274,6 +4266,7 @@ static void task_numa_work(struct callback_head *work)
 	const unsigned int numab_mode = READ_ONCE(sysctl_numa_balancing_mode);
 	const bool tiering = numab_mode & NUMA_BALANCING_MEMORY_TIERING;
 	const bool balancing = numab_mode & NUMA_BALANCING_NORMAL;
+	bool pid_scan_allowed, placement_due, scan_started;
 	unsigned long migrate, next_scan, now = jiffies;
 	struct task_struct *p = current;
 	struct mm_struct *mm = p->mm;
@@ -4460,15 +4453,29 @@ static void task_numa_work(struct callback_head *work)
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
+		placement_due = vma_needs_placement_scan(vma);
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
@@ -4501,6 +4508,7 @@ static void task_numa_work(struct callback_head *work)
 
 		/* VMA scan is complete, do not scan until next sequence. */
 		vma->numab_state->prev_scan_seq = mm->numa_scan_seq;
+		vma->numab_state->promo_only = false;
 
 		/*
 		 * Only force scan within one VMA at a time, to limit the
-- 
2.53.0-Meta

