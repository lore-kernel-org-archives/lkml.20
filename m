Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBEA399342
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345945; cv=none; b=q/opbnLQTrJEXZqck+27R37XtYI8WxSeSv3nvuL4L2uezZTO2wmsuZzybCtexCX1RMVzSf3Jwod8QcNrgu8I8Vx5Yx/7FMVB+4yjLCJcnjYu3CDD7a3pFhywifVoYyUPt9fARNOm9vsnsSvuWoetyGSaEZECGG2Rt+vLpAHsx+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345945; c=relaxed/simple;
	bh=MW/8cAkpUfBZj+AAMbDtIiEEvfRdFgO6kef5gvhP4JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCu7BPrhrkl+VdZmSPhkHWdG9rzjgB3q1LFJ3HCEe5jsWdQcWbSW60b6JgyKK4W7DajX3Ovc46AEfzUEsdjuYNEruGOWR8lfQtU0ADKaYW8byxduXE4z5rHpr9Rs8JOGoK3W7s9fMF5ZpmnhjjzoC2PaLzRKFRQkeSUreZ8pmIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FlomnFff; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FlomnFff"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788345936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1y/7CZrsIPPs+qZ7e52CwWBDz3GqTrYJrhJqhXBZxVQ=;
	b=FlomnFffivXT3kHWqfagvHGwRB6EOdZMDFZxZXo6Ie/VH2oF/SLXE3S9BOlI5a9WRci61S
	Ku5uleaTdbShqjCqfpoZ+fOi++Wfes1FKiazvLPKVjMXeJdCkJF27/aZxguxjIAmrrLBS9
	bnEzSmkmSI0lhFQtcmU6iogtBhGhyhE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-619-_pDHuYtNPzyr39PtG5Agvw-1; Wed,
 02 Sept 2026 06:45:31 -0400
X-MC-Unique: _pDHuYtNPzyr39PtG5Agvw-1
X-Mimecast-MFC-AGG-ID: _pDHuYtNPzyr39PtG5Agvw_1788345930
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 657DF192575C;
	Wed,  2 Sep 2026 10:45:29 +0000 (UTC)
Received: from fedora (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 59B717E7;
	Wed,  2 Sep 2026 10:45:26 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed,  2 Sep 2026 12:45:29 +0200 (CEST)
Date: Wed, 2 Sep 2026 12:45:25 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Hyunwoo Kim <imv4bel@gmail.com>, brauner@kernel.org,
	peterz@infradead.org, anna-maria@linutronix.de,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] signal: Prevent exec() race
Message-ID: <apf-RXIcRwDZC8Ko@redhat.com>
References: <87tsofdvf2.ffs@fw13>
 <871pbfeaiv.ffs@fw13>
 <87zey3fep2.fsf@email.froward.int.ebiederm.org>
 <87pkyyd39l.ffs@fw13>
 <87h5kad0mx.ffs@fw13>
 <87bjaie2gc.fsf@email.froward.int.ebiederm.org>
 <87wlt5aybr.ffs@fw13>
 <87qzjcdh06.fsf@email.froward.int.ebiederm.org>
 <87ecfcbyt1.ffs@fw13>
 <apf6XyStCiwJ7CSM@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apf6XyStCiwJ7CSM@redhat.com>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On 09/02, Oleg Nesterov wrote:
>
> On 09/01, Thomas Gleixner wrote:
> >
> > If the timer signal is blocked, its sigqueue stays queued on the leader's
> > task::pending. The next expiry of that timer can then run while
> > release_task() flushes the queue.
> >
> > posixtimer_send_sigqueue() checks whether the sigqueue is already queued
> > with a plain list_empty(), which only reads list_head::next.
>
> If timer->sigq is queued on T->pending list, then T has a reference.
> Even if this timer is destroyed, it and its ->sigq can't go away until
> __sigqueue_free() -> posixtimer_sigqueue_putref(timer->sigq). Right?
>
> So, If we change posixtimer_send_sigqueue() to check PF_EXITING and
> return, then why do we need other changes?

Aaah. I am stupid. the PF_EXITING check in posixtimer_send_sigqueue()
is obviously not enough, posixtimer_get_target() can return the execing
thread which is alive and doesn't have PF_EXITING set...

> Ah, and I just noticed...
>
> > @@ -1990,6 +2004,9 @@ void posixtimer_send_sigqueue(struct k_i
> >  	if (!likely(lock_task_sighand(t, &flags)))
> >  		return;
> >
> > +	if (unlikely(tmr->it_pid_type == PIDTYPE_PID && (t->flags & PF_EXITING)))
> > +		return;
>
> this lacks unlock_sighand().

Oleg.

