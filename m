Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874056;
	b=bj7SrSHG7lrjkuU69J/CDptx+22uwJEgsP46YTxKmDN0QAHfW2ybSHZNHmd+os3RNUsA
	 r1VzlTstXVB/Vg+/gLdGJrFSMXyJHjTlnB1TqlqfjQ59pxLiICvldNVcq1J9gj/PVy0vT
	 v5ihN3ZZbjysdYH2scWpUYM8zIXKg+2Ln7X74fnhL2vIIS/+FDHcIpdwXi5OxUdZ0ueKW
	 iwivuHMBJYuliAQellLKxZkhdV6IC47jxrXFh0FWlGUze7MdWpRqjHJdHasUSQtpFZyP4
	 MUR+ddkaSVb8kaCKLUh2G26RaanYA43NRsN5F93zQfYxJfBxoFhvROlUupzWaK8CfiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874056;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=vhOy0WYjbnbNPevN0I66LBgU9/72j0MKwkfeZuFn8lY=;
	b=P3TZ99DVu7UaIZkT8xSFRxwQiVIzVH8Rtyeq2pyujs9964OXCvF/7MAWK8KQDoRYs7ub
	 FsLwcx9K+80ANe8dX2rvih1Pr7k/7c6mMXY7OiAIpTUUkU5kzWdvzHHTD3wv2rVYnyw7E
	 AzGRvBXdNFOjvcF2faDAh9lpjGoMVVJfL7JxcOEI94bZiEBTqRc6iiIEmgGbZonwBYDwB
	 k6MrIPNFMUhnD/zbLRwmjoOKRWxGJjlHDVmQnjc4BMrFRdveMR+dDekJAVhBhSb5ferZL
	 QEpk14v9wozR/kGoTn1gz95JH0JgU6W19WhHATUl0IpP/fCpVGNzgR6/c1z47KxwQGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Y9DmeWMK;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123E3606A32F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 123E3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Y9DmeWMK
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261105102053euoutp01cb1be5977e2c2e76b7d2f166e2d333da~lHvJyx7zg0095500955euoutp01X
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:20:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261105102053euoutp01cb1be5977e2c2e76b7d2f166e2d333da~lHvJyx7zg0095500955euoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793874053;
	bh=vhOy0WYjbnbNPevN0I66LBgU9/72j0MKwkfeZuFn8lY=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Y9DmeWMKNpclA5NOnRIMJe4sazdHuzbYBKv0bsDYVC/8/B5Ce3t4gf/VpdrFnuB+s
	 mZ0wV+8Tw40ppOX+T+2WRqZLqycuTKpt9JX7NOPx5xCZUI7KNXS9lNkOkoqIgb1h5a
	 EefOnvZxBsNGR63RToCJgv+6THrTQaYcgKcMKGF0=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261105102052eucas1p2fa2d23d1c49cdadef3b1099e18ffb958~lHvJT5pV90592505925eucas1p2q;
	Thu,  5 Nov 2026 10:20:52 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261105102051eusmtip2e68726c57b9000e3e5db2fbdb4e93a22~lHvITBjc92150221502eusmtip2q;
	Thu,  5 Nov 2026 10:20:51 +0000 (GMT)
Message-ID: <eb0e386b-da07-4a2b-bff3-79441fd6be1f@samsung.com>
Date: Thu, 5 Nov 2026 11:20:51 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 1/4] sched/deadline: Fix stale root domain in cpuset
 bandwidth transfer
To: Juri Lelli <juri.lelli@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
	Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K
	Prateek Nayak <kprateek.nayak@amd.com>, Luca Abeni
	<luca.abeni@santannapisa.it>
Cc: linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, Weiheng Qiu
	<weihengqiuu@gmail.com>, Ingo Molnar <mingo@kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261103-b4-sched-dl-bw-fixes-v1-1-dd761fe005b4@redhat.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261105102052eucas1p2fa2d23d1c49cdadef3b1099e18ffb958
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261105102052eucas1p2fa2d23d1c49cdadef3b1099e18ffb958
X-EPHeader: CA
X-CMS-RootMailID: 20261105102052eucas1p2fa2d23d1c49cdadef3b1099e18ffb958
References: <20261103-b4-sched-dl-bw-fixes-v1-0-dd761fe005b4@redhat.com>
	<20261103-b4-sched-dl-bw-fixes-v1-1-dd761fe005b4@redhat.com>
	<CGME20261105102052eucas1p2fa2d23d1c49cdadef3b1099e18ffb958@eucas1p2.samsung.com>

On 03.11.2026 12:26, Juri Lelli wrote:
> dl_task_needs_bw_move() and set_cpus_allowed_dl() use task_rq(p)->rd
> to determine a task's current root domain. For a sleeping task, this
> is stale: it points to the rq of the CPU the task last ran on, which
> may belong to a different root domain after a cpuset move.
>
> This causes incorrect bandwidth accounting when a sleeping DL task is
> moved between exclusive cpuset partitions and back:
>
>   1. Move root->partition: task_rq(p)->rd = root, destination in
>      partition -> different -> bandwidth transferred correctly.
>   2. Move partition->root: task_rq(p)->rd is still root (task never
>      ran) -> looks like same domain -> no transfer. Partition keeps
>      stale bandwidth, root domain is short.
>
> The root domain then over-admits, and when the task exits total_bw
> underflows.
>
> Introduce dl_task_root_domain_cpu() helper that uses the task's
> cpus_mask (which still reflects the old/source cpuset at call time)
> to find the root domain where the bandwidth is actually accounted,
> instead of relying on the potentially stale task_rq(p)->rd.
>
> Use cpus_mask rather than cpus_ptr, as the latter may be temporarily
> narrowed to a single CPU by migrate_disable().
>
> Reported-by: Weiheng Qiu <weihengqiuu@gmail.com>
> Closes: https://lore.kernel.org/all/14508cb2-805f-41ac-9f6b-bfd7c3d7cb1c@gmail.com/
> Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
This patch landed recently in linux-next as commit b4a61fdc19c5
("sched/deadline: Fix stale root domain in cpuset bandwidth transfer").
I found that it triggers kernel BUG during CPU hot-plug tests on some
of my tests boards. Reverting it on top of next-20261104 (together with
dependent 41a7968022ca3) fixes the issue.

Here is the log from Amlogic Meson G12B based Odroid-N2 board
(arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts):


root@target:~# for i in /sys/devices/system/cpu/cpu[1-9]; do echo 0 >$i/online; done; sleep 4; for i in /sys/devices/system/cpu/cpu[1-9]; do echo 1 >$i/online; done

psci: CPU1 killed (polled 0 ms)
psci: CPU2 killed (polled 0 ms)
psci: CPU3 killed (polled 0 ms)
psci: CPU4 killed (polled 0 ms)
psci: CPU5 killed (polled 0 ms)
CPU1: Booted secondary processor 0x0000000001 [0x410fd034]
arch_timer: CPU2: Trapping CNTVCT access
CPU2: Booted secondary processor 0x0000000100 [0x410fd092]
cpufreq: cpufreq_policy_online: CPU2: Running at unlisted initial frequency: 999999 kHz, changing to: 1000000 kHz
------------[ cut here ]------------
kernel BUG at kernel/sched/deadline.c:3340!
Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
Modules linked in: ...
CPU: 2 UID: 0 PID: 1403 Comm: sugov:2 Tainted: G         C          7.4.0-rc1+ #16963 PREEMPT(full)
Tainted: [C]=CRAP
Hardware name: Hardkernel ODROID-N2 (DT)
pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : dl_task_root_domain_cpu+0x44/0x48
lr : dl_task_root_domain_cpu+0x28/0x48
sp : ffff8000853dbd00
x29: ffff8000853dbd00 x28: 0000000000000000 x27: 0000000000000000
x26: 0000000000000000 x25: 0000000000000000 x24: ffff0000f4768f40
x23: 0000000000000000 x22: ffff8000853dbdc8 x21: ffff0000f4776480
x20: ffff8000853dbe10 x19: ffff800082e2f000 x18: 00000000ffffffff
x17: 616974696e692064 x16: 657473696c6e7520 x15: ffff800083b338c0
x14: 0000000000000001 x13: 0000000000000000 x12: 0000000000000001
x11: 000000000000000a x10: 0000000000000000 x9 : 000000000000008e
x8 : ffff0000f47770c0 x7 : ffff00000f039db0 x6 : 0000000000000040
x5 : 0000000000000003 x4 : 0000000000000001 x3 : 0000000000000000
x2 : 0000000000000006 x1 : 0000000000000006 x0 : 0000000000000006
Call trace:
 dl_task_root_domain_cpu+0x44/0x48 (P)
 dl_task_needs_bw_move.part.0+0x18/0x60
 set_cpus_allowed_dl+0x2c/0xd8
 __set_cpus_allowed_ptr_locked+0x154/0x1f0
 __set_cpus_allowed_ptr+0x68/0xc0
 set_cpus_allowed_ptr+0x34/0x60
 kthread_affine_node+0xe4/0x10c
 kthread+0x124/0x128
 ret_from_fork+0x10/0x20
Code: f9400bf3 a8c27bfd d50323bf d65f03c0 (d4210000)
---[ end trace 0000000000000000 ]---
note: sugov:2[1403] exited with irqs disabled



> ---
>  kernel/sched/deadline.c | 31 ++++++++++++++++++++++++-------
>  1 file changed, 24 insertions(+), 7 deletions(-)
>
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index c0ebdcde5fe5d..68019dafbaf18 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -3324,14 +3324,28 @@ static void task_woken_dl(struct rq *rq, struct task_struct *p)
>  	}
>  }
>  
> +/*
> + * Find the root domain where a DL task's bandwidth is currently
> + * accounted. For a sleeping task that was moved between cpusets
> + * without running, task_rq(p)->rd may be stale. Use the task's
> + * current cpus_mask (not yet updated to the new mask) to find the
> + * actual root domain. Use cpus_mask rather than cpus_ptr, which
> + * may be temporarily narrowed by migrate_disable().
> + */
> +static unsigned int dl_task_root_domain_cpu(struct task_struct *p)
> +{
> +	unsigned int cpu;
> +
> +	cpu = cpumask_first_and(&p->cpus_mask, cpu_active_mask);
> +	BUG_ON(cpu >= nr_cpu_ids);
> +	return cpu;
> +}
> +
>  static void set_cpus_allowed_dl(struct task_struct *p,
>  				struct affinity_context *ctx)
>  {
> -	struct rq *rq;
> -
>  	WARN_ON_ONCE(!dl_task(p));
>  
> -	rq = task_rq(p);
>  	/*
>  	 * Migrating a SCHED_DEADLINE task between exclusive
>  	 * cpusets (different root_domains) entails a bandwidth
> @@ -3339,16 +3353,16 @@ static void set_cpus_allowed_dl(struct task_struct *p,
>  	 * domain (see cpuset_can_attach()).
>  	 */
>  	if (dl_task_needs_bw_move(p, ctx->new_mask)) {
> -		struct dl_bw *src_dl_b;
> +		unsigned int src_cpu = dl_task_root_domain_cpu(p);
> +		struct dl_bw *src_dl_b = &cpu_rq(src_cpu)->rd->dl_bw;
>  
> -		src_dl_b = dl_bw_of(cpu_of(rq));
>  		/*
>  		 * We now free resources of the root_domain we are migrating
>  		 * off. In the worst case, sched_setattr() may temporary fail
>  		 * until we complete the update.
>  		 */
>  		raw_spin_lock(&src_dl_b->lock);
> -		__dl_sub(src_dl_b, p->dl.dl_bw, dl_bw_cpus(task_cpu(p)));
> +		__dl_sub(src_dl_b, p->dl.dl_bw, dl_bw_cpus(src_cpu));
>  		raw_spin_unlock(&src_dl_b->lock);
>  	}
>  
> @@ -3358,10 +3372,13 @@ static void set_cpus_allowed_dl(struct task_struct *p,
>  bool dl_task_needs_bw_move(struct task_struct *p,
>  			   const struct cpumask *new_mask)
>  {
> +	unsigned int cpu;
> +
>  	if (!dl_task(p))
>  		return false;
>  
> -	return !cpumask_intersects(task_rq(p)->rd->span, new_mask);
> +	cpu = dl_task_root_domain_cpu(p);
> +	return !cpumask_intersects(cpu_rq(cpu)->rd->span, new_mask);
>  }
>  
>  /* Assumes rq->lock is held */
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

