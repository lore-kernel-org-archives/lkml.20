Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485522;
	b=K8prRKNYijhViheyJbAHD2MfHy1fzojcR0zifh9G1Kv33whcbQzb8uxa23DvMhcRnZex
	 yE28N0wC8nYKy2NxwuYu0ADlESS0zolBFnoJiJgur7sYTtSs6+4zad74DdJSLVI3jO+GQ
	 sOg8yv5UFRO0t0E7f4o7uYRdEPPxwG95Qfj5NeHxfTPjfc9nmFd2hFSFhpQoF5KNFqvSF
	 POfLubBSz0Zpx9fyuP6ifOz6hjXSkwFwDmTjT3mkdoJlpZm3QE9O76IoQgM4YUc02bEUB
	 CSsa6uAIZQYD3meA3kc/R+x+oB0j7QnXuyhTllKmInj5YR1DBhZas7BBWiK6PlIV3kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485522;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MPKFv2kcn64e74AAZhc5slVqhnco4fPykUTsk+vl37Y=;
	b=KbNoJQWws46Qes31D+GdH3AsVAVlTNElC+hWDmKFS04fWCV+8O6WQpvX/bYg5MF8z+zo
	 BoTb629NxhNzMpGGDtgdNWnD+cT25rwpszGMa5jH4VTClulz/FqZ40HCzXTwd9uY/VDHo
	 pd0MCuLdrd1R4orhC1r6VToQPNzWn8Buef/rU3Kx3hInHryjQma9ghC964iNrth4++EO0
	 2qwtrTzXjJf68ub3m8H8Cksi8FnUWxk/mLUKP+kiNteXV+4bnBNz1NuFDeyMMWO90wGwx
	 sxniOMyqKxvogDXVvs1V7131b8YH/QAxZljtaIIP2B+2QeOzsbkQ3AKW71jHKvDok5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.195
Received: from out28-195.mail.aliyun.com (out28-195.mail.aliyun.com [115.124.28.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81639606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81639606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.234709|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0159135-0.0011102-0.982976;FP=7178836482150245534|1|1|1|0|-1|-1|-1;HT=maildocker-contentspam033037028158;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.jlWubaq_1792485508;
Received: from localhost.localdomain(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.jlWubaq_1792485508 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 20 Oct 2026 16:38:29 +0800
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
	Li kunyu <likunyu@open-hieco.net>,
	"Li Wang (Hieco)" <li.wang@linux.dev>
Subject: [RFC PATCH 6/6] sched/docs: Add documentation for SMT Buddy Assist feature
Date: Tue, 20 Oct 2026 16:37:46 +0800
Message-ID: <20261020083746.37068-7-likunyu@open-hieco.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020083746.37068-1-likunyu@open-hieco.net>
References: <20261020083746.37068-1-likunyu@open-hieco.net>
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

Document the SMT Buddy Assist mechanism, including its motivation,
enabling method (sysctl interface), and implementation overview. This
helps users understand when and why the feature engages, and how it
interacts with existing CFS load balancing.

Tested-by: Li Wang (Hieco) <li.wang@linux.dev>
Signed-off-by: Li kunyu <likunyu@open-hieco.net>
---
 Documentation/scheduler/smt-buddy-assist.rst | 126 +++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 Documentation/scheduler/smt-buddy-assist.rst

diff --git a/Documentation/scheduler/smt-buddy-assist.rst b/Documentation/scheduler/smt-buddy-assist.rst
new file mode 100644
index 000000000000..c252f4fe955f
--- /dev/null
+++ b/Documentation/scheduler/smt-buddy-assist.rst
@@ -0,0 +1,126 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+================
+SMT Buddy Assist
+================
+
+1. Introduction
+===============
+
+SMT introduces scalability features that constrain the scheduling domain
+within the LLC (L3) cache via the newidle CPU path. Combined with the ability
+to push CFS tasks to SMT sibling CPUs and to quickly distribute tasks to idle
+CPUs using select_task_rq_fair, this improves overall CPU performance under
+varying loads.
+
+2. Design
+=========
+
+The detailed implementation approach is as follows:
+
+Load balancing-related procedures are primarily categorized into two
+major directions:
+
+1. The periodic load balancing path, comprising periodic load balancing
+and NOHZ kick, retains the original logic and continues to maintain
+overall CPU balance.
+
+2. The newidle CPU path logic has been updated solely to quickly obtain
+efficient tasks. By restricting task acquisition to the LLC (L3)
+scheduling domain and avoiding traversal and task migration at levels
+above it, this change avoids jitter in scenarios where the entire
+machine is idle or the CPU load is relatively balanced. This is because
+each traversal of higher-level scheduling domains remains costly, and
+migrating tasks across dies (LLCs) incurs substantial short-term
+overhead, such as TLB flushes/refills and page migration:
+
+  2.1. When overall CPU utilization is relatively low, avoid the
+scenario where the whole CPU is idle yet cross-die (high-latency) tasks
+are being pulled. In such cases, it is better to run only one logical
+CPU per core to avoid cache interference and frequent TLB flushes. This
+applies when:
+    2.1.1. the CPU has multiple sleeping tasks (with delayed dequeue
+disabled).
+    2.1.2. the number of runnable tasks on the CPU is less than 2.
+
+  2.2. When overall CPU load is relatively balanced, refrain from
+pulling cross-die (high-latency) tasks. This avoids task jitter and
+prevents resource exhaustion (similar to the issues in 2.1).
+
+Of course, the change to the newidle CPU path logic has also introduced
+new issues, including:
+1. bursty task creation, where a few CPUs spawn a large number of
+processes or threads in a short period of time and these tasks cannot be
+migrated to low-load CPUs in a timely manner.
+2. uneven system-state load across CPUs. For example, some CPUs show
+0% to 2% user-mode and 30% to 80% kernel-mode utilization, while others show
+0% to 2% user-mode and 10% to 30% kernel-mode utilization. In addition, more
+than 10% of CPUs remain idle.
+
+To address the aforementioned issues, a more lightweight implementation
+was adopted to avoid the interference caused by the original newidle CPU
+path. Subsequently, select_task_rq_fair() is used to quickly select the
+most suitable CPU, as follows:
+
+1. The original task wake-up logic remains unchanged: it first runs the
+current-CPU wake-up, affinity wake-up, and similar paths. when the task
+count on the found CPU exceeds a threshold (default: 4) a burst-task CPU
+allocation process is used.
+
+2. For newly created processes or threads, there is less cause for
+concern. Since the CPU selection in the selected scheduling domain meets
+the burst-task condition during the slow path, applying the burst-task
+CPU allocation process is optimal, as it can quickly utilize idle CPUs
+and thereby achieve rapid overall task distribution.
+
+This series of patches also introduces a notable design: in the periodic
+load balancing path, tasks are pushed to SMT sibling CPUs to quickly
+distribute load within the same core, while also pulling tasks from
+other CPUs (excluding SMT siblings) during the current scheduling domain
+traversal. This provides a new mechanism for evenly distributing tasks
+across the entire machine and strongly supports the change to the
+newidle CPU path.
+
+2.1 SMT_BUDDY_ASSIST
+--------------------
+
+Enable feature:
+    echo "SMT_BUDDY_ASSIST" > /sys/kernel/debug/sched/features
+
+3. System interface
+-------------------
+
+3.1. smt_buddy_imbalance_pct
+----------------------------
+
+When pushing tasks to SMT siblings, the current CPU must exceed a certain
+imbalance ratio before its CFS runqueue is considered heavily loaded.
+
+The imbalance ratio threshold is constrained to a range of 105% to 200%,
+covering both mild deviation and severe imbalance scenarios.
+
+Mild deviation:
+For example, when the pull imbalance ratio within the SMT domain is around
+110%, this feature provides a comparable and configurable trigger condition.
+
+Severe imbalance:
+For example, when the runnable time ratio of the local CPU's cfs_rq is 20%
+while that of its SMT sibling is 40%, load balancing is explicitly required
+to restore fairness.
+
+3.2. smt_buddy_balance_task
+---------------------------
+
+The task-burst detection mechanism employs a configurable threshold derived
+from two primary metrics: the runqueue waiting time of a task on the local
+CPU, and the comparative cost of migrating that task to a remote (cross-die)
+CPU versus allowing it to execute locally after a prolonged wait.
+
+A default threshold of 4 is selected such that migration is triggered when
+the queuing latency approaches the execution duration of an individual task.
+The marginal benefit of migration increases monotonically with the number of
+tasks enqueued on the local CPU.
+
+A lower bound of 2 accounts for scenarios involving long-running tasks, which
+require more aggressive distribution across the CPU topology to avoid localized
+congestion.
-- 
2.47.3

