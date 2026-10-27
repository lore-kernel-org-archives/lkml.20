Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099921;
	b=bCakyGIUMO1HTDixqeT7UNdO6bgPjcoWWK6rzgEu8Udc/1TilrbX7CcD67gL3ktrtVEs
	 dV5OSwGGszWVPA6Aw/zbsgJ9DphupBghlFQpLFpCkYZBb6KjogD/VaoUPJ+Up92moYPyN
	 DOFMZu5kHXfh3h3/5wo0hPEtUWVPGKWyVwZjBwzeEx/ufZXaWYNzErukhpS7RjLpzT28A
	 L31oj3/Gd+ROY521Yr7em4qNOpvf1Ca6ptUuIYnW2Qd/9l1j8YNsmkjKtMAIFFBhPp0H/
	 ag/1/n+6EccKPItUxJqPnPhR/wIlYnJB9+9I2bX6w5lMg7n+qygPNZj7QDDKSlkk7Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099921;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Subject:To:Cc:References:
	 From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=s1Lh+ZL65LDPjuRmX1xQUXrTEhu0tNm90UHEZqUaCnQ=;
	b=Urn9Kkg0VMXzhJJWxMPmNXwaT0vxSTBg93xvAaSjlPLT7oOHxvysl/V6Yp1NGLk7EqHC
	 pMRxj8oq5PnXpmlZm4kM8ySz/v6hxVjju19wXuDwK8nSxq4xPUSbDqc9VEpGgYfbR+NoJ
	 +Q9Q9rTMm4uyRWCaV6blbncfASXS1eRSYKvOWRa1INbKIUPePHfl8FXR1H3dciPkqmOS9
	 q+R8lFfoK6ijdA1rdkgXt+9OE4qJ+sY4nhEvxOs8jeFKulY5LkXeCvwwVdiV377LgaOOg
	 uftf4BwNvMuma7FYwB2rQQBOsIfgDXjcKckhGyK0F6d/AM4+IhreziNXKqMIOdX+uuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.4
Received: from out28-4.mail.aliyun.com (out28-4.mail.aliyun.com [115.124.28.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC177606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC177606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07438719|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0934866-0.000154431-0.906359;FP=3161518592240745554|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam011083032240;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.jqbo8fG_1793099909;
Received: from 172.18.25.145(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.jqbo8fG_1793099909 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 27 Oct 2026 19:18:30 +0800
Subject: Re: [RFC PATCH 3/6] sched/fair: SMT sibling exclusion after
 successful push
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org, "Li Wang (Hieco)" <li.wang@linux.dev>
References: <20261020083746.37068-1-likunyu@open-hieco.net>
 <20261020083746.37068-4-likunyu@open-hieco.net>
 <20261021123904.GI2823843@noisy.programming.kicks-ass.net>
From: Li kunyu <likunyu@open-hieco.net>
Message-ID: <2325dcd3-2940-701f-92ab-c2711c65c1cc@open-hieco.net>
Date: Tue, 27 Oct 2026 19:18:30 +0800
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
In-Reply-To: <20261021123904.GI2823843@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 2026/10/21 20:39, Peter Zijlstra wrote:
> On Tue, Oct 20, 2026 at 04:37:43PM +0800, Li kunyu wrote:
> 
>> @@ -13377,7 +13379,20 @@ static struct rq *sched_balance_find_src_rq(struct lb_env *env,
>>  	struct sched_domain __maybe_unused *sd_tmp;
>>  	unsigned int busiest_nr = 0;
>>  	int __maybe_unused dst_llc;
>> -	int i;
>> +	int i, smt_cpu, dst_cpu = env->dst_cpu;
>> +
>> +	if (sched_feat(SMT_BUDDY_ASSIST) && env->is_smt_move_task) {
>> +		/*
>> +		 * Remove the SMT sibling CPU from the mask to avoid the
>> +		 * extremely rare case of pulling tasks from it.
> 
> Your comment seems to think the SMT mask is only ever 2 cpus, we have a
> ton of architectures where this is not true.
> 
>> +		 */
>> +		for_each_cpu(smt_cpu, cpu_smt_mask(dst_cpu)) {
>> +			if (smt_cpu == dst_cpu)
>> +				continue;
>> +
>> +			cpumask_clear_cpu(smt_cpu, env->cpus);
>> +		}
> 
> This is terrifyingly horrible. You're using a loop and atomic bit clear
> to clear bits in a local cpumask.
> 
> 		cpumask_andnot(env->cpus, env->cpus, cpu_smt_mask(dst_cpu));
> 		__cpumask_set_cpu(dst_cpu, env->cpus);
> 

I have rewritten the code. I moved the clearing of the CPU in the mask to before
the traversal of the busiest scheduling group and adopted your clearing method.
The new code is as follows:

 static int sched_balance_rq(int this_cpu, struct rq *this_rq,
                        struct sched_domain *sd, enum cpu_idle_type idle,
-                       int *continue_balancing)
+                       int *continue_balancing, bool is_smt_move_task)
 {
        int ld_moved, cur_ld_moved, active_balance = 0;
        struct sched_domain *sd_parent = sd->parent;
@@ -13784,6 +13784,7 @@ static int sched_balance_rq(int this_cpu, struct rq
*this_rq,
                .tasks          = LIST_HEAD_INIT(env.tasks),
        };
        bool need_unlock = false;
+       bool is_smt_clean_cpu = is_smt_move_task;

        cpumask_and(cpus, sched_domain_span(sd), cpu_active_mask);

@@ -13803,6 +13804,15 @@ static int sched_balance_rq(int this_cpu, struct rq
*this_rq,
                need_unlock = true;
        }

+       /*
+        * Remove the SMT sibling CPU from the mask to avoid the extremely
+        * rare case of pulling tasks from it.
+        */
+       if (sched_feat(SMT_BUDDY_ASSIST) && is_smt_clean_cpu) {
+               cpumask_andnot(cpus, cpus, cpu_smt_mask(this_cpu));
+               is_smt_clean_cpu = false;
+       }
+
        group = sched_balance_find_src_group(&env);
        if (!group) {
                schedstat_inc(sd->lb_nobusyg[idle]);



-- 
thanks,
kunyu
