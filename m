Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792752647;
	b=uH1VTgEL89ajpxX6AlIYc6eCU1zswmsqW2e11VX2zzT1PQP+qQWfuOSmagzbFxxM9Od9
	 VN5qmEM40PE1bYGbWxYDxWOqongHQhdMSNxlOtCiF9Ou0/J5Gg4pWoePF2id9dVkvXUer
	 MUe72Tq5PMjowBW39BMeCVXN/BnqqTHI0olCdKhh4ruLn3qmCofvey1uQt01llrrt/BoX
	 NWi+uKB4EDKwK1nv/NDaObwch/Oy5d484TNYKW61FrYvEOa4hOkSGzJoiiJzNCJ/dRFHR
	 xxM6ISVFgXdwzoB3mm83GPdq8UpOEWvnvxl4ttk+wd/Xx8Db+UOGuE/s0A3jQ87iajA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752647;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=4MHHy7AEttiDujVao2ghw+rQrpaM49lVqzWBSD5g1mM=;
	b=A2JuhpbdEs/xakea45h4vfryiNzSTOaGC1GoUwo6yvhN1I2jYhoz6u9Q0ZNv78GSE/9W
	 WxnqR3qL+xKfzNqrrxqZ6eq/rlZxBXsKAeJxwqOxpgdWkBxCHZ/UTojd7GyPghu7I6eQ3
	 1eh5WTdPAmVzZraACIFmv3fNjUBfMQz+mGaEDzyOtplhPrNdUnSwhHD1mDepjr2/0Qkgq
	 7y9+H0nyinbRmtsPMYwmONYbH0GHX3RX48r6ZifZWTRuJI3h+UfUvulXmECUfO7xa8IDa
	 iP3eyGqXQboCSNGqdOsa8HX1b/70zIscL76HeJ1h6Ag2jqIuR1GLs8d5cfLa+2SBpbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h+901jSc;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3CF606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B3CF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h+901jSc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792752646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4MHHy7AEttiDujVao2ghw+rQrpaM49lVqzWBSD5g1mM=;
	b=h+901jSclojHJWgutZidDtdhVIctVrmiBLgxnTL5GEt5IdAbHbplg4ga/nWy5cUSkz608U
	r8medPKYSBdF42JwYNOcrVGLcuZ+hGfU/NvYjOwm4Vz8ZpoTc2Fns3Hbe0ITiEXcJJHxoG
	3sE6F54xUr/xFTr4A6+j9cZwx1kBv9Q=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-690-28s5e7jXMCqJuBmrHdZ1Xw-1; Fri,
 23 Oct 2026 06:50:42 -0400
X-MC-Unique: 28s5e7jXMCqJuBmrHdZ1Xw-1
X-Mimecast-MFC-AGG-ID: 28s5e7jXMCqJuBmrHdZ1Xw_1792752641
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5F5A5180131A;
	Fri, 23 Oct 2026 10:50:41 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id CCA797DA;
	Fri, 23 Oct 2026 10:50:39 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Fri, 23 Oct 2026 12:50:41 +0200 (CEST)
Date: Fri, 23 Oct 2026 12:50:38 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Avi Weiss <thnkslprpt@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Eric W . Biederman" <ebiederm@xmission.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] signal: cleanup the .si_signo checks in
 dequeue_synchronous_signal()
Message-ID: <ats7_mSMrLBAq0Np@redhat.com>
References: <20261022061015.3737924-1-thnkslprpt@gmail.com>
 <ats7j0mb3VF6lIg4@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ats7j0mb3VF6lIg4@redhat.com>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Christian,

This is on top of Avi's
[PATCH v2] signal: respect the blocked mask in dequeue_synchronous_signal()

If you are going to update your tree and take V2 + my cleanup, I will not
mind if you fold my patch into the fix from Avi.

And! I just noticed the sashiko's review of Avi's patch:
https://sashiko.dev/#/patchset/20261022061015.3737924-1-thnkslprpt%40gmail.com

It noticed the problem with UB too. But, unlike me, it noticed another problem
with the "still_pending" logic. The described scenario is not possible after my
change, but we have the same problem with posix timers.

This needs another change. I'll try to think a bit to avoid a "brute force" fix.

Oleg.

On 10/23, Oleg Nesterov wrote:
>
> - Use SI_FROMKERNEL() instead of open-coded check
> 
> - Use rt_sigmask() instead of sigmask() to avoid UB on 32-bit if
>   .si_signo > 32
> 
> - Pre-calculate the unblocked synchronous signal "mask" to not check
>   .si_signo twice.
> 
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>
> ---
>  kernel/signal.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/kernel/signal.c b/kernel/signal.c
> index 7386b9552dc3..64259219bbdc 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -676,21 +676,17 @@ static int dequeue_synchronous_signal(kernel_siginfo_t *info)
>  	struct task_struct *tsk = current;
>  	struct sigpending *pending = &tsk->pending;
>  	struct sigqueue *q, *sync = NULL;
> +	unsigned long mask;
>  
> -	/*
> -	 * Might a synchronous signal be in the queue?
> -	 */
> -	if (!((pending->signal.sig[0] & ~tsk->blocked.sig[0]) & SYNCHRONOUS_MASK))
> +	/* Might a synchronous signal be in the queue? */
> +	mask = (pending->signal.sig[0] & ~tsk->blocked.sig[0]) & SYNCHRONOUS_MASK;
> +	if (!mask)
>  		return 0;
>  
> -	/*
> -	 * Return the first synchronous signal in the queue.
> -	 */
> +	/* Return the first synchronous signal in the queue. */
>  	list_for_each_entry(q, &pending->list, list) {
> -		/* Synchronous signals have a positive si_code */
> -		if ((q->info.si_code > SI_USER) &&
> -		    (sigmask(q->info.si_signo) & SYNCHRONOUS_MASK) &&
> -		    !sigismember(&tsk->blocked, q->info.si_signo)) {
> +		if (SI_FROMKERNEL(&q->info) &&
> +		    (rt_sigmask(q->info.si_signo) & mask)) {
>  			sync = q;
>  			goto next;
>  		}
> -- 
> 2.55.0
> 

