Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF4C39B972
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789014680; cv=none; b=WIGKHx7v7h7jE88M6uf0QzoQxrq4HRYVwxLSphJhPWw5IkmFO4njJ5eigDtTfxpUMdqxaQA8PRIxdDqAfW6IWe9Pyr8+Xn3gpXt0/tV57rBvuqjZpIxLwmmvERdT6ko7DcXQqaXWX7ngjzE+60lJrFf5g9o0o3MB0eUdHa6A8wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789014680; c=relaxed/simple;
	bh=lyDnxbEM+9S/pozfMxbJvQz3ox9V1hgfd3UHqcQiv58=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L8/pmzpi9kg6ANddidL2lqpeLWp99neVHo/g3cPDcvpMYMwWyHceclf3JVjsPcySpHBqF1FDYNQF3dCGKXPeeBiqxmMEBfnHkOgRaIzVmeW013w4zddCbmCbpWw26rNEi9KuDesLVclxycSgaazbJr1xM9rtdtwtIkkUUYjVJR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Nr58g70V; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Nr58g70V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=4f
	iBNV7Y6qrbgmEFxS4CFywJqbBGqW3q/PRFDM9pke8=; b=Nr58g70V2Bo2LzRgJ1
	GJqpGTS5TzuDd4F43mHxn0rL87YGk+/gS1imdXW6kZhpLsfNHtfpmg5F4gz57Y/D
	XyrLDYdMuGRgGip4O+IAlWdYzirf+da/EYLV1FD1qTNo3tkJ2572/22a+BD46E/v
	yXAfIYbrA+dH4NCDJAMFqTVP4=
Received: from zhaoxin-MS-7E12.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wAXgp5AMqJqap0YBw--.51115S2;
	Thu, 10 Sep 2026 12:29:53 +0800 (CST)
From: Xin Zhao <jackzxcui1989@163.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com
Cc: linux-kernel@vger.kernel.org,
	Xin Zhao <jackzxcui1989@163.com>
Subject: [RFC PATCH RESEND 00/10] sched/fair: A series of load balance patches to improve real-time performance of CFS tasks
Date: Thu, 10 Sep 2026 12:29:40 +0800
Message-Id: <20260910042950.1619727-1-jackzxcui1989@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXgp5AMqJqap0YBw--.51115S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxurWUJw13JF45CFy5Xr13urg_yoWrZF18p3
	9Yqa1Yyr4DJ34xA393Zr4xXr1ruws3JFZxKr43G34UAF15Wr12yw4Sga12kFWfC395Z3W2
	qw1jq347CryvvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEfMaUUUUUU=
X-CM-SenderInfo: pmdfy650fxxiqzyzqiywtou0bp/xtbCvwHf6WqiMkHwPgAA39

Embedded platforms commonly use CONFIG_HZ_250, and testing has revealed
that there are numerous instances of unreasonable CPU idle events on such
platforms. Unreasonable CPU idle refers to situations where the CPU enters
an idle state for a duration of time (t), while there are tasks that can
run on the idle CPU and are not limited by cgroup constraints, yet these
tasks remain unscheduled for a duration greater than (t), t > 2.5 ms.

Testing has shown that over 95% of these events last less than 4 ms, but
there are still some instances of longer durations between 4-5ms, even
occasionally between 5-10 ms. For a real-time system, scheduling delays
greater than 4 ms can lead to performance spikes.

Enabling this option can effectively reduce the occurrence of unreasonable
CPU idle events on low HZ systems like CONFIG_HZ_250, and completely
eliminate events exceeding 4 ms. Note that the feature only affects fair
tasks.

Note that enabling this feature will increase sys%, as it uses CPU time
that would have been idle to expedite the scheduling of tasks. There will
also be some CPU overhead involved in searching for suitable tasks.

This feature has been split into several smaller patches, which will be
elaborated on one by one later. Below are some test data:

Test one compares the number of unreasonable CPU idle events and their
distribution when this feature is enabled versus when it is not, under
the same fillback scenario. The test duration was 60 seconds.

      LB_PROMOTE(on/off) 2.5-3ms 3-4ms  4ms+
index 0               on       0     0     0
index 1              off       4    13     1
index 2               on       0     0     0
index 3              off       6     3     0
index 4               on       0     0     0
index 5              off       1     1     0

Test two compares the performance of the system with and without the
feature enabled, based on the same fillback scenario. Each test lasts for
25 minutes, and a total of 15 comparative tests were conducted. The
results include a comparison of the maximum and median values of
end-to-end latency and sys%.

LB_PROMOTE(on/off)                    on        off
end-to-end latency(max)              172        180
end-to-end latency(median of avg)    166     167.68
sys%(max)                           9.68       9.35
sys%(median of avg)                 8.81       8.55

All of the patches are derived from analysis through ftrace and process
logs of load balance code flow corresponding to every unreasonable CPU
idle event captured during testing.

In patch 4, we define a new feature called LB_PROMOTE, which means to
promote load balance. Currently, this feature only optimizes the CFS load
balance part. The first three patches are prerequisite patches; patch 1
addresses a common issue unrelated to the LB_PROMOTE feature, while
patches 2 and 3 are two prerequisite patches that can be applied
independently of LB_PROMOTE feature but are primarily intended to support
patches 6 and 7. Patches 5, 7, 8, and 10 are all based on the LB_PROMOTE
feature introduced in patch 4. Patch 5 implements an improved version of
select_task_rq_fair() for embedded platforms, enhancing performance and
real-time capabilities. Patch 7 implements preemptive active balance,
while patch 6 allows active_load_balance_cpu_stop() to be reused in
preemptive active balance scenarios. Patch 8 removes checks related to
avg_idle. Patch 9 is a minor optimization that does not depend on the
LB_PROMOTE feature, but since it modifies sched_balance_rq() as patch 10
does, it serves as a precursor to patch 10.

Xin Zhao (10):
  sched/fair: Do not set_rd_overloaded() if rd->online != env->cpus
  scbed/fair: Remove duplicate check for busiest_cpu in
    active_load_balance_cpu_stop()
  sched/fair: Clear active_balance at the end of
    active_load_balance_cpu_stop()
  sched/fair: Add LB_PROMOTE feature to enhance real-time performance of
    fair tasks
  sched/fair: Introduce select_task_rq_fair_thin() to select rq when
    LB_PROMOTE
  sched/fair: Modify active_load_balance_cpu_stop() to accommodate more
    scenarios
  sched/fair: Trigger active balance if a CFS task is preempted when
    LB_PROMOTE
  sched/fair: Do not check avg_idle to prematurely exit newly idle when
    LB_PROMOTE
  sched/fair: Not goto more_balance if newly idle and has pending task
    when LBF_NEED_BREAK
  sched/fair: Strive to find a task to migrate if newly idle when
    LB_PROMOTE

 kernel/sched/core.c     |   3 +
 kernel/sched/fair.c     | 220 +++++++++++++++++++++++++++++++++++-----
 kernel/sched/features.h |  24 +++++
 kernel/sched/sched.h    |   2 +
 4 files changed, 224 insertions(+), 25 deletions(-)

-- 
2.34.1

