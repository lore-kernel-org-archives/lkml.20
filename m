Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794928396;
	b=KFYfNOIw6zBUpbsxYLhbCzxVuO70N7ACy8+RNm4zJBe1J94A63HK9aB/1D+TZN2B9qnF
	 2KxMqcE2f0dU7j6aeAqvs+ZEV0vsKmWhvI/SsDGSr/PNHGiN6/NQfm6nz6Fan1giGt3hO
	 AyaGJC5V1JttkxRtGqLlcnXfXqd59jkI9H1UDW0KiK1fkpUC7sz/a3J+YBSa5XKl3t0Fv
	 SgIZFDzO9W2R+PERBV3iC078g5bG+mSSUPdzZ1cyahnRYUVa1VURbccBAxTE/MkpUl/hi
	 ASfMvfY3pCZEzbQDkEsD4Qozx970Ci1ryoeJov6t3pK2+A2IDmRMWoWbbM6OPXZb5zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928396;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=tmKVAets7j8FHflkKIRT+VDi64RAZwb1CW8sxK1it3I=;
	b=xVJeUpW4vWsZU54NV/JlpjLX9wglUuUB+7q4ZbEkLMCrpkpqrceu1I5172u0abj9zxRZ
	 MqVzc+1aEQzqTB1EoX3t6Ocul7p5kPZx49zjJdy+OaYgp1Baf0Mrvr8/yoBTWWNTocfVU
	 ND4Hzvo1wSgArzi0bLsjBl/4Fv7kiar3viuYkXudbXDHN41Tmo37ROgJlDUl38x0WBkmF
	 RuJl6bl5HHDhZT/kjRZxOmtNosJwGPtEIOx0cA8p6NNXPqY7F+5TBStDa78zfC0Px5Yn4
	 bRrOMkkECoi0YUXCZnfmMfr/QMNEVhEtjDOh/HXkauCD/wFH7DPeVah/emTbGq+uDjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WXndG8ca;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452A5606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 452A5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WXndG8ca
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794928395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tmKVAets7j8FHflkKIRT+VDi64RAZwb1CW8sxK1it3I=;
	b=WXndG8caB/ykadP/gTIE95pHhXvv4M/2YDdNUMNOjEkkcDZ2JhtggsjMmGQzJUMivfWNcM
	yQcqlHnHhPjnYvFJq4JYco7ikq4nyrO4LJAfzru3LXzzQIn0MO5ul1aXFL5nZb7DEBDUls
	km9Ao0Duqz1B+Mx6QrAXFzT4/0arLFA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-642-2r5fIyqXONmwdEA9poClHw-1; Tue,
 17 Nov 2026 10:13:09 -0500
X-MC-Unique: 2r5fIyqXONmwdEA9poClHw-1
X-Mimecast-MFC-AGG-ID: 2r5fIyqXONmwdEA9poClHw_1794928386
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 70C461955F73;
	Tue, 17 Nov 2026 15:13:06 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9FA4A1800543;
	Tue, 17 Nov 2026 15:13:03 +0000 (UTC)
Message-ID: <dd335ee6-c879-4bee-9ea8-6d9e9216fb0e@redhat.com>
Date: Tue, 17 Nov 2026 10:13:02 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] sched: BUG() in select_fallback_rq() at boot with
 isolcpus=domain on the boot CPU and CONFIG_CPUSETS=n
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
Cc: Michal Hocko <mhocko@suse.com>, Tejun Heo <tj@kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, linux-kernel@vger.kernel.org
References: <20261117144817.265109-1-mathieu.desnoyers@efficios.com>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20261117144817.265109-1-mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 11/17/26 9:48 AM, Mathieu Desnoyers wrote:
> Hi,
>
> With CONFIG_CPUSETS=n, a kernel booted with isolcpus=domain,0 hits the
> BUG() in select_fallback_rq() during boot. CPU 0 is the boot CPU. I
> found it while testing a SCHED_DEADLINE series [1]. I then reproduced
> it on v7.4-rc2 alone. tip/master of 2026-11-17 and next-20261116 have
> the same code. A proposed fix follows the scissors line.
>
> Trigger
> =======
>
> Build x86-64 with CONFIG_CPUSETS=n. Boot a VM of 4 CPUs with
> isolcpus=domain,0 or isolcpus=domain,0,1. The kernel panics before
> init runs, in every boot.
>
> These boot fine:
> - the same kernel with isolcpus=domain,1,2, or without isolcpus;
> - a kernel with CONFIG_CPUSETS=y, with isolcpus=domain,0,1.

I am now thinking about disallowing the boot CPU from being domain 
isolated. That will include using isolcpus=domain boot time isolation 
parameter as well as in setting up isolated cpuset partition. Will that 
be a simpler solution than fixing all these places where isolating the 
boot CPU will cause various problems that need to be fixed?

Thanks,
Longman

> Log
> ===
>
>    kernel BUG at kernel/sched/core.c:3642!
>    Oops: invalid opcode: 0000 [#1] SMP NOPTI
>    CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.4.0-rc2-g7475ea8b5861 #1 PREEMPT(lazy)
>    Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
>    RIP: 0010:select_fallback_rq+0x1fd/0x350
>    Call Trace:
>     <TASK>
>     try_to_wake_up+0x299/0x9b0
>     create_worker+0x17d/0x200
>     workqueue_init+0x2bd/0x2f0
>     kernel_init_freeable+0x79/0x1f0
>     kernel_init+0x1a/0x130
>     ret_from_fork+0x22a/0x330
>     ret_from_fork_asm+0x1a/0x30
>     </TASK>
>    Kernel panic - not syncing: Fatal exception
>
> Analysis
> ========
>
> workqueue_init() runs before smp_init(), so only the boot CPU is
> online. create_worker() binds a new unbound kworker to the CPUs of its
> pool. Workqueue restricts unbound workers to the housekeeping CPUs. With
> isolcpus=domain,0,1, those are CPUs 2 and 3. Neither is online yet.
>
> The wakeup of the kworker then calls select_fallback_rq(). It finds no
> allowed CPU online, and widens the mask of the task in two steps:
> - cpuset_cpus_allowed_fallback(). With CONFIG_CPUSETS=y, it gives the
>    mask of the top cpuset, which holds every CPU. The kworker then runs
>    on CPU 0. With CONFIG_CPUSETS=n, it is a stub that returns false.
> - task_cpu_fallback_mask(), which is
>    housekeeping_cpumask(HK_TYPE_DOMAIN). That is CPUs 2 and 3 again.
>
> No step is left, and the loop reaches BUG().
>
> The last step used to allow all CPUs. 3a5446612a3f ("sched,arm64:
> Handle CPU isolation on last resort fallback rq selection"), in v6.14,
> changed it to the nohz_full housekeeping CPUs. With isolcpus=domain
> alone, those are all CPUs. bf5b0c27fad2 ("sched: Switch the fallback
> task allowed cpumask to HK_TYPE_DOMAIN"), in v7.0, changed it to the
> domain housekeeping CPUs. A kernel with bf5b0c27fad2 reverted boots
> with isolcpus=domain,0,1 and CONFIG_CPUSETS=n.
>
> Where to fix
> ============
>
> The patch adds a last step before the BUG(): task_cpu_possible_mask(),
> the mask the fallback used before 3a5446612a3f. It is reached only when
> no housekeeping CPU is online. The kworker then runs on the boot CPU, as
> with CONFIG_CPUSETS=y.
>
> Another option is to have workqueue_init() leave the unbound workers
> on the boot CPU until a housekeeping CPU is online. It would fix this
> path only. Other early kthreads with a housekeeping mask could hit the
> same BUG(). This is from reading.
>
> Testing
> =======
>
> I ran v7.4-rc2 in VMs with 4 CPUs, built with CONFIG_CPUSETS=n:
> - Without the patch: isolcpus=domain,0,1 hits the BUG() in 3 boots of
>    3, and isolcpus=domain,0 in 1 of 1. isolcpus=domain,1,2 and no
>    isolcpus boot.
> - With bf5b0c27fad2 reverted: isolcpus=domain,0,1 boots, 3 of 3.
> - With the patch: isolcpus=domain,0,1 boots, 3 of 3. So do
>    isolcpus=domain,0, isolcpus=domain,1,2 and no isolcpus.
>
> After boot, the unbound kworkers have the same CPUs with the patch as
> with CONFIG_CPUSETS=y: CPUs 2 and 3 for isolcpus=domain,0,1. No "no
> longer affine" message is printed. The patch also builds with
> CONFIG_CPUSETS=y. That kernel boots with isolcpus=domain,0,1. I did
> not run other tests, nor other architectures.
>
> The analysis and the patch were written by an LLM coding assistant
> under my direction and review.
>
> Thanks,
>
> Mathieu
>
> [1] https://lore.kernel.org/all/cover.1794922146.git.mathieu.desnoyers@efficios.com/
>
> -- >8 --
> From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Subject: sched: Fall back to all possible CPUs when no housekeeping CPU is online
>
> select_fallback_rq() picks a CPU for a task that has no allowed CPU
> online. Its last steps widen the mask of the task: first to its
> cpuset, then to task_cpu_fallback_mask(). Commit bf5b0c27fad2 ("sched:
> Switch the fallback task allowed cpumask to HK_TYPE_DOMAIN") made that
> mask the domain housekeeping CPUs. The task then does not land on an
> isolated CPU. If none of these CPUs is online, the next step is BUG().
>
> That happens at boot when isolcpus=domain isolates the boot CPU.
> workqueue_init() runs before the other CPUs come online. It wakes a new
> unbound kworker, bound to the housekeeping CPUs. With CONFIG_CPUSETS=y,
> the cpuset step gives the kworker every CPU, and it runs on the boot
> CPU. With CONFIG_CPUSETS=n, that step does nothing, and the kernel
> panics at boot.
>
> Fix this by adding a last step before the BUG(): allow every CPU the
> task can run on, as task_cpu_possible_mask() gives. This was the last
> step before commit 3a5446612a3f ("sched,arm64: Handle CPU isolation on
> last resort fallback rq selection"). It is reached only when no
> housekeeping CPU is online. In testing, the kernel then boots. After
> boot, the unbound kworkers have the housekeeping CPUs, as with
> CONFIG_CPUSETS=y.
>
> Fixes: bf5b0c27fad2 ("sched: Switch the fallback task allowed cpumask to HK_TYPE_DOMAIN")
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---
>   kernel/sched/core.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 1a088d4576f5..556a27f14619 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3599,7 +3599,7 @@ static int select_fallback_rq(int cpu, struct task_struct *p)
>   {
>   	int nid = cpu_to_node(cpu);
>   	const struct cpumask *nodemask = NULL;
> -	enum { cpuset, possible, fail } state = cpuset;
> +	enum { cpuset, housekeeping, possible, fail } state = cpuset;
>   	int dest_cpu;
>
>   	/*
> @@ -3630,12 +3630,21 @@ static int select_fallback_rq(int cpu, struct task_struct *p)
>   		switch (state) {
>   		case cpuset:
>   			if (cpuset_cpus_allowed_fallback(p)) {
> -				state = possible;
> +				state = housekeeping;
>   				break;
>   			}
>   			fallthrough;
> -		case possible:
> +		case housekeeping:
>   			set_cpus_allowed_force(p, task_cpu_fallback_mask(p));
> +			state = possible;
> +			break;
> +		case possible:
> +			/*
> +			 * No housekeeping CPU is online. This happens at boot
> +			 * when isolcpus=domain isolates the boot CPU. Allow
> +			 * every CPU, as the cpuset fallback does.
> +			 */
> +			set_cpus_allowed_force(p, task_cpu_possible_mask(p));
>   			state = fail;
>   			break;
>   		case fail:

