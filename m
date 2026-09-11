Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6407738DC7F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164172; cv=none; b=DfCltrroj7kXYWKC7Sz7l/BmZJtdHuI062ewiyAny335h+8bW+yFT2Oao726LV7dOTkfk27IfWmMn9N/IgSYjeZv6Xj68LcESWYrCVv4XNbJL73r070CNihct8lJIN6wuSrmb6o+9Odaw0OXXCiDKz0/Ndlsv9ww9EuPLKThpiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164172; c=relaxed/simple;
	bh=cFKLP09hb2NVVP9C1vhUMkIfqq6aDyHtEQyYMKmUbG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Li58GkFHT1t82nV6pEajyZ+QI85rj0dMjX2j8z/0YxbOyLuV4YxyxJwyYp3f1JyC1QfS8ACghziZckMYavaWqYQp9/pVZPVv8yXwJhT4EEH4+eOzlnqDcRudAc8kSZvEF14qvZBpA/dyw+UAyn0Bk/Eq1KAYTEM5fQezrjq7cGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AGoHMJOQ; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGoHMJOQ"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e518329so143322e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789164169; x=1789768969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yl3Uwa3EEjUbnekS0cfkiubLDnhsAXEaKVCEpZdxIxU=;
        b=AGoHMJOQ1wWiRaAcVRUB4feABDFQLn3JkS5KCO9QvQslevY1auX//04gJxJuxanojq
         HjfIFDJffvMwV0XuhyfWWV+YJooZ4I3k73jKXHYwWvfYDWS5BGAjNa6eyPSzvnUP4o5o
         rCr1ZrsreeehMKg0wg+WC9a/C0tc9JITCOWrUVaI9ioAyCNiP5iGnfwXOeZVApqC8j+A
         QBgL0SvANpLC2l2Rhf8b1Fgiy611eGMYEOgFsqCWL3LOmd82OIw5P6leYBU1djW+P/Lk
         TmDPSzPOcTFZebrMWl7O8S9W8yVtKkXjOX4lhrfQ+iPcvMfWrBTeTTXo87+mTg1OE7s/
         JZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164169; x=1789768969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yl3Uwa3EEjUbnekS0cfkiubLDnhsAXEaKVCEpZdxIxU=;
        b=dlmw/NzdEKCkP54818hOgzBVXoRps9kpoUxyuAlkTnGbAHLNgC+Z4SJh/2zrPPL7F4
         S78qeTzeTpJOgpmH25YyXJpBUDQeamc/9HTpKlnwpmXx4gmfqLMfnaYiB3kxeWkuu3Et
         djMCjtssVR4iecXYbpfqZ+T/F5wsqbHZAeU2nGs4rY6GzI68yLQY96dlePKJwm0wCGQT
         l7wOpYwie3C2X+Ir6CmPWTACkKedqFLUS3qQSJd1RbcNMRvczX2qWp4kwupNRpPTbCxv
         wAqDr5Xyu9r78nFlfThOZ4nV266H8LaxLwmJZ8lOEN0ChQkmc5HaJcnuutc3v9gtmM8/
         uPdQ==
X-Forwarded-Encrypted: i=1; AKwUvByUnjObtGzaTI5W7Ymet8rwWtGAJqYXJ61vLcmb6aio7yaVhFk3TX1CGcF1ByMDR8T5CJLYkqfw7nAN6ME=@vger.kernel.org
X-Gm-Message-State: AFuF++n24j/LXVGefQyGuVkxgZ+Y5Ogh4Og2jeKfO9GMShYXIXCyD2sT
	husKD3gemz4ci6LucUH2h4AFYxPRaXYwf59lBt7QTxGaOxy5fbiyANk7
X-Gm-Gg: AYBFou3KQ3XA/2ZFTUh5d52UgF2h+B6mvxf1nRZoHOIQopprbicuzfEI5AteCxQeOfh
	m1zHLMcdSBxSN70U8Qiph6KIUSCg3UZ+AW4ti7OZzWxoSsPqLEC9AVMaqS71m3acAQnxJDw4Ctv
	WQNTlh+78W7yj1S3F+Knv6Cy4gCwFlVsQO4IkS0hElRKwmZcZFF4vonnxZuvjl1V1jUf42q8POl
	KeO1lHz5EjPRPFsAF33fNe5/vu7d7d7S3QKsDkVO0yKlJNsai0hkmQ0D/vmGouUb0/r5rCEtxE+
	hWEoBthzKOczIWgGf+J6kWOTyX1TlMkWLGJ4D3vi/vQJEflVBda+PxjwQa2pQN8j/oRxr3IQken
	f+rpX0F7c39VgbExL52VXk+gxVnP5inHgoZvfZ9kvOzYfqODQHGWuSo03sI+o6mbqbVss78fQpJ
	un+Z5eky2vTlIw8+48h49oUaC+h2sPJ0z96WCj/6JfNfgsCgpyK2w7nxgJAgA1dr2t0TZ6lo3X3
	CYFc6733g12fKpKEaENoQUrF+0=
X-Received: by 2002:a05:6122:3288:b0:5bd:b0a7:47e7 with SMTP id 71dfb90a1353d-5c8462cfc27mr3450774e0c.3.1789164169067;
        Fri, 11 Sep 2026 15:02:49 -0700 (PDT)
Received: from localhost ([200.151.1.221])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c8470add08sm4114213e0c.3.2026.09.11.15.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:02:48 -0700 (PDT)
From: Davi Chaves Azevedo <davichazbh@gmail.com>
To: peterz@infradead.org,
	mingo@redhat.com
Cc: Chen Yu <yu.c.chen@intel.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	chen.yu@linux.dev,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] sched/cache: Refresh LLC capacity across CPU hotplug
Date: Fri, 11 Sep 2026 19:02:29 -0300
Message-ID: <20260911220229.1368887-1-davichazbh@gmail.com>
In-Reply-To: <20260911134825.420748-1-davichazbh@gmail.com>
References: <20260911134825.420748-1-davichazbh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The scheduler scales LLC capacity by the fraction of cache-sharing CPUs
covered by a domain:

  llc_bytes = cache_size * span_weight / shared_weight

During CPU teardown, sched_cpu_deactivate() rebuilds scheduler domains
before cacheinfo_cpu_pre_down() removes the CPU from shared_cpu_map. The
new domains therefore use the old sharing weight. The later call to
sched_update_llc_bytes() looks up the departing CPU's sd_llc, which has
already been detached, and returns without correcting the surviving CPUs.

On a Ryzen 5 7535U with twelve logical CPUs sharing a 16 MiB LLC,
offlining one SMT sibling left the remaining CPUs with:

  llc_bytes = floor(16777216 * 11 / 12) = 15379114 bytes

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

Fixes: 7030513a0877 ("sched/cache: Calculate the LLC size and store it in sched_domain")
Signed-off-by: Davi Chaves Azevedo <davichazbh@gmail.com>
Reviewed-by: Chen Yu <yu.c.chen@intel.com>
---
Changes in v2:
  - Restore the original boot-time shared_cpu_map explanation, as Chen Yu
    suggested, alongside the CPU-offline and cpuset-partition rationale.
    No functional changes from v1.
  - Add Chen Yu's Reviewed-by tag and document his multi-LLC testing.

v1:
https://lore.kernel.org/r/20260911134825.420748-1-davichazbh@gmail.com
Review:
https://lore.kernel.org/r/a3433e6a-0d1f-44a8-99bd-bc63d1a15913@intel.com

The issue was identified by tracing the scheduler/cacheinfo teardown
ordering, then checking live llc_bytes values using the running kernel's
BTF layout and /proc/kcore.

Local validation performed for v1 (no functional changes in v2):
  - Reproduced the stale value on 7.2.3-arch1-3 on the Ryzen system above.
    The patched kernel retained 16777216 bytes on every surviving CPU.
  - Ten SMT-thread and ten whole-core hotplug cycles passed on the patched
    kernel, including capacity checks after each removal and restoration.
    The existing limited CPU-hotplug selftest also passed.
  - Source-level state fixtures: five failures in eight scenarios before
    the fix, eight passes after it. These cover partition changes, unequal
    spans, sparse CPU IDs and boot-time map growth, but not concurrency.
  - Full x86-64 baseline and patched bzImage/modules builds passed with
    matched configs apart from LOCALVERSION. Focused ARM64, x86 without
    CONFIG_SCHED_CACHE, and x86 UP builds also passed.

Thanks to Chen Yu <yu.c.chen@intel.com> for the additional verification
and review. He reproduced the issue and confirmed that v1 restored the
expected sd->llc_bytes on:
  - AMD Ryzen 8945HX: two LLCs, eight cores per LLC.
  - Xeon: four LLCs per node.

The local tests used a single-LLC host; Chen Yu reported the multi-LLC
results above. These checks validate LLC accounting.
Builds and hotplug tests were not rerun for this comment revision.

 drivers/base/cacheinfo.c       | 11 ++++++-----
 include/linux/sched/topology.h |  4 ++--
 kernel/sched/topology.c        | 22 +++++++++++++---------
 3 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 9f9c72727a05..7a47a392568a 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -1040,9 +1040,10 @@ static int cacheinfo_cpu_online(unsigned int cpu)
 	rc = cache_add_dev(cpu);
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
 
 	free_cache_attributes(cpu);
-	if (nr_shared > 1)
+	if (nr_shared > 1) {
 		update_per_cpu_data_slice_size(false, cpu, cpu_map);
-
-	sched_update_llc_bytes(cpu);
+		sched_update_llc_bytes(cpu_map);
+	}
 
 	return 0;
 }
diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index b5d9d7c2b8ad..f96812d71c51 100644
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -281,9 +281,9 @@ static inline int task_node(const struct task_struct *p)
 }
 
 #ifdef CONFIG_SCHED_CACHE
-extern void sched_update_llc_bytes(unsigned int cpu);
+extern void sched_update_llc_bytes(const struct cpumask *cpus);
 #else
-static inline void sched_update_llc_bytes(unsigned int cpu) { }
+static inline void sched_update_llc_bytes(const struct cpumask *cpus) { }
 #endif
 
 #endif /* _LINUX_SCHED_TOPOLOGY_H */
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 0248227d983a..3dab0253976f 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -985,8 +985,8 @@ void sched_cache_active_set(void)
 }
 
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
 
 	sched_domains_mutex_lock();
 
-	sdp = rcu_dereference_sched_domain(per_cpu(sd_llc, cpu));
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
+		sdp = rcu_dereference_sched_domain(per_cpu(sd_llc, i));
+		if (!sdp)
+			continue;
+
 		sd = rcu_dereference_sched_domain(cpu_rq(i)->sd);
 		if (sd)
 			sd->llc_bytes = get_effective_llc_bytes(i, sdp);
 	}
 
-unlock:
 	sched_domains_mutex_unlock();
 }
 
base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
