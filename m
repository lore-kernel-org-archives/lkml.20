Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.71.94.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393118;
	b=h27nIVuKme0TFGMXmSvv3XmDHTCmRhYH80eM9a/qZIM4uBqvuBg1QzCOAhezjiUR7Izb
	 sASLVAsVg3aCIAArhT612rc8kl1Y8448YI9UwndAruG+bLLkioZ0Uu04/Iyk/Qds8dxpN
	 UGvXGHqe+chuwpNrhpXTrtOfsKiCgPvWDXaqpa5j+EgsFJvrUL6cDsjrXfhbrc1ognVfr
	 EmufTMkvbVDOrKwB9JJca1vD6HUbwgysGl5PwzPJKD8Uh5PlAuCnRc9oqzwMM7xPLfbii
	 dMMinp5OhZZSZA0hBwsWULkslRjsWEvl63aWlf6JWLCXpb+8q/9R6gOd+042jwipmHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393118;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=+j2Zw82rI4bi9BdrRXYNJBiSJombr1mdxpB01klzT0I=;
	b=DYZfGoAT0sxwhlb1Zu723BhvJqvZ6Id5xEk5hNLQytS7RnldgnbvYkOBmkq4lTyMgsJw
	 xbE4vKMFBaHyIaWG259mi2KBS0J2+SMdTM74nm3WkVTJkQK3sdD4JRZw7nvOz+fakvRbA
	 9iToOTQE4NhfI9Ch5RJrpUiJYLT5AXv+UdlPfgWmJTqA4mOtHjjEMxPEBq+QvxOJZeLcm
	 2ouxdi4x0JY4Ueq3XH1eQ94Dya/FU6qZIAsCnLxG8M556LQTDSaXhVvW/Zpbt1b/t2TIX
	 dnSCTO/8icLxB/JwANKDX4onPeLS3/pgCxu36DaDLH749fBDEafZpE5xDM/llTuAEgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=huaweicloud.com;
	spf=pass smtp.mailfrom=huaweicloud.com;
	arc=none smtp.remote-ip=124.71.94.104
Received: from dggmsgout13.his.huawei.com (dggmsgout13.his.huawei.com [124.71.94.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41641606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41641606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggmsgout13.his.huawei.com (SkyGuard) with ESMTP id 4jPfv047wLz1rrqG
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:31:08 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 2F85E40CC4
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:31:48 +0800 (CST)
Received: from huawei.com (unknown [10.67.174.193])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgCHwvEGRPRqbs+8Dw--.50026S2;
	Wed, 11 Nov 2026 18:31:47 +0800 (CST)
From: Luo Gengkun <luogengkun@huaweicloud.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	tim.c.chen@linux.intel.com,
	yu.c.chen@intel.com,
	kprateek.nayak@amd.com
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 0/2] Cache aware scheduling: Reduce the overhead of task_cache_work
Date: Wed, 11 Nov 2026 11:04:07 +0000
Message-Id: <20261111110409.1498035-1-luogengkun@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:gCh0CgCHwvEGRPRqbs+8Dw--.50026S2
X-Coremail-Antispam: 1UD129KBjvJXoWfGw1xur13Xr1UXw45CF13CFg_yoWDuF1kp3
	9agrZ3JF45Xry7Aw17A3W8CFyrtF17JF17Xr1rt348ZF1UCr4UJr18Ka1fXryUCryUAr17
	Zr1Dtr47WF1vyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAa
	w2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
	Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q
	6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
	kF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
	xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
	xUF1v3UUUUU
X-CM-SenderInfo: 5oxrwvpqjn3046kxt4xhlfz01xgou0bp/

Hi everyone,
The goal of this patch is to reduce the overhead of task_cache_work() by
minimizing the number of scanned CPUs, which yields significant
performance gains in multi-instance scenarios like Redis. To facilitate
testing, a debug patch is appended.

Below are the Redis test results conducted on AMD server.

When NUMA balancing is disabled:

valkey-benchmark rps  |      baseline       |         schedcache              |     schedcache_visit
                      |  (no cache aware)   |    (without this series)        |     (with this series)
----------------------+---------------------+---------------------+-----------+-------------------+--------
                      |   p99 latency(ms)   |    p99 latency(ms)  |   DIFF(%) |   p99 latency(ms) |  DIFF(%)
400000                |      0.436          |        0.554        |   -25.68% |         0.441     |   -1.14% 

Additionally, the output of perf top -e cycles:k highlights the overhead
incurred by task_cache_work():

valkey-benchmark rps  |         schedcache                        |     schedcache_visit
                      |    (without this series)                  |     (with this series)
----------------------+-------------------------------------------+---------------------------------------
400000                |  0.81%  [kernel]  [k] task_cache_work     |  0.02%  [kernel]  [k] task_cache_work

The trace data is shown below:

echo NO_SC_VISIT > /sys/kernel/debug/sched/features
    redis-server-24660   [195] .....  2916.005989: sched_cache_scan: comm=redis-server pid=24660 scan=384
 valkey-benchmar-48836   [317] .....  2916.005993: sched_cache_scan: comm=valkey-benchmar pid=48836 scan=384
 valkey-benchmar-48487   [310] .....  2916.006002: sched_cache_scan: comm=valkey-benchmar pid=48487 scan=384

echo SC_VISIT > /sys/kernel/debug/sched/features
    redis-server-29080   [225] .....  2876.257909: sched_cache_scan: comm=redis-server pid=29080 scan=14    
    redis-server-26694   [018] .....  2876.257909: sched_cache_scan: comm=redis-server pid=26694 scan=13    
 valkey-benchmar-48198   [103] .....  2876.257909: sched_cache_scan: comm=valkey-benchmar pid=48198 scan=16 

The above results show that this series significantly reduces the overhead
of task_cache_work() by decreasing the number of CPUs that need to be
scanned, from 384 to 16, when NUMA balancing is disabled.

Even with NUMA balancing enabled, this patch provides better performance
benefits. The following tests were conducted with NUMA balancing enabled:

valkey-benchmark rps  |      baseline       |         schedcache              |     schedcache_visit
                      |  (no cache aware)   |    (without this series)        |     (with this series)
----------------------+---------------------+---------------------+-----------+-------------------+--------
                      |   p99 latency(ms)   |    p99 latency(ms)  |   DIFF(%) |   p99 latency(ms) |  DIFF(%)
400000                |      0.437          |        0.454        |   -3.89%  |         0.442     |   -1.14%

The overhead of task_cache_work() is as follows:

valkey-benchmark rps  |         schedcache                        |     schedcache_visit
                      |    (without this series)                  |     (with this series)
----------------------+-------------------------------------------+---------------------------------------
400000                |  0.13%  [kernel]  [k] task_cache_work     |  0.03%  [kernel]  [k] task_cache_work 


Hackbench testing was also conducted. The results below show that this
series does not affect the accuracy of cache-aware scheduling.

=========================================
Hackbench Comparison: baseline vs schedcache
=========================================
MODE       GROUPS  FDS |     baseline(std)  |  schedcache(std)   |    DIFF(%) | VERDICT
---------- ------ -----+--------------------+--------------------+------------+-----------
threads         1   10 |    113.200 (4.22%) |     67.300 (1.32%) |     40.55% | IMPROVED
threads         1    2 |     16.555 (4.11%) |     11.020 (1.66%) |     33.43% | IMPROVED
threads         1   20 |    250.774 (1.26%) |    265.026 (5.44%) |     -5.68% | REGRESSED
threads         1    4 |     42.117 (1.44%) |     27.758 (1.64%) |     34.09% | IMPROVED
threads         1    6 |     65.140 (4.31%) |     39.182 (1.38%) |     39.85% | IMPROVED
threads         1    8 |     84.286 (1.29%) |     53.721 (1.58%) |     36.26% | IMPROVED
threads         2   10 |    122.592 (0.44%) |    113.365 (4.93%) |      7.53% | IMPROVED
threads         2    2 |     17.702 (4.09%) |     10.473 (0.42%) |     40.84% | IMPROVED
threads         2   20 |    336.457 (1.77%) |    314.108 (1.51%) |      6.64% | IMPROVED
threads         2    4 |     43.989 (0.88%) |     27.067 (3.38%) |     38.47% | IMPROVED
threads         2    6 |     69.322 (0.85%) |     41.707 (4.19%) |     39.84% | IMPROVED
threads         2    8 |    103.767 (1.81%) |     58.518 (3.00%) |     43.61% | IMPROVED
threads         4   10 |    148.882 (3.56%) |    149.449 (1.06%) |     -0.38% | REGRESSED
threads         4    2 |     18.909 (2.96%) |     11.063 (2.08%) |     41.49% | IMPROVED
threads         4   20 |    724.943 (2.14%) |    631.222 (3.92%) |     12.93% | IMPROVED
threads         4    4 |     48.191 (1.91%) |     27.352 (5.35%) |     43.24% | IMPROVED
threads         4    6 |     79.725 (3.84%) |     78.732 (4.10%) |      1.25% | IMPROVED
threads         4    8 |    108.768 (1.36%) |    105.928 (1.65%) |      2.61% | IMPROVED
     
Hackbench Comparison: schedcache vs schedcache_visit
=========================================
MODE       GROUPS  FDS |    schedcache(std) |schedcache_visit(std) | DIFF(%) | VERDICT
---------- ------ -----+--------------------+----------------------+---------+-----------
threads         1   10 |     67.300 (1.32%) |     67.014 (0.96%)   |   0.42% | IMPROVED
threads         1    2 |     11.020 (1.66%) |     10.557 (1.46%)   |   4.20% | IMPROVED
threads         1   20 |    265.026 (5.44%) |   212.366 (16.32%)   |  19.87% | IMPROVED
threads         1    4 |     27.758 (1.64%) |     25.711 (1.32%)   |   7.37% | IMPROVED
threads         1    6 |     39.182 (1.38%) |     38.914 (0.34%)   |   0.68% | IMPROVED
threads         1    8 |     53.721 (1.58%) |     52.889 (0.27%)   |   1.55% | IMPROVED
threads         2   10 |    121.203 (6.99%) |    124.254 (1.38%)   |  -2.52% | REGRESSED
threads         2    2 |     10.473 (0.42%) |     11.206 (5.91%)   |  -7.00% | REGRESSED
threads         2   20 |    314.108 (1.51%) |    301.754 (1.95%)   |   3.93% | IMPROVED
threads         2    4 |     27.067 (3.38%) |     28.028 (2.01%)   |  -3.55% | REGRESSED
threads         2    6 |     41.707 (4.19%) |     42.149 (3.35%)   |  -1.06% | REGRESSED
threads         2    8 |     58.518 (3.00%) |     57.133 (4.39%)   |   2.37% | IMPROVED
threads         4   10 |    149.449 (1.06%) |    141.407 (0.08%)   |   5.38% | IMPROVED
threads         4    2 |     11.063 (2.08%) |     11.360 (5.85%)   |  -2.68% | REGRESSED
threads         4   20 |    631.222 (3.92%) |    622.780 (2.49%)   |   1.34% | IMPROVED
threads         4    4 |     27.352 (5.35%) |     27.947 (5.37%)   |  -2.18% | REGRESSED
threads         4    6 |     78.732 (4.10%) |     73.911 (0.70%)   |   6.12% | IMPROVED
threads         4    8 |    105.928 (1.65%) |    107.535 (3.29%)   |  -1.52% | REGRESSED 

---
Changes history

**v11 Changes:**
1. Addressed code review feedback from Tim Chen:
  - Removed a redundant 'continue' statement to minimize code changes.
  - Shortened and clarified the lockless comment for visited_cpus.
  - Updated the eviction comment and fixed a long-line coding style issue.
2. Collected Tested-by tag from K Prateek Nayak <kprateek.nayak@amd.com> 
3. Collected Reviewed-by and Tested-by tags from Chen Yu <yu.c.chen@intel.com>

Link to v10: https://lore.kernel.org/all/20261009032943.95091-1-luogengkun@huaweicloud.com

**v10 Changes:**
1. Rebase onto the latest mainline.
2. Dropped Reviewed-by and Tested-by tags due to the rebase.

Link to v9: https://lore.kernel.org/all/20260731024417.1106503-1-luogengkun2@huawei.com/

**v9 Changes:**
1. Using for_each_cpu_and(i, sched_domain_span(sd), cpus) instead of
for_each_cpu_and(i, sched_domain_span(sd), mm->sc_stat.visited_cpus) in
the inner loop to reduce the race window to  read mm->sc_stat.pcpu_sched.
2. Update the comment to reflect that a single scanner is elected per epoch
in task_cache_work().

Link to v8: https://lore.kernel.org/all/20260723040429.630176-1-luogengkun2@huawei.com/

**v8 Changes:**
1. Remove get_scan_cpumasks() since visited_cpus provides the exact CPUs to
scan.

Link to v7: https://lore.kernel.org/all/20260720122214.3977092-1-luogengkun2@huawei.com/

**v7 Changes:**
1. Add code comments in task_cache_work() to clarify the race condition
between setting and reading visited_cpus.

Link to v6: https://lore.kernel.org/all/20260717041231.3324851-1-luogengkun2@huawei.com/

**v6 Changes:**
1. Switched to cpumask_var_t to dynamically allocate visited_cpus inside
mm_struct, preventing per-process memory bloat when NR_CPUS is configured
large.
2. Intersected the LLC scheduling domain span directly with visited_cpus
to prevent skipping CPU is cross-node LLC topolgies.
3. Renamed epoch_timeout to epoch_last_visit to better reflect its purpose.
4. Moved __update_mm_sched to execute before the timeout check in
fraction_mm_sched()

Link to v5: https://lore.kernel.org/all/20260709130053.2749834-1-luogengkun2@huawei.com/

**v5 Changes:**
1. Restore get_scan_cpumasks() to avoid violating NUMA_BALANCING constraints.
2. Use for_each_cpu_and() to filter CPUs within the LLC domain.

Link to v4: https://lore.kernel.org/all/20260618064300.80072-1-luogengkun2@huawei.com/

**v4 Changes:**
1. Rebase to the master.
2. epoch_timeout is introduced to evict expired CPUs instead of relying on
epoch, because epoch is refreshed periodically due to invocations of
fraction_mm_sched().
3. Move the increasement of nr_running before fraction_mm_sched().
4. Remove the redundant 'work->next' reset at the end of task_cache_work().
5. Add a debug patch to show the number of CPUs scanned to show the
benefit of this optimization.

Link to v3: https://lore.kernel.org/all/20260423085414.1389749-1-luogengkun2@huawei.com/

**v3 Changes:**
1. Remove the static key and enable this feature by default.
2. Reuse llc_epoch_affinity_timeout instead of introducing
llc_epoch_visited_timeout.
3. Move the calculation of rq->cpu_epoch - pcpu_sched->epoch into
fraction_mm_sched() to avoid race between task_cache_work() and
__update_mm_sched(). 
4. Reset work->next at the end of task_cache_work() to prevent concurrent
executions by multiple threads within the same process.

Link to v2: https://lore.kernel.org/all/20260414150745.225416-1-luogengkun2@huawei.com/

**v2 Changes:**
1. Added a pre-check before set/clear visited_cpus to avoid C2C overhead.
2. Optimized llc_epoch_visited_timeout by using a static key to minimize overhead.

Link to v1: https://lore.kernel.org/all/f2488085-4b52-491d-84be-d30d43954381@huawei.com/

Luo Gengkun (2):
  sched/cache: Reduce the overhead of task_cache_work by only scan the
    visisted cpus
  -- DO NOT APPLY!!! -- sched/cache/debug: Add trace event and sched
    feature to track scan cost

 include/linux/sched.h        |  2 ++
 include/trace/events/sched.h | 21 +++++++++++
 kernel/sched/fair.c          | 68 +++++++++++++++++++++++++++++-------
 kernel/sched/features.h      |  1 +
 4 files changed, 80 insertions(+), 12 deletions(-)

-- 
2.34.1

