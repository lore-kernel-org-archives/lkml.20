Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C681E3ED3CF
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 11:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791632077; cv=none; b=Cve9mZ/pl4uXsPerJV1IioKSMPusybu4+MzTdXsMMYK91Om6bj5YTT/pQP2PxiTfUa/W154rIe+xhi9WYlRBSP5e5i6TmOmMYA7NyZqTzAnap+LKmWpq50wHN5pcy9JDnpV+pDfeUFk6qRYbRs4fSwIrjVelyHQrKSmDm3q9msg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791632077; c=relaxed/simple;
	bh=/+TlNSm7QXTIJcMEubRH6RaGeI8wyqw+u3J0glsRWso=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ovCnkkYjAncoqPi9U3pCowsMLrVn0cxOxbrM30Woh4LrXgdOAp02+ax/vuSGhy/ikL+waNx/saDlppMEaPYh9gSRaPB4rbBO0NYt+5Bg8YEsYFiXkGhlUp3NzEICN9x+ySnvFvrgDq/brd07frwgN+6mSo7GYkgOWh67N88fsAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDF2uO4S; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDF2uO4S"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e836252e1dso4153695ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 04:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791632076; x=1792236876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=247L/iosYBVll1NKUHDCcHocrA60iOndQJiYeXqSeDs=;
        b=ZDF2uO4SNuUEw6miN5SehPbYOzjwxcpAEMia7ZC0R8O4355yadnLixAa2Y1DiiRbU0
         4Pbqo3quqXLCXF59395HAwTbNvTg6XG161VWdulnM5D+lWootIQWHfrCe03jWeiZFcxy
         rX7RPv8ntbx9DuNAnemUEIt56GEGf6ibHUQTBUpKFuPhL5b9v+jyAzOsVfK8xuI/aw4y
         XWuRcSk2T9wdnksvcqnKmZiursMX2EhYuDqVMqwTuiEj2x3dvBK3DTWhCzKgNr0zKbr7
         NmOsVXrRjwRMnClsXKE6vOaaxVaS2ZrsAlqzL2H8qdeum3w8BVfiCjcUhCjayZgsit97
         cUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791632076; x=1792236876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=247L/iosYBVll1NKUHDCcHocrA60iOndQJiYeXqSeDs=;
        b=1Lec7HZJrvqvcQUlnUQs2Sa+LWIYmF0oeoBzEjj4Uq+3zcDZkHvnZxu27byB0wwDuI
         Kj8mxrDUQMuKzS4jQRxspBBg3K+1QLb6I2LRECKHHBuCHjjXRnpghkMDhY26FsHWaNKZ
         XqdZ80Ll8cEOYJoC0iWIAnXaOEH31BujVMjZrIL6LwphRQbg4LIovLmjYT/UXwY5X2QT
         5aQGFa72HK88ZroyNZeJ0z3TsTPYXZVBGCOPqX/jhe4qGkrUiLAQf/LlV5eGX4OIL2GQ
         XngjQZSLhUp8TNiN1Y8j9ASBtjmxHqrqyxbKxiDVnAa38+F+DKThy5MeC0WkDExq0Xjz
         hFpg==
X-Forwarded-Encrypted: i=1; AKwUvBxhdoDPvX0A9+2ZZMp7VN0QnnfkSaiG9vHIJpmLYNjcCRC6vv7sQddoMReLuU0ULA26/gO1pGACrEiGmbU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeNaxqlIamX1tLxDka47qQgZ857aXFNGkGaV9M27AKTEUkyL+W
	aA0m6f70/9kagkrDLX2kIHzIZFN676Hg8VByGDcAbaUb75oSG/9Wen+5
X-Gm-Gg: AYBFou3ead/Qr2NYmLCyctkN8c1GsPxV736Y6Lt+VCbjSMWgVStITGh51QxSSyo2h6o
	mfQT+Ssi3RBKIzFfLhLS2AjhVOeV0O9KPS/FLyz6rc/LIPTsj62RxByB0WBPESrsCitgiAjNa8q
	+MYZhj9ueGiXSEG8frHbtYS9/mXBjUlGjNOhyUHeLLDs1YwO0fyyVAnbzr+YWRM688uD2fjJ0EV
	swKr6cmZyI4lfLTtM8SACGrr+O9TLGuUM2EpyE0CrXrWX2mgik5nanXRFpfFxHhMJNxmaRJ2lMV
	iN5d7+TasKx121yU4bMRK32UyzyKcxc/Ax280P8KuRab64WRQEnfLsXJoLHLOtYhy3KIHmFB1+h
	XW+2E2pYE98Ay1Ux0EQ+PPRPdzEFtVSdAb2z7EX83P5gDizN5LQSlPX9bWFnhMQAW0Nc585O0Vr
	sbqdjbSKvAZU6cKSTVBHmepg1hOit6XqIWoTpMrJSkVUX5NOAxf3XqjludHjxf8a+ui3dz1g==
X-Received: by 2002:a17:902:fc4e:b0:2dd:c170:2d4d with SMTP id d9443c01a7336-2e842abcb40mr45997035ad.24.1791632076141;
        Sat, 10 Oct 2026 04:34:36 -0700 (PDT)
Received: from localhost.localdomain ([2a05:dfc1:8bc4:feda::11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e854375642sm17557525ad.57.2026.10.10.04.34.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 04:34:34 -0700 (PDT)
From: Jemmy Wong <jemmywong512@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tim Chen <tim.c.chen@linux.intel.com>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org,
	Jemmy Wong <jemmywong512@gmail.com>
Subject: [PATCH] sched/cache: Avoid publishing partial LLC utilization
Date: Sat, 10 Oct 2026 19:34:25 +0800
Message-ID: <20261010113425.34829-1-jemmywong512@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

update_sg_lb_stats() sums utilization over the CPUs in both
sched_group_span(group) and env->cpus, but takes capacity from
group->sgc->capacity for the whole group. record_sg_llc_stats()
publishes both.

Rejecting an all-affinity-pinned source runqueue removes that CPU from
env->cpus and retries group selection. The retry can publish the
partial utilization with the full capacity. On a two-CPU LLC this
replaces 1800/2048 with 900/2048.

can_migrate_llc() then treats a busy preferred LLC as having spare
capacity. More tasks can aggregate into it, migrations out can be
blocked, and two busy LLCs may not fall back to generic balancing.
This increases CPU contention and task latency. Found by inspection.

Publish either shared LLC statistic only when env->cpus covers the
whole group. A partial scan keeps the previous complete snapshot;
other groups still refresh. Load balancing still uses the
affinity-filtered statistics.

The same window exists during CPU hotplug. env->cpus drops a CPU at
set_cpu_active(false), but the group span and sgc->capacity still
include it until cpuset_cpu_inactive() rebuilds the domains. Keeping
the previous snapshot avoids the mismatched publish. After the rebuild,
the next periodic balance records both statistics again.

Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
---
 kernel/sched/fair.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index aa4a7d22d1df..a98a62f729d4 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -12121,6 +12121,13 @@ static void record_sg_llc_stats(struct lb_env *env,
 	if (env->sd->child != rcu_dereference_all(per_cpu(sd_llc, env->dst_cpu)))
 		return;

+	/*
+	 * Affinity retries can remove CPUs from env->cpus. Do not publish
+	 * partial utilization against the capacity of the whole group.
+	 */
+	if (!cpumask_subset(sched_group_span(group), env->cpus))
+		return;
+
 	/*
 	 * At this point we know this group spans a LLC domain.
 	 * Record the statistic of this group in its corresponding
--
2.25.1
