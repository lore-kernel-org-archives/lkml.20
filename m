Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA3C1FCFFC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788358210; cv=none; b=fvAfgtxgZ4suN0VOvjDQNbMTcumqp7Uk7WCrwBYJ88X1JuwU2B+uMeFrK9M/yZWdEtCIYYOwzDnO7g0tie7tgRXqI4KRvbUpGwcsCN66In1hBElEYZivTvmzk+JaLdqQIM2VWTnOHAAXXI41pO7n1p5IiaSctPPYRiBOnMnlNoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788358210; c=relaxed/simple;
	bh=1Wk9qyONT2hvuTO4hblwOkOZfWftxzXibcKXHRJCCQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wrt4dUQ48MEJomG3rLnDYkZlKPYFdrxQA4U/bpaI0QVowJ437R0Zo6eG/JISdqTL5+SaPd2pUTZawabDfJL40alWhH1YroHeuzcw2w07AM4GNfokYGwYB9cNIIIHCrFg9RdFdj2DCxxqgxMb9d1bPcXGpxn7ywiJA6hU0/LWZho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AbNyyGXp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AbNyyGXp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF741F00A3A;
	Wed,  2 Sep 2026 14:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788358209;
	bh=IHxs6/U1x5uyJuxikO9wDzp20/n5ZVu9EDJq4swYRnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AbNyyGXpcABIOs2uywp5o1EtFTHBPsBRoHMEpULWuEPQQckJDbzgiQZUgS3CvSS4E
	 N7UNObgsmPmWx7LCFyv5Uu4zuVclly0xFeOgqLJ3WSjdiZSYa9D26hpjvY/3P2rpLP
	 sgxDg2C30MlQ/4G5qSca3IAKUPXtV8HLcRJ46J5E2Ov2uu5xZ/4rffhcnfxeZ/QCJD
	 ZOsPG45dNH1j9x/2bik58QPbK2iscdqwAGW0n4b9I+AEH6YMtJlZSHj8qhwOvPQHji
	 44gNPE0tBODCDs6j1dTgP9O9QnGyIqkVDNvFq5JrPU/cS/vlESgV6gO4DW8B+aSBcH
	 3I9ICikaHD04A==
Date: Wed, 2 Sep 2026 16:10:06 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Bradley Morgan <brads@mainlining.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Bradley Morgan <include@grrlz.net>, Tejun Heo <tj@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kthread: remove worker->task self-assignment
Message-ID: <apguPoeERI92N4yD@localhost.localdomain>
References: <20260829161150.16301-1-include@grrlz.net>
 <20260829161848.20635-1-include@grrlz.net>
 <apbI91PzT2BaRazM@localhost.localdomain>
 <20260901124900.GB687043@noisy.programming.kicks-ass.net>
 <CE1F7435-D872-4A3F-BC7A-50443BBE2904@mainlining.org>
 <apbb--idnSZMNLPU@localhost.localdomain>
 <87CE893D-07E6-4EA4-8156-2CE6946D12BD@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87CE893D-07E6-4EA4-8156-2CE6946D12BD@mainlining.org>

Le Tue, Sep 01, 2026 at 07:28:19PM +0100, Bradley Morgan a écrit :
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
> >> Do you really want me to readd the warn
> >> statement? Maybe add some text, like
> >> 
> >> "worker->task is deprecated"?
> >
> >Is it deprecated? We still need that field for wakeup on queue at least.
> >Don't bother with a message, it's only a sanity check.
> >
> >Thanks.
> 
> Hi, I hopped on the computer, 
> 
> Right, so the whole warn on things is good, but I converted all the
> callers, so it'll never fire.
> 
> For OOT users, maybe this'll be beneficial (but yk what their like, theyll
> remove the warn on)
> 
> Guys, what do you think?

The warning is mostly to prevent from future changes to break.

Thanks.

> 
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
