Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D4142050
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 16:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788712838; cv=none; b=oq8qgh2kZtHQRBC/b1QZEn4IU8sPPuaQm4gdXcWtINh3tmwTr9+9JV/uteHpptEY0oI42OelcWMSQ5Jbi0eXHywc2TvSVCYA2o+i0GayMki6+thCPJZvZhM4eGtwIb0nsnrysIQLSyTB2NlAjg4sbkZ/pLK1WbUE//XAqFmff7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788712838; c=relaxed/simple;
	bh=oM+738PVbZHiYhhlMBvgqOV8WTnjmUEb6tZJr0l6pU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJ4GCMNRwhHCdvzj9an0Z0TV+ga7KDchvqAdpLrAN9+lNLFYa/0At1hXAbo9HQYAuzp2+1l3noF9CdPf1StGHTDfnRRY9ojwf7VH9pdMlkYFaElF38HcgRWe2ttYC9O0QMTfgwIVeR131MLK9j+iEF8VvV822t4E+LZnS4Q1qik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MspkF+q1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MspkF+q1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788712835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EL4aNUMY9mMbEtP8u5vywX1iZjK38Q2xUmEROrf4YwE=;
	b=MspkF+q1tkSRt+9iY9k/gKn3qy6JQnEKiKr0dtn4tzmg5xGxD68ErTIM3TXOYxtf3KxZHb
	7xRZEiXsPCd79Tj/ixPk6a9mSTZPxzPTQ9v04XkD3MwqdVpPK2CdFMVazSFU7dV6x1lxw/
	+dtlS/7QuqU2eKQrqEGLoil+faWN3Uc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-32-xu6D2zywOWyt2R1R4VDa4Q-1; Sun,
 06 Sep 2026 12:40:27 -0400
X-MC-Unique: xu6D2zywOWyt2R1R4VDa4Q-1
X-Mimecast-MFC-AGG-ID: xu6D2zywOWyt2R1R4VDa4Q_1788712826
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A169A1956066;
	Sun,  6 Sep 2026 16:40:25 +0000 (UTC)
Received: from fedora (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id D4655423;
	Sun,  6 Sep 2026 16:40:22 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sun,  6 Sep 2026 18:40:25 +0200 (CEST)
Date: Sun, 6 Sep 2026 18:40:21 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	"Cc: Hyunwoo Kim" <imv4bel@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	John Stultz <jstultz@google.com>, Ingo Molnar <mingo@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	"Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: [patch V2 8/8] posix-timers: Handle exit in do_exit() completely
Message-ID: <ap2XdXRXRG0ABl5n@redhat.com>
References: <20260905181551.738186850@kernel.org>
 <20260905185840.033154049@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905185840.033154049@kernel.org>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

I am still trying to understand this patch, one question for now.

On 09/05, Thomas Gleixner wrote:
>
> +void posix_cpu_timers_exit_task(void)
>  {
> -	cleanup_timers(&tsk->posix_cputimers);
> +	posix_cpu_timers_exit_work();
> +
> +	guard(spinlock_irq)(&current->sighand->siglock);
> +	cleanup_timers(&current->posix_cputimers);
>  }

So it calls posix_cpu_timers_exit_work()

> +static inline void posix_cpu_timers_exit_work(void)
> +{
> +	/*
> +	 * current->flags has PF_EXITING set so this can be done lockless and
> +	 * with interrupts enabled as PF_EXITING prevents the interrupt from
> +	 * scheduling the work.
> +	 */
> +	if (current->posix_cputimers_work.scheduled)
> +		task_work_cancel(current, &current->posix_cputimers_work.work);

... which does not clear ->scheduled

>  void posixtimer_exec(void)
>  {
> -	scoped_guard(spinlock_irq, &current->sighand->siglock)
> -		posix_cpu_timers_exit(current);
> -
> +	posix_cpu_timers_exit_task();

... and this looks obviously wrong for posixtimer_exec() ?

Oleg.

