Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7463939150B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269260; cv=none; b=LJ/udgQHsjoYCE/1HH+M2CUMW5YhaFe+RgBcqIaQ6bndM9mxdQfWTaQXR9aiVx9KJ97LndrVdjgnNYeAFsn1/Tq632FyTSOl63MrqGVVSlhNWscKQWV/RkBhADVwSHqWrRJxVwL9Wtwcddw1VCk+mGMQ7zYwHf2rQdXBeth2iHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269260; c=relaxed/simple;
	bh=vwMrl9i/DP1YsNAER0cPhR8gUVlM2n+vz6BbGyDVMGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OuLH7RPZgGd6IGDSigpfqjHyrwUi8eXAL/nyOUFBuhxz5XoZ6AZnahXkTiecSYPE+ig3UQR59VzN9T1iqakSb6hHfj2MDmPTyM++lSLYTLRoWO/zhfl1g+g7Mrb2f0s9Dl6f95a/ejsej67y+eA9FSxNXNTpOq5t4U6Yp0xR8tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kxZRdZjK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kxZRdZjK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D70B41F00A3F;
	Tue,  1 Sep 2026 13:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788269259;
	bh=pBS7irNWxvGwayeC0Q7wSQQoYDqrkgQk7ZzJO3A0APM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kxZRdZjKTEc4WoYGrVxmtMy04MWSSm7D1sEOHDQzBUKn0B3kBFSKowm00GOSwwXT8
	 RqhcUjWbQQIzQ8T+gh9l/fJhCpHidoEEN8msp2XdHI0nnYlvNsuBF84oRWpqhNbN+V
	 SFniv6pl06DaTYpAZelg50ekay65B5z2iU94t4eAyKFyaNSkIXIyJ7ydP3+XuRQ64o
	 DNiJRXl6iiIfAm7+/jz2xUXFGZTSHoTXJHdIwJ+8W7DRkoyECELePHQXh6iLxZM1Dm
	 OJk+HSb5HAtqBz4k46FJoTLqqMG6YYX8l805iM9lx3Pf8iRgARGSYQvLM8CTdcJn+s
	 +lLx+xsIY535w==
Date: Tue, 1 Sep 2026 15:27:36 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>,
	Oleg Nesterov <oleg@redhat.com>, Hyunwoo Kim <imv4bel@gmail.com>,
	brauner@kernel.org, peterz@infradead.org, anna-maria@linutronix.de,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] signal: Prevent exec() race
Message-ID: <apbSyHyRRczgEP2V@localhost.localdomain>
References: <87ecfki6l5.fsf@email.froward.int.ebiederm.org>
 <87se3zgb3m.ffs@fw13>
 <87mru7h09e.fsf@email.froward.int.ebiederm.org>
 <87tsofdvf2.ffs@fw13>
 <871pbfeaiv.ffs@fw13>
 <87zey3fep2.fsf@email.froward.int.ebiederm.org>
 <87pkyyd39l.ffs@fw13>
 <87h5kad0mx.ffs@fw13>
 <apV5A6IGNIe2Uh4f@localhost.localdomain>
 <87zey1b07t.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zey1b07t.ffs@fw13>

Le Tue, Sep 01, 2026 at 02:55:02PM +0200, Thomas Gleixner a écrit :
> On Mon, Aug 31 2026 at 14:52, Frederic Weisbecker wrote:
> > Le Mon, Aug 31, 2026 at 12:50:46PM +0200, Thomas Gleixner a écrit :
> >
> > Is the following situation possible?
> >
> > CPU 0                                CPU 1                   CPU 2
> > -----                                -----                   -----
> >
> > exit_signals()
> >    spin_lock(sighand)
> >    tsk->flags |= PF_EXITING;
> >    spin_unlock(sighand)
> >
> >    flush_pending_unlocked(tsk);
> >
> >   ...
> >   do_task_dead()
> >                                      de_thread()
> >                                         // acquired tsk->flags
> >                                         // and signal flushed
> >                                         // through tasklist_lock
> >                                         transfer_pid()
> >                                                            
> >                                                            posix_timer_fn()
> >                                                               posixtimer_send_sigqueue()
> >                                                                  // happen to see new leader
> >                                                                  t = posixtimer_get_target(tmr)
> >                                                                  lock_task_sighand()
> >                                                                  // passes !PF_EXITING cond
> >                                                                  // but what makes sure that flush_pending_unlocked()
> >                                                                  // is observed here? So that signal list isn't messed up
> >                                                                  // pid_task() doesn't have acquire semantics
> 
> 
> On some far fetched completely out of order CPU that might be possible,
> but it's moot as it's already established that we can't do that lockless
> at this point.

Sorry I probably missed something in the discussion, what can't we do
lockless?

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
