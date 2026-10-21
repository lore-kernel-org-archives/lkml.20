Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792557601;
	b=D41U4n0YbG2Z7V1MDhwha09vmDjfnZz8OpLzz+gB/rgm2Vsm2UCBA7enTht7gpY3FfLE
	 RkUmLxHY6CJy7lexToQCyzojC1EKVK4a7TjWVX7wNU6di2PlSCfN811S1HDl+xbCNN5/i
	 GKsQP7GiMAYplCKT+ZlRO2Xv/A3cFZfFihQAo4B/S47wJBWpG/W3q+vGqMjF99dyxAd4F
	 6sqw/DFpC/7heMvoIH4fxtI2KDV1+SblE5zEm0/JFbX6lTF2j8X2Aspc4cGsAwxp4lVKM
	 pWRRf/vcD6d+DPp0j9T7nK64oj82fPcOVFKXnma/emrNlj+9iQvIuB0DnhohhNXG8Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792557601;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=I3gxG50NKmjDdYtQA/tktdZksMt75bL8m/FJi/yj/zg=;
	b=PJildG427Kbo7h3yBJItaO3a4kO0DpuCu3cTBx628yzgTKkj9kbMc54r2TJFV16aP6hy
	 SEZ8WRE9d0EqzzvIRHr6bHaoYdQj+LCnYF8eJWdb9i3zpurtfJdUvSU3OMbBatadWl3De
	 n/KfziBSZf394ILPBgZIBsv8fP0QJHChiNMprSbetEMhXuSIkXbrnFpKaSCXgGjEBpfkU
	 TsECOeff8OgF4K96txOwFcTaB2sduCGLmjW3mpsBNYkUTKKZKYrEHFPCudllPtblj7fQo
	 276XGJs5vPAHoGgKYYNFvIHh42O9CL9NMiuro9yrqvXnwzxIwcQiao/5bDC7g3aQkCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Zva7W1eV;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27944606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:39:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27944606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Zva7W1eV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=I3
	gxG50NKmjDdYtQA/tktdZksMt75bL8m/FJi/yj/zg=; b=Zva7W1eVeN4d8iseWr
	JHueWD5ktvENxD+wnBddhn5XqQS4LQD9f61Q7bT00iNpumhszNhKOv2qCXcNQvnq
	q4xeKmAU4QJX9M4i331BAn9mLnSVxSbMGNtwiCVf36FkGDCRS0WlQoSIgeI48cgJ
	JksdPqjqsdcEC4RKwPI4nvePs=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDnzxHKQdhqC8Q9BQ--.12283S2;
	Wed, 21 Oct 2026 12:38:35 +0800 (CST)
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
Subject: [PATCH v2] sched/topology: Balance cluster static-key updates
Date: Wed, 21 Oct 2026 13:38:34 +0900
Message-ID: <20261021043834.1140951-1-sh_def@163.com>
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
X-CM-TRANSID:_____wDnzxHKQdhqC8Q9BQ--.12283S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJF4UCrW5uw1xZr4fZr1fZwb_yoW5Gr17pF
	WDKrW5Jr4jqrnxG3yrCw1kury5Ga97Jw17t3WfGw1fGF4DAwnYgr1I9F9I9F1jkrWkArnI
	vr12gw1I9a1DAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUOyCLUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6Q5Us2rYQc5BpQAA3Z

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
Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: Hui Su <sh_def@163.com>
---

Changes in v2:
- Guard the SD_CLUSTER domain scan with sched_cluster_active to avoid an
  unnecessary loop on systems without cluster domains. (K Prateek Nayak)

v1: https://lore.kernel.org/r/20261021034314.864713-1-sh_def@163.com

 kernel/sched/topology.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 3dab0253976fb..21e3ab1af4c85 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -3314,13 +3314,25 @@ int __init sched_init_domains(const struct cpumask *cpu_map)
 static void detach_destroy_domains(const struct cpumask *cpu_map)
 {
 	unsigned int cpu = cpumask_any(cpu_map);
+	bool has_cluster = false;
 	int i;
 
 	if (rcu_access_pointer(per_cpu(sd_asym_cpucapacity, cpu)))
 		static_branch_dec_cpuslocked(&sched_asym_cpucapacity);
 
-	if (static_branch_unlikely(&sched_cluster_active))
-		static_branch_dec_cpuslocked(&sched_cluster_active);
+	if (static_branch_unlikely(&sched_cluster_active)) {
+		rcu_read_lock();
+		for_each_cpu(i, cpu_map) {
+			if (lowest_flag_domain(i, SD_CLUSTER)) {
+				has_cluster = true;
+				break;
+			}
+		}
+		rcu_read_unlock();
+
+		if (has_cluster)
+			static_branch_dec_cpuslocked(&sched_cluster_active);
+	}
 
 	rcu_read_lock();
 	for_each_cpu(i, cpu_map)
-- 
2.55.0

