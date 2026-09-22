Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66875304BD;
	Tue, 22 Sep 2026 09:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070417; cv=none; b=jsjnrFJXbT5c8Po8LMYg2gHw2+DNHGeQJQI2c35sNB5gC6ZsHN05oGfaGad0GAh7PGh3L2XiW0ZvtJnb/dabtfojvs1AfxzEaQMffXvOyNzh2j+lgfmG8h3Wa+mqL6MJTpWGQ2UEaBy5FbLZgMQVDTxz9w253fUJlZGM6dts2Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070417; c=relaxed/simple;
	bh=FsBkTq7tovVUJuuwMcMLRTF6KuVrlrX4fyO3mpT23sc=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=VRU09h08rURzF83cZWDDqBwqUDmmtgtRNZNNLkyDn3GbuocUBO+EEQCzdheb6cKd8DXijqSm4nTE1GvQVf4YObCe+0Au2MgvE+p7PqjM9M5XyRAJsy/cTh/cXg8Dpq+PWfVtLtQ6GPoBGDcnycMp8cPyg01fUebZ4w/JAW2s1vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1m6qtrHt; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fgwNA6sx; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1m6qtrHt";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fgwNA6sx"
Date: Tue, 22 Sep 2026 09:46:49 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790070412;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AO+JOnDyj0aLgiWkTXsPBAABl09IGqRdXfkfEGnC7R0=;
	b=1m6qtrHtA9ecKH4TU/r3pvhZgJOvqnUdPr62b0s73U4dnG7mW1HQ1QXyX3CP9necyrCJQg
	amMbZWbhE3oWe5q0QUXfKK6cN4ibEhxjiQoxOslH8U8CT/bru3xE3tpnABMFJUUHnfAgxN
	161EDNYl2ddjIHAySot4ZinwvLQeFE4eHHXYFPToCL63S5Zb4rmfUg9lFOX8gCEV+8yMwf
	ysk+L0qvcow41xW089QMlbEtm1nJPJ2KBHEZLXFE68vPaoxseXS1/psuBCUlQtr0Ksdat/
	KWJmByGk4b/1Jnvo3mUhOzaZ0LgtLLTZDGAYELRmf6P39/nYDOQXJQ2F2idGwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790070412;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AO+JOnDyj0aLgiWkTXsPBAABl09IGqRdXfkfEGnC7R0=;
	b=fgwNA6sx/nEz1UzhhbFvVazHxnUwISo7DejFhIzs0xWlpEDSuaIzUWVfgK4ON6adM/6WbO
	GFn7N1FxKvJzH5DQ==
From: "tip-bot2 for Davi Chaves Azevedo" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/cache: Refresh LLC capacity across CPU
 hotplug, to fix capacity underestimation bug
Cc: Davi Chaves Azevedo <davichazbh@gmail.com>,
 Tim Chen <tim.c.chen@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Chen Yu <yu.c.chen@intel.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,  <stable@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: =?utf-8?q?=3C6751d93e15889e624796c74db0bfe66603d60b1b=2E1790035?=
 =?utf-8?q?273=2Egit=2Etim=2Ec=2Echen=40linux=2Eintel=2Ecom=3E?=
References: =?utf-8?q?=3C6751d93e15889e624796c74db0bfe66603d60b1b=2E17900352?=
 =?utf-8?q?73=2Egit=2Etim=2Ec=2Echen=40linux=2Eintel=2Ecom=3E?=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179007040997.2819794.5327125138487970284.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     3cb0243767fd033bdce95f4f1b5882172a2f8119
Gitweb:        https://git.kernel.org/tip/3cb0243767fd033bdce95f4f1b5882172a2=
f8119
Author:        Davi Chaves Azevedo <davichazbh@gmail.com>
AuthorDate:    Mon, 21 Sep 2026 17:37:27 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Tue, 22 Sep 2026 10:50:54 +02:00

sched/cache: Refresh LLC capacity across CPU hotplug, to fix capacity underes=
timation bug

The scheduler scales LLC capacity by the fraction of cache-sharing CPUs
covered by a domain:

  llc_bytes =3D cache_size * span_weight / shared_weight

During CPU teardown, sched_cpu_deactivate() rebuilds scheduler domains
before cacheinfo_cpu_pre_down() removes the CPU from shared_cpu_map. The
new domains therefore use the old sharing weight. The later call to
sched_update_llc_bytes() looks up the departing CPU's sd_llc, which has
already been detached, and returns without correcting the surviving CPUs.

On a Ryzen 5 7535U with twelve logical CPUs sharing a 16 MiB LLC,
offlining one SMT sibling left the remaining CPUs with:

  llc_bytes =3D floor(16777216 * 11 / 12) =3D 15379114 bytes

The correct capacity is still 16777216 bytes. On systems with active
cache-aware scheduling, an underestimated capacity can cause
exceed_llc_capacity() to reject aggregation for a process whose footprint
would fit. Unchanged cpuset partitions sharing the physical cache can
also retain stale capacity when a CPU comes online in another partition.

Pass the cache-sharing mask already retained by cacheinfo to the
scheduler update. Refresh every surviving CPU using its own LLC domain
so that each partition receives the correct share. This also preserves
the correction needed as cache-sharing maps grow during boot.

Keep the existing CPU-hotplug and scheduler-domain synchronization. The
update remains on the hotplug path; no steady-state scheduling operation
or persistent allocation is added.

Fixes: 7030513a0877 ("sched/cache: Calculate the LLC size and store it in sch=
ed_domain")
Signed-off-by: Davi Chaves Azevedo <davichazbh@gmail.com>
Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Chen Yu <yu.c.chen@intel.com>
Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>
Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Tested-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: <stable@kernel.org> # v7.2.x
Link: https://patch.msgid.link/6751d93e15889e624796c74db0bfe66603d60b1b.17900=
35273.git.tim.c.chen@linux.intel.com
---
 drivers/base/cacheinfo.c       | 11 ++++++-----
 include/linux/sched/topology.h |  4 ++--
 kernel/sched/topology.c        | 22 +++++++++++++---------
 3 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 9f9c727..7a47a39 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -1040,9 +1040,10 @@ static int cacheinfo_cpu_online(unsigned int cpu)
 	rc =3D cache_add_dev(cpu);
 	if (rc)
 		goto err;
-	if (cpu_map_shared_cache(true, cpu, &cpu_map))
+	if (cpu_map_shared_cache(true, cpu, &cpu_map)) {
 		update_per_cpu_data_slice_size(true, cpu, cpu_map);
-	sched_update_llc_bytes(cpu);
+		sched_update_llc_bytes(cpu_map);
+	}
 	return 0;
 err:
 	free_cache_attributes(cpu);
@@ -1059,10 +1060,10 @@ static int cacheinfo_cpu_pre_down(unsigned int cpu)
 		cpu_cache_sysfs_exit(cpu);
=20
 	free_cache_attributes(cpu);
-	if (nr_shared > 1)
+	if (nr_shared > 1) {
 		update_per_cpu_data_slice_size(false, cpu, cpu_map);
-
-	sched_update_llc_bytes(cpu);
+		sched_update_llc_bytes(cpu_map);
+	}
=20
 	return 0;
 }
diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index b5d9d7c..f96812d 100644
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -281,9 +281,9 @@ static inline int task_node(const struct task_struct *p)
 }
=20
 #ifdef CONFIG_SCHED_CACHE
-extern void sched_update_llc_bytes(unsigned int cpu);
+extern void sched_update_llc_bytes(const struct cpumask *cpus);
 #else
-static inline void sched_update_llc_bytes(unsigned int cpu) { }
+static inline void sched_update_llc_bytes(const struct cpumask *cpus) { }
 #endif
=20
 #endif /* _LINUX_SCHED_TOPOLOGY_H */
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 0248227..3dab025 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -985,8 +985,8 @@ void sched_cache_active_set(void)
 }
=20
 /*
- * Update the bottom sched_domain's llc_bytes for @cpu and all its
- * LLC siblings. Called from cacheinfo_cpu_online() or
+ * Update the bottom sched_domain's llc_bytes for @cpus sharing a physical
+ * LLC. Called from cacheinfo_cpu_online() or
  * cacheinfo_cpu_pre_down() with cpu hotplug lock held.
  *
  * Note: get_effective_llc_bytes() returns 0 on PowerPC.
@@ -996,17 +996,13 @@ void sched_cache_active_set(void)
  * and does not populates the per-CPU struct cpu_cacheinfo array
  * that get_cpu_cacheinfo_llc() reads.
  */
-void sched_update_llc_bytes(unsigned int cpu)
+void sched_update_llc_bytes(const struct cpumask *cpus)
 {
 	struct sched_domain *sd, *sdp;
 	unsigned int i;
=20
 	sched_domains_mutex_lock();
=20
-	sdp =3D rcu_dereference_sched_domain(per_cpu(sd_llc, cpu));
-	if (!sdp)
-		goto unlock;
-
 	/*
 	 * ci->shared_cpu_map is built incrementally as CPUs come
 	 * online, so the first CPU in an LLC initially sees
@@ -1014,14 +1010,22 @@ void sched_update_llc_bytes(unsigned int cpu)
 	 * get_effective_llc_bytes().  Re-evaluating every LLC
 	 * sibling on each online event corrects this once the full
 	 * shared_cpu_map is known.
+	 *
+	 * The departing CPU's domains have already been detached when
+	 * cacheinfo removes it. Use the surviving cache siblings instead.
+	 * They may belong to different cpuset partitions, so use each CPU's
+	 * own LLC domain to scale its share of the physical cache.
 	 */
-	for_each_cpu(i, sched_domain_span(sdp)) {
+	for_each_cpu(i, cpus) {
+		sdp =3D rcu_dereference_sched_domain(per_cpu(sd_llc, i));
+		if (!sdp)
+			continue;
+
 		sd =3D rcu_dereference_sched_domain(cpu_rq(i)->sd);
 		if (sd)
 			sd->llc_bytes =3D get_effective_llc_bytes(i, sdp);
 	}
=20
-unlock:
 	sched_domains_mutex_unlock();
 }
=20
