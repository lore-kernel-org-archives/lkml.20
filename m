Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CA53FD12A;
	Tue, 22 Sep 2026 18:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790103142; cv=none; b=VctaNi8MbQdhA940NxffoCFahv74TyGk4Je+py9IU0Drdla4PgJBu9pScicYqwv+5ZSI0E1+3AsOGR6umvd/+ONms9ubFmy6fHhzQMkD5Sp3X5zSTrCk4z8OQ5nddeBO6a1vF9N+e/bpPdlwZV8P3DAyay4tdE1wP7GNM57820o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790103142; c=relaxed/simple;
	bh=xnQm2+amSAgvO5Z12c1qHMNDypd/FiR9OLaZ1vS3toE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=csftB676xsapuN6xDL3NZzrnf2VjybdxOkUa9WhyEtvt41jK5IzuLI4zrchdYd8YzAumPc5kPAQDzw2LEGlPjidU6ZNKHK6oSt2ZkcACWmKsSOygnu0whziYdelptObb91IGvX/ot0mfZPcxBHprnx6vFJXTSxL82APMYLj3eSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=mOiF3kCa; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="mOiF3kCa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1790102663;
	bh=xnQm2+amSAgvO5Z12c1qHMNDypd/FiR9OLaZ1vS3toE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mOiF3kCavHoT3Xn3skIsIgy023iX8+tl6kOtQDymPMNuEbdp4x8WKfSPjPdHLrhPe
	 PM8Drx46eI+tS+W9AdIhxBha9Ikjaec9OcvkxmQstlOvlgqpgwTUSEAdXLPvxLPkvw
	 S8WtV6DB/8M0WmmqFN57J0oHNCWQP8yC9lEmnyWA=
Received: by gentwo.org (Postfix, from userid 1007)
	id 63244402BC; Tue, 22 Sep 2026 11:44:23 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 60662401A2;
	Tue, 22 Sep 2026 11:44:23 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:44:23 -0700 (PDT)
From: Shubhang <sh@gentwo.org>
To: Peter Zijlstra <peterz@infradead.org>
cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
    Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
    Juri Lelli <juri.lelli@redhat.com>, 
    Vincent Guittot <vincent.guittot@linaro.org>, 
    Dietmar Eggemann <dietmar.eggemann@arm.com>, 
    Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
    Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
    K Prateek Nayak <kprateek.nayak@amd.com>, 
    Shubhang Kaushik <shubhang@os.amperecomputing.com>, 
    Shrikanth Hegde <sshegde@linux.ibm.com>, 
    Madadi Vineeth Reddy <vineethr@linux.ibm.com>, 
    Christopher Lameter <clameter@amperecomputing.com>, 
    linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 2/2] sched/wait: Clarify WF_SYNC wakeup
 semantics
In-Reply-To: <20260918113735.GN776954@noisy.programming.kicks-ass.net>
Message-ID: <e1028918-6421-235e-8407-7fa51adc2f14@gentwo.org>
References: <20260917-sched-wf-sync-doc-v2-0-6d1f107c0596@gentwo.org> <20260917-sched-wf-sync-doc-v2-2-6d1f107c0596@gentwo.org> <20260918113735.GN776954@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2106592082-1790102663=:1976520"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2106592082-1790102663=:1976520
Content-Type: text/plain; charset=ISO-8859-7; format=flowed
Content-Transfer-Encoding: 8BIT

Hi Peter,

Thanks for the review and suggestions.

The intent was only to preserve the small but important contract that
callers must not treat WF_SYNC as a no-migration or run-next guarantee.
As Shrikanth noted, that ambiguity has already led to confusing uses 
and proposals.

I agree that standalone documentation is overkill here. I¢ll instead 
keep the contract as a concise comment next to WF_SYNC, remove the stale
waitqueue wording, and de-duplicate the locked-helper comment in a 
single patch.

Thanks,
Shubhang Kaushik

On Fri, 18 Sep 2026, Peter Zijlstra wrote:

> On Thu, Sep 17, 2026 at 01:43:25PM -0700, Shubhang Kaushik (Ampere) wrote:
>> The synchronous waitqueue wakeup comments state that the wakee will not
>> be migrated to another CPU. This is not guaranteed by the current
>> scheduler wakeup path.
>>
>> The synchronous helpers pass WF_SYNC to waitqueue wake functions. The
>> default wake function forwards it to the scheduler, where fair-class
>> tasks can use it as a wakeup-placement and preemption hint.
>>
>> Correct the API comments to describe this behavior and remove the
>> incorrect no-migration guarantee.
>>
>> Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
>> ---
>>  kernel/sched/wait.c | 30 ++++++++++++++++--------------
>>  1 file changed, 16 insertions(+), 14 deletions(-)
>>
>> diff --git a/kernel/sched/wait.c b/kernel/sched/wait.c
>> index d033f600f48c6fc3a0a088ea5d9f6ed95ec4c86e..ac1d260a6a37fc35b934079706819b79e20df4ba 100644
>> --- a/kernel/sched/wait.c
>> +++ b/kernel/sched/wait.c
>> @@ -174,15 +174,16 @@ EXPORT_SYMBOL_GPL(__wake_up_locked_key);
>>   * @mode: which threads
>>   * @key: opaque value to be passed to wakeup targets
>>   *
>> - * The sync wakeup differs that the waker knows that it will schedule
>> - * away soon, so while the target thread will be woken up, it will not
>> - * be migrated to another CPU - ie. the two threads are 'synchronized'
>> - * with each other. This can prevent needless bouncing between CPUs.
>> + * The caller expects the waker to schedule away soon. This helper passes
>> + * WF_SYNC to waitqueue wake functions. The default wake function forwards
>> + * it to the scheduler.
>>   *
>> - * On UP it can prevent extra preemption.
>> + * For fair-class tasks, WF_SYNC is a wakeup-placement and preemption
>> + * hint. It does not guarantee that the wakee will run on the waker CPU
>> + * or avoid migration. On UP, this may avoid an unnecessary preemption.
>>   *
>> - * If this function wakes up a task, it executes a full memory barrier before
>> - * accessing the task state.
>> + * If this function wakes up a task, it executes a full memory barrier
>> + * before accessing the task state.
>>   */
>>  void __wake_up_sync_key(struct wait_queue_head *wq_head, unsigned int mode,
>>  			void *key)
>> @@ -200,15 +201,16 @@ EXPORT_SYMBOL_GPL(__wake_up_sync_key);
>>   * @mode: which threads
>>   * @key: opaque value to be passed to wakeup targets
>>   *
>> - * The sync wakeup differs in that the waker knows that it will schedule
>> - * away soon, so while the target thread will be woken up, it will not
>> - * be migrated to another CPU - ie. the two threads are 'synchronized'
>> - * with each other. This can prevent needless bouncing between CPUs.
>> + * The caller expects the waker to schedule away soon. This helper passes
>> + * WF_SYNC to waitqueue wake functions. The default wake function forwards
>> + * it to the scheduler
>>   *
>> - * On UP it can prevent extra preemption.
>> + * For fair-class tasks, WF_SYNC is a wakeup-placement and preemption
>> + * hint. It does not guarantee that the wakee will run on the waker CPU
>> + * or avoid migration. On UP, this may avoid an unnecessary preemption.
>>   *
>> - * If this function wakes up a task, it executes a full memory barrier before
>> - * accessing the task state.
>> + * If this function wakes up a task, it executes a full memory barrier
>> + * before accessing the task state.
>>   */
>>  void __wake_up_locked_sync_key(struct wait_queue_head *wq_head,
>>  			       unsigned int mode, void *key)
>
> Does it make sense to have one of those function refer to the other and
> de-duplicate all that? Also, how relevant is the UP comment? I don't
> think anybody much still cares about UP.
>
--8323329-2106592082-1790102663=:1976520--
