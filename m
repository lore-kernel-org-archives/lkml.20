Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7459C30ACEE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788271504; cv=none; b=ezlI3DXMH5NNC5cWgJcrRxsZo+E5LhvQGH6zyBZw0OcidB+/uxQ0nb9uno8vmUuSoTiui0J+haLs4XdExuOrvLn0c/iVNlOV5Ous+aQW9GenAHYff/syWPSa99B03eKsR/Sug+6SFW7bVtEYRc0LThYXz3Yhvt7x71JXxJeKmM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788271504; c=relaxed/simple;
	bh=jD/ONZSLbowzx+LFj72q8JEr7jRabvB3cvCBqEm2vjI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=RXoEzw9mw/fKFnbHB0KFa27YLEEPhA1AQsVkRF9B9lH+2Xuq40hvO6f6eskoHmruN7rV5LuMsP2OMuJKIibMLNmZ84aIH/UQK2fu/XON3gAQk3Iqqoa/lSlo4+OzHxFIHbdhUBbYJ5wnCtnEG3sQ/+oLeIxZg2zEq02CpMFofx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=AiUAjx+z; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=+wHjthqc; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="AiUAjx+z";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="+wHjthqc"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788271500; bh=kLwaOrUYpubngcN634rgund
	QPeMLyBPxxJ91I6qecNo=; b=AiUAjx+znlpKTVDN2DDRo78UvCli/sJtmKqLmBB/XPpBpEa8/a
	Z38kQnpxSv52ZeBFOVZhw8oyU69R+mQp6VNWrmsmqWWq+0v83IG2tdz3gQypCOz1S2OwTxbK0Hd
	n55XimSGMWJi8VpjcfuVG+y2xqb6zu6MxJpnhAmA81paJmvY35u+uLxEaSXbmDRJ5vgSPnvML3F
	kXn3iV4Wad4nZSmJQlP1jwB2VciSqlP0YVJfv4M57Lb1dqBA//ivEDhstCTOt8na6O8aeyLZk3E
	8U1Ud1D/CRrZBABLjylVoJX0qTUIC5XjRlrlH8jnfoyEQ7Y1VyOwY1+pJqMYB6zm0Pw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788271500; bh=kLwaOrUYpubngcN634rgund
	QPeMLyBPxxJ91I6qecNo=; b=+wHjthqcpWl0R25on1GctES7sTY+NCl7edSlC50FXCikxSfpgk
	Og9tczFzPSbf+u1QLGuseijV1PajcyCsvSCw==;
Date: Tue, 01 Sep 2026 15:04:59 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Peter Zijlstra <peterz@infradead.org>,
 Frederic Weisbecker <frederic@kernel.org>
CC: Bradley Morgan <include@grrlz.net>, Tejun Heo <tj@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kthread: remove worker->task self-assignment
In-Reply-To: <CE1F7435-D872-4A3F-BC7A-50443BBE2904@mainlining.org>
References: <20260829161150.16301-1-include@grrlz.net> <20260829161848.20635-1-include@grrlz.net> <apbI91PzT2BaRazM@localhost.localdomain> <20260901124900.GB687043@noisy.programming.kicks-ass.net> <CE1F7435-D872-4A3F-BC7A-50443BBE2904@mainlining.org>
Message-ID: <291AB69E-EF15-4204-AEF2-EFB6C79BFBE9@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 1 September 2026 14:57:38 BST, Bradley Morgan <brads@mainlining.org>
wrote:
>On 1 September 2026 13:49:00 BST, Peter Zijlstra <peterz@infradead.org>
>wrote:
>>On Tue, Sep 01, 2026 at 02:45:43PM +0200, Frederic Weisbecker wrote:
>>> Hi,
>>> 
>>> Le Sat, Aug 29, 2026 at 04:18:48PM +0000, Bradley Morgan a écrit :
>>> > From: Bradley Morgan <brads@mainlining.org>
>>> > 
>>> > All kthread worker users now create their workers with
>>> > kthread_create_worker*(), which sets worker->task before the worker
>>> > starts. The self-assignment in kthread_worker_fn() is dead code now.
>>> 
>>> How could it be created before?
>>> 
>>> > 
>>> > Remove it.
>>> > 
>>> > Signed-off-by: Bradley Morgan <brads@mainlining.org>
>>> > ---
>>> >  kernel/kthread.c | 7 -------
>>> >  1 file changed, 7 deletions(-)
>>> > 
>>> > diff --git a/kernel/kthread.c b/kernel/kthread.c
>>> > index 63beb59b7a3d..18bc702e8d2d 100644
>>> > --- a/kernel/kthread.c
>>> > +++ b/kernel/kthread.c
>>> > @@ -987,13 +987,6 @@ int kthread_worker_fn(void *worker_ptr)
>>> >  	struct kthread_worker *worker = worker_ptr;
>>> >  	struct kthread_work *work;
>>> >  
>>> > -	/*
>>> > -	 * FIXME: Update the check and remove the assignment when all kthread
>>> > -	 * worker users are created using kthread_create_worker*() functions.
>>> > -	 */
>>> > -	WARN_ON(worker->task && worker->task != current);
>>> 
>>> Should we keep a WARN_ON(worker->task != current) here?
>>
>>I vote yes! Paranoia is good :-)
>>
>
>
>Yeah, but it *should* be useless. Do you really want me to readd the warn
>statement? Maybe add some text, like
>
>"worker->task is deprecated"?

Btw this is a "something around the lines of", so it's definitely not
gonna be this! (Its sorta wrong too)

>
>--- Thanks!
>https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
