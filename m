Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794931340;
	b=OIRZ/VUcuynCy2eAhRO0pGmGUYYTXAYl1yN1XlK5tv9Xvin3iiOvo7/k7x2YMZePUQvU
	 VdrImnkH5pjykhSiiwoW6aDBz9VnQC+HjGozVF0hUyIhwqnmXQ+suhF/Sh8JNVfbTH1kT
	 4udqCmsztPm++WR1YYaK+DFr+XBrfOxb4Wm7mIEfVKadkzOXtdkqw1+wBou7ms7KkQzs7
	 q/xUW4/CpqCO9CT6RU85MpI0Q2KJgQLUeuMn/+GY3qJXpX1riBG5jkk7QvRhbVWW77QkU
	 EaQ9PRFvrYbR03FS1EaFhfbI34ez6++qLVNauHHGlM1fd+8hZOSLYOSOHNQCt01B0+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794931340;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=HQXFEjcKDKmNARb95O11s6PnWmjpZQCT4DGs1RHc8QY=;
	b=WnRaflLZH3tGlxsGp4+DxTgdV2101ild8dZxpDpucqzjVqkQp6T2nIFha68GAr8TQNd5
	 EI3MECZZFKN4eNQIZMY6T1DvqHQ01sApE35t4h2y+qQpJ4YdRkn474k7Kh+4upVdzqTE4
	 MMxCi9sET8jz/9bNquOpVur3QqqLAfAxotdbK2VyW2Izzk/4WPiDEvBdndTNrUc/NMbCo
	 jKJoQvPI5XHP5jAnKLkJO41XOWh6KWYR0zDVyelU4KXBAAaABnkKsnjpgywjl999r3wOR
	 nrXpRnO6pKSAFeT24/miuiS8ENp/tBb4uLXEVCsBp+Bcs5vNy9IE1e8ziDd/0Zhi16g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dGSMMkAd;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5A0606A333
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F5A0606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dGSMMkAd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794931339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HQXFEjcKDKmNARb95O11s6PnWmjpZQCT4DGs1RHc8QY=;
	b=dGSMMkAdnikaHq0CVWhQZlAXyMG5JSPff0iC43yDiWFt3nIRCGIcvv48J1inX3QKtWkgEh
	K16jz3muuZBWu98E7gfzR+rob4WRNgjkE3pUyxJof0bBaDRwYN6NdBR+ApGy4LAndt8uim
	F2GERsksd2Xfn75t9id3QcIIDGBL7X8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-235-mUKf0wkuPdqXZQbs14mgUw-1; Tue,
 17 Nov 2026 11:02:15 -0500
X-MC-Unique: mUKf0wkuPdqXZQbs14mgUw-1
X-Mimecast-MFC-AGG-ID: mUKf0wkuPdqXZQbs14mgUw_1794931333
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5ADB7195DE7F;
	Tue, 17 Nov 2026 16:02:07 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BE521349;
	Tue, 17 Nov 2026 16:02:02 +0000 (UTC)
Message-ID: <090384c2-c15f-4357-a7dd-4330972c8c51@redhat.com>
Date: Tue, 17 Nov 2026 11:02:01 -0500
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
Subject: Re: [PATCH v2] sched/isolation: Enable cpuset_mutex/cpus_read_lock
 synchronization before freeing old housekeeping cpumask
To: Ridong Chen <ridong.chen@linux.dev>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Tejun Heo <tj@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, Guopeng Zhang <guopeng.zhang@linux.dev>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
References: <20261117051853.2429410-1-longman@redhat.com>
 <054a53a3-c038-48fe-ac01-fc24fd8065d0@linux.dev>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <054a53a3-c038-48fe-ac01-fc24fd8065d0@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On 11/17/26 3:34 AM, Ridong Chen wrote:
>
>
> On 11/17/2026 1:18 PM, Waiman Long wrote:
>> Commit a84097e625f2 ("cgroup/cpuset: Call housekeeping_update() without
>> holding cpus_read_lock") adds a new cpuset_top_mutex on top but drops
>> cpus_read_lock and cpuset_mutex before calling housekeeping_update()
>> which calls other functions that may acquire cpus_read_lock leading
>> to a possibility of deadlock if cpus_read_lock isn't dropped before
>> calling housekeeping_update().
>>
>> This commit also changes lockdep_is_cpuset_held() to return true if
>> either cpuset_mutex or cpuset_top_mutex is held. 
>> lockdep_is_cpuset_held()
>> is used by housekeeping_dereference_check() as one of the conditions
>> that rcu_read_lock() is not needed to access HK_TYPE_DOMAIN
>> cpumask which can be changed by housekeeping_update() at run
>> time. The housekeeping_dereference_check() function also uses
>> lockdep_is_cpus_write_held() as another condition that can skip the
>> use of rcu_read_lock().
>>
>> In reality, both cpuset_mutex and cpus_write_lock are now no longer
>> valid conditions to skip rcu_read_lock(). It is certainly possible
>> that there can be a parallel housekeeping_update() call going on if
>> only cpuset_mutex or cpus_write_lock is held. This can lead to a
>> potential use-after-free situation when HK_TYPE_DOMAIN housekeeping
>> cpumask is being accessed.
>>
>> One possible solution is to hold rcu_read_lock for functions that may
>> be called with only cpuset_mutex or cpus_write_lock is held. Quite a
>> large number of functions will need to be modified if rcu_read_lock()
>> has to be added. A far simpler solution is to synchronize with other
>> cpuset_mutex and cpus_write_lock critical sections before freeing the 
>> old
>> housekeeping cpumask. This will ensure that code within those critical
>> sections will not have a UaF situation when accessing housekeeping
>> cpumask. This commit implements the latter solution and make the code
>> in lockdep_is_cpuset_held() and housekeeping_dereference_check() 
>> correct.
>>
>> Fixes: a84097e625f2 ("cgroup/cpuset: Call housekeeping_update() 
>> without holding cpus_read_lock")
>> Signed-off-by: Waiman Long <longman@redhat.com>
>> ---
>>   kernel/sched/isolation.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
>> index 156025ef81b7..5634d6a597bd 100644
>> --- a/kernel/sched/isolation.c
>> +++ b/kernel/sched/isolation.c
>> @@ -159,6 +159,16 @@ int housekeeping_update(struct cpumask *isol_mask)
>>       err = kthreads_update_housekeeping();
>>       WARN_ON_ONCE(err < 0);
>>   +    /*
>> +     * Synchronize with cpuset_mutex and cpus_read_lock to make sure 
>> that
>> +     * cpuset_mutex and cpus_write_lock critical sections afterward 
>> will
>> +     * not have access to the old housekeeping cpumask.
>> +     */
>> +    cpus_read_lock();
>> +    cpuset_lock();
>> +    cpuset_unlock();
>> +    cpus_read_unlock();
>> +
>>       kfree(old);
>>         return 0;
>
> Hi Waiman,
>
> Taking the locks and releasing them right away looks a bit odd to me.
> It is not obvious what the empty critical section protects until one
> reads the commit message.
>
> Let me check that I understand the problem correctly.
> housekeeping_dereference_check() lets readers holding cpus_write_lock
> or cpuset_mutex access HK_TYPE_DOMAIN without rcu_read_lock(). After
> commit a84097e625f2, the pointer is switched and the old cpumask is
> freed after cpuset_mutex and cpus_read_lock have been dropped, and
> synchronize_rcu() does not wait for those readers. For example:
>
>   CPU A                                  CPU B
>   rebuild_sched_domains() cpuset_update_sd_hk_unlock()
> mutex_unlock(&cpuset_mutex)
>                                            cpus_read_unlock()
>     mutex_lock(&cpuset_mutex)
>     p = housekeeping_cpumask(DOMAIN)
>                                            housekeeping_update()
>                                              rcu_assign_pointer()
>                                              synchronize_rcu()
>                                              kfree(old)
>     access p <- UAF
>
> Here CPU A reads the mask in asym_cpu_capacity_scan() or
> dl_get_task_effective_cpus().
>
> If that is right, the root cause is that the pointer is now switched
> outside of those locks.

The way that housekeeping cpumask is being accessed is that you are 
going to either get the old cpumask pointer or the new cpumask 
pointer.  It won't be a mess-up version. So lock protection is not 
essential in this regard.

In the case of old pointer being used, the important point is that it 
cannot be freed while its content is being accessed.

>  So instead of adding a lock barrier before
> kfree(), how about switching the pointer before the locks are
> dropped? housekeeping_update() could be split into two parts:
>
>  - housekeeping_publish(): allocate, check and publish the new mask,
>    called with cpus_read_lock and cpuset_mutex held.
>
>  - housekeeping_update(): synchronize_rcu(), the workqueue flushes and
>    kfree(old), called after the locks are dropped as it is now.
>
> Then a reader holding cpuset_mutex either finishes before the pointer
> is switched, or only sees the new mask:
>
>   CPU A                                  CPU B
> cpuset_update_sd_hk_unlock()
>                                            housekeeping_publish()
>                                              rcu_assign_pointer()
>     mutex_lock(&cpuset_mutex) <- wait
> mutex_unlock(&cpuset_mutex)
>                                            cpus_read_unlock()
>     p = housekeeping_cpumask(DOMAIN)       housekeeping_update()
>         <- new cpumask                       synchronize_rcu()
>                                              kfree(old)
>
> The same applies to cpus_write_lock readers, as cpus_read_lock is held
> until the new mask is published. The workqueue flushes still run
> without those locks, so the deadlock fixed by a84097e625f2 does not come
> back.

That will certainly work too. I choose the current solution as it is 
more localized instead of spreading out to a large code section. Either 
one will work.

Cheers,
Longman

