Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE85D49C4C9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 18:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788287306; cv=none; b=eswQb8A8Vv+ZM67C5qnrBCe4mvy7nPwDy+DiVoFX4B8B/GHnbcge7Ha00Ddnuqnie6t/Fb+h4BOAZYC26Byh2K1KlR+Zs0rLPl8aFgiqb8IKrja0SbbbFlHUlIfirqSt9bVFXDvlSXOKI3/lrCB1uLXfvtH/jyxq/rhICx2kCEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788287306; c=relaxed/simple;
	bh=dW2zjSNtAE6tsW8Oju7mw9KbJTPLQO2YIQfVnyGAYe8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=N2S5du2zOXXNoGWPrjx0tK6MF/yIzLfy4/pguARlFcp4yFsHvA1y04ZHHr9bj0XZa+DTJ4FjCOaTD5IykS7ibPgPcK4oyRFYnR/RaF2k4cjVy+aUL7KAm+esUzE9pgXXUiYS2RRLMGoG6biyFsNBcpx4fo71frCb6mfAwhND7B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=DyoSLdec; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=tHc8/rT4; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="DyoSLdec";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="tHc8/rT4"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788287301; bh=OkJepz8PCeZ28Uwp3SuZn8C
	JAmNOXwFNtkBjqv1pH9A=; b=DyoSLdec6c3y2IbCMvaqtrJMS9+CxoRNJk3mqw91OjZwXM0wS1
	0BxRXmqruIiHqOBeCORrrmC6CPwPjr5uwoBtbJwVa7DydtqhjVxBDnIcfBUSitCIP/SA4cSo6pX
	uAHDqF6W7vFCrJnGMPKO6IrlA2tCoj1D52V94VHo2Li1MDard/BpHzGZ0D38ERESUNUdvy6e44E
	8c/Ym8TpjZyKgFa8nvZAwdNA45uz4VxcvNbVNMegdvSHZxZM69yyiSKf7NUsvMI4+0YQUSNyI+X
	eaTgUFKinnkivHLNX4meuPGlUi66xebysB4Xc/wtlaj2XCOG65WKgSrqgDNm2ThT7wA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788287301; bh=OkJepz8PCeZ28Uwp3SuZn8C
	JAmNOXwFNtkBjqv1pH9A=; b=tHc8/rT4+RRRtqhi/Jw2oNdsMpaDJAz6WdMp9VdCGvFnx42e8k
	H/smFzih8FG5sDBl3dGbj2DvRfFoEQJSbIAA==;
Date: Tue, 01 Sep 2026 19:28:19 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Frederic Weisbecker <frederic@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>, Bradley Morgan <include@grrlz.net>,
 Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kthread: remove worker->task self-assignment
In-Reply-To: <apbb--idnSZMNLPU@localhost.localdomain>
References: <20260829161150.16301-1-include@grrlz.net> <20260829161848.20635-1-include@grrlz.net> <apbI91PzT2BaRazM@localhost.localdomain> <20260901124900.GB687043@noisy.programming.kicks-ass.net> <CE1F7435-D872-4A3F-BC7A-50443BBE2904@mainlining.org> <apbb--idnSZMNLPU@localhost.localdomain>
Message-ID: <87CE893D-07E6-4EA4-8156-2CE6946D12BD@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 1 September 2026 15:06:51 BST, Frederic Weisbecker <frederic@kernel.org>
wrote:
>Le Tue, Sep 01, 2026 at 02:57:38PM +0100, Bradley Morgan a écrit :
>> On 1 September 2026 13:49:00 BST, Peter Zijlstra <peterz@infradead.org>
>> wrote:
>> >On Tue, Sep 01, 2026 at 02:45:43PM +0200, Frederic Weisbecker wrote:
>> >> Hi,
>> >> 
>> >> Le Sat, Aug 29, 2026 at 04:18:48PM +0000, Bradley Morgan a écrit :
>> >> > From: Bradley Morgan <brads@mainlining.org>
>> >> > 
>> >> > All kthread worker users now create their workers with
>> >> > kthread_create_worker*(), which sets worker->task before the worker
>> >> > starts. The self-assignment in kthread_worker_fn() is dead code
>now.
>> >> 
>> >> How could it be created before?
>> >> 
>> >> > 
>> >> > Remove it.
>> >> > 
>> >> > Signed-off-by: Bradley Morgan <brads@mainlining.org>
>> >> > ---
>> >> >  kernel/kthread.c | 7 -------
>> >> >  1 file changed, 7 deletions(-)
>> >> > 
>> >> > diff --git a/kernel/kthread.c b/kernel/kthread.c
>> >> > index 63beb59b7a3d..18bc702e8d2d 100644
>> >> > --- a/kernel/kthread.c
>> >> > +++ b/kernel/kthread.c
>> >> > @@ -987,13 +987,6 @@ int kthread_worker_fn(void *worker_ptr)
>> >> >  	struct kthread_worker *worker = worker_ptr;
>> >> >  	struct kthread_work *work;
>> >> >  
>> >> > -	/*
>> >> > -	 * FIXME: Update the check and remove the assignment when all kthread
>> >> > -	 * worker users are created using kthread_create_worker*() functions.
>> >> > -	 */
>> >> > -	WARN_ON(worker->task && worker->task != current);
>> >> 
>> >> Should we keep a WARN_ON(worker->task != current) here?
>> >
>> >I vote yes! Paranoia is good :-)
>> >
>> 
>> 
>> Yeah, but it *should* be useless.
>
>Famous last words :-)
>
>> Do you really want me to readd the warn
>> statement? Maybe add some text, like
>> 
>> "worker->task is deprecated"?
>
>Is it deprecated? We still need that field for wakeup on queue at least.
>Don't bother with a message, it's only a sanity check.
>
>Thanks.

Hi, I hopped on the computer, 

Right, so the whole warn on things is good, but I converted all the
callers, so it'll never fire.

For OOT users, maybe this'll be beneficial (but yk what their like, theyll
remove the warn on)

Guys, what do you think?

>
>> 
>> --- Thanks!
>>
>https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
>
>

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
