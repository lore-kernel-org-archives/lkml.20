Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4597D181334
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 16:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788711996; cv=none; b=iCsE9LJPzJ9Ki7rlfdeHrxATYdAoZjpIYOgnXEyBh3LYpbhzcBI171bw7aZKgUJMJy6Ke4RZi/F64Li2aI3VQr8Aqmc3VeD0h9K8pxEDitJh91nYiK/DJGvqrJ9U4icnJ1bFdL+W8U2V5RSATAhlEsWLi37BZrRu6W3ve10LKDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788711996; c=relaxed/simple;
	bh=L5j6j4jcURXtUmtswkw2W3gbswVusDqtNSY0HJ3GOXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THakjEY7QHIVx2wzm9i7XB4tMjF7dDciEhL/txabRNoBUcXUdwwgbfr1qXH0fVAwOc5Go6enE9fpfmP0QYkQEyzamE8Dcq8UOyfiIojLobKATHCNoTew6+tWwor+B+RLDWad30hePu9AjfRIFOHVEErAzkrnRSY/8cH/4LXbFtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ikg6uui+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ikg6uui+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788711994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DNaRcyGQFdOTqC6GOWU5FjtvrmB0bo0wKJJgL8NUxk4=;
	b=ikg6uui+4J/6cmLkUy0FKPb9rJNjPxmNQpRIiyAxB7sFby9EcDydEvwY/E/QFlegB18DuH
	BHg3YPJjiqpsZ2Y3lOUMlawMVhvlXcEhEpRQ6giKKP5v5UM0Zo7nEHsMdUQdnXeHhFyRc6
	yDnGs0HChrGChxxbFIOJoLwe/cpqB3o=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-531-n6Fx-9QwOVqeZN1apLXGDQ-1; Sun,
 06 Sep 2026 12:26:27 -0400
X-MC-Unique: n6Fx-9QwOVqeZN1apLXGDQ-1
X-Mimecast-MFC-AGG-ID: n6Fx-9QwOVqeZN1apLXGDQ_1788711986
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 395671805A05;
	Sun,  6 Sep 2026 16:26:25 +0000 (UTC)
Received: from fedora (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 408B3426;
	Sun,  6 Sep 2026 16:26:21 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sun,  6 Sep 2026 18:26:24 +0200 (CEST)
Date: Sun, 6 Sep 2026 18:26:19 +0200
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
Subject: Re: [patch V2 7/8] posix-cpu-timers: Prevent enqueueing when
 PF_EXITING is set
Message-ID: <ap2UK_7yQkJqDzVG@redhat.com>
References: <20260905181551.738186850@kernel.org>
 <20260905185839.972374320@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905185839.972374320@kernel.org>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

I do not want to spam lkml, so let me say that all the previous changes
look good to me, feel free to add

Reviewed-by: Oleg Nesterov <oleg@redhat.com>


But I am confused by this patch, even if it looks correct to me too.

On 09/05, Thomas Gleixner wrote:
>
> @@ -684,7 +706,13 @@ static void arm_timer(struct k_itimer *t
>  	struct cpu_timer *ctmr = &timer->it.cpu;
>  	u64 newexp = cpu_timer_getexpires(ctmr);
>
> +	lockdep_assert_held(&p->sighand->siglock);
> +
>  	timer->it_status = POSIX_TIMER_ARMED;
> +
> +	if (unlikely(!task_can_enqueue_timer(p, clock_pid_type(timer->it_clock))))
> +		return;

I can't understand why does it check task_can_enqueue_timer() after
setting POSIX_TIMER_ARMED. This adds the new armed-but-not-enqueued state,
afaics.

I see nothing wrong, it seems that this can only affect __posix_cpu_timer_get()
which checks ->it_status, other code paths do not check ->it_status.

But I don't understand this code, so let me ask: is it on purpose? I mean,
is there any reason to set _ARMED unconditionally ?

Oleg.

