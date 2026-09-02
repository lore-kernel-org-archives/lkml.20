Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B685F43B49D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 11:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788348213; cv=none; b=idoCuRJjaehXzewv80EAanBpIR88jW+EOckxo/bgOh0yXrWG6epGIEcL/cv54Ybb+kf5WvkqHgIOon9dUTgvQnnKEL4nHnZo/s/dwzsWzEZlnDKfCDGOq6Ig54MF9mCztdrE7TCWDh9aJxuj4garCqOCxtK63cstTuT/jDTLpzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788348213; c=relaxed/simple;
	bh=I3Gzw4+IdNSw2XwNwgQoJBnppv4WPMtqeIONoTFtETQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U0L9wLVZMl5MKbQWmHeuogwdHOZaKknmslFixCAPwywmH0jm0cY4sLf0uxupIoBItehH8QUN24Hrwb1o4G8mn6od7cjdMOPKk0HpEaiwvluuqBt+0DOUoBVDeEaMDSi+Je0vP8xqrYgHg3ACThY/Ucgs5mpb6xt/YCV52T5m6os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BX1MbQBv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BX1MbQBv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788348207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/BunSUA5yF4m8KSB269OW86rY/k6HCVCdVKtJ5nGLhY=;
	b=BX1MbQBvR0x0kC2MqGYPnWV8i31cXDz2IEtO8d2nuBXJEfmh5K1i1dAt1XlR13cHIXbRWv
	m2BfasAxH/hdJfpE1jixQ0BbCASgmGOpOIDpJlv/4IZqVs3yYX4r2fqA2WsWKwWqJPoyfj
	8FGbNeiIvrDruKikEln34bgcWEfkZHo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-501-NxIp2s0hOEiE-49QFAmrzA-1; Wed,
 02 Sept 2026 07:23:24 -0400
X-MC-Unique: NxIp2s0hOEiE-49QFAmrzA-1
X-Mimecast-MFC-AGG-ID: NxIp2s0hOEiE-49QFAmrzA_1788348203
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6D1DC1955DB6;
	Wed,  2 Sep 2026 11:23:22 +0000 (UTC)
Received: from fedora (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id BB8D17DD;
	Wed,  2 Sep 2026 11:23:19 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed,  2 Sep 2026 13:23:22 +0200 (CEST)
Date: Wed, 2 Sep 2026 13:23:18 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Hyunwoo Kim <imv4bel@gmail.com>, brauner@kernel.org,
	peterz@infradead.org, anna-maria@linutronix.de,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] signal: Prevent exec() race
Message-ID: <apgHJj0qH7HlAXKO@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On 09/01, Thomas Gleixner wrote:
>
> @@ -3130,8 +3148,12 @@ void exit_signals(struct task_struct *ts
>  	cgroup_threadgroup_change_begin(tsk);
>
>  	if (thread_group_empty(tsk) || (tsk->signal->flags & SIGNAL_GROUP_EXIT)) {
> -		tsk->flags |= PF_EXITING;
> +		scoped_guard(spinlock_irq, &tsk->sighand->siglock) {
> +			tsk->flags |= PF_EXITING;
> +			sigqueue_dequeue_pending(&tsk->pending, &sigq_list);
> +		}
>  		cgroup_threadgroup_change_end(tsk);
> +		flush_sigqueue_list(&sigq_list);
>  		return;

OK... lets suppose the exiting task T passes exit_signals().

Suppose we have an "ignored" timer tmr. Another sub-thread calls
do_sigaction() -> posixtimer_sig_unignore() and finds that tmr
in ->ignored_posix_timers list.

But posixtimer_queue_sigqueue() doesn't check PF_EXITING, I guess
it should check it too?

Or perhaps it makes more sense to check PF_EXITING in
posixtimer_get_target() ?

Oleg.

