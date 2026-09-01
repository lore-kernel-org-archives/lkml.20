Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A458E330301
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266946; cv=none; b=ZEPMrB95nQhAkL0V+gx1uC/riXjLpAqDMBxClEH+eJbfR4iYexjICCmldiwfgUv/bPRoSiWd3AYTH/b5bRlelcGHwieN9q4RZp+ws4nfG/LA01c3l1ykPqV/NHNeZ9DMAAqsMUhQTRYTTGyrOQ7zM269Jc/o5i8bIeiWtvO6Oi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266946; c=relaxed/simple;
	bh=p+RebVyRjeEN8sDHYk4AA5M8VtGKIjLTPplRY2HkqHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sxqdJhZHF8zdEuObLZU3RYFSPl9JPe/URZtLjQVJ0oEbC6dlCdCE+uQgCz18bVNim6S+VcV6NeUVX1ir1fIrxnvZ9CaDh1plqqRIfObRXYYjkyLX3W1RISezCCTkG3di52+CizJnvLARP43MNslvH4UZQSC9xibMYbKA2Flfoic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=uQYbR90L; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uQYbR90L"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zYOvd8xUmq3KMZUEL2+l4KB/Nt/1RwlSG63QEYkOY6s=; b=uQYbR90Lnxq7Osc/BftVPgL6vy
	hX3+r9x3m2WbtJF0kYLTZFbSEhlHF30qRZUKW8UrDiML37g7kJ/cBubbwsbTf76LT4L3GPxBTTi8C
	QbEc4S3iX7Stnfe2jMt1nqKUUTiDFfuiksNddKOVRpOZqOQd6l10MADcKK9GsluO20IzXCFf3vap6
	eQjFIUXpuypd/EMncyln3GlCHWh5yA6FW8Dhj4Vzi46DHl8R1fGvX6Z0J15iMbZqZQlJILKREpxhq
	xiOWWBLu7EiCq/iOXdJ8SZ0zt0wszMoM5Tiy2E37BNZ1JKhPPZ1cc3LsXMoxL9pTswFXjFVBfPY4o
	X+q8mofw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1NvA-000000057zj-30Ez;
	Tue, 01 Sep 2026 12:49:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 546EB30031E; Tue, 01 Sep 2026 14:49:00 +0200 (CEST)
Date: Tue, 1 Sep 2026 14:49:00 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Bradley Morgan <include@grrlz.net>, Tejun Heo <tj@kernel.org>,
	linux-kernel@vger.kernel.org, brads@mainlining.org
Subject: Re: [PATCH] kthread: remove worker->task self-assignment
Message-ID: <20260901124900.GB687043@noisy.programming.kicks-ass.net>
References: <20260829161150.16301-1-include@grrlz.net>
 <20260829161848.20635-1-include@grrlz.net>
 <apbI91PzT2BaRazM@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <apbI91PzT2BaRazM@localhost.localdomain>

On Tue, Sep 01, 2026 at 02:45:43PM +0200, Frederic Weisbecker wrote:
> Hi,
> 
> Le Sat, Aug 29, 2026 at 04:18:48PM +0000, Bradley Morgan a écrit :
> > From: Bradley Morgan <brads@mainlining.org>
> > 
> > All kthread worker users now create their workers with
> > kthread_create_worker*(), which sets worker->task before the worker
> > starts. The self-assignment in kthread_worker_fn() is dead code now.
> 
> How could it be created before?
> 
> > 
> > Remove it.
> > 
> > Signed-off-by: Bradley Morgan <brads@mainlining.org>
> > ---
> >  kernel/kthread.c | 7 -------
> >  1 file changed, 7 deletions(-)
> > 
> > diff --git a/kernel/kthread.c b/kernel/kthread.c
> > index 63beb59b7a3d..18bc702e8d2d 100644
> > --- a/kernel/kthread.c
> > +++ b/kernel/kthread.c
> > @@ -987,13 +987,6 @@ int kthread_worker_fn(void *worker_ptr)
> >  	struct kthread_worker *worker = worker_ptr;
> >  	struct kthread_work *work;
> >  
> > -	/*
> > -	 * FIXME: Update the check and remove the assignment when all kthread
> > -	 * worker users are created using kthread_create_worker*() functions.
> > -	 */
> > -	WARN_ON(worker->task && worker->task != current);
> 
> Should we keep a WARN_ON(worker->task != current) here?

I vote yes! Paranoia is good :-)
