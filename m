Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A2937187C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787871413; cv=none; b=exwc1zzkew0wdqcy1bxL+lIKrfAcDbntXkyuAKoIg6vQuAIeTMY+grefqTzS8FCUz/oxU+bzyYhglj/AsC42/c8/7gZOmQV318dXPI6YTb+DuI06zgCiQGFcziSmg1/+Ou7vo5aTQKPUe/pDBGpHVd/VMfc7wSo+SOCLbzX4D+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787871413; c=relaxed/simple;
	bh=+DsFvs2gwRAYrmYQAIAj7itcrQcQux4DQAEjvjsolgw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bqWYZP70KWOPU8Trz93a4cTY+mHOySSfivJeyaaxxsfbXmLjg6RwvqTPslcmPyWOrvu04LRuYCZaXkqn0jejQy8wV+NBbjwgC+a0GtCPbClgYdZTSv7ypQy6VPaGjetkGNc4czPIwhdSuhDPUfVDEVzSRPMqZlb60vfy8BzTjIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ogz5yE/8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ogz5yE/8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FFBB1F000E9;
	Thu, 27 Aug 2026 22:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787871411;
	bh=9eameWyDFPGm2IGfMjVLZrh83mYxw9Nw2llG859msx0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ogz5yE/8+SLQ6dvqcENWpUNfOmKdqVH8wtN/Fg2pgJH0Tn1HraMx7JOHURN5ED+8S
	 Lg5xeC6DLmwpyS9eSg23w2eL5ZMrk/OYUeGIgoE6LRMADs9N/AFbi0vq8yMotXaF+7
	 I7RBpDPbKaAwptoxXJ7wNnmKHK+TGzeIwb314tT0Mcms6CfmigU6NNxQkMPdb1c9hc
	 YKVDgrfxKkUwUyHFmPudKDBmEDNCQP+qztkHvxJ8IZzdMX2lprK5XC8Bj2PyBEyC72
	 qtYNararJVBS1gCsWXu1m5KWvsMMJVbFni+E36MgNm433V85g2QiL8ZhSiYrOkEfPR
	 b0BZ3TGTtwyRQ==
From: Thomas Gleixner <tglx@kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Oleg Nesterov <oleg@redhat.com>, Frederic Weisbecker
 <frederic@kernel.org>, Hyunwoo Kim <imv4bel@gmail.com>,
 brauner@kernel.org, peterz@infradead.org, anna-maria@linutronix.de,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] signal: Use list_del_init_careful() in flush_sigqueue()
In-Reply-To: <87mru7h09e.fsf@email.froward.int.ebiederm.org>
References: <875x10hrkt.ffs@fw13> <8733w3j1i1.ffs@fw13>
 <aowkvvxg8cPP5V0X@redhat.com> <aoww8qi_ce_8ECA9@redhat.com>
 <aoxOVAd8ooqHFW12@localhost.localdomain> <87pkz6gms6.ffs@fw13>
 <ao3kt-eRxw4agOj7@redhat.com> <87fr02gegn.ffs@fw13>
 <ao6zmDB9EjsqPIVN@redhat.com> <87zey8g05g.ffs@fw13>
 <ao8_NUo0ACPAA4QB@redhat.com>
 <87ecfki6l5.fsf@email.froward.int.ebiederm.org> <87se3zgb3m.ffs@fw13>
 <87mru7h09e.fsf@email.froward.int.ebiederm.org>
Date: Fri, 28 Aug 2026 00:56:49 +0200
Message-ID: <87tsofdvf2.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Aug 27 2026 at 13:43, Eric W. Biederman wrote:
> Thomas Gleixner <tglx@kernel.org> writes:
>> The safe and obvious place is to do that is _after_ setting
>> task::sighand to NULL because that ensures that no new signal can be
>> queued and nothing can touch task::pending anymore.
>
> Not really.  Using release_task (which is what is called when a zombie
> is reaped) for anything except cleaning up state that a zombie needs is
> a bit of a misfeature.  Timers should not be active in a zombie.
> Signals also should be deactivated long before then.

I agree.

>
> The obvious place to clean up task::pending i.e. signals is in
> exit_signals().
>
> I expect if I read through the history again that I would find that
> exit_signals() used to call flush_sigqueue, and that during the addition
> of posix thread signal handling flush_sigqueue was moved into
> __exit_signal in release_task because knowing if the entire thread group
> is dead was not available during that part of 2.5.
>
> We should honor PF_EXITING on a task and simply stop delivering
> signals to it.  Today the code goes halfway there and does not
> set sig-pending after PF_EXITING is set.

If flushing tsk::pending in exit_signals() is safe and stopping signals
to be queued when PF_EXITING is observed under sighand lock, then sure
that's the right thing to do. I'll look into that tomorrow.

> There is the goofy case that we need to be able to deliver signals
> to the entire process through a zombie thread (in particular a zombie
> thread group leader).  That goofy case unfortunately means that except
> for signals to just the thread we have to deliver signals when
> PF_EXITING is set.  That goofy case also unfortunately means that
> sighand_struct needs to be retained past the point where signals
> are delivered.

There's a lot of goofy stuff in this code :)

Thanks

        tglx
