Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3ED35E1BC
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789832007; cv=none; b=ApVJaBbvYoitEsd96HH9KFl1lKgX9T0vmtNZqHmO3FYc39h6Xg8WNw1a9HfS0ZC5ZnTORNwpcK2JmgPzq9m/APcvvSzj+IzHVKgek53xFc6+6CutjWicPX6byOp4zJu3EhkDoHg/WHRX5SQU8ZCbJrOsjZTLbPFLskIBNPZRjtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789832007; c=relaxed/simple;
	bh=tnyvlgVfMTCqXQRSuxE4ccJ7ZERb/YFR+1kcZBsxHc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TWLoXDdk+WuYQRGAJwthdcMaMUi8+MTWuliG1/550ngPXodL+VQa51gF6QPUYatjnkPdytJZznvOXo3o8II2EPqIl4fbS7aTSGPfVjfM56l6XRP1UsAMbPBr7nZqFOalTWaiBXwCHiBqxsrMf+1cx2PK8rdNJPcm+b3qC1pC6k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=YHAVfXS8; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="YHAVfXS8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ji
	BZQvfRIoXjlSkwoC7QLZ8NuzwJpdxqfXaQMSP4mJc=; b=YHAVfXS8w+cB97zWGY
	4nivfCCUHl9Y0KMz9rJZ5R4POY0oWJD53oC3W1gTFfocFd/XoTKbh2UNsGPgICGJ
	rRuKo0ffOjcWzFZos8c0X0IlVUyV6Wr+Z5Izkw9pK7K7Knq+GX2T8Ynt1TpAiDQm
	k2Bina5rRhsXNTQlMBmhck7RY=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wAXJInmqq5qoyXRBQ--.6014S2;
	Sat, 19 Sep 2026 23:31:51 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Mikhail Zaslonko <zaslonko@linux.ibm.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Daniel Bristot de Oliveira <bristot@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] sched/deadline: Fix zero-CPU DL bandwidth handling
Date: Sun, 20 Sep 2026 00:31:48 +0900
Message-ID: <20260919153150.2618403-1-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXJInmqq5qoyXRBQ--.6014S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr43XFWkJw43Gr1xAF4kXrb_yoW5Jr15pF
	98Wr1Yqr4Dtry2ya1UAr4Fqa409an7tay7Wr97JryDZF15A34Iva4Yk3yjgrW7Gwna93W2
	yw4Yga9xuF4jk3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uha9fUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6QcqiWququfKNAAA36

During CPU hot-unplug, a CPU is removed from cpu_active_mask before it
becomes offline. If it is the last active CPU in a root domain,
dl_bw_cpus() can therefore return zero while paths associated with the CPU
are still reachable.

v1 addressed this in the DL server parameter-update path. Mikhail Zaslonko
reported the same divide-by-zero on s390x through sched_setscheduler(),
showing that the problem is more general, and pointed out several other
callers of __dl_sub() and __dl_add().

This version moves the zero-CPU handling into those common helpers. The
debugfs cpu_active() check is kept as a separate follow-up because it
completes the offline-CPU check added by 4043f5498416, while the generic
helper issue dates back much further. Keeping them separate also gives the
two fixes the appropriate stable backport scopes.

Patch 1 fixes the generic divide-by-zero while retaining the existing
total_bw update when no active CPU remains.

Patch 2 rejects per-CPU DL server debugfs writes once the CPU becomes
inactive instead of waiting until it is fully offline.

Validation on x86_64 included:
- cpus=0/1/2/4 DL bandwidth accounting
- targeted task_non_contending() and inactive_task_timer() zero-CPU paths
- 100 root-domain rebuild/offline-online cycles with accounting checks
- 200 cross-root-domain SCHED_DEADLINE cpuset moves
- SCHED_FLAG_RECLAIM policy transitions
- concurrent SCHED_DEADLINE/SCHED_OTHER transitions and CPU hotplug
- 100 CPU hotplug/debugfs update cycles
- A/B validation of the inactive-but-online debugfs window: the write was
  accepted and changed runtime with patch 1 only, but was rejected and left
  runtime unchanged with both patches

The final series was also built and boot-smoke-tested from its exact HEAD.

Changes since v1:
- Handle cpus == 0 in __dl_sub() and __dl_add(), as suggested by Mikhail.
- Split the generic bandwidth fix from the DL server debugfs check.
- Add the s390x sched_setscheduler() report.
- Extend validation to the other DL bandwidth paths and accounting cases.

Hui Su (2):
  sched/deadline: Fix divide-by-zero in DL bandwidth accounting
  sched/deadline: Reject debugfs dl_server writes for inactive CPUs

 kernel/sched/deadline.c | 6 ++++--
 kernel/sched/debug.c    | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)


base-commit: f259f446f5198d98e13756d2cd531812a0ad3064
-- 
2.55.0

