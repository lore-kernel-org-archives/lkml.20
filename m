Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCB81D432D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792121293; cv=none; b=B1Vb+2OuGDNVLPVV4L9lZRJvVlKmMtHWFmvNa1UR0ftyOQk5KcfAOQZQXSYrUpZFjQB9fg1vAMKGZvA2h2/27KTX0z7RAp7ftgBVdG82Aq2bVzcL4fSftpY7Gx2esnKWu2lHu9LwNaJQ6RPVfsr1SePO2Hk+oTGqOnAi4tDDNzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792121293; c=relaxed/simple;
	bh=XSSPdOCNAc5WWi5tUc5olPewciaW+9RyoAozlFhXOiM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IrWr3+JHZK/hSJmWEyhMMgbZWt9FqEJ640wFXIfFD59QTWsL7vDOtlC3x91ghY7sa74uj0iK1FF1tNYZxf/h+Syz3HXWfwe1pnm0VhsD7xXZmqtmQTBNcgONrlDed04LOYbWMtO3+0ZB3uK9AqndPloBwVKjtEt3//DCF/KDht0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0JFIXSf; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0JFIXSf"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e5fb79ce82so34429665ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792121291; x=1792726091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=57IwzSravw3Iqow3SrotqKeFlKBEhaoHY1IKJqGvUEA=;
        b=f0JFIXSfuzsPUJL1qjcRIc1Lr50f0NSEgnZYWbxu+P2x4vL6juoaQV2p33mYhpDxW3
         i2iQBUyptC49for8BqemK7oft5sEdHcwwU/phFFaSpqpqfFXUcfyan/D5LgnJYegjdk/
         yhlFHdKi4nRMDwDG7droc1l0TXTku8IYeSJSu/mKniDbB4bh8S1WTxD7vLWSoW68aHcJ
         Y6YnfnW4g3ZuD9VLdObEleDgk1AM6akLdGesgw30amaRqwNPumwDiS7MZhyXa/q7Te2t
         moRF5CwfrWHrIPVQy1dk2q5IOcMFKq1aFmqIB+mEG81HIs5VPSgoe/O8MVG41/wCVOqM
         2i3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792121291; x=1792726091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=57IwzSravw3Iqow3SrotqKeFlKBEhaoHY1IKJqGvUEA=;
        b=vyBVYb3FRc10upCmUFGA4I47+ojsFkXnAuydpLRbcfXNzFO7idpjA/4hBZNUCddwgl
         EOjFtfVopRXry4RmnbAID4M6NWVDoi4g90vLDC3mDs/Urc9AHNxXnoVFicDRWdLgp+5M
         THq5RxLZNrItpBSsb759Nxn/X7gPF5dP0d+dG6JoZINtemwBtRi2rWfJ3HBfOouoXtaN
         LLoev2aUImk3NK/sEmewNEQYErsgq6LVgMAj+hB/3FBS6B8nxIl2DysM6LUtaRmP8n2Q
         SaqNtWnnZjMYCwK0TsTsZsTew7lEtwc+Ubta0+R4AodwQHLGzboLaZ9WjLPY69uDH5Qe
         TU5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzl7jjqgu0KmmOInnciGw6/ell6c+D693AqrTDa4KoJv42qLSADVK2wiOV7ss7JJetEEV/JUPPLUQraLQ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKWNCBFtHtauNaF50XG8GVz0ed/L6u12uKp6HgP1UzlY5ysmsl
	6npRBB3XE+QhpdqdqugYbe7Njf45KSmJ2mcKItJCipYwimNTI8UNsHXz
X-Gm-Gg: AYBFou1I5T4drwICZ/KeTIdoS6SKJRFzi1M/bzUZaI4eCIu0q/EuKGp0UNMCh3Vh7Si
	OKgWyWLIxlh6y6DlgFmN54aClURAW+h1E0r42RwBvWMQQKCccGspwBjAOkCibFfsMZGaQz3vnZ0
	Nsph4UN1GvucOVTi0q0JhMsPh63IrnttNmPLtoVN33Ha+9a66qmsaZE7PfTe9EyrpDbQ++lByNm
	z3epSNSbTXrQ+M1nl1ACO6p1KUyho+rfNQi1pdWstJgNWdKtPg0pOpq0xoS7ULEnyrIgdEf8HxC
	DegmqLUagIWRTN0y5fjzeWSCrr5zBHPNkLW9SzkHNANyAVxGc6hhq7mYGGxk5wpBQkAys/1ekql
	S5u7o42d5PG41FstkOqpvKces1Cwu9DdFtfECGHXYuIdjWijBOftMbMdSUXHO8oYp2asa9Acco7
	R3GxXDHxGFfykF+Ebjf3ENAHtb+WXqpYt80CjV7A0OFTdby5Aprbup/DK6L2t//0UIh7qeAVZjn
	Zz3suDcPnRzax6dmkVgCVI=
X-Received: by 2002:a17:902:ce12:b0:2e2:aa17:477f with SMTP id d9443c01a7336-2e842f11b4bmr193459365ad.58.1792121291215;
        Thu, 15 Oct 2026 20:28:11 -0700 (PDT)
Received: from localhost.localdomain ([202.8.105.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e834ef9sm3672935ad.42.2026.10.15.20.28.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 Oct 2026 20:28:10 -0700 (PDT)
From: Jemmy Wong <jemmywong512@gmail.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	tim.c.chen@linux.intel.com,
	kprateek.nayak@amd.com,
	yu.c.chen@intel.com
Cc: chen.yu@linux.dev,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jemmy Wong <jemmywong512@gmail.com>
Subject: [PATCH v3] sched/cache: Avoid publishing partial LLC utilization
Date: Fri, 16 Oct 2026 11:27:59 +0800
Message-ID: <20261016032759.45279-1-jemmywong512@gmail.com>
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
Cc: stable@vger.kernel.org # 7.2.x
Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>
Reviewed-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>

---

v2: https://lore.kernel.org/r/20261013084338.55100-1-jemmywong512@gmail.com/
v1: https://lore.kernel.org/r/20261010113425.34829-1-jemmywong512@gmail.com/

Changes since v2:
- Clarify that LBF_ALL_PINNED identifies affinity redos here and that
  retaining the recent first-pass snapshot avoids publishing partial
  utilization against full capacity, as suggested by Chen Yu.
- Add Cc: stable@vger.kernel.org # 7.2.x, as suggested by Tim.
- Add Reviewed-by tags from Tim Chen and Chen Yu.
- No functional changes.

Changes since v1:
- Skip publication on affinity retries using LBF_ALL_PINNED, retaining
  first-pass snapshots and avoiding repeated cpumask checks, as suggested
  by Prateek and Tim. Keep cpumask_subset() for partial group coverage
  during CPU hotplug on the first pass.
- Update the comment and commit message to explain the retry behavior.
- Add Fixes and Suggested-by tags.

 kernel/sched/fair.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 57360f5cdde4..7df5b5d2dce1 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -12111,6 +12111,16 @@ static void record_sg_llc_stats(struct lb_env *env,
 	if (env->sd->child != rcu_dereference_all(per_cpu(sd_llc, env->dst_cpu)))
 		return;

+	/*
+	 * Here, LBF_ALL_PINNED is set only on affinity redos. Keep the recent
+	 * first-pass snapshot, since env->cpus may now be incomplete.
+	 * Hotplug can also leave env->cpus incomplete on the first pass;
+	 * do not publish partial utilization against the full group capacity.
+	 */
+	if ((env->flags & LBF_ALL_PINNED) ||
+	    !cpumask_subset(sched_group_span(group), env->cpus))
+		return;
+
 	/*
 	 * At this point we know this group spans a LLC domain.
 	 * Record the statistic of this group in its corresponding

base-commit: 2f2f7eeef8b0a1a9b9ca998231419873ccae8d4e
--
2.25.1

