Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=166.70.13.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792641354;
	b=yqe1TOJ5V9eAC9aSCFs6dD/7HRxplmw6blcLrX+41ajWU9TizrOUTt1Q2Wa1mQzjtQOv
	 6clfbBOw6jX12rc2129GbyGwbRIMndUAV7zlzHXta6dxF1Mj3NlE094uIMIcU2HsMn5MW
	 FyXvNZMU8emB7fWV5NIiyqW3f2kxbWZMLxjs13KRFKNMLK3USDraOdYOq5p4fyurBMBFj
	 pi4ty/6zmiP5cNrxgOpZQFVsXExrnDbel6OBPnyJe71i6005Bqfwl0yfps9jFagQcRjTV
	 UuPJxY6C2dzYuFeY7Jb4w+q46LQWac9gBO/n1/SURvxknSfi5Atu4ECcYDK7C1RntLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792641354;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:In-Reply-To:
	 References:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-XM-SPF:X-XM-AID:X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:
	 X-Spam-Virus:X-Spam-Report:X-Spam-DCC:X-Spam-Combo:
	 X-Spam-Relay-Country:X-Spam-Timing:Subject:X-SA-Exim-Connect-IP:
	 X-SA-Exim-Rcpt-To:X-SA-Exim-Mail-From:X-SA-Exim-Scanned;
	bh=PKULCRaq0yE/sYN0J0WQXl3ZQAAJcX/cI3KJOyuw5TU=;
	b=JTG4FQRrcuylsvbti5GbnbH4dS6igWcuPaJ5oP3nt5eKH3gohjMzGWtblHR1r01DQnN1
	 +UyAmGRZkhgP7w3yLdpoiY/Ut4DVVKFnmum7zMdNBpgh9JK7hyK78uk1kgQr6eFfzybyw
	 UR6zSFtpVJRNsvB+b1x41X0gZcnrkZrnap0TbrU9RM0K8FxKqNuz+OqN0pB6A7WZrsn6V
	 0aibL24yDsyHuBVDUNjWZsgN0zxdreKXKwPDKaIXjllvGtpYA8/HHF2/IJ5vfUqCRrRDj
	 h9kfCLF8Tj1IesQmjOyn9diCu+XhNTeVJv2cio2i9h6ICtn64NTTWbeV65e33g8gYPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xmission.com;
	spf=pass smtp.mailfrom=xmission.com;
	dkim=pass header.d=xmission.com header.i=@xmission.com header.a=rsa-sha256 header.s=xmission header.b=dVyaTRjW;
	arc=none smtp.remote-ip=166.70.13.232
Received: from out02.mta.xmission.com (out02.mta.xmission.com [166.70.13.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B60B606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B60B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xmission.com header.i=@xmission.com header.a=rsa-sha256 header.s=xmission header.b=dVyaTRjW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=xmission.com;
	 s=xmission; h=Subject:Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=IJsjKfoWjZ2x7MB8Zrm5vcXPKLdlgNNIe90ab+rWWTc=; b=dVyaTRjWTcvZoZ/QYAUNslQPAx
	MBovUeI9Q+UeIRb1Q1gFLiaK2TOxViaZIvEYorkgvwgyd7oVItKpz9yJdNergleIqeFU7hIVpQQWn
	ceW9RKqJewtRaOuG15fHKU+vB8ddyaxA7Z10W+bpTdj6KUAgXgaMGyMARBIFPekk/mUw=;
Received: from in02.mta.xmission.com ([166.70.13.52]:44258)
	by out02.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1xJju5-005l2N-M1; Wed, 21 Oct 2026 21:55:45 -0600
Received: from ip72-198-196-98.om.om.cox.net ([72.198.196.98]:40954 helo=email.froward.int.ebiederm.org.xmission.com)
	by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1xJju4-00DfKJ-OZ; Wed, 21 Oct 2026 21:55:45 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Oleg Nesterov <oleg@redhat.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Christian Brauner <brauner@kernel.org>,
  linux-kernel@vger.kernel.org
In-Reply-To: <20261020181101.1605736-1-thnkslprpt@gmail.com> (Avi Weiss's
	message of "Tue, 20 Oct 2026 21:11:01 +0300")
References: <20261020181101.1605736-1-thnkslprpt@gmail.com>
Date: Thu, 22 Oct 2026 03:55:36 +0000
Message-ID: <87tsmeo0cn.fsf@email.froward.int.ebiederm.org>
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
X-XM-SPF: eid=1xJju4-00DfKJ-OZ;;;mid=<87tsmeo0cn.fsf@email.froward.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=72.198.196.98;;;frm=ebiederm@xmission.com;;;sPfnum=0;;;sPf=pass
X-XM-AID: U2FsdGVkX19yqlNQ3wSnFfMwg77E5IpmHQTbBD+J4eg=
X-Spam-Level: 
X-Spam-Virus: No
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.1 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.4996]
	*  0.7 XMSubLong Long Subject
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa03 1397; Body=1 Fuz1=1 Fuz2=1]
	*  0.0 T_TooManySym_02 5+ unique symbols in subject
	*  0.0 T_TooManySym_01 4+ unique symbols in subject
X-Spam-DCC: XMission; sa03 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Avi Weiss <thnkslprpt@gmail.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 414 ms - load_scoreonly_sql: 0.06 (0.0%),
	signal_user_changed: 4.5 (1.1%), b_tie_ro: 2.8 (0.7%), parse: 1.08
	(0.3%), extract_message_metadata: 3.8 (0.9%), get_uri_detail_list:
	1.41 (0.3%), tests_pri_-2000: 3.7 (0.9%), tests_pri_-1000: 2.5 (0.6%),
	tests_pri_-950: 1.12 (0.3%), tests_pri_-900: 0.76 (0.2%),
	tests_pri_-90: 57 (13.8%), check_bayes: 56 (13.5%), b_tokenize: 7
	(1.7%), b_tok_get_all: 7 (1.7%), b_comp_prob: 2.4 (0.6%),
	b_tok_touch_all: 35 (8.4%), b_finish: 1.03 (0.2%), tests_pri_0: 318
	(76.8%), check_dkim_signature: 0.66 (0.2%), check_dkim_adsp: 3.6
	(0.9%), poll_dns_idle: 1.62 (0.4%), tests_pri_10: 2.1 (0.5%),
	tests_pri_500: 11 (2.6%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH] signal: skip blocked signals in
 dequeue_synchronous_signal()
X-SA-Exim-Connect-IP: 166.70.13.52
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, brauner@kernel.org, akpm@linux-foundation.org, oleg@redhat.com, thnkslprpt@gmail.com
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out02.mta.xmission.com); SAEximRunCond expanded to false

Avi Weiss <thnkslprpt@gmail.com> writes:

> dequeue_synchronous_signal() checks whether an unblocked
> synchronous signal is pending, but its queue scan can select a
> different blocked entry with a positive si_code. This can deliver
> a signal while it is still blocked.
>
> Check the blocked mask for each queued entry. Forced faults
> are unblocked when necessary by force_sig_info_to_task(), and the
> existing pending bookkeeping is unchanged.

I am going to quibble a little with your description.

What you describe above as a forced fault, is what the code calls a
synchronous signal.  As such synchronous signals by definition can not
be blocked.  Unfortunately the code does not currently have a way to
distinguish between such a signal number used synchronously, and such a
signal number used normally.

Given the poor state of delivering these things I think the code change
is technically correct.

The comments change is wrong as there is no such thing as a blocked
synchronous signal.

Eric

> Fixes: 7146db3317c6 ("signal: Better detection of synchronous signals")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
>
> Reproduced by blocking SIGSEGV, queuing a positive-code SIGSEGV
> with rt_tgsigqueueinfo(), then triggering an unblocked SIGTRAP.
> Without the fix, SIGSEGV was delivered while still blocked.
>
> Patched version behaved as expected.
>
>  kernel/signal.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/signal.c b/kernel/signal.c
> index e433de93b430..4dcc47a7d30d 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -684,12 +684,13 @@ static int dequeue_synchronous_signal(kernel_siginfo_t *info)
>  		return 0;
>  
>  	/*
> -	 * Return the first synchronous signal in the queue.
> +	 * Return the first unblocked synchronous signal in the queue.
>  	 */
>  	list_for_each_entry(q, &pending->list, list) {
>  		/* Synchronous signals have a positive si_code */
>  		if ((q->info.si_code > SI_USER) &&
> -		    (sigmask(q->info.si_signo) & SYNCHRONOUS_MASK)) {
> +		    (sigmask(q->info.si_signo) & SYNCHRONOUS_MASK) &&
> +		    !sigismember(&tsk->blocked, q->info.si_signo)) {
>  			sync = q;
>  			goto next;
>  		}
>
> base-commit: f47d223627f80cb7a1eb14c585fe6cb35de5e984
