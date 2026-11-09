Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242235;
	b=ICrKKz/lnl19nBDmh2IrTnlGmsRVXvo2RGpMzdT6bQHchfiAVHObB9RrL9FDGGNJxl/4
	 a0OczbWKWxNSs3l3S9ZswhHwHJtCkqyhYEEWWkakxzoHuRaUKzXoYAgv+7QvWxTnp5udn
	 FPYA520vBuZALeYG/IuTXk/Os/QoHVQ6R/7KFNOeCoR3uPbONIrKzMLSEY8pRt7ENrZGe
	 YjbpSu1Ezca9Ae63EuSOOqwLTIdJfMhcT0ONFdl8XArcB8uFTukrrx3IYN6k/2d+0eWly
	 lxz1j0ks1gSVazFBW8zvgDppbvBvOIB9iyV6bGqa4shbEAhrlzj7rhZpisBClhIa3Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jlpVF20WPjkfF8mdnXQ0DbDdBmVUqfGyIfcYvYY8RUQ=;
	b=e5e6gud64i9z91n6W8xo3d7PnLUBF+F0gWdLQn0fvwcLOA6IHccHF+Mujw+Ii2CAuotL
	 4Ta23pfErcMQeIvE/3iM4FPMLHtr4MFXxFrvUbyAHboBi8nAZ+eBnvTHtI9bYDj36zGhY
	 YrjjmfjkZkFH6OOZj4cwDkoOsEWPJvymvMb/BFc7cgU1W9iW/KFuURZ0HS0jkIJpPgkdI
	 XWwtsWvOBH/qoftDR3AlzuYsjbzKGAupOuwUjr2V45bSbyuvr3Ct2bafQoxv4iooBjKez
	 pl9MbfREH8mKsifotNw3DQspZmPDpapHa07TmChClPAUX4NRZYAt2/XTtGemeJAfSig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jjqRyeZw;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B66C606AAF6
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B66C606AAF6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jjqRyeZw
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so13341185e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242227; x=1794847027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jlpVF20WPjkfF8mdnXQ0DbDdBmVUqfGyIfcYvYY8RUQ=;
        b=jjqRyeZwKAegIVsLCDmJgzkcaidh1Czz5AccTG5O1KYjqe09GJToTPdv4bPMHoBWBP
         yFaBIdaZXXjJMwQsv1vuHOIL5LzW49PQx2Xc5wQWbxpwKC3YcJLIRkxwyewOh9+ShgV+
         CYMyEUqPuI89UqmHcT6PxIIGvfzUNraInlSI+W+duBpxNSfU2KpmZXNs3WiQDRwvzM5n
         2UvNseJrBb/qs7bCkn9v1B2GNxkWNNPobMYUdATH9w+bxOsXGWvQ+9VjmgeRaHJUQf/z
         sVuTW8NwDAhATgLUpnNfm3HEjKbQjjlz3F8O4BYwGxJrEB0fs5+pGX1/IEz0VNVH6kRv
         Mp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242227; x=1794847027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jlpVF20WPjkfF8mdnXQ0DbDdBmVUqfGyIfcYvYY8RUQ=;
        b=Ek+GNvg8W7e2DWdrxJ0kmdNO+1/Z6Ovxr/ZEt7ijeZh7JsILki8ySq+zpSjlfJan4m
         Om6yI21VFNI+FSozYAiBUGPy4ScwJYyBXJKkE3i5iDo1JSS66iUoP0VR/VwpSVvMwyQn
         eXHsqECKBnbGiAgsS9yZtllj/8Ft/8v20UkwLDVBU4KJfV3hZnTbzFj3lbrisYPdBsnh
         mcLixCYjZC1N/OVTwrF4kax2b02QPqQOsGnQ/4oNv4MTWQua/YrwtoyxFwCgRmV81+5c
         X9h0Q4jBpL5+HZOSX1qd2E3hb8CShy7/ixaQMrNo4dFiKVceU/zFkB3yylK5rukHkWOr
         Sx4Q==
X-Forwarded-Encrypted: i=1; AL+hErGF9K9ZXODIwhGKCCbPZe2BupDFKtH1R/zTicU1mGA6poCp4A1jfoYrjyeLU+xrqWcOQfPJflPfn7j9aQI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Jv4Bc+XRgF2AJqWdUQbViOWbn0zWHz5YJ1Iv0tZgODHE932+g
	zTTOwWxrKoy0ux70525qxrtGQ8nGLTyslI0i6pjNa3C0rqs9eDdqujsK
X-Gm-Gg: AYBFou2Dh0IShY7cChIFuBAfxogS1UKwTK1kDch9kmOnU5iBw8R7XWZu7FMtir23hfj
	kxeP5+vsWFD78XbHbWr1/AyG7mWlQcxj+ckAChQMPCQt+aGZUd/x5b3mhic91mgkFN8zGKInRXN
	o9QvGIFxe8RApuEStRe+ikBRWGoQpkzZu8jfYyrc/rzeDugaK5/QELhWOG6hOOVTox4Xw2LNtX1
	NujDfW/aZjZZWd5AYpQ+4tR7zMXx0p38PsZbXYwaTaVWpSgRuf6sLPzUTQKHfOilpBt4Ibh2VvY
	4qYzLXC18cdr/SupRS5QyzbORN5A+FAt1gaMyR09/X+PkigVGyeLi7reQRBsKiCZKs2A450vYFu
	6+uSalHn4VfcJg7eZ3rQ7MRg0MgI7la0uMNfwGJm0zNg7VsdCs5mxMyopS8HzfgRiyA0eMie3pv
	a1mT1UF2zW0NIJx7Bi1zjL5XOL7eBuAdSxA2AKEbPJLCWFJFr87FOt7wp5OaL1RWBqxx4VWBACs
	VZOptyTkCMGPy33RAfvrygoDM4TfTBbMpWEXRNJ+8pdrQjvxETKqDosZ0efeO/DSlspGweIMa0s
	6A8aHUdmleIwiNLmA6itd2di9w==
X-Received: by 2002:a05:600c:6092:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4b963c87c64mr86784315e9.34.1794242226727;
        Mon, 09 Nov 2026 08:37:06 -0800 (PST)
Received: from victus-lab ([193.205.81.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b96cd012e1sm138851295e9.8.2026.11.09.08.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:37:06 -0800 (PST)
From: Yuri Andriaccio <yurand2000@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Yuri Andriaccio <yuri.andriaccio@santannapisa.it>
Subject: [RFC PATCH v7 29/29] sched/rt: Introduce multi-cpu support
Date: Mon,  9 Nov 2026 17:36:15 +0100
Message-ID: <20261109163616.195264-30-yurand2000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109163616.195264-1-yurand2000@gmail.com>
References: <20261109163616.195264-1-yurand2000@gmail.com>
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

Introduce per-cpu overrides to server's runtime and period: it is now possible
to override a subset of cpus HCBS setup by writing to the cpu.rt.max file.

The new syntax is as follows:
max [<period_us>]				  - Set whole cgroup to `max`.
						    Remove any overrides.
default runtime=max				  - As above.
<runtime_us> <period_us>			  - Set default runtime/period.
						    Keeps overrides.
default runtime=<runtime_us> period=<period_us>	  - As above.
<cpumask> default				  - Remove override for the
						    given cpumask. Resets to
						    the default runtime and
						    period.
<cpumask> runtime=<runtime_us> period=<period_us> - Set override for the
						    given cpumask.

To keep consistency between the cpumask and the overrides, it is not possible
to override a cpu to zero runtime. Shrink the cpuset controller cpumask
instead.

If the cgroup defaults to zero runtime, defaulting an override will reset the
cpus to zero runtime. A zero runtime cgroup which has all of its cpus
overriden to non-zero can be scheduled onto (but for consistency, if not all
cpus are overriden, running tasks is disallowed).

Details:
- update struct dl_bandwidth to store per-cpu runtime and period overrides.
- introduce tg_set_rt_bandwidth_override to set a cpuset's override.
- update schedulability/admission checks.
- update cpu.rt.max interface to support per-cpu overrides.

Signed-off-by: Yuri Andriaccio <yurand2000@gmail.com>
---
 kernel/sched/core.c     |  89 ++++++++++++++-
 kernel/sched/deadline.c |  23 ++++
 kernel/sched/rt.c       | 237 ++++++++++++++++++++++++++++++++++++----
 kernel/sched/sched.h    |   7 ++
 4 files changed, 331 insertions(+), 25 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 4321be11c6c7..bf57da4f59d9 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -10494,9 +10494,20 @@ static int cpu_rt_max_show(struct seq_file *sf, void *v)
 {
 	struct task_group *tg = css_tg(seq_css(sf));
 	u64 period_us, runtime_us;
+	int cpu;
 
 	tg_rt_bandwidth(tg, &period_us, &runtime_us);
 	cpu_period_quota_print(sf, period_us, runtime_us);
+
+	if (tg == &root_task_group)
+		return 0;
+
+	for_each_possible_cpu(cpu) {
+		tg_rt_single_bandwidth(tg, cpu, &period_us, &runtime_us);
+		if (runtime_us != RUNTIME_INF)
+			cpu_period_quota_single_print(sf, cpu, period_us, runtime_us);
+	}
+
 	return 0;
 }
 
@@ -10510,19 +10521,91 @@ static int cpu_rt_internal_show(struct seq_file *sf, void *v)
 		tg_rt_internal_bandwidth(tg, cpu, &period_us, &runtime_us);
 		cpu_period_quota_single_print(sf, cpu, period_us, runtime_us);
 	}
+
 	return 0;
 }
 
+static int __cpu_rt_max_parse(char *buf, struct cpumask *mask,
+			      u64 *period_us_p, u64 *quota_us_p)
+{
+	char *tok, *runtime_key, *period_key;
+
+	tok = strsep(&buf, " ");
+	if (!tok)
+		return -EINVAL;
+
+	if (strncmp(tok, "max", sizeof("max")) == 0) {
+		*quota_us_p = RUNTIME_INF;
+		return 0;
+	}
+
+	if (strncmp(tok, "default", sizeof("default")) == 0) {
+		if (strncmp(buf, "runtime=max", sizeof("runtime=max")) == 0) {
+			*quota_us_p = RUNTIME_INF;
+			*period_us_p = 0;
+			return 0;
+		}
+
+		if (!buf)
+			return -EINVAL;
+
+		goto parse_keys;
+	}
+
+	if (buf && sscanf(buf, "%llu", period_us_p) == 0) {
+		if (cpulist_parse(tok, mask) != 0)
+			return -EINVAL;
+
+		goto parse_cpumask;
+	}
+
+	if (sscanf(tok, "%llu", quota_us_p) < 1)
+		return -EINVAL;
+
+	return 0;
+
+parse_cpumask:
+	if (strncmp(buf, "default", sizeof("default")) == 0) {
+		*quota_us_p = RUNTIME_INF;
+		*period_us_p = RUNTIME_INF;
+		return 0;
+	}
+
+parse_keys:
+	runtime_key = strstr(buf, "runtime=");
+	period_key = strstr(buf, "period=");
+
+	if (runtime_key &&
+	    period_key &&
+	    sscanf(runtime_key, "runtime=%llu", quota_us_p) == 1 &&
+	    sscanf(period_key, "period=%llu", period_us_p) == 1)
+		return 0;
+
+	return -EINVAL;
+}
+
 static ssize_t cpu_rt_max_write(struct kernfs_open_file *of,
 			        char *buf, size_t nbytes, loff_t off)
 {
 	struct task_group *tg = css_tg(of_css(of));
-	u64 period_us = 0, runtime_us;
+	cpumask_var_t mask __free(free_cpumask_var) = CPUMASK_VAR_NULL;
+	u64 period_us, runtime_us;
 	int ret;
 
-	ret = cpu_period_quota_parse(buf, &period_us, &runtime_us);
-	if (!ret)
+	if (!alloc_cpumask_var(&mask, GFP_NOWAIT))
+		return -ENOMEM;
+
+	cpumask_clear(mask);
+
+	ret = __cpu_rt_max_parse(buf, mask, &period_us, &runtime_us);
+	if (ret)
+		return ret;
+
+	if (cpumask_empty(mask))
 		ret = tg_set_rt_bandwidth(tg, period_us, runtime_us);
+	else
+		ret = tg_set_rt_bandwidth_override(tg, mask, period_us, runtime_us);
+
 	return ret ?: nbytes;
 }
 #endif /* CONFIG_RT_GROUP_SCHED */
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 0282258db3e9..392e48b63698 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -593,24 +593,47 @@ static inline int is_leftmost(struct sched_dl_entity *dl_se, struct dl_rq *dl_rq
 static void init_dl_rq_bw_ratio(struct dl_rq *dl_rq);
 
 struct dl_bandwidth *alloc_dl_bandwidth(struct dl_bandwidth *dl_b, gfp_t gfp_flags) {
+	u64 *period_overrides  __free(kfree) = NULL;
+	u64 *runtime_overrides __free(kfree) = NULL;
+
+	period_overrides = kcalloc(nr_cpu_ids, sizeof(u64), gfp_flags);
+	if (!period_overrides)
+		return NULL;
+
+	runtime_overrides = kcalloc(nr_cpu_ids, sizeof(u64), gfp_flags);
+	if (!runtime_overrides)
+		return NULL;
+
 	if (!alloc_cpumask_var(&dl_b->active_mask, gfp_flags))
 		return NULL;
 
+	dl_b->dl_period_overrides  = no_free_ptr(period_overrides);
+	dl_b->dl_runtime_overrides = no_free_ptr(runtime_overrides);
+
 	return dl_b;
 }
 
 void free_dl_bandwidth(struct dl_bandwidth *dl_b) {
 	free_cpumask_var(dl_b->active_mask);
+	kfree(dl_b->dl_period_overrides);
+	kfree(dl_b->dl_runtime_overrides);
 }
 
 void init_dl_bandwidth(struct dl_bandwidth *dl_b, u64 period, u64 runtime,
 		       struct task_group *active_context)
 {
+	int cpu;
+
 	raw_spin_lock_init(&dl_b->dl_runtime_lock);
 	dl_b->dl_period = period;
 	dl_b->dl_runtime = runtime;
 	dl_b->active_context = active_context;
 	cpumask_clear(dl_b->active_mask);
+
+	for_each_possible_cpu(cpu) {
+		dl_b->dl_period_overrides[cpu]  = RUNTIME_INF;
+		dl_b->dl_runtime_overrides[cpu] = RUNTIME_INF;
+	}
 }
 
 
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index e5f05aeabd5c..8702d0e0c4e3 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -2428,11 +2428,25 @@ static int tg_subtree_has_rt_tasks(struct task_group *tg) {
 }
 
 static inline u64 tg_cpu_period(const struct dl_bandwidth *dl_b, int cpu) {
-	return cpumask_test_cpu(cpu, dl_b->active_mask) ? dl_b->dl_period : 0;
+	u64 period;
+
+	if (dl_b->dl_period_overrides[cpu] == RUNTIME_INF)
+		period = dl_b->dl_period;
+	else
+		period = dl_b->dl_period_overrides[cpu];
+
+	return cpumask_test_cpu(cpu, dl_b->active_mask) ? period : 0;
 }
 
 static inline u64 tg_cpu_runtime(const struct dl_bandwidth *dl_b, int cpu) {
-	return cpumask_test_cpu(cpu, dl_b->active_mask) ? dl_b->dl_runtime : 0;
+	u64 runtime;
+
+	if (dl_b->dl_runtime_overrides[cpu] == RUNTIME_INF)
+		runtime = dl_b->dl_runtime;
+	else
+		runtime = dl_b->dl_runtime_overrides[cpu];
+
+	return cpumask_test_cpu(cpu, dl_b->active_mask) ? runtime : 0;
 }
 
 struct tg_update_data {
@@ -2542,8 +2556,9 @@ static int __tg_rt_schedulable(struct task_group *tg, void *data)
 	/*
 	 * Cannot have more runtime than the period.
 	 */
-	if (dl_b->dl_runtime > dl_b->dl_period)
-		return -EINVAL;
+	for_each_possible_cpu(cpu)
+		if (tg_cpu_runtime(dl_b, cpu) > tg_cpu_period(dl_b, cpu))
+			return -EINVAL;
 
 	/*
 	 * Ensure we don't starve existing RT tasks if runtime turns zero.
@@ -2551,16 +2566,21 @@ static int __tg_rt_schedulable(struct task_group *tg, void *data)
 	if (dl_bandwidth_enabled() && !dl_b->dl_runtime && tg != &root_task_group &&
 	    tg_subtree_has_rt_tasks(tg))
 		return -EBUSY;
-
-	total = to_ratio(dl_b->dl_period, dl_b->dl_runtime);
-
 	/*
 	 * Nobody can have more than the global setting allows.
 	 */
-	if (total > to_ratio(global_rt_period(), global_rt_runtime()))
-		return -EINVAL;
+	for_each_possible_cpu(cpu) {
+		total = to_ratio(tg_cpu_period(dl_b, cpu), tg_cpu_runtime(dl_b, cpu));
+		if (total > to_ratio(global_rt_period(), global_rt_runtime()))
+			return -EINVAL;
+	}
 
+	/*
+	 * By definition the root_task_group has the same settings for all cpus,
+	 * and the overrides are always disabled.
+	 */
 	if (tg == &root_task_group) {
+		total = to_ratio(dl_b->dl_period, dl_b->dl_runtime);
 		if (!dl_check_tg(total))
 			return -EBUSY;
 	}
@@ -2665,6 +2685,34 @@ int tg_rt_bandwidth(struct task_group *tg,
 	return 0;
 }
 
+int tg_rt_single_bandwidth(struct task_group *tg, int cpu,
+			   u64 *rt_period_us, u64 *rt_runtime_us)
+{
+	const struct dl_bandwidth *dl_b;
+	cpumask_var_t mask __free(free_cpumask_var) = CPUMASK_VAR_NULL;
+
+	if (!alloc_cpumask_var(&mask, GFP_NOWAIT))
+		return 0;
+
+	cpuset_effective_cpus(tg->css.cgroup, mask);
+
+	guard(raw_spinlock_irq)(dl_bw_lock_of_tg(tg));
+	dl_b = dl_bandwidth_read(tg);
+
+	if (dl_b->dl_runtime_overrides[cpu] == RUNTIME_INF) {
+		*rt_runtime_us = RUNTIME_INF;
+		return 0;
+	}
+
+	*rt_runtime_us = tg_cpu_runtime(dl_b, cpu);
+	*rt_runtime_us = div64_u64(*rt_runtime_us, NSEC_PER_USEC);
+
+	*rt_period_us  = tg_cpu_period(dl_b, cpu);
+	*rt_period_us  = div64_u64(*rt_period_us, NSEC_PER_USEC);
+
+	return 0;
+}
+
 int tg_rt_internal_bandwidth(struct task_group *tg, int cpu,
 			     u64 *rt_period_us, u64 *rt_runtime_us)
 {
@@ -2680,16 +2728,40 @@ int tg_rt_internal_bandwidth(struct task_group *tg, int cpu,
 	dl_b = dl_bandwidth_read(tg);
 
 	*rt_runtime_us = -1;
+	*rt_period_us  = 0;
 	if (dl_b->dl_runtime != RUNTIME_INF || !cpumask_test_cpu(cpu, mask)) {
 		*rt_runtime_us = tg->dl_se[cpu]->dl_runtime;
 		*rt_runtime_us = DIV64_U64_ROUND_CLOSEST(*rt_runtime_us, NSEC_PER_USEC);
-	}
 
-	*rt_period_us = div64_u64(dl_b->dl_period, NSEC_PER_USEC);
+		*rt_period_us = div64_u64(tg->dl_se[cpu]->dl_period, NSEC_PER_USEC);
+	}
 
 	return 0;
 }
 
+static void __update_parent_runtime(struct tg_update_data *update,
+				    struct task_group *parent_ctx,
+				    const struct cpumask *mask,
+				    u64 *children_runtime)
+{
+	const struct dl_bandwidth *dl_b;
+	u64 period, runtime;
+	int cpu;
+
+	if (parent_ctx == &root_task_group)
+		return;
+
+	dl_b = dl_bandwidth_read(parent_ctx);
+
+	tg_compute_children_runtime(parent_ctx, update, mask, children_runtime);
+	for_each_cpu(cpu, mask) {
+		period = tg_cpu_period(dl_b, cpu);
+		runtime = tg_cpu_runtime(dl_b, cpu) - children_runtime[cpu];
+
+		dl_init_tg(parent_ctx->dl_se[cpu], runtime, period);
+	}
+}
+
 int tg_set_rt_bandwidth(struct task_group *tg,
 			u64 rt_period_us, u64 rt_runtime_us)
 {
@@ -2700,7 +2772,6 @@ int tg_set_rt_bandwidth(struct task_group *tg,
 	const struct dl_bandwidth *dl_b;
 	u64 rt_period, rt_runtime, old_rt_runtime;
 	u64 *rt_actual_runtime __free(kfree) = NULL;
-	u64 period, runtime;
 	struct sched_attr attr;
 	int err, i;
 
@@ -2768,6 +2839,10 @@ int tg_set_rt_bandwidth(struct task_group *tg,
 
 	init_dl_bandwidth(&update.dl_b, rt_period, rt_runtime, dl_b->active_context);
 	update.tg = tg;
+	for_each_possible_cpu(i) {
+		update.dl_b.dl_period_overrides[i]  = dl_b->dl_period_overrides[i];
+		update.dl_b.dl_runtime_overrides[i] = dl_b->dl_runtime_overrides[i];
+	}
 
 	cpuset_effective_cpus(tg->css.cgroup, update.dl_b.active_mask);
 
@@ -2807,19 +2882,128 @@ int tg_set_rt_bandwidth(struct task_group *tg,
 	/*
 	 * Update the dl_servers of the parent's active context
 	 */
-	if (parent_ctx == &root_task_group)
-		return 0;
+	__update_parent_runtime(&update, parent_ctx, update.dl_b.active_mask, rt_actual_runtime);
 
-	dl_b = dl_bandwidth_read(parent_ctx);
+	return 0;
+}
 
-	tg_compute_children_runtime(parent_ctx, &update, update.dl_b.active_mask, rt_actual_runtime);
-	for_each_cpu(i, update.dl_b.active_mask) {
-		period = tg_cpu_period(dl_b, i);
-		runtime = tg_cpu_runtime(dl_b, i) - rt_actual_runtime[i];
+int tg_set_rt_bandwidth_override(struct task_group *tg,
+				 const struct cpumask *rt_mask,
+				 u64 rt_period_us,u64 rt_runtime_us)
+{
+	struct tg_update_data update;
+	struct dl_bandwidth *__update_dl_b __free(dl_bandwidth_free) = NULL;
+	struct task_group *parent_ctx;
+	struct dl_bandwidth *dl_b_write;
+	const struct dl_bandwidth *dl_b;
+	u64 rt_period, rt_runtime;
+	u64 *rt_actual_runtime __free(kfree) = NULL;
+	struct sched_attr attr;
+	int err, i;
 
-		dl_init_tg(parent_ctx->dl_se[i], runtime, period);
+	if (rt_runtime_us == RUNTIME_INF)
+		rt_runtime = RUNTIME_INF;
+	else if ((u64)rt_runtime_us > U64_MAX / NSEC_PER_USEC)
+		return -EINVAL;
+	else
+		rt_runtime = (u64)rt_runtime_us * NSEC_PER_USEC;
+
+	if (rt_runtime == RUNTIME_INF)
+		rt_period = RUNTIME_INF;
+	else if ((u64)rt_period_us > U64_MAX / NSEC_PER_USEC)
+		return -EINVAL;
+	else
+		rt_period = (u64)rt_period_us * NSEC_PER_USEC;
+
+	/*
+	 * The root_task_group bandwidth settings are only used to reserve bw
+	 * for HCBS cgroups; changing a subset of cpus has no meaning there.
+	 */
+	if (tg == &root_task_group)
+		return -EINVAL;
+
+	/*
+	 * Bound quota to defend quota against overflow during bandwidth shift.
+	 */
+	if (rt_runtime != RUNTIME_INF && rt_runtime > max_rt_runtime)
+		return -EINVAL;
+
+	/*
+	 * Check if the runtime and period min and max values are admissible.
+	 */
+	attr = (struct sched_attr){
+		.sched_flags = 0,
+		.sched_runtime = rt_runtime,
+		.sched_deadline = rt_period,
+		.sched_period = rt_period,
+	};
+
+	if (rt_runtime != RUNTIME_INF && !__checkparam_dl(&attr, false))
+		return -EINVAL;
+
+	guard(mutex)(&rt_constraints_mutex);
+	dl_b = dl_bandwidth_read(tg);
+
+	guard(sched_rt_handler)();
+	guard(sched_domains)();
+	guard(rcu)();
+	/*
+	 * Disallow resetting overrides to active default-zero cgroups
+	 */
+	if (rt_runtime == RUNTIME_INF && dl_b->dl_runtime == 0 &&
+	    tg_subtree_has_rt_tasks(tg))
+		return -EINVAL;
+
+	rt_actual_runtime = kcalloc(nr_cpu_ids, sizeof(u64), GFP_NOWAIT);
+	if (!rt_actual_runtime)
+		return -ENOMEM;
+
+	__update_dl_b = alloc_dl_bandwidth(&update.dl_b, GFP_NOWAIT);
+	if(!__update_dl_b)
+		return -ENOMEM;
+
+	init_dl_bandwidth(&update.dl_b, dl_b->dl_period, dl_b->dl_runtime, dl_bandwidth_read(tg)->active_context);
+
+	update.tg = tg;
+	cpuset_effective_cpus(tg->css.cgroup, update.dl_b.active_mask);
+
+	/* Check if the input mask is a subset of the cpuset mask */
+	if (!cpumask_subset(rt_mask, update.dl_b.active_mask))
+		return -EINVAL;
+
+	for_each_cpu_andnot(i, update.dl_b.active_mask, rt_mask) {
+		update.dl_b.dl_period_overrides[i]  = dl_b->dl_period_overrides[i];
+		update.dl_b.dl_runtime_overrides[i] = dl_b->dl_runtime_overrides[i];
+	}
+
+	for_each_cpu_and(i, update.dl_b.active_mask, rt_mask) {
+		update.dl_b.dl_period_overrides[i]  = rt_period;
+		update.dl_b.dl_runtime_overrides[i] = rt_runtime;
 	}
 
+	err = tg_rt_schedulable(&update, rt_actual_runtime);
+	if (err)
+		return err;
+
+	scoped_guard(raw_spinlock_irq, dl_bw_lock_of_tg(tg)) {
+		dl_b_write = dl_bandwidth_write(tg);
+		for_each_cpu(i, rt_mask) {
+			dl_b_write->dl_period_overrides[i]  = rt_period;
+			dl_b_write->dl_runtime_overrides[i] = rt_runtime;
+		}
+	}
+
+	parent_ctx = dl_bandwidth_read(tg->parent)->active_context;
+
+	for_each_cpu(i, rt_mask) {
+		dl_init_tg(tg->dl_se[i], rt_actual_runtime[i], tg_cpu_period(dl_b, i));
+	}
+
+	/*
+	 * Update the dl_servers of the parent's active context
+	 */
+	__update_parent_runtime(&update, parent_ctx, rt_mask, rt_actual_runtime);
+
 	return 0;
 }
 
@@ -2883,6 +3067,8 @@ int tg_can_offline_cpu(int cpu) {
 int sched_rt_can_attach(struct task_group *tg)
 {
 	struct task_group *ctx;
+	const struct dl_bandwidth *dl_b;
+	int cpu;
 
 	/* If rt group sched is disabled, tasks are always run in the root rq */
 	if (!rt_group_sched_enabled())
@@ -2897,8 +3083,15 @@ int sched_rt_can_attach(struct task_group *tg)
 
 	/* Don't accept real-time tasks when there is no way for them to run */
 	scoped_guard(raw_spinlock_irqsave, dl_bw_lock_of_tg(ctx)) {
-		if (dl_bandwidth_read(ctx)->dl_runtime == 0)
-			return 0;
+		dl_b = dl_bandwidth_read(ctx);
+
+		if (dl_b->dl_runtime)
+			return 1;
+
+		/* Allow default-zero but fully overridden cgroups to be attached to */
+		for_each_cpu(cpu, dl_b->active_mask)
+			if (tg_cpu_runtime(dl_b, cpu) == 0)
+				return 0;
 	}
 
 	return 1;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index a6aae4375a31..5ea5fd420305 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -317,6 +317,8 @@ struct dl_bandwidth {
 	raw_spinlock_t		dl_runtime_lock;
 	u64			dl_runtime;
 	u64			dl_period;
+	u64			*dl_runtime_overrides;
+	u64			*dl_period_overrides;
 	cpumask_var_t		active_mask;
 	struct task_group	*active_context;
 };
@@ -586,10 +588,15 @@ extern bool cfs_task_bw_constrained(struct task_struct *p);
 
 extern int tg_rt_bandwidth(struct task_group *tg,
 			   u64 *rt_period_us, u64 *rt_runtime_us);
+extern int tg_rt_single_bandwidth(struct task_group *tg, int cpu,
+				  u64 *rt_period_us, u64 *rt_runtime_us);
 extern int tg_rt_internal_bandwidth(struct task_group *tg, int cpu,
 				    u64 *rt_period_us, u64 *rt_runtime_us);
 extern int tg_set_rt_bandwidth(struct task_group *tg,
 			       u64 rt_period_us, u64 rt_runtime_us);
+extern int tg_set_rt_bandwidth_override(struct task_group *tg,
+					const struct cpumask *rt_mask,
+					u64 rt_period_us, u64 rt_runtime_us);
 extern int tg_can_offline_cpu(int cpu);
 extern int sched_rt_can_attach(struct task_group *tg);
 
-- 
2.56.0

