Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794198451;
	b=Xiwd8v3W5S6tWg+HaK73QWqC2BHhHaw4baTpUyrhn/OwVgwrJrfklmqi8zRht4OMiDBL
	 5eYMeOLRd2ZMpV4NjN0G1K4AoczrC34LUS3pp+yQbSsE4LBRrUL//6Q2W0Fqyl307t3ss
	 Y+b2h5XO9S9wIsRkzs1yE5FQQc/WoJ6e8WmeECH6HiXlJDcO1KL4Nbw0epSRUOU0aVt6B
	 1VfBT0Gs2s8Lwq8zAirsjtSHRePWAcr88RaEw4uDwyu2eXHcRuU4fSDwH5vtzpT+LCLrf
	 0QNHHRpb5QCrr2Y7Ci+ajCIt0+sVooVRa0wptTXs7L9HFepdOuYYRu4Qu4rG7SAo1hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794198451;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=JEkFw+SS0z1afRw5WQPzZ/ewnEGPN05o4u9nvAEnDUA=;
	b=InAggNHJdwBEuqUZ6zLos8QBevtisEwFyN0QWxNaC7DCG+tHRyGE1izHWzaGAD6yba3J
	 ILi8hdAMYCOw8kZ+DQyMKzrI1uzf6ECDOVll9oRqsKq+Xl3y0zO7ZEEeWzkveutpu7Q/M
	 B5VsY3Ae4WqUlAV0i22jaiGevn6gnEoej2nVELsGWIH27s7ZMz488dmMTntp7HXftQBF4
	 OX53AvWCraTml/gCOiHFGXNKWGvd1HGNqfwCy0mjXH7Yx7o/tYqRvoK/ZHWRfkA8JdzM0
	 csV2JtkdwOb22/+ijS5y91FCwb+NFOb3c2tmk+kKRPAGBv2l/lQU/UDazMgMM4/wRMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IGvmHHwU;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842C9606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 842C9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IGvmHHwU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794198449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JEkFw+SS0z1afRw5WQPzZ/ewnEGPN05o4u9nvAEnDUA=;
	b=IGvmHHwUZXPNgC0ou4Q/MT4yqnxDl1GD0Q2QMML2NiaZggWTcOgGkg8ndhMLQ4MqRM3aYG
	1/j26RAqB3dQh8PD/hcMeX3GPk5skZwR0520y9RhtRWCbxEJTxXxfC3mPSDYyM5SwHKX7l
	EP8ppZIgDhYeIuHhH0/r/Lds+XLlC0w=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-226-8Oi4MqWDMZeQ6spLrGDiEw-1; Sun,
 08 Nov 2026 23:27:26 -0500
X-MC-Unique: 8Oi4MqWDMZeQ6spLrGDiEw-1
X-Mimecast-MFC-AGG-ID: 8Oi4MqWDMZeQ6spLrGDiEw_1794198444
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 02E701956068;
	Mon,  9 Nov 2026 04:27:24 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EF10430000E3;
	Mon,  9 Nov 2026 04:27:21 +0000 (UTC)
Message-ID: <06324bf7-ba8e-4485-b916-8a03eed755ad@redhat.com>
Date: Sun, 8 Nov 2026 23:27:21 -0500
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
Subject: Re: [PATCH] cpu: Fix online housekeeping CPU check in _cpu_down()
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Frederic Weisbecker <frederic@kernel.org>, Tejun Heo <tj@kernel.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Ridong Chen <ridong.chen@linux.dev>, Guopeng Zhang
 <guopeng.zhang@linux.dev>, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261108180849.1268263-1-longman@redhat.com>
 <20261109023703.1551928-1-mathieu.desnoyers@efficios.com>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20261109023703.1551928-1-mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 11/8/26 9:37 PM, Mathieu Desnoyers wrote:
> [ Resent with the lists in Cc. The first copy went to Waiman only. ]
>
> On 2026-11-08 13:08, Waiman Long wrote:
> [...]
>
> This is not about the patch itself, but about the mask it reads. The
> Sashiko AI reviews of this patch and of my sched/isolation patch [1]
> both flag a race on the HK_TYPE_DOMAIN cpumask. I checked it against
> the code. It is real in some configurations, and older than this patch.
>
> Since commit a84097e625f2 ("cgroup/cpuset: Call housekeeping_update()
> without holding cpus_read_lock"), housekeeping_update() replaces the
> mask and frees the old one with only cpuset_top_mutex held. Its message
> says that CPU hotplug can run in parallel. But
> housekeeping_dereference_check() still accepts cpus_write_lock, or
> cpuset_mutex, as enough to read the mask without RCU. _cpu_down() reads
> it that way, with or without this patch:
>
>    CPU 0                                  CPU 1
>
>    write to cpuset.cpus.partition
>      cpuset_update_sd_hk_unlock()
>        mutex_unlock(&cpuset_mutex)
>        cpus_read_unlock()
>                                           echo 0 > .../cpuN/online
>                                             _cpu_down()
>                                               cpus_write_lock()
>                                               m = housekeeping_cpumask(
>                                                     HK_TYPE_DOMAIN)
>                                               <preempted>
>        housekeeping_update()
>          rcu_assign_pointer(...)
>          synchronize_rcu()
>            CPU 1 is not an RCU reader
>          flushes workqueues
>          tmigr_isolated_exclude_cpumask()
>            the !CONFIG_NO_HZ_COMMON stub
>          kfree(old)
>                                               cpumask_any_and(..., m)
>                                                 reads freed memory
>
> With CONFIG_NO_HZ_COMMON, tmigr_isolated_exclude_cpumask() takes
> cpus_read_lock() before kfree(old). That waits for CPU 1. So most
> configurations are safe, but by accident. Without CONFIG_NO_HZ_COMMON,
> nothing makes kfree(old) wait. The same holds when one of its two
> allocations fails: it returns -ENOMEM before it takes the lock.
>
> This comes from reading the code. I did not try to reproduce it.
>
> A fix could make housekeeping_update() take and release
> cpus_read_lock() before kfree(old). That waits for any hotplug reader
> of the old mask, whatever the timer code does. It holds only
> cpuset_top_mutex there, which comes first in the cpuset lock order. I
> did not find a reader that holds cpuset_mutex without the hotplug
> lock, but I did not check every caller. I can send a patch, if you
> agree with that direction.
>
> [1] https://lore.kernel.org/all/20261108185129.1549419-1-mathieu.desnoyers@efficios.com/

Yes, I am aware of the sashiko report of this UAF problem. Taking and 
releasing cpus_read_lock() before kfree() is a possible workaround. 
Another possible fix is to take out cpuset_mutex and cpus_write_lock 
from housekeeping_dereference_check() and add rcu_read_lock/_unlock 
around the housekeeping cpumask access. The latter approach is what I am 
planning to do.

Cheers,
Longman

