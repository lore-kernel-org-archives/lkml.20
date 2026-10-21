Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792554298;
	b=ETNbzYMf7tOiYqGXQGirEmT+8R3Rx9P9YKhH324Qbis7qQY+VOcYpCwNtoUEnCOPI4Bu
	 5xUZ9oWuuJLhhaemfEh0qKq3AX0SsiiJ5zOgHKVJYHXF5fpUwx+l0BPRxeyZXz56aMZ5h
	 s6UO3MjaxhqVPwOg2OdSJ/F5+6oDS1wMlABqSTdeisUSQ9uvAqDjGMyLIV68t3raD/Pj0
	 hLHjGcKH0/Z4UD0nXxVDq7x4bIFwd+kBdizcw6OXcPT1A5paWmF1mQzybfktD3YoeIBik
	 8vU6m3LaTGdckrPY1cJY0eTqhJbGNWZmWBzXS9KSOZNUVp4+/Ho5YAZgRdT3Qs1nvzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792554298;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=9KJuCkCBZAca5pY88c3+YtbskUC0sKCr7WEHfuer9o8=;
	b=XToHnT6h5qvaEH+FOkZsmpLEaAoMRYT6x4RlaJdsp3LTrqPo9Yz1vZ6HylQDxnNKNcrW
	 ohKtSXLmAC+MJhl2KQTfP+bsbbvMPXaE1S3kkVKqXjLnuRaMI2vOcxM930Bl7/aQW6a4E
	 4lb1lKwC/zlbuKJ0Os/AZQPOSzuomcSwWwOjKMCIeQ5fP1XtLwHIv6OJX+AWvQrdKsjZu
	 o1JiSpFHMFSQMv5HuN0aMBz7UnpKgkvFN9moRAFMiZgDuRCIeW07blg8+QrDzZtYQ/Bc1
	 FfdMeOlcIvJOquUlSH6LhQM7mwuyR9dWEkE/o3BLb0VAJHEGYtGeqixs3TeBqo99eoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=WXUJvDTs;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7156B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7156B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=WXUJvDTs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=9K
	JuCkCBZAca5pY88c3+YtbskUC0sKCr7WEHfuer9o8=; b=WXUJvDTspUXyM0ney/
	q45qLxwXqHAUPZr+Bbggo9ujnu/cesrrXooDNT93pacL+FhJwq3dkSLQy8Rj83Mm
	orK1CvIm4dAbhiE6EUmHzURMHQlm5IVTM3vCKjVIxt9HWP1poKPcgS3fD5oTbb9W
	kRGunQ9UMCqZigSnALVF+LUK4=
Received: from localhost (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgBXcJ_SNNhq2PR5BA--.11684S2;
	Wed, 21 Oct 2026 11:43:15 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Barry Song <baohua@kernel.org>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	linux-kernel@vger.kernel.org,
	Hui Su <sh_def@163.com>
Subject: [PATCH] sched/topology: Balance cluster static-key updates
Date: Wed, 21 Oct 2026 12:43:14 +0900
Message-ID: <20261021034314.864713-1-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
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
X-CM-TRANSID:QCgvCgBXcJ_SNNhq2PR5BA--.11684S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrW3AF4DJr1xXF4UZF45GFg_yoW8Zw45pF
	WkKrW5tr4UKrsxC3yrC3Wv934rCa93Jw17t3WrGw1fGF1DJw1FgryIqF9I9F1Y9rWDArnI
	vr12g347ua1DAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUYkshUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6RMScWrYNNOy0gAA3s

build_sched_domains() increments sched_cluster_active once per newly
built partition that contains an SD_CLUSTER domain.
detach_destroy_domains() instead tested the global static key before
decrementing it, so destroying a cluster-less partition could drop a
reference owned by another partition and disable cluster-aware
scheduling while SD_CLUSTER domains remained installed.

Check the installed domains before detaching them and decrement only
when the removed partition contains an SD_CLUSTER domain.

With two cluster-bearing partitions installed, removing a singleton
partition left the baseline count at 1 where 2 partitions still
carried SD_CLUSTER; the fixed kernel correctly reports 2.  On an
asymmetric cluster topology where the parent partition gains no
cluster domain, the baseline count drops to 0 while a cluster
partition remains installed; the fixed kernel keeps it at 1.

Fixes: 8881e1639f1f ("sched/fair: Scan cluster before scanning LLC in wake-up path")
Signed-off-by: Hui Su <sh_def@163.com>
---
 kernel/sched/topology.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 3dab0253976fb..c9e10bfade6d0 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -3314,12 +3314,22 @@ int __init sched_init_domains(const struct cpumask *cpu_map)
 static void detach_destroy_domains(const struct cpumask *cpu_map)
 {
 	unsigned int cpu = cpumask_any(cpu_map);
+	bool has_cluster = false;
 	int i;
 
 	if (rcu_access_pointer(per_cpu(sd_asym_cpucapacity, cpu)))
 		static_branch_dec_cpuslocked(&sched_asym_cpucapacity);
 
-	if (static_branch_unlikely(&sched_cluster_active))
+	rcu_read_lock();
+	for_each_cpu(i, cpu_map) {
+		if (lowest_flag_domain(i, SD_CLUSTER)) {
+			has_cluster = true;
+			break;
+		}
+	}
+	rcu_read_unlock();
+
+	if (has_cluster)
 		static_branch_dec_cpuslocked(&sched_cluster_active);
 
 	rcu_read_lock();
-- 
2.55.0

