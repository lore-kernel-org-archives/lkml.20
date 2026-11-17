Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794897825;
	b=IA+BBcm/EWmbpVQ8u9WeESDWFSJ7lSLeULFQfwIeneLAHWf/uDV9NbXZuvMY1XRnUO9w
	 aOS0T17atov2yKFpA2dLuwvIv1GG5hrlQwpJBML6756Y9BkwpWW90T79UHCAMDpCb0ckT
	 7y3SGskyrrejAtL8ag9NaRlVnMfIuW8qCj3ye4+RFtJbnEKsrvBZHNZefHKNz6m7ughrl
	 rnrqcJ2UTaInWb2wqrbfs2AZvNInFQLqi+1E+DM0/npuJvH1t1RTTUgc3poOhNcsEYBE9
	 EmpNtHe7UqEMPzMxwkuytJC64uZH6xvNzEd8LxrnguI9dm5DZMG4u2f+lfzd/zycttQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897825;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ThhUyn0lQK0bHkHO1Fc6tijF95IxJDbZSzjBU4QD+wk=;
	b=W60mytCF0GCXUSWs3FATolV0KsImJFSkTOON+ejNOS59b32GwiEn/OBQdyuHfq0KFGKW
	 wRMNsNU1L8EmbtRI1a0Bz/uVTh64T2EG8UKOLmjgu0VPkJ3VszXQirlUhvkgPKVcg21eS
	 VI4Ns1ecoMtf1wVA7+9HuWgoRlUGBNLtrHk5Qe5xMZRUoJ5NrcvNUxsWriH8/u1F57XmL
	 mWIO4wyA0SZZJxOEa0CFb5eXD+um4iBOmr/NA3IZRk4MBq9XbL4CK8cmstcP4D1hnkB3Q
	 pAiqZRL65VYBFaL1vXIKP9jmYpInqMNZVAG5+ZFXkxAlayvoD3h4noGxM1hPh0u3MAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NjOhazoH;
	arc=none smtp.remote-ip=91.218.175.224
Received: from mta0.migadu.com (out-224.mta0.migadu.com [91.218.175.224])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BD6606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45BD6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NjOhazoH
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=59cywDmz4bjbV7FM9qeVrxYwleUR667XbYlZ1k8/lZI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794897822; v=1; x=1795502622;
 b=NjOhazoHv1AkCqxpj8XSMmLfAuf8HRe9sp1MXs9hRelWPXVMjhYSEInWmT8QazzZo6vrmUrb
 CYDJxEgikldE0Y29JpFjacO3y6zTub5NgKzMsudNJHQ4mYQKMnAR64hv3XW5c7R8RvT02AoD2AW
 ErlnZx4sg/PW2umyfjTt6tpo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bfbf2bb25fcd2b23;
	Tue, 17 Nov 2026 06:43:41 +0000
X-Mizu-Trace-ID: bfbf2bb25fcd2b23
X-Migadu-Flow: FLOW_OUT
Message-ID: <b26fa408-eee0-4728-849a-21ff2a4a560f@linux.dev>
Date: Tue, 17 Nov 2026 14:43:34 +0800
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
Cc: linux-kernel@vger.kernel.org, Ridong Chen <ridong.chen@linux.dev>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
References: <20261117051853.2429410-1-longman@redhat.com>
Content-Language: en-US
From: Guopeng Zhang <guopeng.zhang@linux.dev>
In-Reply-To: <20261117051853.2429410-1-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/11/17 13:18, Waiman Long 写道:
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
>  kernel/sched/isolation.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
> index 156025ef81b7..5634d6a597bd 100644
> --- a/kernel/sched/isolation.c
> +++ b/kernel/sched/isolation.c
> @@ -159,6 +159,16 @@ int housekeeping_update(struct cpumask *isol_mask)
>  	err = kthreads_update_housekeeping();
>  	WARN_ON_ONCE(err < 0);
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
>  	kfree(old);
>  
>  	return 0;

Hi Waiman,

This looks good to me.

Nit: Could the comments in housekeeping_dereference_check() be updated
as well? They seem to be outdated after the locking changes.

Acked-by: Guopeng Zhang <zhangguopeng@kylinos.cn>

Thanks,
Guopeng
