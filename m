Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDD534D4F9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404972; cv=none; b=rffmnqTzy2Z7wohZypxc/8jFuuV2JRLnWf08rmSa4f9yV2JSDyll3YgnWmZtxFeg+ywKuxv7T125dvMzfrAWr3P3UKgpOZOT3wCQVNhvkufBdzIrDxYRGQddxcpApFRHuFjFayq90L3+dbiL/uVV0G0GTAP18Z1ySUYVJbULwjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404972; c=relaxed/simple;
	bh=D7vzhlf0hjpkDW99SWFc0WfWbz4ti1gKAEcb1H+1vTE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mEcN2VptXFQ2MOK6U9WqIHjVTz8MI75VeWTS7L0Qz5WoIQ40WBhQQsph9u3iDcBT7Cu0J0d4oQHZpJYXoEjIsi6UEK14kCsTd0Rk6RvZYYk7r/LnSSfYmsFg8bRDcUKuFZspLlJZmmZKdqeREKBhm1i6rDIDCzknZ/5/sjQQDks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=LcBDdWc7; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="LcBDdWc7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=9i
	9N3wAYfPlpnB8U3eYXy1kGW3RxsFZFdWPXsEYk9LE=; b=LcBDdWc7NOSquPoaCT
	uLg0PLDaEq9t6j3zo9JgbN8e02WpCijiosKu5f4mCGuzVTF46GE5vGsEYNisVNRp
	3JsJouRdoH61P/9ZgUlCW60NMHt4dap4gCKIXE4Rr+Glg2VQ1CoNDnW8scdy5zjL
	/b0klBYvFGsyAND9YjKTgsaPg=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wCXP3vfJqhqTZqsAg--.29999S2;
	Tue, 15 Sep 2026 00:54:56 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Zhidao Su <soolaugust@gmail.com>,
	John Stultz <jstultz@google.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org,
	Hui Su <sh_def@163.com>
Subject: [RFC PATCH 0/1] sched/proxy_exec: detect cycles without persistent walk state
Date: Tue, 15 Sep 2026 01:54:54 +0900
Message-ID: <20260914165455.2126134-1-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCXP3vfJqhqTZqsAg--.29999S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3GryrAFW5Kw45tr4kXr1fZwb_yoW7Ar1fpF
	Z3KFW2kr4DGr4Iv3Z7Zw4UXry5X395Ar45JFn5tw10qFn0vFn7Krs3K3WFvFyjkrZYqFWj
	vw4jqFykuF4DAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piHa0PUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6gGG5WqoJuG3CAAA3y

Proxy execution follows blocked_on relationships to find a runnable lock
owner. If that relationship contains a cycle, find_proxy_task() can loop
indefinitely while holding rq->lock.

Zhidao Su's v5 detects repetition with sequence state in task_struct and
struct rq, and resets the task marker on activation. This RFC explores a
different trade-off: keep cycle-detection state local to the real owner walk
without adding persistent task or runqueue state.

The patch applies Brent's checkpoint algorithm directly to the existing owner
walk. Cycle detection reuses the owner resolution already performed by the
real walk and does not add a separate preflight traversal. The existing
owner == p wakeup-race handling remains ahead of cycle detection because that
state does not by itself prove a deadlock cycle.

The Online Brent walk can temporarily install a blocked_donor cycle before
the delayed checkpoint detection point.

I also tested the lifetime of this transient state. In the natural recovery
path, a cycle member selected to run reached its subsequent mutex_unlock()
with blocked_donor already cleared. As a defense-in-depth check, a
validation-only forced-stale test restored a stale blocked_donor immediately
before mutex_unlock(); the existing blocked_on revalidation rejected that
handoff.

This does not prove every possible scheduling interleaving, but no
blocked_donor chain reader was found in the tested tree, and the tested
recovery path did not expose the transient backlink to normal mutex handoff.
Whether allowing that transient state while rq->lock is held is preferable
to persistent visitation state is the main design question for this RFC.

For comparison, Zhidao Su's v5 patch is available at:

https://lore.kernel.org/r/20260722120346.93000-1-soolaugust@gmail.com/

Both implementations were tested as one commit above the same base
revision, with the same x86_64 configuration, compiler, staged testcase
module, SSH initramfs, KVM setup, 2048 MiB guest memory, four vCPUs, and host
CPU affinity 8-11. The timing hook surrounds only find_proxy_task(),
accumulates per-CPU counters, and dumps once after each testcase. No
per-edge printk or atomic counter is used.

The following are medians from five fresh acyclic runs. ns/call is calculated
per run before selecting the median:

        depth   v5 ns/call   Online Brent ns/call   Online/v5
        -----   ----------   --------------------   ----------
        16      500          442                    0.884
        32      584          612                    1.048
        64      1314         988                    0.752
        128     2276         1942                   0.853
        256     4561         4815                   1.056
        512     9338         8396                   0.899
        1024    26551        25507                  0.961

The 16-64 entries are included for completeness; fixed per-call and guest
scheduling noise is more visible at those depths. Across these deeper
acyclic walks, Online Brent and the sequence-marker implementation show
comparable find_proxy_task() cost. These measurements are not intended to
claim a performance improvement for Online Brent; they show that keeping
Brent state in the real owner walk does not add a second owner traversal.

Cycle testing covered 33 topologies per implementation, including A -> B ->
A, A -> B -> C -> A, D -> A -> B -> C -> A, D0 -> D1 -> A -> B -> C -> A,
root cycle lengths through 513 with power-of-two boundaries, and tail lengths
1 and 5 with selected cycle lengths. Each topology was run in a fresh guest.
All 66 cases returned successfully and emitted exactly one cycle warning.
Saved dmesg logs include blocked_donor dumps. This build did not include a
per-edge cycle counter, so these results establish detection and progress,
not an exact first-closing-edge count.

Additional validation included Brent power-of-two boundaries, acyclic chains
through depth 1024, repeated task/mutex reuse, and a KCSAN + lockdep build.
The synthetic mutexes used to construct deliberate dependency cycles were
assigned no-validate lockdep classes so that those test dependencies did not
disable lockdep before the scheduler paths were exercised. No
Online-Brent-specific KCSAN report or scheduler lock-order failure was
observed.

The Online Brent patch changes one file with 19 implementation lines. Unlike
v5, it adds no task_struct or rq fields and needs no activation-time marker
reset.

A hard bound on proxy-walk length is intentionally left separate from this
cycle detector. In particular, should we also add an independent bound of
1024 owner transitions, matching the rt-mutex maximum lock depth, for
pathological acyclic or late-detected proxy-futex dependency graphs? Depth
exhaustion does not itself prove a cycle, so the recovery policy for such a
bound is orthogonal to cycle detection and is left for discussion.

The implementation diff in this message-only reroll is identical to the
Online Brent implementation used for the measurements; only commit-message
and cover-letter text changed after testing.

The open design question is whether avoiding persistent task/rq state and its
activation lifecycle is worth accepting the temporary blocked_donor cycle
window in the single-pass Online Brent walk.

Hui Su (1):
  sched/proxy_exec: detect cycles in proxy walks

 kernel/sched/core.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)


base-commit: 2f0c1cf72f4682178506f513bbf015e591b1aa4a
-- 
2.55.0

