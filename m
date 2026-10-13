Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71EF3B14B7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881033; cv=none; b=CTl7osD/bImcYl5URESOOO2AAXsgJw4pE6bh+nnPdHi3xbRKvF8xdIBczCkXJGQ7uJoFXGNiHrQ59Jwa68O8GTTQ3RoB2+9Lwe+kL8ClJYjNe8q2byGko0UOyowA2EuJUQCG7No1VkYEVlfoTuEi3DsocreMMxwKlrsCV/8Ycrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881033; c=relaxed/simple;
	bh=Joji4zp6pv5Twj/uBO1a+P6hcfHJt9IF6zPKPEQchCw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ra5MjxyqZbNDpLTjxQ5E1s6fQbVdkPRr0p1phX6jxHHn2vpLhjTM2o8e7tpzM9Z5iHOGJeDkvmmU20ubytMmUUnjuOrMMT/+QbUMAbtvWhw4bOoydPb0XuAoub9U6XpaPpxhduID65yOagf1MjVhNQGLS2w8kvXlViCgMLNfmjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbDqIeoH; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbDqIeoH"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc502d509c0so758382a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791881031; x=1792485831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rSO5b9MbWN9K4JeL/tFQ5KTnIGqjzZA2uMHcl22/ORY=;
        b=LbDqIeoHruTF+FqDLIYUznZzz7Fp4su/NkMd0gJcOGe/ytezfO93Cm/QaiFSePERca
         o/HRWOfEFx+tntR/xsDfgUb7KwwZmXkKxnQ+JNmLpREXWkiRJK/SuYpK+52UfPyASCHi
         bVE6WGdQCJeT1FjN6jfKGQbhan+6fGpEBXnDa+j7fcTcO+4PU0hwnd17/JT1h58q83+T
         JFEfq697wXPJLfEkgCnxtd/9b852V4JY8NpAbkUfCc+FLrkzd0TCy2GfXdL8wRYdHwhZ
         elVqBXLugYJOKgtGbt/xexdWyg1KnHpLL8eqjWxreeK9s42IukwCCwDeB86NP7dqu4/C
         divA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881031; x=1792485831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rSO5b9MbWN9K4JeL/tFQ5KTnIGqjzZA2uMHcl22/ORY=;
        b=hfHcvYRHdPyEGTykURA5wgkl0Qf/p3Jx1QOZlefArvtNEWHFCgfhJ25BCdnHhPZGj5
         QJVtIA9a2bI3NjKwBM9OtFhykqs9+JygwolZsW4kyUb7Ef18lhx6S5eVr2Ps0uf0/bvq
         CcX3Cb2XQSaxEnkR9yG3Y9AGKPXMoRmTy83QL9z+WboQIvAatIqhf5FkrWbHNoYQYVjn
         INjeuq8ju/qxbe0g1oTih+GX5d2dHVfFLnJChWQZBAgYZVJeP385tlacPePpk8gXE18G
         SdCJoJvBbWVDvhFgPwOFLsxjI5RjI6MDBOvpTEMvfNvHUppgyVl+NAZTjyQYFVdva0kW
         ARHQ==
X-Forwarded-Encrypted: i=1; AKwUvByKYn6BBl90LGzTg/YsYmfMPBvg2nLOaXSOViPH0jJu+DBl/6Pm6SbUddZ9FlVb/ZHbMSGfS+vfMzqbFMM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZLv4NJHVyYg8z6x8MGp1UjczGYKOW0hUJERXO2WT4XoxgXWfm
	v1OJ2w6xEiR/X8pylelF3utyckw0wxCzpUgD9kc1T8TXfjPC34CDoVeq
X-Gm-Gg: AYBFou1nDnrNpaY9J094/nzdUplFis0xNw42mgeJ9l0/N0fFy9HyKslLbLbQ3glfjdf
	VYKcHRINsE8QEquN9sFEPA1f6W3U54i1uLQqBmt9nOnR2FM+4KQlcfkUbJZN65Rv/uSQw2SVpC7
	DQZ7i0RXINM4KdNFLqS8Ri2MabSDufSEhLLzuvPl/fqyVtzW+MhDk/06Jx/Yq0XjrrsSkZq7pxS
	ck2odTRi3ORxtFxA6FoC2+apDB+9IqDoP4Csh9Fo2+cgvjRgqw4QglFRgVy6rRrp3XJ1OUMpHg/
	mAO2KLenYE2m6GXVLGcYAW0xDXxieY6Msbzy9O+O1fhLWIc7wu/YujPCE3imP/2LEuNWoNbhPtD
	PDcd859ES/bc3OXHK6C61cglxFA5Vwj3js7kIBhMY+6vbVgP3/WN82YWsWafslMFfwLeKYq828W
	2MS99Sme+4oHhQ0xqQzETakVErtTlYXeN8jMKCRRT2V87uKDywTLTmpKiglSeqxcFNg/gFOnbBF
	q8Aj4yl6k+H
X-Received: by 2002:a05:6a20:a10a:b0:3d3:af85:eb99 with SMTP id adf61e73a8af0-3e16bdf4942mr10553376637.27.1791881031032;
        Tue, 13 Oct 2026 01:43:51 -0700 (PDT)
Received: from localhost.localdomain ([202.8.105.124])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896b68f0664sm4578579b3a.3.2026.10.13.01.43.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 01:43:50 -0700 (PDT)
From: Jemmy Wong <jemmywong512@gmail.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	tim.c.chen@linux.intel.com,
	kprateek.nayak@amd.com,
	yu.c.chen@intel.com
Cc: juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	linux-kernel@vger.kernel.org,
	Jemmy Wong <jemmywong512@gmail.com>
Subject: [PATCH v2] sched/cache: Avoid publishing partial LLC utilization
Date: Tue, 13 Oct 2026 16:43:38 +0800
Message-ID: <20261013084338.55100-1-jemmywong512@gmail.com>
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
partial utilization with the full capacity.

can_migrate_llc() then treats a busy preferred LLC as having spare
capacity. More tasks can aggregate into it, migrations out can be
blocked, and two busy LLCs may not fall back to generic balancing.
This increases CPU contention and task latency. Found by inspection.

Skip publication on affinity retries using LBF_ALL_PINNED, retaining
the first-pass snapshots and avoiding repeated cpumask checks. On the
first pass, publish either shared LLC statistic only when env->cpus
covers the whole group. Load balancing still uses the affinity-filtered
statistics.

The same window exists during CPU hotplug. env->cpus drops a CPU at
set_cpu_active(false), but the group span and sgc->capacity still
include it until cpuset_cpu_inactive() rebuilds the domains. Keeping
the previous snapshot avoids the mismatched publish. After the rebuild,
the next periodic balance records both statistics again.

Suggested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Suggested-by: Tim Chen <tim.c.chen@linux.intel.com>
Fixes: f025ef275388 ("sched/cache: Record per LLC utilization to guide cache aware scheduling decisions")
Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
---

v1: https://lore.kernel.org/r/20261010113425.34829-1-jemmywong512@gmail.com/

Changes since v1:
- Skip publication on affinity retries using LBF_ALL_PINNED, retaining
  first-pass snapshots and avoiding repeated cpumask checks, as suggested
  by Prateek and Tim. Keep cpumask_subset() for partial group coverage
  during CPU hotplug on the first pass.
- Update the comment and commit message to explain the retry behavior.
- Add Fixes and Suggested-by tags.

 kernel/sched/fair.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 57360f5cdde4..dc01fdc0526d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -12111,6 +12111,14 @@ static void record_sg_llc_stats(struct lb_env *env,
 	if (env->sd->child != rcu_dereference_all(per_cpu(sd_llc, env->dst_cpu)))
 		return;

+	/*
+	 * A redo repeats stats published on the first pass. Hotplug can
+	 * still leave env->cpus partial, so util would not match capacity.
+	 */
+	if ((env->flags & LBF_ALL_PINNED) ||
+	    !cpumask_subset(sched_group_span(group), env->cpus))
+		return;
+
 	/*
 	 * At this point we know this group spans a LLC domain.
 	 * Record the statistic of this group in its corresponding

--
2.54.0 (Apple Git-157)

