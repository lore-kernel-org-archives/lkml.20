Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B92E4EDCB1;
	Fri, 18 Sep 2026 11:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731469; cv=none; b=VLcEljyjISAXRhN3od2gRvYd2GCmg64+ZYAymKYCoPvYojGtEQkJNkFH5PEoK8u0K+N7g8cc+1BXmcbujCNXa0KZYiCSLRm6czP9JbDHPwdqQtpjFTF5nZUWOOpNJaeZm3tiGylXETMYXhKK5t97we1q+EGznQFvF4mTwCefz9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731469; c=relaxed/simple;
	bh=bdqAFs31xvorXX0M0zzsNaAmciEK3Cr0dJ5m/CjDALI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmf4Wink1B6PI1KJny2MX/7xBF9UDlJP+Ccr0bQC9aVGtUJalmtriPvHavUdfH9Kf2dY3Q+OwMKj/wuBKe4Tms72GeYcvcKOueNlmtPVC+gRkSv9qoXXECybERxhCrzjEOXthuKce1C7v27ZmiD1/gexlgqtZWGTOoNmGFikFpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jcvmfn0B; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jcvmfn0B"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Qsst1GCKodCJVD+N4ePzekgY62P7dq2hg5BL7A9fZDg=; b=jcvmfn0B+VokACd4rYmkMw1day
	cddAGbVqJMvOIoVApfj+kLiM1l1+VcmPwi5Le+CqnaWngDJSU2xhe+rKk+S89KcetBJohKJqrbVaH
	D1C4u3JjCMf6X/ahL2PfXvrOx5LXH77pRqzBgNY+MqngC78D9/2IWoz1Mh4+x+xJXa7jOto27p2oW
	R6SDpcroQWM1myZF8u7Ds5YQ9afU7t4PqTLSjkjn2b21Cvkwoi8+MYEY0TDFlWbHpKSwBVkLkRPYK
	efhMMqcGT4QBD4eWKKff6p7MxCxnNhHzatxuDc1BcwqO80QxNKL0rEODXzjGM37s3wasA1rFjAPUr
	uMdvSI5Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WuO-0000000H9rT-1rhB;
	Fri, 18 Sep 2026 11:37:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 044EB30057F; Fri, 18 Sep 2026 13:37:36 +0200 (CEST)
Date: Fri, 18 Sep 2026 13:37:35 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Shubhang Kaushik <shubhang@os.amperecomputing.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
	Christopher Lameter <clameter@amperecomputing.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 2/2] sched/wait: Clarify WF_SYNC wakeup semantics
Message-ID: <20260918113735.GN776954@noisy.programming.kicks-ass.net>
References: <20260917-sched-wf-sync-doc-v2-0-6d1f107c0596@gentwo.org>
 <20260917-sched-wf-sync-doc-v2-2-6d1f107c0596@gentwo.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-sched-wf-sync-doc-v2-2-6d1f107c0596@gentwo.org>

On Thu, Sep 17, 2026 at 01:43:25PM -0700, Shubhang Kaushik (Ampere) wrote:
> The synchronous waitqueue wakeup comments state that the wakee will not
> be migrated to another CPU. This is not guaranteed by the current
> scheduler wakeup path.
> 
> The synchronous helpers pass WF_SYNC to waitqueue wake functions. The
> default wake function forwards it to the scheduler, where fair-class
> tasks can use it as a wakeup-placement and preemption hint.
> 
> Correct the API comments to describe this behavior and remove the
> incorrect no-migration guarantee.
> 
> Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
> ---
>  kernel/sched/wait.c | 30 ++++++++++++++++--------------
>  1 file changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/kernel/sched/wait.c b/kernel/sched/wait.c
> index d033f600f48c6fc3a0a088ea5d9f6ed95ec4c86e..ac1d260a6a37fc35b934079706819b79e20df4ba 100644
> --- a/kernel/sched/wait.c
> +++ b/kernel/sched/wait.c
> @@ -174,15 +174,16 @@ EXPORT_SYMBOL_GPL(__wake_up_locked_key);
>   * @mode: which threads
>   * @key: opaque value to be passed to wakeup targets
>   *
> - * The sync wakeup differs that the waker knows that it will schedule
> - * away soon, so while the target thread will be woken up, it will not
> - * be migrated to another CPU - ie. the two threads are 'synchronized'
> - * with each other. This can prevent needless bouncing between CPUs.
> + * The caller expects the waker to schedule away soon. This helper passes
> + * WF_SYNC to waitqueue wake functions. The default wake function forwards
> + * it to the scheduler.
>   *
> - * On UP it can prevent extra preemption.
> + * For fair-class tasks, WF_SYNC is a wakeup-placement and preemption
> + * hint. It does not guarantee that the wakee will run on the waker CPU
> + * or avoid migration. On UP, this may avoid an unnecessary preemption.
>   *
> - * If this function wakes up a task, it executes a full memory barrier before
> - * accessing the task state.
> + * If this function wakes up a task, it executes a full memory barrier
> + * before accessing the task state.
>   */
>  void __wake_up_sync_key(struct wait_queue_head *wq_head, unsigned int mode,
>  			void *key)
> @@ -200,15 +201,16 @@ EXPORT_SYMBOL_GPL(__wake_up_sync_key);
>   * @mode: which threads
>   * @key: opaque value to be passed to wakeup targets
>   *
> - * The sync wakeup differs in that the waker knows that it will schedule
> - * away soon, so while the target thread will be woken up, it will not
> - * be migrated to another CPU - ie. the two threads are 'synchronized'
> - * with each other. This can prevent needless bouncing between CPUs.
> + * The caller expects the waker to schedule away soon. This helper passes
> + * WF_SYNC to waitqueue wake functions. The default wake function forwards
> + * it to the scheduler
>   *
> - * On UP it can prevent extra preemption.
> + * For fair-class tasks, WF_SYNC is a wakeup-placement and preemption
> + * hint. It does not guarantee that the wakee will run on the waker CPU
> + * or avoid migration. On UP, this may avoid an unnecessary preemption.
>   *
> - * If this function wakes up a task, it executes a full memory barrier before
> - * accessing the task state.
> + * If this function wakes up a task, it executes a full memory barrier
> + * before accessing the task state.
>   */
>  void __wake_up_locked_sync_key(struct wait_queue_head *wq_head,
>  			       unsigned int mode, void *key)

Does it make sense to have one of those function refer to the other and
de-duplicate all that? Also, how relevant is the UP comment? I don't
think anybody much still cares about UP.
