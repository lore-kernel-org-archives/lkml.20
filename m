Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485500;
	b=TStbTgfsaY8+abgk96P75I88gddS7bT6yYQ/unDhfYlZqL6H2Upm6iPU18atgcZEvLq6
	 oW0cJB9VIoqIoivG0P7UgZ4zp0luuTR6L+TUX01P5nnBqgQXhZRtY8pGBvx1VPiwqxenA
	 BtzQrEwVg3hkXOnwR6VXvqbKy0kWSWDdLs7+7eeC/7CmgexbE/BJ6wcJ/8CItEcFviqc4
	 C5EnHyD2+jUGykWLepecNYOXrxPVVvZemXYR0yoa0Lrpn5hOlPxckOM890nelhEsSjXvq
	 +cQJ4jB0z/9lrOJXDjIkccCiilmXRI9rHmj65gGJ/Ze2l0ZRqKfG4032QSpGVjcx0Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485500;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=zxlqtwdy5MkemcZ3DgYXyAKijDFis3QUI4KwyahstZA=;
	b=3eYWsoGu14drJsX1xjmEVM+ux2heBF3G2xIYTodjXqt0+1hAoIeP3uYgU07AG3ygHfKo
	 tdFtYc0nF+MvoLCTcuMrfnq107aJrO9vCh4Ol7AKD9ZPJsr0VIrRtdjh1cSoipG+fmEe7
	 QIUaZSAGK1aVqURG1iSQT67klCYwZUUfVuDniIajemHPIQy4mKb0xlHbgRbACKOnRJpwU
	 3YhPf4OGh7ldt8DihLmQ+Nn+jwS3xgfDQ4bE3UEaMtfARnUzL0cZwa0QT9+Q+rdLcqlQr
	 7oXdTXGm3LtNQ6jHRbnDOcOFsV9xahGNu1OC3dVpEdEfe9jKFwf7q+tTKhzZB4YjtSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.121
Received: from out28-121.mail.aliyun.com (out28-121.mail.aliyun.com [115.124.28.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526F3606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 526F3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1639225|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0212322-0.000737175-0.978031;FP=2585374935525098718|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037034184;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.jlWubDa_1792485488;
Received: from localhost.localdomain(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.jlWubDa_1792485488 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 20 Oct 2026 16:38:09 +0800
From: Li kunyu <likunyu@open-hieco.net>
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
	Li kunyu <likunyu@open-hieco.net>
Subject: [RFC PATCH 0/6] sched/fair: Introduce the SMT_BUDDY_ASSIST feature
Date: Tue, 20 Oct 2026 16:37:40 +0800
Message-ID: <20261020083746.37068-1-likunyu@open-hieco.net>
X-Mailer: git-send-email 2.47.3
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

[Background]

In high-performance computing (HPC) and cloud computing scenarios,
maximizing overall compute throughput and sustaining peak CPU capacity
remain critical optimization goals. Within the scheduling domain, the
primary optimization focuses include:

1. Timely responsiveness for task wakeup and execution startup.

2. Fast and balanced distribution of CPU utilization across cores.

3. Preferring task migration within shared-cache domains (e.g., L3)
before burst workloads arrive, so as to reduce cross-die or
cross-node overhead.

During development, the following issues were encountered. The above
approach ultimately yielded measurable performance improvements.


[Problem]

It was found that on servers equipped with the Hygon 7447v CPU (Model 7,
384 logical cores), migrating tasks across LLC scheduling domains during
load balancing caused significant performance degradation:

1. A low L3 cache hitting rate (due to factors such as non-shared L3
caches).

2. The traversal overhead of higher-level scheduling domains (e.g.,
cross-NUMA scheduling domains).

Similar issues were also observed on CPUs from other vendors during
testing, though the degree of memory bandwidth increase and other
latency effects varied. Consequently, a series of patches was developed
to address and improve these issues.


[Solution]

This RFC patch series introduces the SMT_BUDDY_ASSIST scheduling
feature. The main work is as follows:

1. Push CFS tasks to SMT sibling CPUs during periodic load balancing.

2. Skip SMT-domain balancing after a successful push and avoid pulling
the pushed task back.

3. Restrict newidle balancing so it does not pull from higher-level
scheduling domains.

4. Compensate for the resulting load imbalance with a burst-task wakeup
path that sends tasks to idle CPUs.


The detailed implementation approach is as follows:

Load balancing-related procedures are primarily categorized into two
major directions:

1. The periodic load balancing path, comprising periodic load balancing
and NOHZ kick, retains the original logic and continues to maintain
overall CPU balance.

2. The newidle CPU path logic has been updated solely to quickly obtain
efficient tasks. By restricting task acquisition to the LLC (L3)
scheduling domain and avoiding traversal and task migration at levels
above it, this change avoids jitter in scenarios where the entire
machine is idle or the CPU load is relatively balanced. This is because
each traversal of higher-level scheduling domains remains costly, and
migrating tasks across dies (LLCs) incurs substantial short-term
overhead, such as TLB flushes/refills and page migration:

  2.1. When overall CPU utilization is relatively low, avoid the
scenario where the whole CPU is idle yet cross-die (high-latency) tasks
are being pulled. In such cases, it is better to run only one logical
CPU per core to avoid cache interference and frequent TLB flushes. This
applies when:
    2.1.1. the CPU has multiple sleeping tasks (with delayed dequeue
disabled).
    2.1.2. the number of runnable tasks on the CPU is less than 2.

  2.2. When overall CPU load is relatively balanced, refrain from
pulling cross-die (high-latency) tasks. This avoids task jitter and
prevents resource exhaustion (similar to the issues in 2.1).


Of course, the change to the newidle CPU path logic has also introduced
new issues, including: 
1. bursty task creation, where a few CPUs spawn a large number of
processes or threads in a short period of time and these tasks cannot be
migrated to low-load CPUs in a timely manner.
2. uneven system-state load across CPUs. For example, some CPUs show
0% to 2% user-mode and 30% to 80% kernel-mode utilization, while others
show 0% to 2% user-mode and 10% to 30% kernel-mode utilization. In addition
, more than 10% of CPUs remain idle.


To address the aforementioned issues, a more lightweight implementation
was adopted to avoid the interference caused by the original newidle CPU
path. Subsequently, select_task_rq_fair() is used to quickly select the
most suitable CPU, as follows:

1. The original task wake-up logic remains unchanged: it first runs the
current-CPU wake-up, affinity wake-up, and similar paths. when the task
count on the found CPU exceeds a threshold (default: 4) a burst-task CPU
allocation process is used.

2. For newly created processes or threads, there is less cause for
concern. Since the CPU selection in the selected scheduling domain meets
the burst-task condition during the slow path, applying the burst-task
CPU allocation process is optimal, as it can quickly utilize idle CPUs
and thereby achieve rapid overall task distribution.


This series of patches also introduces a notable design: in the periodic
load balancing path, tasks are pushed to SMT sibling CPUs to quickly
distribute load within the same core, while also pulling tasks from
other CPUs (excluding SMT siblings) during the current scheduling domain
traversal. This provides a new mechanism for evenly distributing tasks
across the entire machine and strongly supports the change to the
newidle CPU path.


[Implementation]

This patchset gathers 3 different parts:

- Patch 1-3 In periodic load balancing, tasks are pushed to SMT sibling
  CPUs, and pulling them back should be avoided.

- Patch 4 For newidle CPUs, avoid pulling tasks from cross-die
  (high-latency) CPUs.

- Patch 5 This change fixes the local limitations introduced by patch 4
  (e.g., the hackbench performance regression), improves overall
  performance, and quickly distributes tasks to idle CPUs based on the
  task surge threshold.


For detailed information on each patch, please refer to the respective
patch description.


Enable feature:
    echo "SMT_BUDDY_ASSIST" > /sys/kernel/debug/sched/features


[The test results are as follows (Hygon 7447v CPU)]

The overall average improvement is approximately +9.26%.
Testing on other hardware platforms is working in progress.

hackbench:
group   base    smt_buddy pct
g=1	0.262	0.2646	  -0.99%(degeneration)
g=2	0.2878	0.2954	  -2.64%(degeneration)
g=4	0.4074	0.347	  +14.83%(improve)
g=8	0.5674	0.5328	  +6.10%(improve)
g=16	0.8358	0.8418	  -0.72%(degeneration)
g=32	1.411	1.2166	  +13.78%(improve)
g=64	2.4726	2.3564	  +4.70%(improve)
g=128	4.5024	4.5424	  -0.89%(degeneration)
Average improvement: +4.27%.


tbench(Throughput):
clients base       smt_buddy    pct
1	475.968	   487.169	+2.35%(improve)
2	714.484	   808.752	+13.19%(improve)
4	1349.733   1435.15	+6.33%(improve)
8	2058.997   2085.303	+1.28%(improve)
16	4364.247   3692.093	-15.40%(degeneration)
32	8325.17	   6772.693	-18.65%(degeneration)
64	12614.197  12448.367	-1.31%(degeneration)
128	15845.067  17133.367	+8.13%(improve)
256	20837.933  22958.567	+10.18%(improve)
512	29820.667  28242.767	-5.29%(degeneration)
1024	25969.933  22917.733	-11.75%(degeneration)
Average improvement: -0.99%.


schbench(99th):
threads base    smt_buddy  pct
1	10.75	7.6	   +29.30%(improve)
2	11.2	10.8	   +3.57%(improve)
4	12.8	12.2	   +4.69%(improve)
8	13.8	15.0	   -8.70%(degeneration)
16	14.8	15.0	   -1.35%(degeneration)
32	17.0	17.4	   -2.35%(degeneration)
64	27.2	28.8	   -5.88%(degeneration)
128	2844	2845.6	   -0.06%(degeneration)
256	5656	5672	   -0.28%(degeneration)
512	9676	10096	   -4.34%(degeneration)
Average improvement: +1.46%.


stream-10:
operation  base         smt_buddy       pct
Copy	   103034.5	126128.4	+22.41%(improve)
Scale	   100012.0	131812.34	+31.80%(improve)
Add	   128469.0	151501.48	+17.93%(improve)
Triad	   114401.24	158818.78	+38.83%(improve)
Average improvement: +27.74%.


stream-100:
operation  base         smt_buddy       pct
Copy	   122156.6	169662.65	+38.89%(improve)
Scale	   127074.8	168375.375	+32.50%(improve)
Add	   140021.52	154840.075	+10.58%(improve)
Triad	   136455.38	151062.275	+10.70%(improve)
Average improvement: +23.17%.


unixbench:
cpu     base      smt_buddy     pct
1 	1808.3	  1853.1	+2.48%(improve)
384 	113834.2  122562.6	+7.67%(improve)
Average improvement: +5.08%.


sysbench_mysql_test:
operation    base       smt_buddy     pct
TPS	     128.955	134.555	      +4.34%(improve)
QPS	     2579.085	2691.055      +4.34%(improve)
95% latency  1060.31 ms	1022.805 ms   +3.54%(improve)
Average improvement: +4.07%.


Several benchmarks show performance regressions:

1. tbench 32      8325.17    6772.693     -18.65%(degeneration):
Each tbench sample was run three times. Initially, some measurement
error was observed. Moreover, this patch series essentially utilized all
idle CPUs, whereas without the feature enabled, 5% to 10% of idle CPUs may
remain idle. This led to more CPUs experiencing cache interference and
other effects. The results are benign and within an acceptable range.

2. schbench(99th) 8       13.8    15.0       -8.70%(degeneration):
The situation is similar to that observed with tbench. Each sample was
tested five times. The primary regression occurs under bursty task
scenarios, in which tasks are spread across idle CPUs, resulting in
increased memory bandwidth contention, cache latency, and other delays
over a short interval. This is also considered acceptable.


Li kunyu (6):
  sched/fair: Add SMT sibling push in periodic load balance
  sched/fair: Add is_smt_buddy_run() to skip SMT domain
  sched/fair: SMT sibling exclusion after successful push
  sched/fair: Restrict newidle balance to LLC domain
  sched/fair: Add task burst threshold for large-scale bursts
  sched/docs: Add documentation for SMT Buddy Assist feature

 Documentation/scheduler/smt-buddy-assist.rst | 126 ++++++++++
 kernel/sched/fair.c                          | 239 ++++++++++++++++++-
 kernel/sched/features.h                      |   9 +
 3 files changed, 364 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/scheduler/smt-buddy-assist.rst

-- 
2.47.3

