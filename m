Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FF4449B11
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344949; cv=none; b=UUsoAvh0G/9ZI4rScO9txLNIXgpzMq/+yUtwpjGIXKyTG5o2kRfwtRFhLSueXSOVeT+EzdIxP05XKYAqhTC5+5m3wRfAcKUNFdscdd49ymBItvAxD4ciVU68/8XOIXroDLSVW4fpQpLsZeJbIWy3kfwd9Ge6fMw8dSfeuVhybK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344949; c=relaxed/simple;
	bh=rAPJcs9RPHCyZwp07+g9Qac2pUnl8IzKa/HVeDBlySk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovG0r2I5/hlRRTJWl+VJZQS50i1345kwIxnkOrV+gQp09ntXERETmdy55/bylVjK1A9IxbuBZpekdrtFUuCYC7ZTwZSk9644fdCHBc658ayNRpgUsYj2nrou1kaGIAC5ZX+oQt6DFjY6Xv6eFRRGOYwZ+LlL0y71Spu+X8OfmKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hA0yhYB3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hA0yhYB3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788344939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YvcJguNw4pgTRbE16S7t7xUCubjsm9WDHYvV9WpJ1I8=;
	b=hA0yhYB31dA4/2OFDAwy716UJtz/wSC0pMOhH/yoqwUsFOojVz0+wH2opqfNR7jFTJkidg
	3UMfnZOOd6bUcdeMymvHAi4j9060TQV/dDpnUxaVGQexPHTZtmkCYjPuKCHDIoFR1CUvJa
	r5+CjRe3jWNzvd0WoWfxJ4GCqnS0x8Q=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-462-MFrU4m_nMjKmBRuFGoXF_Q-1; Wed,
 02 Sept 2026 06:28:54 -0400
X-MC-Unique: MFrU4m_nMjKmBRuFGoXF_Q-1
X-Mimecast-MFC-AGG-ID: MFrU4m_nMjKmBRuFGoXF_Q_1788344932
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4BF7D195605E;
	Wed,  2 Sep 2026 10:28:52 +0000 (UTC)
Received: from fedora (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id D8A521800577;
	Wed,  2 Sep 2026 10:28:48 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed,  2 Sep 2026 12:28:51 +0200 (CEST)
Date: Wed, 2 Sep 2026 12:28:47 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Hyunwoo Kim <imv4bel@gmail.com>, brauner@kernel.org,
	peterz@infradead.org, anna-maria@linutronix.de,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] signal: Prevent exec() race
Message-ID: <apf6XyStCiwJ7CSM@redhat.com>
References: <87mru7h09e.fsf@email.froward.int.ebiederm.org>
 <87tsofdvf2.ffs@fw13>
 <871pbfeaiv.ffs@fw13>
 <87zey3fep2.fsf@email.froward.int.ebiederm.org>
 <87pkyyd39l.ffs@fw13>
 <87h5kad0mx.ffs@fw13>
 <87bjaie2gc.fsf@email.froward.int.ebiederm.org>
 <87wlt5aybr.ffs@fw13>
 <87qzjcdh06.fsf@email.froward.int.ebiederm.org>
 <87ecfcbyt1.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ecfcbyt1.ffs@fw13>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

As I said many times in this thread I am all confused ;)
And of course I don't understand posix-timers.c enough.

So let me ask the stupid question...

On 09/01, Thomas Gleixner wrote:
>
> If the timer signal is blocked, its sigqueue stays queued on the leader's
> task::pending. The next expiry of that timer can then run while
> release_task() flushes the queue.
>
> posixtimer_send_sigqueue() checks whether the sigqueue is already queued
> with a plain list_empty(), which only reads list_head::next.

If timer->sigq is queued on T->pending list, then T has a reference.
Even if this timer is destroyed, it and its ->sigq can't go away until
__sigqueue_free() -> posixtimer_sigqueue_putref(timer->sigq). Right?

So, If we change posixtimer_send_sigqueue() to check PF_EXITING and
return, then why do we need other changes?

Perhaps they make sense, but why do we need them to fix this particular
problem?

I am sure I missed something obvious, please help me to understand.

Ah, and I just noticed...

> @@ -1990,6 +2004,9 @@ void posixtimer_send_sigqueue(struct k_i
>  	if (!likely(lock_task_sighand(t, &flags)))
>  		return;
>
> +	if (unlikely(tmr->it_pid_type == PIDTYPE_PID && (t->flags & PF_EXITING)))
> +		return;

this lacks unlock_sighand().

Oleg.

