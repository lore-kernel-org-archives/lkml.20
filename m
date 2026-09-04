Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14A24266B8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512045; cv=none; b=WtHZe0U8Tm4mMTJGiCGsVxnkWxrxqPbwEEDoaZypm3yoj6MVh2HVBThHmLkeo36FmI4JmWmZN0XVYHP1+DYkSYeN+sEX1AxHHJNu4/eQkadGrrcFBRyG9cgcOcbAPIo+Rxzrq5zSyBz5GdPqHtMNYEqg0s8mkqKQmwvYROov80Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512045; c=relaxed/simple;
	bh=es3xO/5vCj2hjB4Kh/quLgi5QdTKKBNemUcXuTx3l9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rGbHA6+mvHGZzYIR0DWWRx1nGoLqkNZmyQbiU4JtK0YPpWxF51SX2irD0ZEsqZqgBAu5mSlPC3mW1/lsNML5h6BecndFUcW4nwXcdSmAVh+cbwhqqHGVeP4QZCPxDlEj7hLSnEoZ0UwqTg5W/Y4mILr0UTXPjDbmqZWY/TxPF9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nroUVOIR; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nroUVOIR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=sm
	6LXl42Py9NAMOB7pZKBDL3T3H09vMLPL2UrRFAFTI=; b=nroUVOIRbOcJw6uVpO
	jCr8L+7Xmt0OUp8NkMvUbj0grkqs8P6JCz9ITlfAOAQg5Ib+O50qiKkT+W3m1vgC
	siEyoIWFTnXYtsV9UZC/Q6FnudDCMOnasbT390d3KNxTQJwAhAQBIoJXDZTscqDh
	+XtVmkp7Kub+bs+aOyLbqFqFU=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wCHn9PchppqUwtsAg--.49854S2;
	Fri, 04 Sep 2026 16:52:45 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	tim.c.chen@linux.intel.com,
	yu.c.chen@intel.com,
	kprateek.nayak@amd.com
Cc: juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	connoro@google.com,
	jstultz@google.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] sched: Fix execution-context tick handling under proxy execution
Date: Fri,  4 Sep 2026 16:52:42 +0800
Message-ID: <20260904085244.799276-1-sh_def@163.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCHn9PchppqUwtsAg--.49854S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJw1kGryUZw4DKF18AryfXrb_yoW5ZrWUpF
	ZYgF43Jrn7KFy2yF1xAwsYga4fuFs3Aw13Ww4DG348ur98JF18KryIqw1jvFyUZr92vF92
	vrn093Z3ury5taDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbmiiUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwR4aeWqaht7MUAAA3I

Proxy execution separates the scheduling context in rq->donor from the
execution context in rq->curr. Scheduler tick hooks which operate on
execution-context state must use rq->curr, while scheduling-context
state must continue to use the donor.

Move NUMA and cache task tick handling into a common execution-context
helper. This ensures that both hooks run when a fair task executes on
behalf of an RT or deadline donor, while the remaining fair-class tick
bookkeeping stays associated with the scheduling context.

Changes in v2 (since v1):
- Move NUMA and cache execution-context tick handling from
  task_tick_fair() to sched_tick().
- Invoke the hooks when rq->curr is a fair task, allowing them to run
  when the donor belongs to another scheduling class.
- Add the corresponding calls to sched_tick_remote() to preserve
  full-dynticks behavior.

Changes in v3 (since v2):
- Factor NUMA and cache execution-context tick handling into
  sched_tick_exec_ctx(), keeping sched_tick() and sched_tick_remote()
  in sync.
- Keep sched_tick_remote()'s existing curr-based scheduling-class
  dispatch unchanged and invoke the common helper afterward.
- Reword the NUMA rationale around execution-context state and the
  task/mm associated with the execution context, with sum_exec_runtime as
  supporting state rather than the sole reason for the change.
- Document why misfit, overutilized and core-scheduling tick handling
  remains associated with the scheduling context.
- Keep the task_tick_core() consumed-slice accounting issue discussed
  during review separate from this series.

Link: https://lore.kernel.org/r/20260903041154.2479761-1-sh_def@163.com

Tested with CONFIG_SCHED_PROXY_EXEC=y and all four NUMA/cache
configuration combinations, including W=1 scheduler object builds and
a full bzImage/modules build.  The first commit was also built
independently, and a CONFIG_NO_HZ_FULL=y kernel was built and booted.

A temporary QEMU proxy-mutex reproducer exercised both a normal FAIR
path and a FAIR execution task running on behalf of an SCHED_FIFO donor.
Using the same workload with QEMU 11.1.0 exposing two L3 domains, the
unpatched kernel did not invoke task_tick_numa() or task_tick_cache() for
the FAIR execution task during proxy execution.  With this series, both
hooks were repeatedly observed with rq->curr while rq->donor remained the
RT scheduling context.  NUMA task work was queued for the execution task;
cache work was also queued and its mm scan epoch advanced.  Three proxy
episodes completed, and the normal FAIR path was observed with
rq->curr == rq->donor.  The full-dynticks remote tick path was observed
invoking sched_tick_exec_ctx() on CPU 1.  No warnings, BUGs, oopses or
panics were observed.

The instrumentation and reproducer were kept outside this series.

Hui Su (2):
  sched/numa: Drive NUMA task tick from execution context
  sched/cache: Drive cache task tick from execution context

 kernel/sched/core.c  | 15 +++++++++++++++
 kernel/sched/fair.c  | 18 +++++++++---------
 kernel/sched/sched.h |  2 ++
 3 files changed, 26 insertions(+), 9 deletions(-)

