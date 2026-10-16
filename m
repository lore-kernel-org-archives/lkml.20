Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D474E5342
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166210; cv=none; b=cCM+swZ9stbM9J+tWRtVvKDJ0LmYpmCQn0FEvrXl9f6Y2H/V9x5tPN4CfxjA/Q77hqtFHEw1QFsKlIfVbQwzlMswdU+oIyxL1/xcL/p2WrDEA9KrIEoVV2ozApYFKqbzSOTnSI4nIXNy1609Bx+tW+cKHbNfeMPDNCSFbcI1BHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166210; c=relaxed/simple;
	bh=nU8RSFW69mNkyJT4Rhc8gicfIo7effrqYiCWcQcjz7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxkSOLr2KptFhQEuK6vMsR5e7HTdKqLH//nurj9+k1KozFszxj6yi46vmRTmq1h+zBcnPHYLHKeeXtpLdm96i0fEEF/tkk+7Psg3gF3PQ2riskqj5YS4QodGYoDiFPK9yev3w9BCIocHp/Ugd+gac+C5v6FzP/3tyRzFGG1AMto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=feBSJGjs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="feBSJGjs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792166208;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=rPm/5ubIK9ctcSKn4CbS59CdEpzhwmeJzcm8xytSHLU=;
	b=feBSJGjspE9+s7g4S/UG1FDf3lBaRi2nSCTtvex9gJ+FChBOPPyZaVccEEsFFGb2cQMtaB
	bWMfr2cFXco9vxOGZkl6RQyYuoFAz+dBYpz85/q4JKMzVc1p2QbM3i+rameUdVDM7myfnV
	/y8dBDcCRm++sngNnNLpjjIID111FYM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-130-d_4iLguhN320QllpJf6LsQ-1; Fri,
 16 Oct 2026 15:56:38 +0000
X-MC-Unique: d_4iLguhN320QllpJf6LsQ-1
X-Mimecast-MFC-AGG-ID: d_4iLguhN320QllpJf6LsQ_1792166197
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5F94E1801351;
	Fri, 16 Oct 2026 15:56:37 +0000 (UTC)
Received: from localhost (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C8140195607F;
	Fri, 16 Oct 2026 15:56:36 +0000 (UTC)
Date: Fri, 16 Oct 2026 11:56:36 -0400
From: Derek Barbosa <debarbos@redhat.com>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH printk v2] printk: Postpone kthread startup
Message-ID: <atJDkxLPtJRxsSLS@debarbos-thinkpadt14gen5.rmtusma.csb>
Reply-To: debarbos@redhat.com
References: <20261016085441.857695-1-john.ogness@linutronix.de>
 <87ik31iz4x.fsf@jogness.linutronix.de>
 <atI4IyP7LtxsTzIF@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atI4IyP7LtxsTzIF@pathway.suse.cz>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On Fri, Oct 16, 2026 at 04:43:47PM +0200, Petr Mladek wrote:
> On Fri 2026-10-16 15:00:54, John Ogness wrote:
> > On 2026-10-16, sashiko.dev wrote:
> > diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> > index 0ed86b5e8b160..0a87f49b3908a 100644
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> > @@ -4322,9 +4322,6 @@ static int unregister_console_locked(struct console *console)
> >  	if (console->exit)
> >  		res = console->exit(console);
> >  
> > -	/* Changed console list, may require printer threads to start/stop. */
> > -	printk_kthreads_check_locked();
> > -
> >  	return res;
> >  }
> >  
> > @@ -4333,7 +4330,12 @@ int unregister_console(struct console *console)
> >  	int res;
> >  
> >  	console_list_lock();
> > +
> >  	res = unregister_console_locked(console);
> > +
> > +	/* Changed console list, may require printer threads to start/stop. */
> 
> It might make sense to warn about the potential recursion. Otherwise,
> someone might try to optimize it back. And the problem is far from
> obvious. We should not rely on Sashiko...
> 
> Something like:
> 
> 	/*
> 	 * Changed console list, may require printer threads to	start/stop.
> 	 * Do this outside of unregister_console_locked() to avoid regression.
> 	 */

Sorry for chiming in here. It might be an obvious (and therefore useless)
comment, but could we expand this warning to say:

    /*
     * Changed console list, may require printer threads to start/stop.
     * Perform this check outside of unregister_console_locked() call sites
     * to avoid use-after-free scenarios.
     /

to elaborate on what "regression" could mean?

> Or we could add a comment above printk_kthreads_check_locked(). But it
> would be easier to overlook.
> 

I could be wrong, but iss there any harm in doing both (outside of being
redundant)? Explaining the "design pattern" above the function could be helpful

    /*
     * If appropriate, start nbcon kthreads and set @printk_kthreads_running.
     * If any kthreads fail to start, unregister those consoles.
     *
     * Refrain from calling this function within routines that may iterate over
     * the active console list to perform any (un)registration.
     *
     * Must be called under console_list_lock().
     */

IIUC it just makes it a little more clear that the old behavior, where the inner
loop was mutating the outer loop's iterator, should be avoided.


> > +	printk_kthreads_check_locked();
> > +
> >  	console_list_unlock();
> >  	return res;
> >  }
> > @@ -4471,6 +4473,9 @@ static int __init printk_late_init(void)
> >  		}
> >  
> >  		unregister_console_locked(con);
> > +
> > +		/* Changed console list, may require printer threads to start/stop. */
> 
> Same here.
> 
> > +		printk_kthreads_check_locked();
> >  	}
> >  	console_list_unlock();
> > 
> > I can submit an official patch after the 7.4 merge window.
> 
> That would be great. Thanks in advance.
> 
> Best Regards,
> Petr
> 

-- 
Derek <debarbos@redhat.com>

