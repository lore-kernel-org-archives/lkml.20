Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670321;
	b=DUvaIUH1PZuhe9YdviJlzuB1Qbke9C5GHl8n2SwZ0I6Q1eiBTDstJlTJsKpKGb1QXW5b
	 TeG1E3NuLR2WOumb0D+n4UuqbU48+1fX0zFytOvBn95O0T6jnODwh+DyTKpN42oCdualX
	 PrhJ0HDEJN8wbYE+4uVNYbT6GdoXArZ95aPE1LdRWJjzMgbmVEj189K9GCHMQz5lKsB4Q
	 XHf6+wtgugDRayd4daC5B7FWjccosSWE4igHCtn7Ak7P5ESDLbVX3WYM7O+Ou+ViNGUiV
	 zWrcDhVdoOYTyp/tufvU3/g4UxobcU4omT+5t41KbMRst75NU756bOog21H+M29Oz/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670321;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=tMc/gRJ1K2JZmN798zKV6iwCMmDlrgeGnYF1mTQ2vjQ=;
	b=4qcaOlWccN7yJyMPzpQ9BpdsreyQGfmKaCySF1/+XraBVYj1Wr7IeXCgGf462adHZXd2
	 0FK9IAq885sWP3noETepPRsdVkncgFR87/vaSE4Ypf1ZijU79sX+bSneldiSbhPcpgwpl
	 vuWdU/4RARlH3l8ZIO7g/ZD5BTWjMKpd981YVC1jHO8R0bXKXoCx91syiCTQ1ET5IlH2T
	 dcNlo5pNy5KP71UkhN3qfPqVppuIK+OuDjatUOqhWBe1X9NDQ+zfZ/cC7VqKhOGxqFYVd
	 3pqJwB+E4aKyuQiW3TMSvyDs7sxlhVSpoC0uwx3OXi9Komp9X0eZa8cglgrXa5e7ibg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KuNNkPvq;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247B9606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 247B9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KuNNkPvq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792670320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tMc/gRJ1K2JZmN798zKV6iwCMmDlrgeGnYF1mTQ2vjQ=;
	b=KuNNkPvqqsWzB1oOuWBeydle2uSxGdPW5RH0730IBmFzE4eWZwrnvxa+W+VR8CeUliY4CM
	gMJBe4Q7sYXI93yJdcmqwWBzZyQZTqfCNW0guEUv8DUoO3eGFjwyczh5j+6gkZsb5VB5ZT
	Vpcrf9w8qIIxk5BLaJsTIXXGNawdwis=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-662-jiDiXb60MISpojiK5tT19w-1; Thu,
 22 Oct 2026 11:58:38 +0000
X-MC-Unique: jiDiXb60MISpojiK5tT19w-1
X-Mimecast-MFC-AGG-ID: jiDiXb60MISpojiK5tT19w_1792670317
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 562901800D87;
	Thu, 22 Oct 2026 11:58:37 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id B76A91800347;
	Thu, 22 Oct 2026 11:58:35 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Thu, 22 Oct 2026 13:58:37 +0200 (CEST)
Date: Thu, 22 Oct 2026 13:58:34 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>,
	"Eric W . Biederman" <ebiederm@xmission.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] signal: respect the blocked mask in
 dequeue_synchronous_signal()
Message-ID: <atn6anj4NRKpT-qN@redhat.com>
References: <20261022061015.3737924-1-thnkslprpt@gmail.com>
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
In-Reply-To: <20261022061015.3737924-1-thnkslprpt@gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 10/22, Avi Weiss wrote:
>
> Changes in v2:
> - Restore the original queue-scan comment following Eric's feedback.
> - Clarify that ordinarily queued signals can match the
>   synchronous-signal heuristic.
> - Rebase onto current mainline.
>
>  kernel/signal.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/signal.c b/kernel/signal.c
> index cb6ec7054eee..7e690f4fb5bc 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -689,7 +689,8 @@ static int dequeue_synchronous_signal(kernel_siginfo_t *info)
>  	list_for_each_entry(q, &pending->list, list) {
>  		/* Synchronous signals have a positive si_code */
>  		if ((q->info.si_code > SI_USER) &&
> -		    (sigmask(q->info.si_signo) & SYNCHRONOUS_MASK)) {
> +		    (sigmask(q->info.si_signo) & SYNCHRONOUS_MASK) &&
> +		    !sigismember(&tsk->blocked, q->info.si_signo)) {

Still:

CC: stable@vger.kernel.org
Acked-by: Oleg Nesterov <oleg@redhat.com>


I was going to send another cleanup on top of this fix. Can't do this today,
but let me explain... It is a bit ugly to check si_signo twice. And afaics we
have another problem. sys_rt_sigqueueinfo() allows to send a SI_FROMKERNEL RT
signal to itself. In this case sigmask(q->info.si_signo) leads to UB on 32-bit.

I'll recheck, write the changelog, and send something like below tomorrow.
perhaps rt_sigmask() makes more sense than sigset_t...

Oleg.


From 6f7441ff08d7b88b96ac6787b40634e8c173003c Mon Sep 17 00:00:00 2001
From: Oleg Nesterov <oleg@redhat.com>
Date: Thu, 22 Oct 2026 13:43:01 +0200
Subject: [PATCH] signal: cleanup the .si_signo checks in dequeue_synchronous_signal()

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 kernel/signal.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/kernel/signal.c b/kernel/signal.c
index 7386b9552dc3..9cfd4d03cad4 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -676,21 +676,24 @@ static int dequeue_synchronous_signal(kernel_siginfo_t *info)
 	struct task_struct *tsk = current;
 	struct sigpending *pending = &tsk->pending;
 	struct sigqueue *q, *sync = NULL;
+	unsigned long mask;
+	sigset_t xxx;
 
 	/*
 	 * Might a synchronous signal be in the queue?
 	 */
-	if (!((pending->signal.sig[0] & ~tsk->blocked.sig[0]) & SYNCHRONOUS_MASK))
+	mask = (pending->signal.sig[0] & ~tsk->blocked.sig[0]) & SYNCHRONOUS_MASK;
+	if (!mask)
 		return 0;
 
+	siginitset(&xxx, mask);
 	/*
 	 * Return the first synchronous signal in the queue.
 	 */
 	list_for_each_entry(q, &pending->list, list) {
 		/* Synchronous signals have a positive si_code */
-		if ((q->info.si_code > SI_USER) &&
-		    (sigmask(q->info.si_signo) & SYNCHRONOUS_MASK) &&
-		    !sigismember(&tsk->blocked, q->info.si_signo)) {
+		if (SI_FROMKERNEL(&q->info) &&
+		    sigismember(&xxx, q->info.si_signo)) {
 			sync = q;
 			goto next;
 		}
-- 
2.55.0


