Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7094756CB
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132533; cv=none; b=WHI8mra9L681gxSsZ/CbjFc1Rs0lRnXBsimqKcBdZU1z2hfDZ0ppiMvdRSxK2lPJO4sG+ouRpckZ5IsfnQ4CvLOyBw9gecRwns2wok6i0yKedRj2H7xX/Hnel7TBo7HFDwwu0LfKeV1kQtcXG0/G0jPym0edkdLhzFfHvC1JWPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132533; c=relaxed/simple;
	bh=kGg2PjuYI2b/DLIS3zlEOFb09yYcPjhF2RPrjDBqnIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VMJQ3Gc1PPb83+e8rRBkNXtsw7BktxP4TkAiNWeDB2D/cS3mQK72wp5tGy5mvNU+WKh7M0I/HvZ5NpiW4DZGqCfs05sYu88gDIWCxhlRhPHQkjmqXwYf/YosQjtECT+gAcYs8eRAFn9oy0i1I+YZ6Mpbo9tNiOXAhp14LWXZCCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jUgTgo43; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jUgTgo43"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E87901F000FF;
	Fri, 11 Sep 2026 13:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789132531;
	bh=uf6M/xxUQ+UT5bogU660oyp4T4DIjKocuLFStG16swk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jUgTgo43oDRe4QnNIaqfaHJJG0tE3ESANh95X5tO/ZeWQ5tqWKkrMXRASTq2dw3md
	 DhSbWrQICMws1P6VVD9dqRCIhxCLKPxGeRvxC/j4Jadfipw1ATBKYWJPqUlTaAW9dS
	 IhkV7uO/oxsaq+Txn5WYbUbNkd7bN1h5SA2XUYhUF6Fm7CiKAwisxR0ODjeTHdj4/j
	 WLxXgCr/tnpCubbyvoYPa05ZgNTN0dKBjOBjVmrnET7ZL210n1g0IeFkEG1AT5fbMN
	 3TvDqeEct6y70FwgEKAJD4e7gjBqAgGt/zSzCsbiGzPRNQQ7T5PIHJUdzw9ziBOzuR
	 Zpk4Gne/IZyOg==
Date: Fri, 11 Sep 2026 15:15:28 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Hyunwoo Kim <imv4bel@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	John Stultz <jstultz@google.com>, Ingo Molnar <mingo@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [patch V3 6/8] posix-cpu-timers: Use PF_EXITING to indicate exit
Message-ID: <aqP-8NpXNwBm4pBM@localhost.localdomain>
References: <20260911090341.949101445@kernel.org>
 <20260911090541.837831386@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911090541.837831386@kernel.org>

Le Fri, Sep 11, 2026 at 11:09:35AM +0200, Thomas Gleixner a écrit :
> From: Thomas Gleixner <tglx@kernel.org>
> 
> Right now POSIX CPU timers use task::exit_state to check whether a task is
> exiting. That works correctly, but exit_state is set later in do_exit() and
> too late for allowing to cleanup POSIX timers earlier.
> 
> It does not matter in case of exit whether the cutoff is a bit earlier.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>


> 
> ---
>  kernel/time/posix-cpu-timers.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> --- a/kernel/time/posix-cpu-timers.c
> +++ b/kernel/time/posix-cpu-timers.c
> @@ -1505,7 +1505,7 @@ void run_posix_cpu_timers(void)
>  	 * posix_cpu_timer_del() may fail to lock_task_sighand(tsk) and
>  	 * miss timer->it.cpu.firing != 0.
>  	 */
> -	if (tsk->exit_state)
> +	if (tsk->flags & PF_EXITING)
>  		return;
>  
>  	/*
> 
> 
> 

-- 
Frederic Weisbecker
SUSE Labs
