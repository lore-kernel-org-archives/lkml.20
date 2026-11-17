Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904486;
	b=yoQYQrPfjlNv2KUBH4ILfmEjUmLqMzN1zY30r5furPUnHl8xSfu7oLhqRe+zDtYL5YeX
	 7n4CE//VEUBx4dD/QmFGIYYjNaXs3N4dSNz8JslsHh8qFRVPLnSBixSzr6NdKG8zb7IMe
	 m/N1JvXzAztyugi1cB7xs8BgEcBM+vLN6pLpoOEKOqY+6fPRU0o9w8avaFL6oqEH9zYgM
	 pf41Mfa/85lvOrfhHnDP6/4IdbsVlJLpNDc6xiFmieplj7GnYrhV94XZPIWUS6/Gq1Y9u
	 2sanPjeJQxQy70ifJvO1Nv4e/6cYfEcqjN6h/fViodrm6CZCoAoNIZ3gaWBtmFHngag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904486;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8jCJe6zqZ3Co8pmFbsComOegWB6K4ssivk12S6PyzP0=;
	b=T0amRTisyU9Imr8M4k9jnjRBEA/ID8KoOQxo0w7ZByjgG4aN/D9oo/HYC3e6ZlFWE6Vd
	 Xg+AVXXZ4ylJPFTCbHn90jKEfBuZ9LYNOw9K7GSdVQiA5ODJA578b34ceNllcXMCrY7J4
	 3Tr+u3slPRIDU9YK2XRdK1h31ao7FWE0B47ycroA7rl22FLJ3O/KQdr40fLEZz0FEXt0X
	 Wpq9w31lLWPaoxJPdEHPqelX4O7N6ZTOcA6B1ZM6HUclBTAO/RAEaJhXR19hCGCEhsYpA
	 GhbNF0D99qOPa9BZ2xATa7O4dH1tpIUNl8WN/Uye4CvvMD8/eKYM9Hiz6R1qErBllfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=P03Irz2E;
	arc=none smtp.remote-ip=91.218.175.5
Received: from mta0.migadu.com (out-5.mta0.migadu.com [91.218.175.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F50606A8B5
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90F50606A8B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=P03Irz2E
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wBtQsSagb6ca3eFz5WMEY1v/6WbErz9n5J3dU/87J3o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794904483; v=1; x=1795509283;
 b=P03Irz2EL3oE4595klhHGJkxm1yQCR/Egrev0RppCmz8TONltatXg2scCVWbKaXZ+DGaAAbP
 fWfVBtvhQFg68fZTVaS+RuuZBy8MyAmlJ8ihG2MyU6QPZOcUKLjLY0pZtEqj1TtXApxTfp8TOhv
 vegrXqbUdliabwNFzKFstDjI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d11bd404e42c6712;
	Tue, 17 Nov 2026 08:34:43 +0000
X-Mizu-Trace-ID: d11bd404e42c6712
X-Migadu-Flow: FLOW_OUT
Message-ID: <054a53a3-c038-48fe-ac01-fc24fd8065d0@linux.dev>
Date: Tue, 17 Nov 2026 16:34:34 +0800
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
To: Waiman Long <longman@redhat.com>, Ingo Molnar <mingo@redhat.com>,
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
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20261117051853.2429410-1-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/17/2026 1:18 PM, Waiman Long wrote:
> Commit a84097e625f2 ("cgroup/cpuset: Call housekeeping_update() without
> holding cpus_read_lock") adds a new cpuset_top_mutex on top but drops
> cpus_read_lock and cpuset_mutex before calling housekeeping_update()
> which calls other functions that may acquire cpus_read_lock leading
> to a possibility of deadlock if cpus_read_lock isn't dropped before
> calling housekeeping_update().
> 
> This commit also changes lockdep_is_cpuset_held() to return true if
> either cpuset_mutex or cpuset_top_mutex is held. lockdep_is_cpuset_held()
> is used by housekeeping_dereference_check() as one of the conditions
> that rcu_read_lock() is not needed to access HK_TYPE_DOMAIN
> cpumask which can be changed by housekeeping_update() at run
> time. The housekeeping_dereference_check() function also uses
> lockdep_is_cpus_write_held() as another condition that can skip the
> use of rcu_read_lock().
> 
> In reality, both cpuset_mutex and cpus_write_lock are now no longer
> valid conditions to skip rcu_read_lock(). It is certainly possible
> that there can be a parallel housekeeping_update() call going on if
> only cpuset_mutex or cpus_write_lock is held. This can lead to a
> potential use-after-free situation when HK_TYPE_DOMAIN housekeeping
> cpumask is being accessed.
> 
> One possible solution is to hold rcu_read_lock for functions that may
> be called with only cpuset_mutex or cpus_write_lock is held. Quite a
> large number of functions will need to be modified if rcu_read_lock()
> has to be added. A far simpler solution is to synchronize with other
> cpuset_mutex and cpus_write_lock critical sections before freeing the old
> housekeeping cpumask. This will ensure that code within those critical
> sections will not have a UaF situation when accessing housekeeping
> cpumask. This commit implements the latter solution and make the code
> in lockdep_is_cpuset_held() and housekeeping_dereference_check() correct.
> 
> Fixes: a84097e625f2 ("cgroup/cpuset: Call housekeeping_update() without holding cpus_read_lock")
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>   kernel/sched/isolation.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
> index 156025ef81b7..5634d6a597bd 100644
> --- a/kernel/sched/isolation.c
> +++ b/kernel/sched/isolation.c
> @@ -159,6 +159,16 @@ int housekeeping_update(struct cpumask *isol_mask)
>   	err = kthreads_update_housekeeping();
>   	WARN_ON_ONCE(err < 0);
>   
> +	/*
> +	 * Synchronize with cpuset_mutex and cpus_read_lock to make sure that
> +	 * cpuset_mutex and cpus_write_lock critical sections afterward will
> +	 * not have access to the old housekeeping cpumask.
> +	 */
> +	cpus_read_lock();
> +	cpuset_lock();
> +	cpuset_unlock();
> +	cpus_read_unlock();
> +
>   	kfree(old);
>   
>   	return 0;

Hi Waiman,

Taking the locks and releasing them right away looks a bit odd to me.
It is not obvious what the empty critical section protects until one
reads the commit message.

Let me check that I understand the problem correctly.
housekeeping_dereference_check() lets readers holding cpus_write_lock
or cpuset_mutex access HK_TYPE_DOMAIN without rcu_read_lock(). After
commit a84097e625f2, the pointer is switched and the old cpumask is
freed after cpuset_mutex and cpus_read_lock have been dropped, and
synchronize_rcu() does not wait for those readers. For example:

   CPU A                                  CPU B
   rebuild_sched_domains()                cpuset_update_sd_hk_unlock()
                                            mutex_unlock(&cpuset_mutex)
                                            cpus_read_unlock()
     mutex_lock(&cpuset_mutex)
     p = housekeeping_cpumask(DOMAIN)
                                            housekeeping_update()
                                              rcu_assign_pointer()
                                              synchronize_rcu()
                                              kfree(old)
     access p <- UAF

Here CPU A reads the mask in asym_cpu_capacity_scan() or
dl_get_task_effective_cpus().

If that is right, the root cause is that the pointer is now switched
outside of those locks. So instead of adding a lock barrier before
kfree(), how about switching the pointer before the locks are
dropped? housekeeping_update() could be split into two parts:

  - housekeeping_publish(): allocate, check and publish the new mask,
    called with cpus_read_lock and cpuset_mutex held.

  - housekeeping_update(): synchronize_rcu(), the workqueue flushes and
    kfree(old), called after the locks are dropped as it is now.

Then a reader holding cpuset_mutex either finishes before the pointer
is switched, or only sees the new mask:

   CPU A                                  CPU B
                                          cpuset_update_sd_hk_unlock()
                                            housekeeping_publish()
                                              rcu_assign_pointer()
     mutex_lock(&cpuset_mutex) <- wait
                                            mutex_unlock(&cpuset_mutex)
                                            cpus_read_unlock()
     p = housekeeping_cpumask(DOMAIN)       housekeeping_update()
         <- new cpumask                       synchronize_rcu()
                                              kfree(old)

The same applies to cpus_write_lock readers, as cpus_read_lock is held
until the new mask is published. The workqueue flushes still run
without those locks, so the deadlock fixed by a84097e625f2 does not come
back.

I will send a patch in reply to this mail. Could you take a look and
tell me whether this approach works for you?

-- 
Best regards
Ridong

