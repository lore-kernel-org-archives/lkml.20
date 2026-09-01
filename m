Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFF237C11B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788271616; cv=none; b=LgbQ1oB1o1JSVriTghsUnB216ViZeRc1S4ZwtYWK21S4m9sNcqh/WEHAszWMzY3TWo+Qk9Qu6vFZqGt34npVBPWX5bexgk/2qxy0ilu0HpGavHymKj0aXKdc+LJbQjaMG++WjumEfHm509m/mho1Tj5rPF+4IqvynACZ74aXNrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788271616; c=relaxed/simple;
	bh=CpaMJadh+y3WV+yZtrg9bgGu7OB8ouIcG0ku6hqwNaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wa4WclAvUsVtJwY6P56SPI6tblYMQp2i2JYOmST5wtWuYY0/f0q7AhZ7ETigcqhxE5seFJJylUrhVbtDWZd9N+PjiA/pjak5aOTGMkjZHfAVDCWU7ZVWVT6YHgM20RfeNM7fuw5yGXQjSnVjaN7SxwsLyh/DN1/zqmX3GpuxyTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MUuSakfW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MUuSakfW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2FB11F00A3D;
	Tue,  1 Sep 2026 14:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788271614;
	bh=8R8Mq4W5uSVojTlAGsYpBZV1tLFFuWWE6THlPNrD8F0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MUuSakfW5TRi67sburbFPhGSxmfbVMjrwbZQ/Gyc5Ewt/mgO1V2Cz0zElDXUFtlm5
	 +0mrt4/ct+tgEqnlBwG97a3PMF8TIPnYa4TX2XiMJEhIVyML9IT/Wl/3dKYgwbQEL+
	 x15e09WKdS65y2i3WNkz3BeFoOEtYgPREHaZmix9RncMCQ4XYQK2NxWQeUkGfgzzFB
	 4KCOv2lwobGodLhcQEoztSTvNloPfLeN72shmRbwyYZ5M+w7uyB3iLlXwUjuBIT4CR
	 u8quUdn5V8F0N66LtR7rl5GyeGbxa+YPyiWGliZSGR0wtC7avESWu1mfVW1Q1etwCE
	 V+r0BfxYTYK+w==
Date: Tue, 1 Sep 2026 16:06:51 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Bradley Morgan <brads@mainlining.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Bradley Morgan <include@grrlz.net>, Tejun Heo <tj@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kthread: remove worker->task self-assignment
Message-ID: <apbb--idnSZMNLPU@localhost.localdomain>
References: <20260829161150.16301-1-include@grrlz.net>
 <20260829161848.20635-1-include@grrlz.net>
 <apbI91PzT2BaRazM@localhost.localdomain>
 <20260901124900.GB687043@noisy.programming.kicks-ass.net>
 <CE1F7435-D872-4A3F-BC7A-50443BBE2904@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CE1F7435-D872-4A3F-BC7A-50443BBE2904@mainlining.org>

Le Tue, Sep 01, 2026 at 02:57:38PM +0100, Bradley Morgan a écrit :
> On 1 September 2026 13:49:00 BST, Peter Zijlstra <peterz@infradead.org>
> wrote:
> >On Tue, Sep 01, 2026 at 02:45:43PM +0200, Frederic Weisbecker wrote:
> >> Hi,
> >> 
> >> Le Sat, Aug 29, 2026 at 04:18:48PM +0000, Bradley Morgan a écrit :
> >> > From: Bradley Morgan <brads@mainlining.org>
> >> > 
> >> > All kthread worker users now create their workers with
> >> > kthread_create_worker*(), which sets worker->task before the worker
> >> > starts. The self-assignment in kthread_worker_fn() is dead code now.
> >> 
> >> How could it be created before?
> >> 
> >> > 
> >> > Remove it.
> >> > 
> >> > Signed-off-by: Bradley Morgan <brads@mainlining.org>
> >> > ---
> >> >  kernel/kthread.c | 7 -------
> >> >  1 file changed, 7 deletions(-)
> >> > 
> >> > diff --git a/kernel/kthread.c b/kernel/kthread.c
> >> > index 63beb59b7a3d..18bc702e8d2d 100644
> >> > --- a/kernel/kthread.c
> >> > +++ b/kernel/kthread.c
> >> > @@ -987,13 +987,6 @@ int kthread_worker_fn(void *worker_ptr)
> >> >  	struct kthread_worker *worker = worker_ptr;
> >> >  	struct kthread_work *work;
> >> >  
> >> > -	/*
> >> > -	 * FIXME: Update the check and remove the assignment when all kthread
> >> > -	 * worker users are created using kthread_create_worker*() functions.
> >> > -	 */
> >> > -	WARN_ON(worker->task && worker->task != current);
> >> 
> >> Should we keep a WARN_ON(worker->task != current) here?
> >
> >I vote yes! Paranoia is good :-)
> >
> 
> 
> Yeah, but it *should* be useless.

Famous last words :-)

> Do you really want me to readd the warn
> statement? Maybe add some text, like
> 
> "worker->task is deprecated"?

Is it deprecated? We still need that field for wakeup on queue at least.
Don't bother with a message, it's only a sanity check.

Thanks.

> 
> --- Thanks!
> https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/

-- 
Frederic Weisbecker
SUSE Labs
