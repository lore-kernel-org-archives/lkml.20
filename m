Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792648676;
	b=Uj9z5Badx8vfIrN0mc1hyqbQP9+FisVSC2lIu17X8QVj1GDM95odWjmeCdeBn6lVkeBv
	 2r6YsApQS+jcsffTIb7yLAHNWmtgXHIIYZS9Ley+rPAajMYoHsgjfvSPQJLGrO0eKGP8Z
	 rQRfNGqU2s4Xfs+/J1IBom/yKBQq8Pqwf0wgZLW31I2LJTxCLv/ezMvixP2mE7GM4b8Dn
	 wcqoFhDzLZSdjaMRFy0K8s1IBea3vXFYcqE+ZvOaQJOyRQigT6VLRUCt5fsbhYRaQXSHz
	 STJto1SmkRhF34hsw0Ohw6ArG+EqRwPchIzAu/08kx+IhusvBJCI/1i/mmp6Vm5L8JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792648676;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=y1muRzXbh9xEJli8qmeLMn/g2VS9yM5epSDiKrh66q4=;
	b=sJw1LJ9FZAnlaBJeslA5Eppt/YOu5mV/LOf5WXml8OsMVDESITUljkNeX6b8upoCW41k
	 Qw7gYsPVmK2WvsAuV5+JQLtDkya3HKLFk/PRyDIFhfT/Eco5nVyMvGZnxqrTWsngRmuGs
	 tsy2SaT/qXsk7pusVtTI9zbR04LXPXjhbCNvEDPuF9OF66pup32/P3fMJveD1xpbYAjsR
	 w4FSBR7Rs1ir/uD8/FbLfnL/Z1ovBNQoZpjRQMcH+B0g9frZBWRiahbDpZrL2fZXdDZH9
	 SjJlUAngqJNDGh+u4y3oNM43uQ8vzXzyQe1MCbJAPtgbCYs50dHyMthB5uK5IMrpGFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=U1gLNmwD;
	arc=none smtp.remote-ip=95.215.58.211
Received: from mta1.migadu.com (out-211.mta1.migadu.com [95.215.58.211])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4154B606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4154B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=U1gLNmwD
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PlydeHx41hqXII3ZYHptACB8kpve0J1l4KbAMjAMWaI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792648673; v=1; x=1793253473;
 b=U1gLNmwDwogY1U9ddiF+QQGTn190SA2h2EtxjFtq6k3rrnXWO41TazixWNcdZMEo9Zz04ccm
 nlkB4TjohIjTz4JQw2wMFoyJ0x5vVEU5sd/vv/XKxliLEzb7bfH+6r/lcxzK5Rd9eI8YeHGTy5V
 6me+fyDFzpuYf/0ZSBZUfEa4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ab0e1623da36cf61;
	Thu, 22 Oct 2026 05:57:52 +0000
X-Mizu-Trace-ID: ab0e1623da36cf61
X-Migadu-Flow: FLOW_OUT
Message-ID: <bb11472d-7533-45a2-87cd-a4338e7a0f29@linux.dev>
Date: Thu, 22 Oct 2026 13:57:42 +0800
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
Subject: Re: [PATCH 2/2] cgroup/cpuset: Fix invalid local partition recovery
To: Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
 Ridong Chen <ridong.chen@linux.dev>
Cc: Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 Guopeng Zhang <zhangguopeng@kylinos.cn>
References: <20261010075947.333549-1-guopeng.zhang@linux.dev>
 <20261010075947.333549-3-guopeng.zhang@linux.dev>
 <16db5b91-677e-47ec-b1de-760111b99d23@redhat.com>
Content-Language: en-US
From: Guopeng Zhang <guopeng.zhang@linux.dev>
In-Reply-To: <16db5b91-677e-47ec-b1de-760111b99d23@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/22 11:28, Waiman Long 写道:
> On 10/10/26 3:59 AM, Guopeng Zhang wrote:
>> From: Guopeng Zhang <zhangguopeng@kylinos.cn>
>>
>> An invalid local partition may fail to recover after its exclusive CPU
>> list is changed to a valid one.
>>
>> This can be reproduced on a cgroup v2 system with CPUs 0-7 online:
>>
>>      cd /sys/fs/cgroup
>>      echo +cpuset > cgroup.subtree_control
>>      mkdir A
>>      echo 0-7 > A/cpuset.cpus
>>      echo 0-7 > A/cpuset.cpus.exclusive
>>      echo root > A/cpuset.cpus.partition
>>      cat A/cpuset.cpus.partition
>>      echo 1 > A/cpuset.cpus.exclusive
>>      cat A/cpuset.cpus.partition
>>
>> The first read reports root invalid because all CPUs were requested.
>> After the mask is changed to CPU 1, the partition should become valid,
>> but it remains invalid with PERR_NOCPUS.
>>
>> update_exclusive_cpumask() calls partition_cpus_change() before updating
>> cs->exclusive_cpus. update_parent_effective_cpumask() then gets the
>> old 0-7 mask from user_xcpus() and sets PERR_NOCPUS even though the new
>> mask leaves CPUs for the parent.
>>
>> Move the exclusive_cpus update before partition_cpus_change() so that
>> the partition update sees the new mask.
>>
>> Fixes: 46c521bac592 ("cgroup/cpuset: Enable invalid to valid local partition transition")
>> Signed-off-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
>> ---
>>   kernel/cgroup/cpuset.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index de7553459adc..e96bc66ffa07 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
>> @@ -2546,10 +2546,14 @@ static int update_exclusive_cpumask(struct cpuset *cs, struct cpuset *trialcs,
>>           return -ENOMEM;
>>         trialcs->prs_err = PERR_NONE;
>> -    partition_cpus_change(cs, trialcs, &tmp);
>>         spin_lock_irq(&callback_lock);
>>       cpumask_copy(cs->exclusive_cpus, trialcs->exclusive_cpus);
>> +    spin_unlock_irq(&callback_lock);
>> +
>> +    partition_cpus_change(cs, trialcs, &tmp);
>> +
>> +    spin_lock_irq(&callback_lock);
>>       cpumask_copy(cs->effective_xcpus, trialcs->effective_xcpus);
>>       if ((old_prs > 0) && !is_partition_valid(cs))
>>           reset_partition_data(cs);
> 
> With the patch series that I have just sent out, I can't reproduce this problem. My patch 2 of the series change update_parent_effective_cpumask() to not use user_xcpus() anymore. So that should fix the problem.
> 

Thanks for checking this issue. I'll also test some other scenarios
with your new patch series applied.

Thanks,
Guopeng

