Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099421;
	b=RO9/mD6zp9hUPaZrNViP47l9wVk6wOdm7hmNklvyYw01/HkyCy2EWje/u9QTbtpqVwGJ
	 vDZGF3MmONUfHvRR5sw82/zISoPq+ne/ctryMc+P+H7sDvs3hzLycAg2EVlSlOfPN2ljm
	 S73+SzxKs7H7YyXeZujMAwbVFXgHaodGCFjVWwwD9Y4aAX726UcR8XUAh9BTmMVqAdrqV
	 iwVY9z55n/+b7vP0pThK/DuQoJ3V7vINO3w5tMwp3z23xGHh+dnblGIZ2fMhWksxeCC8Q
	 qyhDNj6GOMNd2ceAELZT9EyaLeZSk1+W4jNDRh66k0Jkh5wWfm1jsGNyys5cpMmvPhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099421;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Subject:To:Cc:References:
	 From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=2cO4lkwHL0FiVImF+BgckHg7E6xQZUk2oytqaffdZDo=;
	b=2MwVluPJPK21kEqC2K8V9lQvkUIwE1RvHAJt2z12Relyvq+r3tZY3T8JsCFbYjf29acP
	 q4KlNcztUr2QT+rPF4upCBX9O7tglf/9hQlcUQXWB4Sq64aOz9QCRNleRBuDOG5cYDFJI
	 lMgD1Sk0U+fRMmurVMlpK8+6xuF1sDZUGKJZ+/4tvGh7v8w3HwJVfgenH6scysaf3kF+z
	 vZFCHVZ0dSPIkLlM1zlYVy4R09yUTDAJONvRj206PcRLv/uOuAauAg5FcJ6XV9JDs/q32
	 XCG85ZgZ86iIAowD2c8RpcvWL7/z6Wjimco8pEDM0mE5zllvnh88RSRaurvLnti8z0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.217
Received: from out28-217.mail.aliyun.com (out28-217.mail.aliyun.com [115.124.28.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F172606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F172606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07541845|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.035794-0.000204909-0.964001;FP=9063336782742549654|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam011083032240;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.jqkClao_1793099407;
Received: from 172.18.25.145(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.jqkClao_1793099407 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 27 Oct 2026 19:10:08 +0800
Subject: Re: [RFC PATCH 1/6] sched/fair: Add SMT sibling push in periodic load
 balance
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org, "Li Wang (Hieco)" <li.wang@linux.dev>
References: <20261020083746.37068-1-likunyu@open-hieco.net>
 <20261020083746.37068-2-likunyu@open-hieco.net>
 <20261021123438.GG2823843@noisy.programming.kicks-ass.net>
From: Li kunyu <likunyu@open-hieco.net>
Message-ID: <291b154d-16e3-9eea-8d61-910cf1f4eb7c@open-hieco.net>
Date: Tue, 27 Oct 2026 19:10:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261021123438.GG2823843@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit


On 2026/10/21 20:34, Peter Zijlstra wrote:
> On Tue, Oct 20, 2026 at 04:37:41PM +0800, Li kunyu wrote:
> 
> Just a few remarks on coding style while I try and make sense of the
> whole thing. Don't go rush out a new version with this stuff fixed
> before you've seen feedback on the higher level stuff.
> 
>> @@ -14226,6 +14244,94 @@ update_newidle_cost(struct sched_domain *sd, u64 cost, unsigned int success)
>>  	return false;
>>  }
>>  
>> +/*
>> + * An exciting thing is that we have implemented an efficient push
>> + * function process.
>> + *
>> + * It is applied in cycle load balancing and nohz_kick process.
>> + * It can help us solve the problem of high workload of CFS tasks in
>> + * the RQ queue.
>> + */
>> +static bool smt_buddy_move_task(struct rq *src_rq)
>> +{
>> +	bool is_overload, is_move = false;
>> +	int src_cpu = cpu_of(src_rq), smt_cpu;
>> +	unsigned long src_cpu_runnable, smt_cpu_runnable;
>> +	struct sched_domain *smt_sd;
>> +	struct task_struct *p;
>> +	struct rq *smt_rq;
>> +	struct rq_flags rf;
>> +
>> +	if (!sched_feat(SMT_BUDDY_ASSIST) || !sched_smt_active())
>> +		goto exit;
>> +
>> +restart:
>> +	if (src_rq->nr_running < 2)
>> +		goto exit;
> Did this want to be:
> 
> 	while (src_rq->nr_running > 1) {
> 
>> +
>> +	rcu_read_lock();
> 	scoped_guard (rcu) {
> 
>> +
>> +	is_overload = false;
>> +	src_cpu_runnable = cpu_runnable(src_rq);
>> +	for_each_cpu(smt_cpu, cpu_smt_mask(src_cpu)) {
>> +		if (smt_cpu == src_cpu)
>> +			continue;
>> +
>> +		smt_cpu_runnable = cpu_runnable(cpu_rq(smt_cpu));
>> +		if ((src_cpu_runnable * 100 > smt_cpu_runnable * sysctl_smt_buddy_imbalance_pct)
>> +			&& cpu_active(smt_cpu)) {
> This is horrifically bad indenting. Operators go at the end of the
> previous line and then you indent to the level of whatever ( is active.
> If you're a vim user 'cino=(0' gets you that.
> 
>> +			is_overload = true;
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (!is_overload) {
>> +		rcu_read_unlock();
>> +		goto exit;
> This pattern should scream at you for doing it wrong.
> 
>> +	}
>> +
>> +	smt_sd = lowest_flag_domain(src_cpu, SD_SHARE_CPUCAPACITY);
>> +	if (!smt_sd) {
>> +		rcu_read_unlock();
>> +		goto exit;
> And again.
> 
>> +	}
>> +
>> +	rcu_read_unlock();
> 	}
>> +
>> +	rq_lock_irqsave(src_rq, &rf);
> 	scoped_guard (irqsave) {
> 		scoped_guard (rq_lock, src_rq)
> 

I configured Vim as you suggested and made the necessary modifications. In
addition, I made the following changes:
﻿
Changed rq->nr_running to rq->cfs.h_nr_runnable and made related changes so that
only CFS tasks that are currently running or already queued are counted and
migrated.
﻿
Added a condition requiring the current CPU's task count to be greater than that
of its SMT sibling CPUs, so as to avoid migrating too many newly created tasks
that have not yet started running.
﻿
Added a migration type, migrate_smt_task, which skips a given SMT sibling CPU
(only for tasks that do not meet CPU affinity requirements), thereby enabling
complete migration and checking of all SMT sibling CPUs.

Thank you for your guidance. Future patches will be more comprehensive and
better justified.

-- 
thanks,
kunyu
