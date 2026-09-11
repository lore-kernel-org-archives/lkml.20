Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76160275AEB
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789085921; cv=none; b=uevijEwaPlHihAKzvJNXKdFqKlHwBUo/4HKk2r3EKlRsvxPtFpX1eRImRdKwaIRE6zvkkgIs2u36daQbj/tR7aaJDYQvLX24b7nRXdQ0fRqX8Q8r1BJiVA4tAIf3B8N4hoEeq5eJ1Ybjt00gsvggileyN/kMlQhTMA39Ex6si8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789085921; c=relaxed/simple;
	bh=MbCDYm5ROgW+FhjLtzZnAOPPKxmb4d+M7CPyKUkZdHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o+K9bBt7d9R2pvzOereyFIsnosLa/gtfAXOcRhSWIZKJE2HfhPR2fPuzLkyq2lzWZ7hCIQBTF7bd/OZkJkMuBHpBbnbzRJ+PIpwYCqh0fQXfFSU+vXuGz6daH8eXgog8zp8bWlRCHHgxE0OW9CZpPCquOtWrHPlw+THPtAeIw0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=eKzHeCjB; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="eKzHeCjB"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910ca5aa6so43986185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789085918; x=1789690718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdeGUk78rOtPCIG/0kxB5vZ5w0EIZpg3hPrMBzGs7bI=;
        b=eKzHeCjBxsA1oJHX/yRG79/lLg6Sjgoog4OZohyMsVneXKA7/sF+q5fztO42LviodM
         FHQw4taURmCmDSQPL/6kZSjMO1QQ8dz8dRz67d9kFcuGHSNseAJCn1qh+0w0ACLtGKQV
         iXy8UIXsL8PPnF5AVn9BdGbIbAZ6+GtWeFf7tTd/X/dafkw/xMqofNxm9nYrtjqc5fYR
         W1YC42wT4fBLz/JA2T1lpj5QttccY/8ymVrUGKhWSc/wdKT4Z2w/L1dPka0JO2hBcqeA
         9QlyVM9il7EwEN2iKnVf2AQW2QJeNwmS+/S40/VkcbFjgObAnjuWhZRBpPm4C/ynTqHQ
         UJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789085918; x=1789690718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PdeGUk78rOtPCIG/0kxB5vZ5w0EIZpg3hPrMBzGs7bI=;
        b=KkD62z2Vtr6lwPYtC+UOgCAnsjV8C/zrUjHed1zSb7JYsY1OjjduVBMt3MIp9A01GP
         wx00UwDOV9BgtEiYSMpOlxcJVtr/HvNUkx6HzF3z8eLA1Ki5zxeF4C1/lVdRGi1HBlkY
         W2KfqA121EZxVSwATZ2sQVhsmbFPOS2DOSQUfVgLx1WfwwKjJTksVLwCOdrku1Zx6FcP
         cfyIlj2ZkX3R98rgI4wT6M+TbzbgHN8FhLTDWgZTSMyPNuE8kyCOcDbkLx0nCV5P3U5r
         FDfeM7wQKg3DbUpa3kBlc1JNJCmmM+YkGNT0bpNMBRDy8WDSiwhe5XtG35Cddl+YY6Ci
         NjkA==
X-Gm-Message-State: AFuF++m7Snr6fTeexApVQ3bQfD+g6+h8q2PaitocCGvtNUF2aepko50i
	9B0tDZgJBv6Vx/E5nk8Byt48NUae1XMmBxMOqazEIpEvThlYwshWtsHfBf8y2S/0ws0=
X-Gm-Gg: AYBFou2MLT37iBSWrsXQ2PJpjFSCcFbJwuZ8olRVaLVVcWJMa5/kXXCHczLk9hV/UHl
	jdDYWgCbhQX9lg5VZEsjCwxdr9Y3CfelPC+C7+zt4709Y6Dg1NNWVegmItfQCMC7RBT4LwLI0SO
	8HCWgzXeBUNOXQfBbZha7gG9+Hvs9cFUl2p7ZWjFfSXNmRsXJThJkfm3+6ngaTz5rl3jRmeR0Bu
	Dg1MfgU+tJ4tUuXApEEfaUIWO3KnH1rQ6YMLieaRuz4CQ4MRiMxP7lrRKiEoqbcY0plz3pdQDqI
	r0nB47hlMcIb3lVKOcdW7vwE7G4QPDmiH3CfdHd2sM7X9tz3JQbLQLlTapIGMcGiJSVALwvjmFO
	Uiv5YVgIsEeXCJP9EqeDi6Ok2b8jdfXxFOR4BJoHGkJWmJgrt4/aeBSv5xQmUlBiiTbOdYDej1u
	eu/THPoS5qoTvGZF1Hl4c17ZAbFZZC0X3tCRAiOv2qLdF4Fz9e0eVIe88iXhpd++ic5v7fsARSK
	Wj8xsloksqrqptWCrshNW2sO0lbDizbIZ/Od2dKRNVCUBzd+X9xyHCz7hyS
X-Received: by 2002:a05:620a:472b:b0:939:d440:e530 with SMTP id af79cd13be357-939ea0e3717mr224092885a.9.1789085918183;
        Thu, 10 Sep 2026 17:18:38 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80e4c36sm108896485a.40.2026.09.10.17.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 17:18:37 -0700 (PDT)
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
Subject: [PATCH v2 3/4] sched/numa: scan read-only file mappings in tiering mode
Date: Thu, 10 Sep 2026 20:18:25 -0400
Message-ID: <20260911001826.2109390-4-gourry@gourry.net>
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

Commit 4591ce4f2d22 ("sched/numa: Do not trap hinting faults for
shared libraries") excludes read-only file mappings from NUMA hinting to
prevent placement bouncing. This also hides hot file folios on slow memory
from the tiering code.

Scan these mappings when memory tiering is enabled, but make their scans
promotion-only. Ordinary NUMA placement retains the existing restriction.

On a host with 768 GB of DRAM and 256 GB of CXL memory running a roughly
430 GB database service, 169 MB of its 185 MB main binary accumulated on
CXL before this change. Afterwards its tier residency tracked runtime load.

Fixes: c574bbe91703 ("NUMA balancing: optimize page placement for memory tiering system")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 kernel/sched/fair.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 81359b414947..e636e8de53f1 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4061,6 +4061,16 @@ void task_numa_fault(int last_cpupid, int mem_node, int pages, int flags)
 	p->numa_faults_locality[local] += pages;
 }
 
+/*
+ * Read-only file-backed mappings are expected to be cache replicated between
+ * accessor nodes, so they are not worth sampling for placement.  They can
+ * still strand on the slow tier like anything else.
+ */
+static bool vma_is_ro_file(struct vm_area_struct *vma)
+{
+	return vma->vm_file && (vma->vm_flags & (VM_READ | VM_WRITE)) == VM_READ;
+}
+
 static void reset_ptenuma_scan(struct task_struct *p)
 {
 	/*
@@ -4220,13 +4230,13 @@ static void task_numa_work(struct callback_head *work)
 		}
 
 		/*
-		 * Shared library pages mapped by multiple processes are not
-		 * migrated as it is expected they are cache replicated. Avoid
-		 * hinting faults in read-only file-backed mappings or the vDSO
-		 * as migrating the pages will be of marginal benefit.
+		 * Read-only file-backed folios are poor NUMA placement
+		 * candidates, but slow-tier folios still need to be scanned for
+		 * promotion.
 		 */
 		if (!vma->vm_mm ||
-		    (vma->vm_file && (vma->vm_flags & (VM_READ|VM_WRITE)) == (VM_READ))) {
+		    (vma_is_ro_file(vma) &&
+		     !(numab_mode & NUMA_BALANCING_MEMORY_TIERING))) {
 			trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_SHARED_RO);
 			continue;
 		}
@@ -4306,7 +4316,8 @@ static void task_numa_work(struct callback_head *work)
 			continue;
 		}
 
-		promo_only = !(numab_mode & NUMA_BALANCING_NORMAL);
+		promo_only = !(numab_mode & NUMA_BALANCING_NORMAL) ||
+			     vma_is_ro_file(vma);
 
 		do {
 			start = max(start, vma->vm_start);
-- 
2.55.0

