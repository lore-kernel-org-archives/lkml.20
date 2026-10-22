Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=166.70.13.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792700113;
	b=skYP/eSYorXrGd2VGaZXkzzlHfArCk8+byYqmdOIybR+Rd4vU7MdJ0qnKrIElFVwJ2Yo
	 dLOgsC8PYY0WIcqIk6v3+t3Pz2svstOd8UgpVhX9/bMRBtm+5PHL6/IP+arl7z4tMUbTM
	 qCiRRC+DwEDmoQNerFZYjaQ4keTYwprcrs0fK5fhMEXAs3u5sJrBQ01xfF71lROlgwYPz
	 LyraPAREU6JpxxWk8GHLoWFd4LcJrBxT8MOGtAAOGhjBsfvSvjn1svwKE4L/CAiXFcLYm
	 JtliBXUq+WVXiey5AWr7bNiTRjfyfjwFyqFyuyAuqfjuGIoD4RrKfvQ7w+PDxR1KLdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700113;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:In-Reply-To:
	 References:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-XM-SPF:X-XM-AID:X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:
	 X-Spam-Report:X-Spam-DCC:X-Spam-Combo:X-Spam-Relay-Country:
	 X-Spam-Timing:Subject:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-SA-Exim-Scanned;
	bh=Jcc5ZrlOiX1cHVRzmslrIcdyalBrvx41fKZJzqFK+bA=;
	b=poSvYGtG4sdFBsq6y6+WfejKUkqlylxGyAz9DroEqJgJOBeLe7ShiBeqkkWn0Wk1FZlD
	 D7bNCh4d0t6YXCJMa3Zh0Dbt3lxhKGQqPVOEKTzIHKQRc1r4yIf2h3Yck5Dko9/MrLtIV
	 +r9Qw4gLVCEeXItQkZBqfPEl03o2a0k1wky4hMNjKn5adZR1wZXXdBIGb57lYmV1xasIr
	 z2kdw74lxtYsYFcFst62P3VOdWM6y3kquZ/Om0jRjdV2Wyj2ZYcGPYuH7i0JV3MFaZa3T
	 sYhhhIXd9btRZg3/gFEy3fYYj2ME9It9dEx07MpIMLWcENNOJejl0/lF7ALRFuKc/bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xmission.com;
	spf=pass smtp.mailfrom=xmission.com;
	dkim=pass header.d=xmission.com header.i=@xmission.com header.a=rsa-sha256 header.s=xmission header.b=jt665gui;
	arc=none smtp.remote-ip=166.70.13.233
Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E0C606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88E0C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xmission.com header.i=@xmission.com header.a=rsa-sha256 header.s=xmission header.b=jt665gui
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=xmission.com;
	 s=xmission; h=Subject:Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=qJkCEnLUr+PLr5k7G9lBw/DYbm1dZxG1gVnc8IOb6Ns=; b=jt665guiyzU252xCFTMrUDfOPF
	5KkparjzRYC7VD1yIuQSUNBYEjkvz3MhG3SlF+HWujQUohJvPZBd8j6rm/1WeVT/LhDA031F81wg4
	Kh11dY18xkojA99H0Wy9kd+A4U0RRoih06HfbfLfyBo+oV9/dCDLYCD3U7O1jNq6mZcg=;
Received: from in01.mta.xmission.com ([166.70.13.51]:56864)
	by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1xJzBp-00GXW5-NV; Thu, 22 Oct 2026 14:15:05 -0600
Received: from ip72-198-196-98.om.om.cox.net ([72.198.196.98]:49632 helo=email.froward.int.ebiederm.org.xmission.com)
	by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1xJzBo-003Bff-TG; Thu, 22 Oct 2026 14:15:05 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Oleg Nesterov <oleg@redhat.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Christian Brauner <brauner@kernel.org>,
  linux-kernel@vger.kernel.org
In-Reply-To: <20261022061015.3737924-1-thnkslprpt@gmail.com> (Avi Weiss's
	message of "Thu, 22 Oct 2026 09:10:15 +0300")
References: <20261022061015.3737924-1-thnkslprpt@gmail.com>
Date: Thu, 22 Oct 2026 20:15:01 +0000
Message-ID: <87mrs5o5kq.fsf@email.froward.int.ebiederm.org>
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
X-XM-SPF: eid=1xJzBo-003Bff-TG;;;mid=<87mrs5o5kq.fsf@email.froward.int.ebiederm.org>;;;hst=in01.mta.xmission.com;;;ip=72.198.196.98;;;frm=ebiederm@xmission.com;;;sPfnum=0;;;sPf=pass
X-XM-AID: U2FsdGVkX1/+oA3z8A/JMFDKjeTaVCDt4tjn0caT0g0=
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.1 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.4998]
	*  0.7 XMSubLong Long Subject
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa07 1397; Body=1 Fuz1=1 Fuz2=1]
	*  0.0 T_TooManySym_01 4+ unique symbols in subject
	*  0.0 T_TooManySym_02 5+ unique symbols in subject
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Avi Weiss <thnkslprpt@gmail.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 328 ms - load_scoreonly_sql: 0.05 (0.0%),
	signal_user_changed: 11 (3.4%), b_tie_ro: 10 (3.0%), parse: 0.95
	(0.3%), extract_message_metadata: 14 (4.2%), get_uri_detail_list: 2.0
	(0.6%), tests_pri_-2000: 14 (4.3%), tests_pri_-1000: 1.91 (0.6%),
	tests_pri_-950: 0.90 (0.3%), tests_pri_-900: 0.70 (0.2%),
	tests_pri_-90: 52 (15.9%), check_bayes: 51 (15.6%), b_tokenize: 6
	(1.8%), b_tok_get_all: 7 (2.2%), b_comp_prob: 2.5 (0.8%),
	b_tok_touch_all: 31 (9.5%), b_finish: 1.09 (0.3%), tests_pri_0: 220
	(66.9%), check_dkim_signature: 0.40 (0.1%), check_dkim_adsp: 3.4
	(1.0%), poll_dns_idle: 1.74 (0.5%), tests_pri_10: 1.67 (0.5%),
	tests_pri_500: 8 (2.3%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH v2] signal: respect the blocked mask in
 dequeue_synchronous_signal()
X-SA-Exim-Connect-IP: 166.70.13.51
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, brauner@kernel.org, akpm@linux-foundation.org, oleg@redhat.com, thnkslprpt@gmail.com
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out03.mta.xmission.com); SAEximRunCond expanded to false

Avi Weiss <thnkslprpt@gmail.com> writes:

> dequeue_synchronous_signal() uses the signal number and a positive
> si_code to identify synchronous signals. An ordinarily queued
> signal can also match this heuristic.
>
> The initial pending-mask check only establishes that an unblocked
> signal in SYNCHRONOUS_MASK is pending. The queue scan can select a
> different blocked signal matching the heuristic and deliver it
> despite its mask.
>
> For example, a thread can block SIGSEGV and queue it to itself with
> a positive si_code using rt_tgsigqueueinfo(). An unblocked SIGTRAP
> then allows the scan to select the blocked SIGSEGV.
>
> Check each candidate against the blocked mask. Genuine forced faults
> are unblocked by force_sig_info_to_task() when necessary.
>
> Fixes: 7146db3317c6 ("signal: Better detection of synchronous signals")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---

Acked-by: "Eric W. Biederman" <ebiederm@xmission.com>

>
> Reproduced by blocking SIGSEGV, queuing a positive-code SIGSEGV
> with rt_tgsigqueueinfo(), then triggering an unblocked SIGTRAP.
> Without the fix, SIGSEGV was delivered while still blocked.
>
> Tested unpatched and patched kernels under QEMU on UP x86-64, with
> test processes running as UID/GID 1000. The unpatched kernel passed
> 21/38 checks and the patched kernel passed 38/38.
>
> These results are from the original patch base. The rebased v2 has
> not been runtime-tested separately.
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
>  			sync = q;
>  			goto next;
>  		}
>
> base-commit: 4403278e4ea2f654f8130a5c03eb8b4516a0f201
