Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E47F4BA1F4
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004183; cv=none; b=GCZjGtHKh45GhVIueGZdeKEw6kcL5xHTZm4rDWeoHLD6PNcBqPVu6FY/Nw9rzNMjG0pkTm6WfkR1GI97J0EwaR54WHWsgogz6znh+KUW1b3RVeMZiWv9nLQ/1pgZ7n7Qz/ZPk7tG2uH7imA4qSsyM1nMMAUnbTW76MKSzOuZonY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004183; c=relaxed/simple;
	bh=C6F+Fmk3tTihtf08pXapvACKxjH2ct8OvBSqTK4plhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KZltmqrmMPRzFNhAP7zoqJibZzu9lh+F6F1FZ0/rk9jCiQrbK7T/tuUIWF+5QimE+eBYMlf3sSqUiWRV79L2UTOhVjqCH5EHc/JW+hf4k2RyT89zG9IiCUgHxFGpoGlvmeO4GVle7W4Nr87+6FRkG/tGmh+JcJ2RTVdBl2F5z5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=onx5Omux; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="onx5Omux"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so16802155e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790004180; x=1790608980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/uhUsAanGewnh2bM3AvBeAQ7knN/46rOtFLZpMDn/lo=;
        b=onx5OmuxhPuINRBgcBZp5x6O/H09XEJXtVTPwu13q5HEREoJwrnCZn5BQw7Yb1TGUK
         ofIzLE3tCc9x5LOHVAEXcRxSK7++vM/BXmCssDLOEfBa2uqs6esBJIe0mcGeESq44cr/
         KUz+Iuk1bPqZT0sDgLRGzZAvqiU/VHKLk2diHjjFlGqYX6ufoRNSH+nffsGNPZWt6snf
         0zrxQJwJHWFv/oneLSfMC2Cs4pNlSViPzvTfaTESkb7+inysmMHcfK3pxvMkDK5EngLv
         GUbgLXcS4E77jP8aQwqINkwCe/KLB/bopSjA5YIQe/+3EZ+Ftzr9KKEwQngllVcD0I7D
         aV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004180; x=1790608980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/uhUsAanGewnh2bM3AvBeAQ7knN/46rOtFLZpMDn/lo=;
        b=aEPh1ePharA5VqKi5vjn7iRL+zsVBhpwyCE+JHWFS6nBAnmebV2D9q2jxEwfu268Rf
         ubUltcz2dpwlQLgGMd2iu3bq3clIhGxiZIr1YIHCnQo6Kj7r/68m0yXJ9baI/1J1OXGB
         J1T6PjY41PGH4j79rttLqCOTGepTTXRFLjdF8dWr5T0YhOOkubtP+NHjGtOA4QQ8es7c
         NMaSQSHiEf6DXGrBg974aEPboI8dULmPcvxkXLzfYLHKGpvLOb1Z4N5VN//jgO8CWC4E
         /yX6yHRsp4SnosI/hC2FK4K5MMxsqMJ6e1jSxLHvk6OBSybdgnr7+KTkUKzqAodY3Qri
         AAqw==
X-Forwarded-Encrypted: i=1; AKwUvBxMf1c0uOAZTJQpIsE9MWNgLkx/jrpO0DSdxUKfvRKZ+2jmBU3TLAsMj9kCVg0F6XYUZoloOeX+tgRA2oM=@vger.kernel.org
X-Gm-Message-State: AFuF++kQ4bJQV1HtpddQv0vWS899JE6/zDAtyIqmnXVo4NDx+kL4mrUF
	tB8JZkKWX7cSYXMER7wRT1Py9QpBtirJzJQgA9F9mmwv0OIdLFpKP3Hpcz89R5ldBqA=
X-Gm-Gg: AYBFou2HDISIsYVh2HEuduE3Z7klFs4pgmi7ygqPICo2osY9NA9VpYV1hnZtXXT0Vci
	9uaqGRIKLsv6LozYZ7CL6N970EL98MU+bqyWvoqr/F422qoh7TDrxLWO5LDnihn2woTlP+1URSb
	0lUf5aj4mKeJBPBIgl0n/3p1xctZKsN9awu8V1uvht/j+kUWS6SvxzdCQ2jdtO5jvbfoDNoZPwL
	F/E2bZ+kgG3PTw8Zja5lGIJP8yDGfxps4QA9mcyf9iBTDFrslyLIC1v1NjjZX0QxRDlOL8nvb6N
	5ALXZWVDpOYkHbOCqc3EKDrkRewhglGXs27EiD8aAvvDO+UQ0S7cc449ZxCGT1Becw9MwB24iX4
	+mUwUdUAsTHyG5S7vvs/ygcSIECacTujGoCIWxdhupIiFYhvQq+nY2vrHy/BdpLSmUXq5MfF6jt
	TCRqfS7rKZBb/7nUa4RKJuovCuINxT/01uJa+uVfbmGYbWTvEjz7PuSqaeWoIRQvpSJq1ycnorV
	GM53WAXo7Hnr38=
X-Received: by 2002:a05:600c:6305:b0:49f:c2ef:cfb9 with SMTP id 5b1f17b1804b1-49fc56719a8mr123284685e9.4.1790004179612;
        Mon, 21 Sep 2026 08:22:59 -0700 (PDT)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:df5:e9a4:98b5:65d1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd8bf159sm223745675e9.10.2026.09.21.08.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:22:59 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Cc: qyousef@layalina.io,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 8/8] sched/eevdf: Add min slice check when selecting CPU
Date: Mon, 21 Sep 2026 17:22:38 +0200
Message-ID: <20260921152238.3804392-9-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921152238.3804392-1-vincent.guittot@linaro.org>
References: <20260921152238.3804392-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new level for selecting CPU when select_task_rq_fair() fails to find
an idle CPU. This last level will compare the slice to select a CPU where
the task could run 1st.
This helps a waking task to select a CPU where a longer slice runs
instead of one where a task with the same or shorter slice already runs.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 63 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 452da94289fe..5c9add3e853c 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9023,6 +9023,59 @@ static inline bool asym_fits_cpu(unsigned long util,
 	return true;
 }
 
+static int select_slice_cpu(struct task_struct *p, struct sched_domain *sd, int target)
+{
+	unsigned long task_util, util_min, util_max;
+	int cpu, nr = INT_MAX;
+	u64 slice = p->se.slice;
+	struct cpumask *cpus;
+
+	if (sched_feat(SIS_UTIL) && sd->shared) {
+		/*
+		 * Same nr_idle_scan hint as select_idle_cpu(), nr only limits
+		 * the scan when not preferring an idle core.
+		 */
+		nr = READ_ONCE(sd->shared->nr_idle_scan) + 1;
+		/* overloaded domain is unlikely to have idle cpu/core */
+		if (nr == 1)
+			return -1;
+	}
+
+	cpus = this_cpu_cpumask_var_ptr(select_rq_mask);
+	cpumask_and(cpus, sched_domain_span(sd), p->cpus_ptr);
+
+	if (sched_asym_cpucap_active()) {
+		task_util = task_util_est(p);
+		util_min = uclamp_eff_value(p, UCLAMP_MIN);
+		util_max = uclamp_eff_value(p, UCLAMP_MAX);
+	}
+
+	/* Those CPUs have been tested not being idle and fiting */
+	for_each_cpu_wrap(cpu, cpus, target) {
+		/*
+		 * Stop when the nr_idle_scan is exhausted (mirrors
+		 * select_idle_cpu() logic).
+		 */
+		if (--nr <= 0)
+			return -1;
+
+		if (slice >= get_rq_min_slice(cpu_rq(cpu)))
+			continue;
+
+		if (sched_asym_cpucap_active()) {
+			int fits = util_fits_cpu(task_util, util_min, util_max, cpu);
+
+			/* Perfect fit: capacity satisfies util + uclamp */
+			if (fits > 0)
+				return cpu;
+		} else {
+			return cpu;
+		}
+	}
+
+	return -1;
+}
+
 /*
  * Try and locate an idle core/thread in the LLC cache domain.
  */
@@ -9117,7 +9170,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 		 */
 		if (sd) {
 			i = select_idle_capacity(p, sd, target);
-			return ((unsigned)i < nr_cpumask_bits) ? i : target;
+			if ((unsigned int)i < nr_cpumask_bits)
+				return i;
+
+			goto select_slice;
 		}
 	}
 
@@ -9150,6 +9206,11 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 	if ((unsigned int)recent_used_cpu < nr_cpumask_bits)
 		return recent_used_cpu;
 
+select_slice:
+	i = select_slice_cpu(p, sd, target);
+	if ((unsigned int)i < nr_cpumask_bits)
+		return i;
+
 	return target;
 }
 
-- 
2.53.0

