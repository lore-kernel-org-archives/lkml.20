Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB8E2D7DFE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563394; cv=none; b=Xc9qb2daJz22S8DpFAerxCS65OzvYt0QHuS1T7tTBXPRq7C8mc3QL9ey6HxnedrWDbbomhTq2bJ6sJGJ/u99iFsniAATElaEvqZNJVpqgbAGd3c36ISBM5VpuiQsYTousWkVhKHjtXkMJvl6zEP8wotGAe7Nb5/kTaCSOYUkqWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563394; c=relaxed/simple;
	bh=mOQCge9/NL7U40f4FB+GDQ19jN8sH/RGWQ26VJriIwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZGWvny4aUlZRKFBIFu181koebtM+fvP4tLIoQSq0SmVrPo5g9Ne6UjOO+gETB3k22UnVvmSygUY4lPAVHQR7+MUD2uPbHReM9REZRRDk+5l+D10J+shrKwImPbTGShvYu9RSnuQCjxrnXyxezq2uxgBxYEdmWoU3/0mJ18qm2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ixyy+vdt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ixyy+vdt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AAB71F000FF;
	Wed, 16 Sep 2026 12:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789563389;
	bh=AqLUvHomg3hWR5yBgxyP4gBW1Bgw25ElzPGd1T6NF7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ixyy+vdtLhrXUtT05jb9I8lprWYo3AvPFJiDX/Boi3gcudHpwT5LK+v7hg3m5o5bf
	 Vw11tkLuNm4isAjEsDtI1guzXo2IXnYtC74DoCRQcRMWC6FRHN8T+L+I36zeoLVSY5
	 f3E7I4GtphAmxORRsSwUOeQvc5u3XLE13cFbI5fXIznjAgVlzdThuRG6FeTN6Tm+rN
	 h6hJqOWbEUvWxbWZeek7WEabsIGddlCInnVA4LZHGj+SUBqCmB4ntGO+Wuf6mVPtgi
	 FD0h/EsIDZKjrZWku7OKkB30jF+RMvWPDQEtKcCxqqrvRuL5IjedRH/dJR+jzfysP6
	 OnKEOjKfTkTwQ==
Date: Wed, 16 Sep 2026 14:56:26 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Quchaosheng <quchaosheng000406@163.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] kthread: Report cpumask allocation failure
 without warning
Message-ID: <aqqR-up8wovbEsv7@localhost.localdomain>
References: <20260915014222.13423-2-quchaosheng000406@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915014222.13423-2-quchaosheng000406@163.com>

Le Tue, Sep 15, 2026 at 09:42:22AM +0800, Quchaosheng a écrit :
> kthread_affine_node() warns when zalloc_cpumask_var() fails:
> 
>   if (!zalloc_cpumask_var(&affinity, GFP_KERNEL)) {
>           WARN_ON_ONCE(1);
>           return;
>   }
> 
> The allocation uses GFP_KERNEL, so it can fail under memory pressure or
> fault injection.  A failed allocation is a recoverable condition and not a
> kernel bug, so the warning is noise.  syzbot reports it for a WireGuard
> NAPI thread:
> 
>   WARNING: kernel/kthread.c:359 at kthread_affine_node+0x200/0x2e8
>   CPU: 0 PID: 5207 Comm: napi/wg2-0
>   Call Trace:
>    alloc_cpumask_var_node+0xfc/0x138
>    zalloc_cpumask_var
>    kthread_affine_node+0x148/0x2e8
>    kthread+0x29c/0x3d4
>    ret_from_fork+0x10/0x20
> 
> The failure is not silent though: the early return also skips
> list_add_tail() of kthread::affinity_node, so the thread never joins
> kthread_affinity_list and kthreads_online_cpu() will not fix up its
> affinity on a later CPU hotplug.  Keep the failure visible with
> pr_warn_once() instead of dropping the message.
> 
> Reported-by: syzbot+37ca7ae3e98cb65c3209@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=37ca7ae3e98cb65c3209
> Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
> ---
> v2:
>  - Keep the failure visible instead of dropping the message silently
>    (Valentine Schneider, Waiman Long).  A WARN is not appropriate for a
>    recoverable GFP_KERNEL allocation failure, but the early return also
>    keeps the thread out of kthread_affinity_list, so report it with
>    pr_warn_once().
> 
>  kernel/kthread.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/kthread.c b/kernel/kthread.c
> index a3f95c904..b59fa7c7e 100644
> --- a/kernel/kthread.c
> +++ b/kernel/kthread.c
> @@ -356,7 +356,14 @@ static void kthread_affine_node(void)
>  		return;
>  
>  	if (!zalloc_cpumask_var(&affinity, GFP_KERNEL)) {
> -		WARN_ON_ONCE(1);
> +		/*
> +		 * The thread stays out of kthread_affinity_list, so a later
> +		 * CPU hotplug will not fix up its affinity. Report it, but do
> +		 * not warn: the allocation can fail under memory pressure or
> +		 * fault injection, and that is not a kernel bug.
> +		 */
> +		pr_warn_once("kthread: %s: no cpumask, node affinity not set\n",
> +			     current->comm);

I'm mildy convinced that this is an improvement. The message now becomes easily
missed and appears like any normal information in the logs.

Kthread creation happens mostly on boot and if there is memory pressure already
on boot, the rest is not going to end well anyway.

Thanks.

>  		return;
>  	}
>  
> 

-- 
Frederic Weisbecker
SUSE Labs
