Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A7733D6F8
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789178072; cv=none; b=eK7P45oxMA2wQy2RNh4dBZJWCyOh/KLLpG+4tXYqijO/85TZyBHo96FZPRO+XHT+sgN1sGt9hBMFxLUXQKI6YQArYHyvbFdh/+zUWQ0J8EcU4rIX+dvb/80PDSsQQ2gubOhk6dgocCGIaQJhJr2Z1Fc7nTUF62DZ7CjhrpEC0jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789178072; c=relaxed/simple;
	bh=AOD6ES53agtGPOdJwgMAp1L23R00GJgsYLVb30CW+OQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OGeIcXZ7/LR4zzcwWJr/XHENEDDF/xX0KO3AB1ngcs8rensd6eErQkYN1LdkGh2qCXw87D0TY0WaPPPkIb8E3Zop4syLZ1nn7Lf0SmdY+geMVGJyYaaZMG2QebXY5q/cT3DmMlWzNHCmeDeX6Tms6vsLr+NqXUBOwQqqCNAhQiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RiHbRe5L; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RiHbRe5L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=kz
	Jl+HiJMo4EEwRnNCYKWoLRScdKh5djMookmaD9fws=; b=RiHbRe5LVtnrfk+xlq
	KO1fwy0n1rGwfbLCER3rKXmSZFhrTD1Zx8tM6SYRoqJPAnZTC0zvfMqsqV+3oe2S
	au9W/xGFmSiuCnlYbBRv+lJ6S20Zbzuoqvi28ueMvXO/I91PFm/nWb39CSkpT8Rk
	DYolYk3b8lfxOL6B05Vg93MDk=
Received: from zhaoxin-MS-7E12.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wC3j8qUsKRqHd20AA--.49789S2;
	Sat, 12 Sep 2026 09:53:25 +0800 (CST)
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
Date: Sat, 12 Sep 2026 09:53:24 +0800
Message-Id: <20260912015324.3310241-1-jackzxcui1989@163.com>
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
X-CM-TRANSID:_____wC3j8qUsKRqHd20AA--.49789S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXw17Gr4kCw48CF4UCFyDKFg_yoW5Cr4fpw
	4vk3yaqr4DJFn293y7ZFn5C3Wayr9Iq3s0ya98WryFyw45Zr48AF98K3WxGrWFkrsYv3W2
	yrn2gFWxuFs8X3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUDpnPUUUUU=
X-CM-SenderInfo: pmdfy650fxxiqzyzqiywtou0bp/xtbC5xUVH2qksJUz5wAA3H

Hello Prateek,

I apologize for the confusion. Please disregard the previous email response; this
email is essentially the same, so you only need to refer to this one.


On Fri, 11 Sep 2026 11:51:10 +0530 K Prateek Nayak <kprateek.nayak@amd.com> wrote:

> What is the point of doing load balancing if the CPUs that are overloaded
> have all their tasks pinned? Those are just wasted cycles.

I don't think so. I sometimes make basic mistakes, so I'll express my complete
viewpoint, and you can check if there's anything wrong with what I'm saying below:

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
           CLUSTER0              CLUSTER1
         cpu0       cpu1        cpu2       cpu3
T0       p1,p2      p3           p4         p5

At time T0:

CPU0 has tasks p1 and p2, and both have a CPU mask of CPU0 and CPU2.
CPU1 has only task p3, with a CPU mask of CPU1.
CPU2 has only task `p4 with a CPU mask of CPU2.
CPU3 has only task p5, with a CPU mask of CPU3.


                          DIE
           CLUSTER0              CLUSTER1
         cpu0       cpu1        cpu2       cpu3
T1       p1,p2      p3           p4         newly lb
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


                          DIE
           CLUSTER0              CLUSTER1
         cpu0       cpu1        cpu2       cpu3
T2       p1,p2      p3           newly lb
At time T2:

Task p4 on CPU2 goes to sleep, and a newly idle load balance (newly lb) is
executed. However, since thesg_overloadedflag inrdhas been set,sched_balance_newidle()`
returns early.
But in reality, at this point, it is possible to migrate a task p1 to CPU2.


--
Xin Zhao

