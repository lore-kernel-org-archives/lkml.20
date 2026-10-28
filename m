Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153820;
	b=shqkBl15EZObFPgZX69Yb+BPxsy14MaiHP4PUf/12jEvFzOjYZWE7zVxDOzhBFtAzeOW
	 UmMhbCFxQbx5LeBY+sPKKQjMkzMXO0OiaC7+ZqX+z5yWUM27RTulq4N+odbdtRJ78SHea
	 LrvqBjGUCr6A+ODE6bNK/f8v885RUAfbvQIUDJDifnSMH/Dk8NyQHbzEPJCQG0v8ifme3
	 IO+YIfmXeutCrSjnuVtbKrOoaqx/ZgofRj2/hH2Gf8RxfeXcZbgYMLFDayM9qmLo1odyv
	 NQOzAST45Leb3JO7UTkFw1AaUIYYSsKW2zjj/+atlT9dsFZfYl2CsbrFK05dxMawRBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153820;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Subject:To:Cc:References:
	 From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=lrCQonoolrwjv1CzKvZ6CRzrYqlsy3KBNBUtoY9/lMk=;
	b=OoaVa8Ot25I/a4gmcLxNXnrLz/z27+fuESiLtKY0kPL5FwtiNiQnH16qISpTCsYv1srl
	 uo96+avMeroUX5KNE/wpzLEbidVElQ6sJEjdb1XTCoy98PjKYFBY1uJuyZkL8xQIG1srZ
	 rl6nK08FsR/o59p4+CagvUYb2JJw8ih2RHSpVzLbWUeSKYnDh+n0wemepYMn6ZBJKmI6U
	 +KT8Mqofha2Q1Pg/9RHB4ZqBDLnVXkN9feRC7mpHiBdhVoavk7Riu/9lKMG9Mzxlb26n6
	 L4/SaEITzy7Jtn8yXDrP768ZbZ3D+EOVt8uCbbQg1AgDamjRwUsUTahLk+y3YbpAJVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.75
Received: from out28-75.mail.aliyun.com (out28-75.mail.aliyun.com [115.124.28.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BA9606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42BA9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07505343|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.100953-0.000718823-0.898328;FP=4028276740343799034|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037028158;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.jr9MeHD_1793153800;
Received: from 172.18.25.145(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.jr9MeHD_1793153800 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 28 Oct 2026 10:16:46 +0800
Subject: Re: [RFC PATCH 4/6] sched/fair: Restrict newidle balance to LLC
 domain
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org, "Li Wang (Hieco)" <li.wang@linux.dev>
References: <20261020083746.37068-1-likunyu@open-hieco.net>
 <20261020083746.37068-5-likunyu@open-hieco.net>
 <20261021124218.GJ2823843@noisy.programming.kicks-ass.net>
From: Li kunyu <likunyu@open-hieco.net>
Message-ID: <417bd81a-6eea-2a03-0f77-a00eac94fe71@open-hieco.net>
Date: Wed, 28 Oct 2026 10:16:43 +0800
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
In-Reply-To: <20261021124218.GJ2823843@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 2026/10/21 20:42, Peter Zijlstra wrote:
> On Tue, Oct 20, 2026 at 04:37:44PM +0800, Li kunyu wrote:
> 
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index 6e2271484c86..f2bf4b53d8a9 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -14983,6 +14983,24 @@ static inline bool nohz_idle_balance(struct rq *this_rq, enum cpu_idle_type idle
>>  static inline void nohz_newidle_balance(struct rq *this_rq) { }
>>  #endif /* !CONFIG_NO_HZ_COMMON */
>>  
>> +/*
>> + * is_smt_buddy_newidle_constrain - After enabling the smt_buddy_assist
>> + *                                  feature, check whether the current
>> + *                                  scheduling domain meets the conditions
>> + *                                  for skipping statistics.
>> + * @sd: The current scheduling domain that is to be traversed.
>> + */
>> +static bool is_smt_buddy_newidle_constrain(struct sched_domain *sd)
>> +{
>> +	if (!sched_feat(SMT_BUDDY_ASSIST))
>> +		return false;
>> +
>> +	if (sd->flags & SD_NUMA)
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>>  /*
>>   * sched_balance_newidle is called by schedule() if this_cpu is about to become
>>   * idle. Attempts to pull tasks from other CPUs.
>> @@ -15080,7 +15098,8 @@ static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
>>  				weight = (1024 + weight/2) / weight;
>>  			}
>>  
>> -			pulled_task = sched_balance_rq(this_cpu, this_rq,
>> +			if (!is_smt_buddy_newidle_constrain(sd))
>> +				pulled_task = sched_balance_rq(this_cpu, this_rq,
>>  						   sd, CPU_NEWLY_IDLE,
>>  						   &continue_balancing,
>>  							false);
> You could have just fiddled with SD_BALANCE_NEWIDLE, no? But instead you
> went and did something inscrutable and violated coding style *again*.
> Any multi-line block must have {} on.

I would like to get your opinion on modifying patch 4 (I have also consulted
Tim). Please take a look at the following:

1. If relax_domain_level is set, patch4 is disabled.

2. If relax_domain_level is not set and the feature is enabled, patch4 takes effect.


-- 
thanks,
kunyu
