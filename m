Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013D33358AD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 04:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788408778; cv=none; b=eVzMhvTvpx8D9Fk/p6/nCuvNqAlRqiGlb1uMYiTTZ1MIKyMf7dBhiYJ/WnsulB3pmzAMZdxp9mC0bIqelmURTARwSK5CWudisOCC5Ig0nFG3hGVFoSC+Oyz6F/HXZg3LENbtDM8Um9qmE7cp7LI51+KT2qXgonQfyu6Z56jzODI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788408778; c=relaxed/simple;
	bh=Am50MnBg+xZSezc5hjd4e4IUHMsOAGKGbuZH2GWM1/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qAK+QTI493Vo9x4eqvE6dlJhG8/TG366qrdwX1eR883xO4/xeSIWrKm6bpr1KRnBz5A5CAJ2Xxyj0b+TsULAl3J19a8vZNCgo8BSFN5Psod7x8u0C5aierRxdvs2Kk2MXZ7nI6YU2lXhV0wA3/WoAGOtMkeWQoAicTm1z3kJ1Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Gty2FDoH; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Gty2FDoH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=pi
	iILL02Sac/AZc5Fl/M40Yk0QQa25mBi3g2h/jsykU=; b=Gty2FDoHVPVYu2I/Yo
	d63g2RgNLWgsV94nATpJXuhVDcxAmaI8XQhC2ZWtdwRohUS6zPSl90YtFoyvzubD
	xBurHzOzhz/+w/GG2lScQUf8nxizQ5GoGzGK9WSGQ9SNGbY9OsGOPucF0HRWCxC5
	IoBC8mT+5JBrsjbPKenjXSesY=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3N2uK85hqaTAnAQ--.45694S2;
	Thu, 03 Sep 2026 12:11:55 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Valentin Schneider <vschneid@redhat.com>,
	John Stultz <jstultz@google.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Hui Su <sh_def@163.com>
Subject: [PATCH v2 0/2] sched: Fix execution-context tick handling under proxy execution
Date: Thu,  3 Sep 2026 12:11:52 +0800
Message-ID: <20260903041154.2479761-1-sh_def@163.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3N2uK85hqaTAnAQ--.45694S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar4rZr4ftFWUCr4rWFykZrb_yoW8Cr4rpF
	ZagF13trn2k34Iy3WxAw1vga4fuF97A3W7WrsrG3y8ur98K3Wjkryjqw10vF15ZrySvFWa
	vw1Uuw17ur1jkw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piHa0PUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwQzgQGqY84yJRAAA3t

Proxy execution separates the scheduling context in rq->donor from the
execution context in rq->curr. sched_tick() dispatches the scheduling-class
task tick through rq->donor, while NUMA and cache task ticks consume state
belonging to the task actually executing.

Move both execution-context ticks to the scheduler core and run them when
rq->curr is a fair task. Keep the corresponding handling in
sched_tick_remote() for full-dynticks CPUs.

Changes in v2:
- Move NUMA and cache execution-context tick handling from task_tick_fair()
  to sched_tick().
- Invoke the hooks when rq->curr is a fair task, allowing them to run when
  the donor belongs to another scheduling class.
- Add the corresponding calls to sched_tick_remote() to preserve
  full-dynticks behavior.

Tested with a QEMU topology providing two NUMA nodes and two LLCs. With
an RT donor and a fair mutex owner, task_tick_numa() and
task_tick_cache() were observed with p == rq->curr while rq->donor was
a different RT task. The proxy test completed three episodes without
warnings or errors.

Also runtime-tested a QEMU guest with nohz_full=1. sched_tick_remote()
ran approximately once per second on the full-dynticks CPU and entered
the fair execution-context tick path. The relevant configurations,
including NUMA/cache feature combinations and CONFIG_NO_HZ_FULL=y, were
build-tested; the affected objects also passed a W=1 build.

Link: https://lore.kernel.org/r/20260902163336.1552840-1-sh_def@163.com

Hui Su (2):
  sched/numa: Drive NUMA task tick from execution context
  sched/cache: Drive cache task tick from execution context

 kernel/sched/core.c  | 13 +++++++++++++
 kernel/sched/fair.c  | 13 ++++---------
 kernel/sched/sched.h |  2 ++
 3 files changed, 19 insertions(+), 9 deletions(-)

-- 
2.54.0

