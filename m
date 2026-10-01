Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633EE49AA24
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790846561; cv=none; b=G7IWrXXkYT7lFUAPSkb9xgzngI3xJR4QYF7gDmLW9oOdbrYwS0QWvgM/bSCcfayjqOwzOSFrj0DVj9p6YdUdHllZeFGaKAJ9jStNiyofye1pjplEgJl8q+sscphB7GInhL8rlYQXKY5ejH2dHNzPnSFMTT54zuZip5QE/dJGy8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790846561; c=relaxed/simple;
	bh=3wNDm0lcFFGOwQzcYeZh2sS7c2q+vGogQy+z9+Z0BTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UOCWL+6FwMhoIaFL6NgUF8n0phxI59b2tbPEjtqaa3MVOq1tGTF4vD8cwVDkbeja9NgzPffVfaB2iFbTuYQBDTvToGutNbDxEF0/vs2PlQ1snfywpLXeS3AWIIQ7cfaMpDmlVm5exo3uPgEeagku2vgZbDARDJ4w8tc1NuNrsO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=gJ1qlBvE; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="gJ1qlBvE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=KAS9nccWQxy7wzoQ15glvxQifDTF+AyI7CQ7dcp9lhk=; b=gJ1qlBvEzACCa6Mdid844+KLcI
	fbNS6zt1QsyDfxRXycWA7N6VqIMZRSh+K81gKN1eoYwrSFwLI5ktpTXLlOPl/kT670yvhWovaSAZl
	bQvKPqOUJYzVTSjWqYMF/+xVe8RONhygONMkID81A7L44BRyBfk2Pb1AW8jKTzEfHaZH38pJXOmVd
	1DtjhjbnZdmfbu4TUt4j2r0gzs7XeEc/0TPvBeVxJCM7f286Xv72LghyelI4dozyWWbdTVYyUIQj1
	904MRMxQhYLnw01U2YZjmxRObfhlhJINepQsRVJaZgyZ2U/h8cM38iCu7BGBv07pbDHWeJfhktIZr
	icKv2n2g==;
Received: from [81.79.79.1] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xCCzj-009p35-O7; Thu, 01 Oct 2026 11:22:27 +0200
Message-ID: <04153ee4-0d2a-4499-849d-e3a5ec87e863@igalia.com>
Date: Thu, 1 Oct 2026 10:22:26 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 2/3] workqueue: Add support for real-time workers
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Bradley Morgan <include@grrlz.net>, Chia-I Wu <olv@google.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost <matthew.brost@intel.com>,
 Steven Price <steven.price@arm.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Breno Leitao <leitao@debian.org>
References: <20260923161251.45428-1-tvrtko.ursulin@igalia.com>
 <20260923161251.45428-3-tvrtko.ursulin@igalia.com>
 <3ff40909da4f1510419ac0e2f9f4e6a1@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <3ff40909da4f1510419ac0e2f9f4e6a1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 29/09/2026 01:00, Tejun Heo wrote:
> Hello,
> 
> On Wed, Sep 23, 2026 at 05:12:50PM +0100, Tvrtko Ursulin wrote:
>> For use cases such as the DRM scheduler submitting work to the GPU on
>> behalf of low latency userspace applications, where latter have sufficient
>> privileges to have had successfully obtained realtime Vulkan global
>> priority, competing with random background CPU load can create large
>> latency spikes which gets in the way of a smooth user experience.
> 
> panthor's group_priority_permit() also allows realtime groups for DRM
> master without CAP_SYS_NICE. What's the usage model there? Should DRM
> master be enough to get RT workers?

Usage model is one active compositor per device with the logind 
orchestrating on switch. So I'd say yes, it makes sense to allow the 
compositor RT. I shall improve the commit text to mention this.

>> @@ -374,8 +374,9 @@ enum wq_flags {
>>   	WQ_FREEZABLE		= 1 << 2, /* freeze during suspend */
>>   	WQ_MEM_RECLAIM		= 1 << 3, /* may be used for memory reclaim */
>>   	WQ_HIGHPRI		= 1 << 4, /* high priority */
>> -	WQ_CPU_INTENSIVE	= 1 << 5, /* cpu intensive workqueue */
>> -	WQ_SYSFS		= 1 << 6, /* visible in sysfs, see workqueue_sysfs_register() */
>> +	WQ_RTPRI		= 1 << 5, /* real-time priority, valid only with WQ_UNBOUND */
>> +	WQ_CPU_INTENSIVE	= 1 << 6, /* cpu intensive workqueue */
>> +	WQ_SYSFS		= 1 << 7, /* visible in sysfs, see workqueue_sysfs_register() */
> 
> Can we name it just WQ_RT? Also, I think WQ_RT is closer to WQ_BH. We can
> reorder the flags later if that helps but for now can you just put it in an
> empty slot?

Sure, I thought it makes sense to group the related features together 
but if you prefer a smaller diff I will do that.

> 
>> @@ -127,6 +127,7 @@ enum wq_internal_consts {
>>   	 */
>>   	RESCUER_NICE_LEVEL	= MIN_NICE,
>>   	HIGHPRI_NICE_LEVEL	= MIN_NICE,
>> +	RTPRI_NICE_LEVEL	= MIN_NICE - 1,
> 
> Can we match the scheduler's representation instead by replacing
> attrs->nice with attrs->prio which uses the same encoding as p->prio?
> Normal pools would be NICE_TO_PRIO(nice) and WQ_RT pools would be in the RT
> range. create_worker() would then do:
> 
> 	if (rt_prio(pool->attrs->prio))
> 		sched_set_fifo_low(worker->task);
> 	else
> 		set_user_nice(worker->task, PRIO_TO_NICE(pool->attrs->prio));

Ack.

>> @@ -7606,7 +7626,10 @@ static ssize_t nice_show(struct device *dev, struct device_attribute *attr,
>>   	int written;
>>
>>   	mutex_lock(&wq->mutex);
>> -	written = scnprintf(buf, PAGE_SIZE, "%d\n", wq->attrs->nice);
>> +	if (wq->attrs->nice == RTPRI_NICE_LEVEL)
>> +		written = scnprintf(buf, PAGE_SIZE, "rt\n");
>> +	else
>> +		written = scnprintf(buf, PAGE_SIZE, "%d\n", wq->attrs->nice);
> 
> Can you also show rt in pr_cont_pool_info() and tools/workqueue/wq_dump.py?
> 
> Thanks.

Of course, I wasn't aware of that tool. Do you prefer in the same patch 
or separate?

Regards,

Tvrtko

