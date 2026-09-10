Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D33733C536
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789014680; cv=none; b=OERePTv1qFOhSrWfoXZ06umNS7NODmWeJyJExOYia2topE87+O39Bgmwf3VM8TWVQ2QwCG/0rC4Nkivoa+773FQXbskxDAQyiUy5akMJbDCm7JO2cQf0tNxa2imuuf9M0aTOcPQ7XIHzm+k29h1bq+nADrXyXS+tjpww3FSvnxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789014680; c=relaxed/simple;
	bh=YxICK9eRAEZm/b4KxMY6YgmHqrAXs3BXuBQsTXme5fo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=siPLCDXFl3+4/pxGnC0XkuNttD/hAGplcJjqAhXzGaXjHVAuBO+5l7LHFbpjtNnuOBIZjIJeNS5XhUCX5lQeMRGHmpVc/3dE2Rza50f7bnm7kEHeBD9aCjdoSUbiTuzeEgxykqzDS+Jnvp7LsMPlVZpkgm5VE11PkQ1UQcEsqug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=bl1gqFjE; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="bl1gqFjE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=mw
	Zx8AptPNgUqEDEdFiFTHEgRLhgM0jjpuxmqGdyRGw=; b=bl1gqFjE7XFJ3+aRq+
	s0zknJqTCfYADk5COqLXf/SYES8ImH1ZGaB/YV61im/0dIq/EfYPCkGA+qmlJzO8
	KQ42pkPLYdvWoqp2S9PzQ7YJ4860OgcEOpaluMKuRJSJQBG7IQipawDYA0Fg15m0
	X4tM64fFFgPC/Lh0SSJh45HGY=
Received: from zhaoxin-MS-7E12.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wAXgp5AMqJqap0YBw--.51115S3;
	Thu, 10 Sep 2026 12:29:55 +0800 (CST)
From: Xin Zhao <jackzxcui1989@163.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com
Cc: linux-kernel@vger.kernel.org,
	Xin Zhao <jackzxcui1989@163.com>
Subject: [RFC PATCH RESEND 01/10] sched/fair: Do not set_rd_overloaded() if rd->online != env->cpus
Date: Thu, 10 Sep 2026 12:29:41 +0800
Message-Id: <20260910042950.1619727-2-jackzxcui1989@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910042950.1619727-1-jackzxcui1989@163.com>
References: <20260910042950.1619727-1-jackzxcui1989@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXgp5AMqJqap0YBw--.51115S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF1UKr1fArWUAF1UAry7KFg_yoW8Cr4Dpa
	yDKayIgr48twnxKasrAF4vg3yUJws5J3WYva1ak3yrJF1Yyw1YvrW0v34DCr4rKa4rZ3WS
	vrWUtFW7u3WjyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zK-erbUUUUU=
X-CM-SenderInfo: pmdfy650fxxiqzyzqiywtou0bp/xtbC5wPf6WqiMkOBYgAA3I

In update_sg_lb_stats(), it only traverses sched_group that belongs to
env->cpus, but env->cpus may not necessarily equal rd->online. This can
lead to the incorrect clearing of the overloaded flag of rd. For example,
if cpuA belongs to the online CPU mask of the rd but does not belong to
env->cpus, and cpuA consistently maintains nr_running >= 2, while other
CPUs in rd->online keep rq->nr_running <= 1, the overloaded flag of rd
will not be set until next update of update_sd_lb_stats() for that rd.
During this period, sched_balance_newidle() will prematurely return due to
the incorrect assumption that the rd is in a non-overloaded state.

In update_sd_lb_stats(), add a check to verify whether rd->online is equal
to env->cpus before calling set_rd_overloaded() to avoid such incorrect
settings.

Signed-off-by: Xin Zhao <jackzxcui1989@163.com>
---
 kernel/sched/fair.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index dcf860c59a14..13e873b1ef58 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -12679,8 +12679,12 @@ static inline void update_sd_lb_stats(struct lb_env *env, struct sd_lb_stats *sd
 		env->fbq_type = fbq_classify_group(&sds->busiest_stat);
 
 	if (!env->sd->parent) {
-		/* update overload indicator if we are at root domain */
-		set_rd_overloaded(env->dst_rq->rd, sg_overloaded);
+		/*
+		 * Update overload indicator if we are at root domain.
+		 * Note that env->cpus may change during sched_balance_rq().
+		 */
+		if (cpumask_equal(env->dst_rq->rd->online, env->cpus))
+			set_rd_overloaded(env->dst_rq->rd, sg_overloaded);
 
 		/* Update over-utilization (tipping point, U >= 0) indicator */
 		set_rd_overutilized(env->dst_rq->rd, sg_overutilized);
-- 
2.34.1

