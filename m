Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3863CB565
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 06:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789282149; cv=none; b=NCddo53S2BCCL7kj4E4PaaJr1uwBbxxWEdXJvZc7HpCR03de7c3sG74AeuGduUiDU0veGpKS6C+GUEZ0uDx91ksP3/TA1B2S9VK6hUS0FdES/ssr3Rmx/b0f3SIrA7dOcuyBm3cdEY/Qij9BKUIoI7cHV5Af2V1FwMAmJ3w7arQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789282149; c=relaxed/simple;
	bh=ylDw/zn+gDtIaAnq1aLOpxgs6k+8G98P1Y8tRy7MP7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iWmVO4pA6ZIDL5PnZI10RUOo+DqRtCVu4wpZIqZgJmZyCsgMI5aCRp6b6AsScrE3HKu4HppYaa7j3e7C83mHDBlZppMIJwXreoF/Pb9cB38VldO7JRZnM20pwtBWZQn0FH58LKqoWv1eMX9+wrhaONj7m7haB/I6UghoPa7zyRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=FGspjzRW; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="FGspjzRW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ro
	LeDVjGGt8xuKfwj/qD3FhBOsewlu8b45zIE7iOyRk=; b=FGspjzRW4LXIFOLOBO
	eCLVsQLw17WFc7VxzDb5xL1+bKe//gjeNZI4RnzsPiihu2qBhhaJIy/ftTtW0nYm
	uQawk+m54bfeKFr4Um977XjDaf4gfDsjZZrhlbOLPg0VXc79kZvpEVgQAohLUJr6
	U6wQV2XVZDqEsimT27GpeQtTo=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wBXhwUAR6ZqW16OAQ--.63600S2;
	Sun, 13 Sep 2026 14:47:29 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: peterz@infradead.org,
	soolaugust@gmail.com,
	arighi@nvidia.com
Cc: mingo@redhat.com,
	kprateek.nayak@amd.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	connoro@google.com,
	jstultz@google.com,
	linux-kernel@vger.kernel.org,
	sched-ext@lists.linux.dev
Subject: [PATCH v5 0/4] sched: Handle split scheduling and execution contexts in task ticks
Date: Sun, 13 Sep 2026 15:47:18 +0900
Message-ID: <20260913064722.1534766-1-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBXhwUAR6ZqW16OAQ--.63600S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGF4DXw4UJryUXFy3Gw13XFb_yoW5AF4UpF
	Z0qFWaqw1kJFy3ArW3ZwsYga4rWwn3Jr17XrsxGr18Xry5Gw4Utr1qvr1UKFW5XryvkFy2
	vF1DZas7u34Yk3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UtWrAUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwQIWdWqmRwL56gAA36

Proxy execution separates the task selected for scheduling from the task
whose execution state advances. This series dispatches scheduler ticks to
both contexts, keeps NUMA and cache work tied to the execution task, and
accounts core-scheduling slice service across same-donor execution-owner
handoffs.

Scheduling-class policy work remains donor-owned, while execution-context
consumers use rq->curr. The core-scheduling fix keeps a per-runqueue donor
service baseline so a synthetic same-donor proxy reselect preserves service
already consumed on behalf of the donor.

Link: https://lore.kernel.org/r/20260909092901.2989564-1-sh_def@163.com

Changes since v4:

- Rework FAIR task-tick handling into one donor-owned block followed by one
  execution-context block, with NUMA and cache work in the latter.
- Keep task_tick_scx() donor-gated pending the separate sched_ext/proxy
  execution integration.
- Preserve the donor core-slice baseline across same-donor synthetic
  reselects, while resetting it for a new donor or explicit set-next
  reactivation.
- Drop the RT watchdog patch from this series; continue that work separately.

Validation:

- x86_64 vmlinux/modules/bzImage builds passed with the main configuration
  and CONFIG_SCHED_PROXY_EXEC=n, CONFIG_SCHED_CORE=n,
  CONFIG_SCHED_CACHE=n, CONFIG_FAIR_GROUP_SCHED=n,
  CONFIG_NUMA_BALANCING=y, and CONFIG_SCHED_CLASS_EXT=y variants.
  sched_ext selftests also built successfully with the SCX-enabled kernel.
- x86_64 QEMU boot smoke and feature-off boot tests: PASS.
- Exact-head two-node NUMA/proxy smoke: PASS.
- Previous validation of the unchanged patch content covers scheduler
  selftests, NO_HZ_FULL proxy smoke, and SMT core-scheduling behavior.
- A focused same-donor CORE-01 test split service across two execution
  owners. Each individual portion stayed below the force-idle threshold,
  while accumulated donor service crossed it with one core_sched_start
  baseline.

No mixed sched_ext/proxy runtime was run because the configurations are
currently mutually exclusive. Runtime validation was performed on x86_64
only; no 32-bit or ARM runtime validation was performed for this revision.

Hui Su (4):
  sched: Dispatch task ticks for donor and execution classes
  sched/numa: Drive NUMA task tick from execution context
  sched/cache: Drive cache task tick from execution context
  sched/core: Fix donor slice accounting under proxy execution

 kernel/sched/core.c      | 22 ++++++++++--
 kernel/sched/deadline.c  | 10 ++++--
 kernel/sched/ext/ext.c   | 22 +++++++++---
 kernel/sched/fair.c      | 77 ++++++++++++++++++++++++----------------
 kernel/sched/idle.c      |  8 ++---
 kernel/sched/rt.c        | 13 ++++---
 kernel/sched/sched.h     |  4 ++-
 kernel/sched/stop_task.c |  5 ++-
 8 files changed, 108 insertions(+), 53 deletions(-)


base-commit: cba2348ab114391f5b1a00fa65c5b739f13f0563
-- 
2.55.0

