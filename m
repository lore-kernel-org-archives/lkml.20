Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792830835;
	b=gAQ5+Ef2dbxd56zqqsU/JT5TwYqoy5VXo9rLCoJrIvACd8+aOPcyEreAtrV0zhXo/Lzj
	 QA8007LEbzpLC27mydgwnUO9U9Ad4KlVSHYlPOCwezuAhRFO3LfzUDvUkoqGahpx/A0Y+
	 TmOscod6w9l/2mHFwemLcPGozJNwl/FQPEKHazSM8M0DtTR/HYiSDvAoWlL9DC2RhYEYB
	 XAGo+r9hx0nCbKvQINPHssEizO9GZr1qhauA2QZ2iTAiqd9NLO7kiTP24aA3lbX9moIKf
	 NHlBhvdabVAVYbmgi4LslYibCMNk/LLOGYIuQkNYw12Moso42coUwWymEayfg1GV1og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792830835;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=YZp8rZSWWef+hEr5NB+SbuoHJzJ2AWaAzEx8GEGIuyQ=;
	b=w07O2ZxPDGKHPl4+fcBD2nYnJEmqOfMUpwoSG9yWVo0b+ViQOdPznjrQQzH6MuNU/lYl
	 NSObJETlnRpDSOnLcRhQaO3Vwe8z3kC9UsxiJMJJk0zbf+WGIwMCEhPNHDc7wRCfM+Jpr
	 VCzaG49EXnerZvYzsULoxgOYujLeEluF854vTAQRFUidJ/5BKtUoV8ASPEwsl8t6XUlQu
	 yGNRlOVHmdZnOPHwPH4JV7CesWPRyg5W2nxgt8MfJT7vqZndjwUO7qyJQ0kaUQqwcEGgC
	 i83smQnoPjH4hyPHVZYQo1qtwA2mLkDsmMompW7uIfmyocr4V2eQDPUPv5iQ6pXarEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=BFusP6TS;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30008606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30008606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=BFusP6TS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=YZp8rZSWWef+hEr5NB+SbuoHJzJ2AWaAzEx8GEGIuyQ=; b=BFusP6TS+Hz4o2rJgHW/d5pNLQ
	XeZQPJXD2kfpJbHlCFYxupyVZIw6917Lwo1Bq6+Nitpd/h3OXh5aW9V/j33cRlGTnp/Z07gUUiMWY
	VoWqDQDLpOSQqjGImn8gl6EY4BZ+FgRn7VdQ9VwJkoZ6pZuNTRy0p4j2Xkcajne5iXrZ5NjON03gN
	xwJ+Cv43QTbsW2tTVX7cnK32oTBELTYwhpQppHAbEyDVPtbq2PX34nZ+TpjbEdB/CwOj5/aJlEbWX
	KoWaOWHdh62utanx1qtaloVPH6DTG2H/rO5RE3DVoA9Qb12Ek+6nX1K+GTpulXsGDoLiSbJsxj72P
	MiR7fa3g==;
Received: from [81.79.79.1] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xKXCB-008iD9-5r; Sat, 24 Oct 2026 10:33:43 +0200
Message-ID: <9d6add80-2ec9-4f29-a815-ad0e955f7b5a@igalia.com>
Date: Sat, 24 Oct 2026 09:33:42 +0100
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
Subject: Re: [PATCH v7 3/4] workqueue: Add support for real-time workers
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Bradley Morgan <include@grrlz.net>, Chia-I Wu <olv@google.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost <matthew.brost@intel.com>,
 Steven Price <steven.price@arm.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Breno Leitao <leitao@debian.org>
References: <20261022093848.5727-1-tvrtko.ursulin@igalia.com>
 <20261022093848.5727-4-tvrtko.ursulin@igalia.com>
 <a3ae9a0f13e3972d0645f555bcc26f4f@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <a3ae9a0f13e3972d0645f555bcc26f4f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hi Tejun,

On 23/10/2026 22:28, Tejun Heo wrote:
> Hello, Tvrtko.
> 
> On Thu, Oct 22, 2026 at 10:38:47AM +0100, Tvrtko Ursulin wrote:
>>   struct workqueue_attrs {
>>   	/**
>> -	 * @nice: nice level
>> +	 * @prio: priority encoded analogous to task_struct->prio.
>>   	 */
>> -	int nice;
>> +	int prio;
> 
> Can the nice to prio conversion be split into a preparation patch with
> no functional change, so that this patch only adds WQ_RT on top?

Can do. I'll get to it the week after next. (Tweaks to other patches in 
the series as well.) Should I switch to a different base branch by then?

>>   sanitize_immutable_workqueue_attrs(struct workqueue_struct *wq,
>>   				   struct workqueue_attrs *attrs)
>>   {
>> +	if (wq->flags & WQ_RT) {
>> +		attrs->prio = RT_PRIORITY;
>> +		/* Strict CPU affinity for low latency execution. */
>> +		attrs->affn_scope = WQ_AFFN_CPU;
>> +		attrs->affn_strict = true;
>> +	}
> 
> Can WQ_RT set only the priority and leave the affinity at the defaults?
> If the pinning is needed for the latency, can you share numbers with
> and without it?

I could do that although note the current numbers are actually without 
strict affinity because that is what the initial RFC did. Then in msg-id 
  b3e5bcb21184d13c7c631daac955f465@kernel.org you suggested to make them 
strict affinity. So latencies 95% and 9% percentiles were already good 
enough without it. But if you are curious how much better strict 
affinity makes them I can measure, it is not a huge effort.

>>   	mutex_lock(&wq->mutex);
>> -	written = scnprintf(buf, PAGE_SIZE, "%d\n", wq->attrs->nice);
>> +	if (wq->attrs->prio == RT_PRIORITY)
>> +		written = scnprintf(buf, PAGE_SIZE, "rt\n");
>> +	else
>> +		written = scnprintf(buf, PAGE_SIZE, "%d\n",
>> +				    PRIO_TO_NICE(wq->attrs->prio));
> 
> Can the sysfs interface comment above struct wq_device be updated too?
> It still lists nice as RW int, while nice reads "rt" and is read-only
> for WQ_RT.

Sure, I did not spot that comment until now. Tunnel vision it seems. :)

>> +rt_prio = prog.constant('RT_PRIORITY', filename='kernel/workqueue.c')
>> ...
>> +    nice = pool.attrs.prio.value_()
>> +    if nice == rt_prio:
>> +        nice = 'rt'
>> +    else:
>> +        nice = nice - 120 # PRIO_TO_NICE
> 
> These fail on a kernel without this patch, where neither RT_PRIORITY
> nor attrs.prio exists. Can they fall back to nice, the way wq_attrs()
> falls back to unbound_attrs for the earlier rename?

Hmm.. I could do that, but since the tool ships within the kernel does 
it _need_ to have backward compatibility regarding kernel _internal_ 
implementation details?

Regards,

Tvrtko

