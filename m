Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A5D3290AA
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789909302; cv=none; b=uiRBSnLjSla1z9/sn5qMKZcl9uNg1EbV6HGrlM3NbblLTsSnV1HHUKWkUCICYgnncvmn1fWlN7O2RCl4nHskQJ3Pq3f2BVhnKHZ+oqDb0WB/hj0pPpkANIsL798j0dK70ZlDrDsvA2W0QM7olEztutM29C5pf6wvE1OU1rHbIcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789909302; c=relaxed/simple;
	bh=FpeGCn8wn6epu8E+hJn2KBmwOq78pEiHoL69LLBBXmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PklukjqmC2BLu8a59G2IVUb4hW9i1Yb2/MMdN9jXOO/2Grm/adpDmuhzKJVx814lQ9jBwFzAXhrEh90NNqsmoXpMEQyaREPzvSL6tnAMn5klmc/ByZ5pNQrPkZoJFCUVKpajIDP3qHUG9tT8K/Cf5N99oZTy/Nx0ZDOXX9tjlUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SW+BCLK8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SW+BCLK8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789909279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U9euLxwPPTyf0gCJNQ1A/ZDoA+dz+x4Zy/vtrCG7HsI=;
	b=SW+BCLK8yqo73D1UwmGhIDmSfHsz8x7p01IcaUexNxNEqwBJ6mpw7JrQ9E2f50dxf/sFHp
	KNctNi7qoUv/MCGfy7wNJTUOF6xmF/Lio28QQyWK6tX+9+zQvc0rloeNIltJuOI+1yp3ce
	K3isqZ4QLdU+8Kc6ybomfd+na0T3g+w=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-660-DYe9EOXZNJGjON6sijFtUg-1; Sun,
 20 Sep 2026 09:01:15 -0400
X-MC-Unique: DYe9EOXZNJGjON6sijFtUg-1
X-Mimecast-MFC-AGG-ID: DYe9EOXZNJGjON6sijFtUg_1789909274
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E9EE7180A9D7;
	Sun, 20 Sep 2026 13:01:13 +0000 (UTC)
Received: from fedora (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 15EA01800370;
	Sun, 20 Sep 2026 13:01:11 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sun, 20 Sep 2026 15:01:13 +0200 (CEST)
Date: Sun, 20 Sep 2026 15:01:10 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Hui Peng <benquike@gmail.com>
Cc: akpm@linux-foundation.org, brauner@kernel.org, tglx@kernel.org,
	elver@google.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] signal: re-arm ignored periodic POSIX timers when
 handler is installed in do_sigaction()
Message-ID: <aq_ZFsHg50ZlqgnO@redhat.com>
References: <20260919221731.3707506-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919221731.3707506-1-benquike@gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 09/19, Hui Peng wrote:
>
> When a periodic POSIX timer fires while its target signal is ignored
> (e.g. default SIGCONT/SIGCHLD/SIGURG/SIGWINCH or SIG_IGN), the signal is
> dropped without advancing or queueing the timer's sigqueue, leaving the
> periodic timer stalled even after userspace installs a signal handler
> via sigaction(). Check and re-arm any pending ignored POSIX timers on
> the thread group when do_sigaction() transitions a signal out of the
> ignored state.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

Well, It was supposed to have been fixed by caf77435dd8a ("signal: Handle
ignored signals in do_sigaction(action != SIG_IGN)") and other commits in
that series...

Do you have a test-case?

Oleg.

> Assisted-by: LLM
> Signed-off-by: Hui Peng <benquike@gmail.com>
> ---
> diff --git a/kernel/signal.c b/kernel/signal.c
> index ec30550951ec..49ba188296c4 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -4351,7 +4351,7 @@ int do_sigaction(int sig, struct k_sigaction *act, struct k_sigaction *oact)
>  	sigaction_compat_abi(act, oact);
>  
>  	if (act) {
> -		bool was_ignored = k->sa.sa_handler == SIG_IGN;
> +		bool was_ignored = sig_task_ignored(p, sig, false);
>  
>  		sigdelsetmask(&act->sa.sa_mask,
>  			      sigmask(SIGKILL) | sigmask(SIGSTOP));
> @@ -4367,7 +4367,7 @@ int do_sigaction(int sig, struct k_sigaction *act, struct k_sigaction *oact)
>  		 *   (for example, SIGCHLD), shall cause the pending signal to
>  		 *   be discarded, whether or not it is blocked"
>  		 */
> -		if (sig_handler_ignored(sig_handler(p, sig), sig)) {
> +		if (sig_task_ignored(p, sig, false)) {
>  			sigemptyset(&mask);
>  			sigaddset(&mask, sig);
>  			flush_sigqueue_mask(p, &mask, &p->signal->shared_pending);
> 

