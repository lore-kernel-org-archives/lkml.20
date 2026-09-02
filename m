Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEA649F106
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788358150; cv=none; b=c3vYnPwXTsJq+v0Z3KukTupVjN1Jo6/5wVw19sm4kC3+r5B3mqbygP+/AnOoFN15jv1m1lSPNPmjWHCCFSOQ+OzukzWbGhhR6Zx7XAqVUFGIVBy9ATyW3NYdApHFrb1XjOTa3ZBWHearEf948uF6MPEZy3qiuMxdY9FDTCu4BCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788358150; c=relaxed/simple;
	bh=GF8er+zjIJHj4N+Qx4uTpZ/bhtM4HfJ+IjTX/k8tDbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rUMf38IgjAIo76dLKWbIJMNi86o7fHWioNHWSCb7Jp7EkK1dbLp2Kn9c6q6/A9Ob55+EK2hbVp0wtkKDitdzeeXv2u6NuNY4adCBGrjCP2Srjnwo6Rt1WqC3R4UkEYxL730548KHWM9eh3mkfaeqp4Xcvy7goWriEGzZH6h1cKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TSofw5RI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TSofw5RI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AACD1F000E9;
	Wed,  2 Sep 2026 14:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788358148;
	bh=fEhRDMtUIgN+yqlJh3edML8eE/fnhvrBORzg2Q7AWQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TSofw5RIpVhh4jAk+EBJxhlgCEUfn7OdTH7dxCIoSmepS/1gY7ku2QDocNkzl1bS0
	 IgiOzGRHEVlU5m+HraTEQIvZ+32yFVv/OETiAzwjVdu6Iux6/S6/+FX1Atvo+OdIF7
	 exvwBuAQ8/tAeoxW6cdI0vLgvYzVDaPc4/nWePwMrYl8OOHCDzDWbEUJlMElLj9R/S
	 h/f3VJ4TujFzrDgyOfjNarEz3KFhXSTe0l2rYbcY+EBZYAgieu1ADiHFHErVfnhPVq
	 HDAVA7athnrltyirQeOug2yZNFqQx/UPP9eeHD0wVX3Ltd8IxO1CCvmlaA4bPvarUC
	 hLnnrVRtjWVjA==
Date: Wed, 2 Sep 2026 16:09:05 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Bradley Morgan <brads@mainlining.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Bradley Morgan <include@grrlz.net>, Tejun Heo <tj@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kthread: remove worker->task self-assignment
Message-ID: <apguAeUgLfOcHOdV@localhost.localdomain>
References: <20260829161150.16301-1-include@grrlz.net>
 <20260829161848.20635-1-include@grrlz.net>
 <apbI91PzT2BaRazM@localhost.localdomain>
 <20260901124900.GB687043@noisy.programming.kicks-ass.net>
 <CE1F7435-D872-4A3F-BC7A-50443BBE2904@mainlining.org>
 <apbb--idnSZMNLPU@localhost.localdomain>
 <131DD326-86C3-4E40-B1CA-959F3E79D1C4@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <131DD326-86C3-4E40-B1CA-959F3E79D1C4@mainlining.org>

Le Tue, Sep 01, 2026 at 03:09:03PM +0100, Bradley Morgan a écrit :
> On 1 September 2026 15:06:51 BST, Frederic Weisbecker <frederic@kernel.org>
> wrote:
> >Le Tue, Sep 01, 2026 at 02:57:38PM +0100, Bradley Morgan a écrit :
> >> On 1 September 2026 13:49:00 BST, Peter Zijlstra <peterz@infradead.org>
> >> wrote:
> >> >On Tue, Sep 01, 2026 at 02:45:43PM +0200, Frederic Weisbecker wrote:
> >> >> Hi,
> >> >> 
> >> >> Le Sat, Aug 29, 2026 at 04:18:48PM +0000, Bradley Morgan a écrit :
> >> >> > From: Bradley Morgan <brads@mainlining.org>
> >> >> > 
> >> >> > All kthread worker users now create their workers with
> >> >> > kthread_create_worker*(), which sets worker->task before the worker
> >> >> > starts. The self-assignment in kthread_worker_fn() is dead code
> >now.
> >> >> 
> >> >> How could it be created before?
> >> >> 
> >> >> > 
> >> >> > Remove it.
> >> >> > 
> >> >> > Signed-off-by: Bradley Morgan <brads@mainlining.org>
> >> >> > ---
> >> >> >  kernel/kthread.c | 7 -------
> >> >> >  1 file changed, 7 deletions(-)
> >> >> > 
> >> >> > diff --git a/kernel/kthread.c b/kernel/kthread.c
> >> >> > index 63beb59b7a3d..18bc702e8d2d 100644
> >> >> > --- a/kernel/kthread.c
> >> >> > +++ b/kernel/kthread.c
> >> >> > @@ -987,13 +987,6 @@ int kthread_worker_fn(void *worker_ptr)
> >> >> >  	struct kthread_worker *worker = worker_ptr;
> >> >> >  	struct kthread_work *work;
> >> >> >  
> >> >> > -	/*
> >> >> > -	 * FIXME: Update the check and remove the assignment when all kthread
> >> >> > -	 * worker users are created using kthread_create_worker*() functions.
> >> >> > -	 */
> >> >> > -	WARN_ON(worker->task && worker->task != current);
> >> >> 
> >> >> Should we keep a WARN_ON(worker->task != current) here?
> >> >
> >> >I vote yes! Paranoia is good :-)
> >> >
> >> 
> >> 
> >> Yeah, but it *should* be useless.
> >
> >Famous last words :-)
> >
> 
> Hahahaha
> 
> >> Do you really want me to readd the warn
> >> statement? Maybe add some text, like
> >> 
> >> "worker->task is deprecated"?
> >
> >Is it deprecated? We still need that field for wakeup on queue at least.
> >Don't bother with a message, it's only a sanity check.
> 
> Okie, I did convert all the drivers as you can see, if you wanna give it a
> lookie

Do you have a link to that?

Thanks.

> 
> >
> >Thanks.
> >
> >> 
> >> --- Thanks!
> >>
> >https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
> >
> >
> 
> --- Thanks!
> https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/

-- 
Frederic Weisbecker
SUSE Labs
