Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C51415B60
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789488083; cv=none; b=M3HPH3A/olw+94We4Q4vPodgWDaWKARl7nXLki++nUlaS67sdheLRgA3CLdgcPjmKrrTbsPOxmF/bHGPnlcXK53LakCgb2kY8aElBM3O3kAR9Uk4D7ODYqug4MsP8XG88xGiE54LT7knk16LJvMZ8Qfv8dJPNa1R45NooxuxSfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789488083; c=relaxed/simple;
	bh=giePifOOgppd212ZfnUJnAdGCS0eSdZ03iNaexweH0g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mdkynwSxb/E3YdBlX2u3/iIqvBC5bKoCIVa1+2NYrspLpOpdNwDmLDK9pUAVBiFO2WMRK4aTv5Soc/c+vC2kx1f8HCXuNFSRZpA0Ig8oML+X/oP+XtcBFk5YuKja82xrMhs5G/JuS/o9spKT/ByFgdb/3iqwJneN5zUCZ8dGN2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=PfIz9zvf; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="PfIz9zvf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=kH
	bfv5hliOVywl9IgiwEtEk/O1geYGzC3Y986QIu4fQ=; b=PfIz9zvflqDnwGlAmG
	G61/UBMOpq/mELVk3ti0CmbVljTfmFLYkRr7eoyIbCnWHl56oTAvQR8v4Yf76RTq
	t5bUU+f/pEACz4AS4hGwtyOQCixQ+Lq0stXqwUSvQbYddHI7x1VFnEa0OEm1VglQ
	Nh17g+5v/972aFYIkGiBXzlfQ=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnR9B5a6lqa425Aw--.34018S2;
	Tue, 15 Sep 2026 23:59:54 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: linux-kernel@vger.kernel.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	tglx@kernel.org,
	mathieu.desnoyers@efficios.com,
	Hui Su <sh_def@163.com>
Subject: [PATCH] sched/mmcid: Fix affinity-triggered switch back to per-task mode
Date: Wed, 16 Sep 2026 00:59:53 +0900
Message-ID: <20260915155953.2856524-1-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnR9B5a6lqa425Aw--.34018S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF1UWr48JrWrtrykJF1xuFg_yoW8Kw47pr
	ZrKFZFgr4DJry09395Ca13XFWFkrn7J3Wjqa4kt3Z5CF15W34SkrW2gFs8WFyagwn7AFW5
	tF4qv34kCa4qv3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piHa0PUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwRr9XWqpa3rEaAAA3F

MM CID switches to per-CPU ownership when the number of users of an
mm exceeds the maximum number of CIDs. When the affinity union grows,
the per-CPU threshold is recalculated and the MM can switch back to
per-task ownership through deferred work.

mm_cid_calc_pcpu_thrs() incorrectly uses
min(nr_cpus_allowed, users) to calculate that switch-back threshold.
This makes pcpu_thrs no larger than users, so the
users < pcpu_thrs check in mm_update_cpus_allowed() can never succeed.

For example, with three users restricted to two CPUs, the MM enters
per-CPU mode. On an eight-CPU system, widening the affinity union to
all eight CPUs should produce a threshold of four, but the old
calculation produces three and returns early. The MM therefore remains
in per-CPU mode even though the widened CPU set makes per-task
ownership preferable.

Calculate pcpu_thrs from nr_cpus_allowed directly. The users bound in
__mm_update_max_cids() still controls when per-CPU mode is entered, so
this does not change the threshold calculated when switching from
per-task to per-CPU ownership.

Tested with an x86_64 QEMU reproducer using three users, an initial
two-CPU affinity, and an eight-CPU affinity expansion. The baseline
did not invoke mm_cid_work_fn() after the affinity expansion. The
fixed kernel invoked the deferred work once and completed the switch
back to per-task mode.

Fixes: fbd0e71dc370 ("sched/mmcid: Provide CID ownership mode fixup functions")
Signed-off-by: Hui Su <sh_def@163.com>
---
 kernel/sched/core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 7885ff76e69f..0280ed132d0a 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -10845,11 +10845,10 @@ static void __mm_update_max_cids(struct mm_mm_cid *mc)
 
 static inline unsigned int mm_cid_calc_pcpu_thrs(struct mm_mm_cid *mc)
 {
-	unsigned int opt_cids;
+	unsigned int nr_cpus = mc->nr_cpus_allowed;
 
-	opt_cids = min(mc->nr_cpus_allowed, mc->users);
 	/* Has to be at least 1 because 0 indicates PCPU mode off */
-	return max(min(opt_cids - opt_cids / 4, num_possible_cpus() / 2), 1);
+	return max(min(nr_cpus - nr_cpus / 4, num_possible_cpus() / 2), 1);
 }
 
 static bool mm_update_max_cids(struct mm_struct *mm)

base-commit: 587858367581b9c55c3690f4e63382ad622719d4
-- 
2.55.0

