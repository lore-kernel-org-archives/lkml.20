Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=166.70.13.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792700494;
	b=cW1BkOrtXGu9g3J+1cHRqdLqZquC4nsL5NgiEmdGAiS5+0NXfL3NYSVui5IbN/qNcsRB
	 SNpy4vHqLzC29eMxaLKRU8xKXLGPiOLBE3VVhkmseANBeldesGgwcAQ7xiYiNtTiMvhqd
	 YfPAu8JwQnApvJrsxEpoMEnMtE3E1EO14BRelUH+adBY1KkAXzsYsZbSTE3LL22YapzJN
	 wAxqUUf7DlU6tn6nFA2ocgCnPsYKsXq4bELjul7Gk8ilkUbl2cnLvz9XSxrHpQLuqGJJN
	 UX0zWeIW7V4JDuCx7zbKO+MRcKUQqfXVNcB17b/WPbuP4IC5laSClTLyT/n8sKf9Bnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700494;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:In-Reply-To:
	 References:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-XM-SPF:X-XM-AID:X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:
	 X-Spam-Report:X-Spam-DCC:X-Spam-Combo:X-Spam-Relay-Country:
	 X-Spam-Timing:Subject:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-SA-Exim-Scanned;
	bh=LcRz1Ev8DmcKSEVZ7ce9IIus/Kh4engCFXM+xi1JDXo=;
	b=V3MMXXAaX7N956nZw6EplPak7On+As/8jdDVk1BAZruXOqaz0Lebqgiv1Tk3x7OFigZc
	 20vW99cgHEtXHsOo4zJm+4KjDcL9ojFlEUGV1QI4ESP22thED/lkHv+32DWCtEZMXyIM3
	 qvaF+IYVnrWC8MuTdbhXoolRk9dPmwW5RnO6jSZfA6i6psrJA4YwmaQ8P4oU3qzQdARLM
	 agQek0TOzHuHrP5qc0sRc68DnmAuunQ0YPFuU1fYPhOIcNTJbtrm6G26Hs0Ua3utNWsiQ
	 Hs0W89XOH4YrpHwt1MS6TSKFPVKrw5SkQma+ClBy3TC6kmuTq1PK5stCrmPB1pPwbJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xmission.com;
	spf=pass smtp.mailfrom=xmission.com;
	dkim=pass header.d=xmission.com header.i=@xmission.com header.a=rsa-sha256 header.s=xmission header.b=MaS0idwL;
	arc=none smtp.remote-ip=166.70.13.232
Received: from out02.mta.xmission.com (out02.mta.xmission.com [166.70.13.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2BB606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F2BB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xmission.com header.i=@xmission.com header.a=rsa-sha256 header.s=xmission header.b=MaS0idwL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=xmission.com;
	 s=xmission; h=Subject:Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=1epwcureGNJe5lZImEmuL8jL3EcLC66Hw65Ezl9z594=; b=MaS0idwL+v+sz+ztqqVGyN+omI
	0s5OI/NpokVagz1E1v03b+Mbyc7lHroUSFkf22A5kMDLHB+mmPPfgadlh2XpQrBf0uWCY9GCYUlIZ
	Q+B0SBmvea8tjhrRMhCs8K6UT+GEKbm+pKKHctUyo/eGhr4LjzPGROIb1aZysAl4LnMg=;
Received: from in02.mta.xmission.com ([166.70.13.52]:36712)
	by out02.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1xJzI5-0079yo-Fp; Thu, 22 Oct 2026 14:21:33 -0600
Received: from ip72-198-196-98.om.om.cox.net ([72.198.196.98]:44010 helo=email.froward.int.ebiederm.org.xmission.com)
	by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1xJzI4-00FRPs-IO; Thu, 22 Oct 2026 14:21:33 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Avi Weiss <thnkslprpt@gmail.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Christian Brauner <brauner@kernel.org>,
  linux-kernel@vger.kernel.org
In-Reply-To: <atn6anj4NRKpT-qN@redhat.com> (Oleg Nesterov's message of "Thu,
	22 Oct 2026 13:58:34 +0200")
References: <20261022061015.3737924-1-thnkslprpt@gmail.com>
	<atn6anj4NRKpT-qN@redhat.com>
Date: Thu, 22 Oct 2026 20:21:26 +0000
Message-ID: <878q3po5a1.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1xJzI4-00FRPs-IO;;;mid=<878q3po5a1.fsf@email.froward.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=72.198.196.98;;;frm=ebiederm@xmission.com;;;sPfnum=0;;;sPf=pass
X-XM-AID: U2FsdGVkX18JiXHqZK5E60Wmiv15NtR6CppcuNhGn+E=
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.1 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.5000]
	*  0.7 XMSubLong Long Subject
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa08 1397; Body=1 Fuz1=1 Fuz2=1]
	*  0.0 T_TooManySym_02 5+ unique symbols in subject
	*  0.0 T_TooManySym_01 4+ unique symbols in subject
X-Spam-DCC: XMission; sa08 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Oleg Nesterov <oleg@redhat.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 424 ms - load_scoreonly_sql: 0.08 (0.0%),
	signal_user_changed: 14 (3.2%), b_tie_ro: 12 (2.8%), parse: 0.95
	(0.2%), extract_message_metadata: 4.0 (0.9%), get_uri_detail_list:
	1.61 (0.4%), tests_pri_-2000: 3.8 (0.9%), tests_pri_-1000: 2.4 (0.6%),
	tests_pri_-950: 1.12 (0.3%), tests_pri_-900: 0.77 (0.2%),
	tests_pri_-90: 93 (22.0%), check_bayes: 91 (21.6%), b_tokenize: 7
	(1.8%), b_tok_get_all: 9 (2.1%), b_comp_prob: 3.7 (0.9%),
	b_tok_touch_all: 66 (15.5%), b_finish: 1.45 (0.3%), tests_pri_0: 281
	(66.3%), check_dkim_signature: 0.70 (0.2%), check_dkim_adsp: 3.5
	(0.8%), poll_dns_idle: 0.75 (0.2%), tests_pri_10: 2.5 (0.6%),
	tests_pri_500: 12 (2.8%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH v2] signal: respect the blocked mask in
 dequeue_synchronous_signal()
X-SA-Exim-Connect-IP: 166.70.13.52
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, brauner@kernel.org, akpm@linux-foundation.org, thnkslprpt@gmail.com, oleg@redhat.com
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out02.mta.xmission.com); SAEximRunCond expanded to false

Oleg Nesterov <oleg@redhat.com> writes:

> I was going to send another cleanup on top of this fix. Can't do this today,
> but let me explain... It is a bit ugly to check si_signo twice.

I can see where your proposed change is addressing that and it seems
reasonable.

> And afaics we have another problem. sys_rt_sigqueueinfo() allows to
> send a SI_FROMKERNEL RT signal to itself.

I don't see where your proposed code is addressing this.

From 10,000 feet I think it is deliberate that we allow sending all
possible pending signals to ourselves.  Some version of that is
necessary to restore a checkpoint of a process, if it has not
yet handled the signal at the point it is check-pointed.

You can look at CRIU if you need to see if this is behavior that
is being relied upon.

> In this case sigmask(q->info.si_signo) leads to UB on 32-bit.

I presume you are referring to a signal number that exceeds 32
being put into a 32bit mask.  That does seem worth fixing.

Eric


> I'll recheck, write the changelog, and send something like below tomorrow.
> perhaps rt_sigmask() makes more sense than sigset_t...
>
> Oleg.
>
>
> From 6f7441ff08d7b88b96ac6787b40634e8c173003c Mon Sep 17 00:00:00 2001
> From: Oleg Nesterov <oleg@redhat.com>
> Date: Thu, 22 Oct 2026 13:43:01 +0200
> Subject: [PATCH] signal: cleanup the .si_signo checks in dequeue_synchronous_signal()
>
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>
> ---
>  kernel/signal.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/signal.c b/kernel/signal.c
> index 7386b9552dc3..9cfd4d03cad4 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -676,21 +676,24 @@ static int dequeue_synchronous_signal(kernel_siginfo_t *info)
>  	struct task_struct *tsk = current;
>  	struct sigpending *pending = &tsk->pending;
>  	struct sigqueue *q, *sync = NULL;
> +	unsigned long mask;
> +	sigset_t xxx;
>  
>  	/*
>  	 * Might a synchronous signal be in the queue?
>  	 */
> -	if (!((pending->signal.sig[0] & ~tsk->blocked.sig[0]) & SYNCHRONOUS_MASK))
> +	mask = (pending->signal.sig[0] & ~tsk->blocked.sig[0]) & SYNCHRONOUS_MASK;
> +	if (!mask)
>  		return 0;
>  
> +	siginitset(&xxx, mask);
>  	/*
>  	 * Return the first synchronous signal in the queue.
>  	 */
>  	list_for_each_entry(q, &pending->list, list) {
>  		/* Synchronous signals have a positive si_code */
> -		if ((q->info.si_code > SI_USER) &&
> -		    (sigmask(q->info.si_signo) & SYNCHRONOUS_MASK) &&
> -		    !sigismember(&tsk->blocked, q->info.si_signo)) {
> +		if (SI_FROMKERNEL(&q->info) &&
> +		    sigismember(&xxx, q->info.si_signo)) {
>  			sync = q;
>  			goto next;
>  		}
