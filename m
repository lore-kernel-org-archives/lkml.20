Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792652855;
	b=BAvmKqcU8rtqS7g+R2ksKnjhO91TJYJehWHmyE26MggErrxW3d0iKm6ApRQCGlTxhrAf
	 xHI54pzA+/IoAmZ/20tDOhWhg/bshkLFlCufNPIVTrs4z4KHbHRCjyoa0dzyPoCVtHbpP
	 r/8s9nqbp2HkYO/30pa0f/bbGL2TjEhT76zUzojRvRt51wF2if8mbBST/2yxMmGXLNm9v
	 O+LsagnPb6WwqHmGa5BG65bAFFQ8dHGTK2GW6i3sBSoS+P3H4xf8w4xrgvg4Rn2vdoHc0
	 EVnSfj9bbM5+VhyiwEjJ4CDtWXp/bU5+EnWFzXDoMHZluyZ3ODCxJBBHDbWs2D3Ye4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792652855;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=/hgPbR7JXNLGasTI9O0hP9hHRbEsF7yh4gXR1RTna4Q=;
	b=jE6WZQJgxotoYF7Q/5YqBsWAJtdVNfkcJcR/j7osYfoXTSFIPllIj9gqQK5EtW98yw0y
	 dBHkeaIOEdZPwZL9SxB3TTDLPJ0Pt9zj0NTnp4aMMxq0u7Gu3Q3DO6a6Y0M8Eno5nadjx
	 Z4EDiUbrYwctfLY6Ijco6ctAvckTC3hnv4DNFSxVGByMdq7wV4XizI6yHvuOLAfmRz6D1
	 BGa7yoUkoOV2R0eRdSgk/v+pJ/UIhbEdr/KuTvGK30vQoRq2xB1jcUtPmbImVGRTHDrid
	 hxPfF3Grn5afFWYqcHHelNwKIPdJ+Okrgl4gH1G8Dxa2aa/Rcxi73bhH8LQODigscfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=NDQiF0l7;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54F4606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E54F4606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=NDQiF0l7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=/h
	gPbR7JXNLGasTI9O0hP9hHRbEsF7yh4gXR1RTna4Q=; b=NDQiF0l7HdIKQpi8BB
	d/MlUDt9rULP/rOPWQTjO24WNVkElP1EsLnAOOt4YOHBtSFGp3awwTaY0VFNjemf
	gBw4wqKD49DWd8XGJcDsgCwE0EB+2LTVrRXJNwS/mZmDOi/qH+ccfwwhaKd1Yszo
	fion3pe78/6nDfWM4Fg0vVL/Y=
Received: from localhost (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgBXuHG2tdlqeinZBA--.27934S2;
	Thu, 22 Oct 2026 15:05:27 +0800 (CST)
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
	Chen Yu <yu.c.chen@intel.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	linux-kernel@vger.kernel.org,
	Hui Su <sh_def@163.com>,
	Kayra Cizmeci <kayracizmeci@gmail.com>
Subject: [PATCH v3] sched/topology: Balance cluster static-key updates
Date: Thu, 22 Oct 2026 16:05:26 +0900
Message-ID: <20261022070526.728824-1-sh_def@163.com>
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
X-CM-TRANSID:PCgvCgBXuHG2tdlqeinZBA--.27934S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJF4UCrW5uw1xZr4fZr1fZwb_yoW5Ar13pF
	4vgrW5Xr47tr1DG3y8Cw18ury5Ga97Jw17Gw15Gw1fGF1DZwnYgr1IvF9I9F1jkrWDAr1a
	vrnFgw1I9a1DAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUYkshUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6RmsDGrZtbkm9QAA38

build_sched_domains() increments sched_cluster_active once per newly
built partition that contains an SD_CLUSTER domain.
detach_destroy_domains() instead tested the global static key before
decrementing it, so destroying a cluster-less partition could drop a
reference owned by another partition and disable cluster-aware
scheduling while SD_CLUSTER domains remained installed.

Check the installed domains before detaching them, only while the key is
enabled, and decrement only when the removed partition contains an
SD_CLUSTER domain.

With two cluster-bearing partitions installed, removing a singleton
partition left the baseline count at 1 where 2 partitions still
carried SD_CLUSTER; the fixed kernel correctly reports 2.  On an
asymmetric cluster topology where the parent partition gains no
cluster domain, the baseline count drops to 0 while a cluster
partition remains installed; the fixed kernel keeps it at 1.

Fixes: 8881e1639f1f ("sched/fair: Scan cluster before scanning LLC in wake-up path")
Cc: stable@vger.kernel.org
Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
Signed-off-by: Hui Su <sh_def@163.com>
---

Changes in v3:
- Combine SD_CLUSTER detection with the existing domain detach loop,
  avoiding a second CPU mask walk and RCU read-side section.
  (Tim Chen)
- Decrement sched_cluster_active after detaching the domains.
- Add Cc: stable@vger.kernel.org for stable backport consideration.

v2: https://lore.kernel.org/r/20261021043834.1140951-1-sh_def@163.com
v1: https://lore.kernel.org/r/20261021034314.864713-1-sh_def@163.com
---
 kernel/sched/topology.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 3dab0253976f..3bf28aefac1c 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -3314,18 +3314,24 @@ int __init sched_init_domains(const struct cpumask *cpu_map)
 static void detach_destroy_domains(const struct cpumask *cpu_map)
 {
 	unsigned int cpu = cpumask_any(cpu_map);
+	bool has_cluster = false;
 	int i;
 
 	if (rcu_access_pointer(per_cpu(sd_asym_cpucapacity, cpu)))
 		static_branch_dec_cpuslocked(&sched_asym_cpucapacity);
 
-	if (static_branch_unlikely(&sched_cluster_active))
-		static_branch_dec_cpuslocked(&sched_cluster_active);
-
 	rcu_read_lock();
-	for_each_cpu(i, cpu_map)
+	for_each_cpu(i, cpu_map) {
+		if (!has_cluster && static_branch_unlikely(&sched_cluster_active) &&
+		    lowest_flag_domain(i, SD_CLUSTER))
+			has_cluster = true;
+
 		cpu_attach_domain(NULL, &def_root_domain, i);
+	}
 	rcu_read_unlock();
+
+	if (has_cluster)
+		static_branch_dec_cpuslocked(&sched_cluster_active);
 }
 
 /* handle null as "default" */
-- 
2.55.0

