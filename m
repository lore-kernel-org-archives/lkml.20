Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C9F23A562
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789177703; cv=none; b=Qlq7tu1HqbiRwSvDA10R09pd271XxPr1VL5eTg27lUynWpU3DaPKQtl1S6cj/miwQoITYzK5UPpg4gsCh+6tcO7f3AcePSPL0juqQzlamNd8un1i9whC+DrGTAEYLKxMx1DPNSHmdE+TOUsKcVFLBfnCeOJfzRh4lfEDFaPd4n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789177703; c=relaxed/simple;
	bh=p+l+kLLWJcH/DP8ZQRnxbwPr8gKh8TQLSkXD+Arj+Wk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mVMIp7RTjFsH7RKLj3+QO/crNbHBbd6tlMSC3nefkRgmQ4lbXMNmPXSqIsfndiFhxAaLYIQXaqj91oPpzJb0qtgdPvofK8SrQPgeUIf1nHAC7zb7tbFIOTwQoOTAlSTSq6hH/kZMLojae3XSyplOUv2/qEOveGdwcViEXmnlgtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=H75HCbVx; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="H75HCbVx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=F+
	6IKphNoF3+njGfhfpNDm9tmz//3UOaAtPgmuqX5qQ=; b=H75HCbVxWm8em6G/SZ
	TAxsQQYjSD8YLfGBBPs5AHgfaLYHZEgWevaJRwjp0qroOLeEDLP74gKwLehJxtJ/
	8CU7L+pg0foDSm+4zsPh3xmdf6M4elnS2pteRavZ9JxNm6YV5C9fG3t9X7FEELIo
	bmxBwm3EqbfNTrPRC3QvhdETU=
Received: from zhaoxin-MS-7E12.. (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgCnDy0Or6RqrTUYOw--.61943S2;
	Sat, 12 Sep 2026 09:46:55 +0800 (CST)
From: Xin Zhao <jackzxcui1989@163.com>
To: kprateek.nayak@amd.com
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	jackzxcui1989@163.com,
	juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [RFC PATCH RESEND 01/10] sched/fair: Do not set_rd_overloaded() if rd->online != env->cpus
Date: Sat, 12 Sep 2026 09:46:54 +0800
Message-Id: <20260912014654.3305884-1-jackzxcui1989@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <b44631c1-4272-4860-88f7-14c62de5e2fd@amd.com>
References: <b44631c1-4272-4860-88f7-14c62de5e2fd@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgCnDy0Or6RqrTUYOw--.61943S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZFW3Gry7Ww1kAF1xWr4kZwb_yoW5WF15pw
	40kw4aqr4DJFn3K3y7XFykGw12yr9Fq3s0yF4rWFWFyw45Zr48CF98K3WxJrWSkrZYqF12
	yrn2g348uFn5J3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JU6v38UUUUU=
X-CM-SenderInfo: pmdfy650fxxiqzyzqiywtou0bp/xtbC6A+yvGqkrw8fagAA3y

On Fri, 11 Sep 2026 11:51:10 +0530 K Prateek Nayak <kprateek.nayak@amd.com> wrote:

> What is the point of doing load balancing if the CPUs that are overloaded
> have all their tasks pinned? Those are just wasted cycles.

I don't think so. I sometimes make basic mistakes, so I'll express my complete
viewpoint, and you can check if there's anything wrong with what I'm saying below:

The simplified code in can_migrate_task() related LBF_ALL_PINNED is as follows:

The simplified code in can_migrate_task() related LBF_ALL_PINNED is as follows:
static
int can_migrate_task(struct task_struct *p, struct lb_env *env)
{
    ...
    if (!cpumask_test_cpu(env->dst_cpu, p->cpus_ptr)) {
        ...
        if (env->idle == CPU_NEWLY_IDLE ||
		    env->flags & (LBF_DST_PINNED | LBF_ACTIVE_LB))
			return 0;
        /* Prevent to re-select dst_cpu via env's CPUs: */
		cpu = cpumask_first_and_and(env->dst_grpmask, env->cpus, p->cpus_ptr);

		if (cpu < nr_cpu_ids) {
			env->flags |= LBF_DST_PINNED;
			env->new_dst_cpu = cpu;
		}

		return 0;
    }

	/* Record that we found at least one task that could run on dst_cpu */
	env->flags &= ~LBF_ALL_PINNED;
    ...
}

Thus, LBF_ALL_PINNED does not mean that tasks are all pinned to their current CPU;
it merely indicates that tasks on the src CPU cannot be migrated to the dst CPU.

Example:

Assuming a system with two clusters, each containing two physical CPUs, the
structure is as follows:

                          DIE
           USTER0              CLUSTER1
         cpu0       cpu1        cpu2       cpu3
T0       p1,p2      p3           p4         p5

At time T0:

CPU0 has tasks p1 and p2, and both have a CPU mask of CPU0 and CPU2.
CPU1 has only task p3, with a CPU mask of CPU1.
CPU2 has only task `p4 with a CPU mask of CPU2.
CPU3 has only task p5, with a CPU mask of CPU3.

At time T1:

Task p5 on CPU3 goes to sleep, and then a newly load balance (newly lb) is
executed. It first looks for load balancing within CLUSTER1 and finds no tasks
to migrate.
It then goes up to the DIE level scheduling and finds the busiest CPU, which is
CPU0's queue. However, it discovers that none of the tasks can be migrated to
CPU3. Since this is a newly idle load balance, it won't perform the binding
check for whether other CPUs in env->dst_grpmask can serve as a CPU.
Consequently, it removes the busiest CPU (CPU0) from the CPU set, but CPU1
remains in the CPU set. Therefore, the check if 

(!cpumask_subset(cpus, env.dst_grpmask)) {

passes leading to the redo phase.
Then it executes sched_balance_find_src_group(), followed by update_sd_lb_stats().
At this point, aside from CPU0, there is at most one task on the other CPUs,
causing the _overloaded flag in rd to be cleared.

At time T2:

Task p4 on CPU2 goes to sleep, and a newly idle load balance (newly lb) is
executed. However, since thesg_overloadedflag inrdhas been set,sched_balance_newidle()`
returns early.
But in reality, at this point, it is possible to migrate a task p1 to CPU2.


--
Xin Zhao

