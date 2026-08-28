Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3FC2EEE91
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906198; cv=none; b=tdhxhyqZmxouMJ+it4R4LkasCXg7nD5w8PrzPtV/3VLaBUDybxhnCTcaq4wWtiX65cRKFNsag2Ju92Mjo8nxQ/glPh9KOwakY05qqS2htFr6ouLgCAmrtFwgAbXohDHaEL2QDj+DHK+muMwe/SmY4fhUmg9qOOeEXbCEfMqRyMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906198; c=relaxed/simple;
	bh=F1a8hjL83x21J4oqY/tV6KscsmJKcZFdvvKIuc14ZN8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XAAer44+15QY+wP42JEuYUTBadPOWUm6kYzrwAf2vQsDVsX5zTa1nCWw9TOMgRWGeFMizzo/0HH1G+1Jq7uxsxovfDpR1macHerkW4CpZLbBwMLAJHMH3KhE3n7XsPVVAQ1TmURQBO/dpIy1ICL7t2ScEyUItWLAlle/6IrkV7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APKr6DHM; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APKr6DHM"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so1005390a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787906196; x=1788510996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jEiZf5VBBS6vGyJArkThuH0ptWV1Q5s7lziEU4M6gec=;
        b=APKr6DHMP6b1+CYjJjryyt4/iuwNBU2ZEp1qQdMEMIjEEhk6SEcSMzDcjQur8edaM4
         mxMyec2/HeKh0bLlac+8sZGBgNYiAK3fpAXHNomci5thsfHHqZL3dnTMBMKaVhb+FYgq
         VhQDzSW37S+8+rPrdP0JV9IJXcXtb4DPhHUbgFtsYLIXT4QagfKNn5xb09dQyud8Hv3D
         2+4OJvNbJ6Uet0kyo/tVZCOvX10zSwtcFO74cP3R+VmZA9KtzgPVNtRMPeYatgslI8Fk
         X6IQ4bUWwHu5LOW4/zCrX8w0wirSDwV6H/aFglzbEHnRIYUPrvJPRMiiU3A0VrtTEilI
         lx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906196; x=1788510996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jEiZf5VBBS6vGyJArkThuH0ptWV1Q5s7lziEU4M6gec=;
        b=ZmXA4ROqzj5IEJZoIGhtoiU939uFa8+dDJRG8kvdKXJDSF1Q/Y6vOminO153V1iFSW
         ajiKO3zbUcsQ1RqDYxOPmMbgiICMyzYHan7JRJlL7XfXOs2RKd255PTQwvsQ+pdyhVJF
         oN3FEfksS7f0bcOBDS77wCmuYc+18UdrlBOu2QXKERnB21tW8xZMQfKWG82x87NUdicj
         VcvA4jgpNAL242gqUmYhzhMAD+LxKbtTUEqEzOk0GbFO0a9XGAbs3Xj1+7lCvuYTEymm
         YYX7Lo0RBIXkZdsBj7HK02/Y6k0fYSaUZJOccS1+HzI43XNxf1M95Oy5mh3ie29UuyIY
         RCyg==
X-Forwarded-Encrypted: i=1; AHgh+RpfSGK/YvhaqApf1t1q2DTDk7U7j6GB/1lrD+4xRWwj8XnRVYyG9kqvECE6ZA2QXKiDOpcQ01Gbepin//s=@vger.kernel.org
X-Gm-Message-State: AFuF++kWDQud7yxBfnr1nfLAENg2T9GwJo1VcAzc8hHFYxhxgy/mtXDd
	+ltaFEfxW4PKs0ng//9xlLDkC2rOgtgYQnjp/godBE7EN47waf5s6jgU
X-Gm-Gg: AR+sD120AwelkwgFXoeonBTHzENg5ZNWs0xYyNgT0UbRbnJvOQwSofL0gYHAiG7kUB2
	3d/E3POsO/phnmJkl/yINb7MUKl4smxl35U8ttXNquy9kJ6aIeA1YtUT3z+iBEseoTPz3uW6+9+
	/UrPMQzeZ0AdXYOEN3lLQuU8hYyl/er7Gpph4Fta/zJem+dO5F3jlNJkhv5OMdGsKQFMPjuzDzl
	JH/C4e3D1g5wu+rG62v9PuyXYI9+vntFeLYyxQzUwHMbU2wweGUX9vww24cM649XoundKCqSJOY
	0IAIcnc4u67+mlYsmGwAGcEZOFxqkWi+xde3ha0CA/nLDGeamXPJK4CfmBa3ZZ4t6lrOReZq31Y
	EF3sbcxUEPoex5smeKi8/PIkx4F4eby3Pp9roR2i2ebcSrtGDMsNI75EYDjdugOO8H7lvhLivvB
	Y+Z/GE73Bd6HpPucXZTLvVlBPDwfccFPZDwEDs0fSXoctCT7mdiFE6yeN+RCyJc5mfPfN2wc5f
X-Received: by 2002:a17:90b:2e0e:b0:38d:dfd1:7c1 with SMTP id 98e67ed59e1d1-396d0e34e0amr12015355a91.2.1787906196095;
        Fri, 28 Aug 2026 01:36:36 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396db196903sm1630961a91.0.2026.08.28.01.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:36:35 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: peterz@infradead.org,
	mingo@redhat.com
Cc: juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH 1/2] sched/fair: Fix stale comment on task_is_ineligible_on_dst_cpu()
Date: Fri, 28 Aug 2026 16:36:27 +0800
Message-ID: <20260828083628.1406519-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

can_migrate_task() soft-limits the migration of ineligible tasks, and
task_is_ineligible_on_dst_cpu() is the test it uses.  A comment above the
helper describes when the limit applies.

That comment matches neither the test that is made nor the runqueue it is
made on.  It gives the condition as "dst_cfs_rq->nr_queued is greater than
1", while the code has always tested for a non-empty runqueue rather than
for more than one task, ever since commit 873199d27bb2 ("sched/core:
Prioritize migrating eligible tasks in sched_balance_rq()") added it.  The
field it names is not the one read anymore either: since
commit 85570f10a4c6 ("sched/eevdf: Move to a single runqueue") dst_cfs_rq
is the root cfs_rq rather than the task group's on the destination cpu, the
count read is h_nr_queued, and eligibility is computed on
&task_rq(p)->cfs rather than task_cfs_rq(p).  The comment was left as it
was.

Describe the test that is actually made, and record why eligibility is
evaluated on the source runqueue, which so far is only stated in the
changelog of the commit that introduced the helper.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 kernel/sched/fair.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 6d881e530f89..6ea87316d162 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10521,12 +10521,13 @@ static inline long migrate_degrades_locality(struct task_struct *p,
 #endif /* !CONFIG_NUMA_BALANCING */
 
 /*
- * Check whether the task is ineligible on the destination cpu
+ * Check whether @p would be ineligible if migrated to @dest_cpu.
  *
- * When the PLACE_LAG scheduling feature is enabled and
- * dst_cfs_rq->nr_queued is greater than 1, if the task
- * is ineligible, it will also be ineligible when
- * it is migrated to the destination cpu.
+ * Eligibility is evaluated on the source runqueue, because place_entity()
+ * preserves the lag over a migration: a task that is ineligible on the
+ * source stays ineligible on the destination.  It only matters when the
+ * destination has something queued, as a task joining an empty runqueue is
+ * eligible either way.
  */
 static inline int task_is_ineligible_on_dst_cpu(struct task_struct *p, int dest_cpu)
 {

base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
-- 
2.43.0

