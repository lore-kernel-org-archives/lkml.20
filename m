Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375386;
	b=ypjqwi3wjI6cFvB15xYb4+uWWwk/C3MZFXUT48hGDqUFKy7ng5P5BrQEJUX9XzH3JKDV
	 1U+H9YaH4vdgCmWYvdcHpUYYrEfjR3T0q3SfivzHYv9qMZB6++ekfaHgJ8LTSHqivV9Vn
	 6ODhlwAQq+rMKG5BJE10k5jqoVF5J5Bv8XPzf++gigxDvJCPnxVg2rSJaPXT16Tjb7US1
	 bqbB6Uz7MSm0dQclBNVAFf9T/quuPO1dkXp4skaG6nfUlUfroT1s7FwnoqXCPKDXpnkuK
	 8hM8iOahCIRcy9DhJCNaCu/9tDroj/JSMF4nNZrReYIoYKBJn8UeeYtOJX4XV0J2MvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375386;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=LIVKGcC9fdG6pCYULEkiHx7DK7D3D6+pfOjhXnMVntw=;
	b=GAR9CsIkZnBSvjtCpRVi5ZCG8Web5T6sVGQg4aLE6EJ4bQL0W4qZ9XlF1T5J4XEOE5Mm
	 xzEuXi7K4aeICVAg7wEvpfGqEyRrZrRWIkBwFS1ZWj9pbHSGt2lcvlf6ndNBkbwM4PuZE
	 Bc1NnBJMT9BHVoKxDzIJgfej8jQz4G+NW9KJZM1FEsLzXj5MmwJpHs4ovENHlqgBOFHb5
	 Reto4CKkKYgjMNajdqw/ypECS+v8RJoS6tZsLXb4DYksvedMM81WlA5dE95Wc9oIWJgUT
	 3AznJUQqC2nd811Fed4dJCtcaM5EUix7wRWLlnbG0oMGA0PGhC0Cu6OsUGiiOZVuKeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Kc4ynsYY;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8DA606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C8DA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Kc4ynsYY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LIVKGcC9fdG6pCYULEkiHx7DK7D3D6+pfOjhXnMVntw=; b=Kc4ynsYYAz//E8Oda0lVcL6Kql
	Sbef0hqDsCa7Rog0Q39FPi+6+4HlipOEer8QoZwmNwGq6W3EI8Sz7RT2RfuCLJQz8rTAqektoDNUo
	4S+Nzgiklwpq9Sis4gQEQ3w+TIfWnOyCVmxYHCH4ewa26NjjfUL3ej7DUU4Vh+0TgpWHHEsna6+aG
	e2YmDbhiQupO0jK3qMF9zgvs6on/5yiPAPlxtv+4aPuOEVumMo7hEIHnMXiKpCvImCyEiz1If901i
	pSL1bakWzLonb5gLVaJYsakEK3pV2NT07PKNMr/3Fgszi1QtWh5RKIgCvIoMlE4bwRpdt6osGo5Fp
	lb5nOjAQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMorN-00000007e08-1ckO;
	Fri, 30 Oct 2026 15:49:41 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 41684300578; Fri, 30 Oct 2026 16:49:40 +0100 (CET)
Date: Fri, 30 Oct 2026 16:49:40 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Daehyeon Ko <4ncienth@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH] sched/autogroup: Fix task_group UAF during thread
 creation
Message-ID: <20261030154940.GW2668564@noisy.programming.kicks-ass.net>
References: <20261023013631.881730-1-4ncienth@gmail.com>
 <20261026115707.GF2668200@noisy.programming.kicks-ass.net>
 <20261030034540.2074077-1-4ncienth@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030034540.2074077-1-4ncienth@gmail.com>

On Fri, Oct 30, 2026 at 12:45:34PM +0900, Daehyeon Ko wrote:
> On Mon, Oct 26, 2026 at 12:57:07PM +0100, Peter Zijlstra wrote:
> > I'm not sure this works; afaict this will result in a NULL deref
> > instead.
> 
> Thanks for taking a look.
> 
> The NULL previous cfs_rq should be handled by the existing set_task_rq()
> contract. __sched_fork() initializes p->se.cfs_rq to NULL, and the normal
> sched_cgroup_fork() path reaches set_task_rq() through __set_task_cpu().
> set_task_rq_fair() returns when prev is NULL, before
> cfs_rq_last_update_time(prev), and set_task_rq() then installs the new
> cfs_rq, parent, and depth.
> 
> > Can't we make ksys_setsid() more complicated instead? Have it create the
> > autogroup in advance, move under the tasklist_lock and destroy on
> > failure or something?
> 
> I don't think moving the autogroup move under tasklist_lock alone closes
> the window, because sched_cgroup_fork() runs before copy_process() takes
> tasklist_lock:
> 
>   clone(CLONE_THREAD)              setsid()
>   -------------------              --------
>   sched_cgroup_fork() -> old tg
>                                     create new autogroup
>                                     lock(tasklist_lock)
>                                     move listed threads; child is absent
>                                     unlock(tasklist_lock)
>                                     drop old autogroup reference
>   lock(tasklist_lock)
>   publish child with old tg
> 
> The ordering trace hit this pre-publication sequence seven times. The
> final revalidation is intended to cover precisely this interval.
> 
> Am I missing another ordering which excludes this interleaving?

No, I think you're right. Also, its a mess :/

We have far too many sched hooks here:


free_signal_struct:
  sched_autogroup_exit();

__put_task_struct:
  sched_core_free();

copy_mm:
  sched_cache_fork();

copy_signal:
  sched_autogroup_fork();



copy_process:
 ret = sched_fork()
   scx_pre_fork()
     LOCK scx_fork_rwsem

 cgroup_can_fork()
   LOCK cgroup_threadgroup_rwsem

 ret = sched_cgroup_fork();
   sched_class::task_fork()
   return scx_fork() // requires scx_fork_rwsem;
                     // also requires p->sched_task_group to be correct;
		     // scx ignores auto-group

 LOCK tasklist_lock

 sched_core_fork() // requires tasklist_lock

 LOCK siglock

+ sched_autogroup_fork_finish();

 UNLOCK siglock
 UNLOCK tasklist_lock

 cgroup_post_fork()
   UNLOCK cgroup_threadgroup_rwsem

 sched_post_fork()
   scx_post_fork()
     UNLOCK scx_fork_rwsem



Now, AUTOGROUP depends on CGROUP, so we can make autogroup_move_group()
also use cgroup_threadgroup_rwsem, such that the autogroup and cgroup
logic stays the same?

I'd hate for this to get more complicated than it already is.

I mean, yes we can move sched_core_fork() into the siglock region, but
duplicating most of sched_cgroup_fork() in there just to fix an
autogroup thingy seems weird and inconsistent.
