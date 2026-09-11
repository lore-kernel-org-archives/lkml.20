Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB6A48EC93
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134535; cv=none; b=uxa2T554ibNUApgbhnesEbrtdggusrxkHty8k/Wtm56ULhgYM7CuN/JBaxCglMqHaWnWtuf1coIdfEOnA9JYlTFBwOTxi2a3TE4uAJVEz9/26ijnE8e59+ioTBGv1BIpBEXcTJMpF9XlBsYXQvRkQ0sDxTX1nXL0bIGeCFBgkOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134535; c=relaxed/simple;
	bh=mYUY1X0u4jMAiaxT3A2tqJfINJC7WO9ByblU8W1JI7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GT0ru11/OEHLe6ITd4t51mTLyShcRl+pf2Vqzoeqc8hhwKwiQQSm6RyvRItmNeiI2H5cQb6mz4J4j4Sp3SLS4zf7QAwHniDJSXgcabSTeSf1a5mpfvRyctRgRmyAMx7ZmWzx+/XHOfu+z3FysAB5EAbNS02YrS8CfYJblg015Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cuh2iY11; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cuh2iY11"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2dcff8f44f2so12490775ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789134529; x=1789739329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P7hwUc1tIO7zM19os5B2JuOflqEWXi9bUCh3PtnCIVg=;
        b=Cuh2iY11t7q21BGVBzXIiW+S3nDFEbUu2B4sEY3ukzdf8JoyAFZH70aQN5xsayHSEp
         Du6LcyNXT45vuXdXpT5F5PNdL520wZKGLfZ2Y0z8KM3nBb8ls56vqeUB6CgGHFIRS2ed
         Gl7ure2T3V+kuzi1IuQWeE+JqiiLNscF8dh2jRE9WbFmC3EeH3qA4SQQ5RwGy1naOTQp
         e2ZpDm5b5NrQHK0MhPsylfOxV5uFuv7f/r6V0MKrF+isXZXUQe0f/dKhHq+3At/QSaXo
         rdWXRgF2bfL+Per46UdI6AenVokt3Duu5pzLwvsc7v/fb+RzHFxRXWGVqIgq6w5OqWAs
         x2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134529; x=1789739329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P7hwUc1tIO7zM19os5B2JuOflqEWXi9bUCh3PtnCIVg=;
        b=fDW3N8cnAVFHXoOrJC71EnrkibLL1mSpQZi9yFBW7BOplxP5pv9ExHz/q/CPyE6s5K
         xGF5eSXncGi63wYY0VzJzflBhqgaOrwF96fAd8LtMP+/tXwhloIrtTpDIpvKWYdKWApU
         ebxrmoII+o0YqbCVI0VYiXvchwAEGGrtx5YcZclUn0hTb3iQhq6WOuv5sZSOkel2BwTk
         ULLtkWrdQTCwMGSrEkoNOJ538Jk5tT+ipNRsoDC0HirahkR5nypMKt5Emslzc7UxJdXX
         Ul/XkOhrOsI/pG9wV1eQaHePZG29wErp1++4YUCIECopFQQAqplH2rottvenzfnyMgtq
         TqdQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7iRtwmNix9uLJVoImk7qWDxLd2qB8O4P9xhGledf3kaZH8r1S60NAJIQ0aPmYCeiEoWPlQH874VP9tJw=@vger.kernel.org
X-Gm-Message-State: AFuF++n22WnNTwQwMXuHIj/TwY0SQJj+Qb+M8vFLAyZ9YEsERHYCIvd4
	liWGBfKH/ewfMBnD2weGmILzZzQAF2vgc7iSTH/FQLxd3J8nFW0r7hMj
X-Gm-Gg: AYBFou2/RoS9Ix2Nqw1UkHjxBbM/t2o+4jmo5DDCgIWw/DQW8T8yGRl1x4uQkGLeFEX
	WFFvDGCOB+S1l6ky8wE+D+3KeUfTH8rrJXfBFML9ZYzdyw8BbRBUPWhYIBwP83iPH2kiROBRcZ7
	Da6NOKwp+AkUBAnl20e9BgaOTSgpzgZffp4oaF3rtDiTZOwY7FZSgRfktjNHcZy98OACHtxORHt
	QewDhW+1wBhron14JH0dhyWguvrf0VVPvfCeANI17iLrb7t0izr8fXsjpbLDvIwANBbn5P0dg2f
	BaqqAL28ZhlOLRzj0O1SHSq4JlBzqIFoDjW2MCHVWCSIfFd2J0S6Kqe/LQFb34qZVCk8c0BD6dQ
	bEVXR7kSbJVTJ7rNJPRSPPDG/8FZohArBgWyD4tEFD0916aol0LztrXDttKr6Rn/1FX6AVzqkW0
	UuXgJSJcKPNlOlQsbcxsVcxDUecB0s7g8o5ry/73eIC20pd0TYaTbTTJOoXRUQNVa25NXKGyg3F
	vIMWLU+l3g/OjFlISrHiooGpu/c
X-Received: by 2002:a17:903:19c8:b0:2d8:d4cc:5bb2 with SMTP id d9443c01a7336-2dd2a357792mr86930675ad.18.1789134528965;
        Fri, 11 Sep 2026 06:48:48 -0700 (PDT)
Received: from localhost ([200.151.1.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfc56b1sm11650265ad.54.2026.09.11.06.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:48:48 -0700 (PDT)
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
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched/cache: Refresh LLC capacity across CPU hotplug
Date: Fri, 11 Sep 2026 10:48:05 -0300
Message-ID: <20260911134825.420748-1-davichazbh@gmail.com>
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
---
The issue was identified by tracing the scheduler/cacheinfo teardown
ordering, then checking live llc_bytes values using the running kernel's
BTF layout and /proc/kcore.

Validation:
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

This host has only one LLC, so the live checks establish the accounting
correction, not an aggregation speedup. No controlled same-version
performance comparison or multi-LLC hardware result is claimed.

 drivers/base/cacheinfo.c       | 11 ++++++-----
 include/linux/sched/topology.h |  4 ++--
 kernel/sched/topology.c        | 27 ++++++++++++---------------
 3 files changed, 20 insertions(+), 22 deletions(-)

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
index 0248227d983a..a10eecc49d51 100644
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
@@ -996,32 +996,29 @@ void sched_cache_active_set(void)
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
-	 * ci->shared_cpu_map is built incrementally as CPUs come
-	 * online, so the first CPU in an LLC initially sees
-	 * hw_weight == 1 and computes an inflated llc_bytes in
-	 * get_effective_llc_bytes().  Re-evaluating every LLC
-	 * sibling on each online event corrects this once the full
-	 * shared_cpu_map is known.
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
