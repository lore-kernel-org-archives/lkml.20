Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABB1350A18
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 23:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788650135; cv=none; b=sSZU1Tyx923NouMh8fAwwS/JwO5g35UKtcOupIWeSJkQB10sBhpsZGAtzKjvkuPcOee0d8JMkTUBrzYJCcd4IdGU4gCTTvnSr0v1dnp1U2itrZjI+dJIXUKLQmpJrdgPo3k2N1z57AglAdrrImd9XPUxQYulc8IKh9Z8RZp7OHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788650135; c=relaxed/simple;
	bh=ZiTz7Qa/G6sR1D2oS6VJicw2PYN3htCTPywCV9DsBu4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BDm4LXearrk5mwe/MKO3nuFVBdkjaSI+A/zRPaH6iqkGYfR6kF7VP/WtIEPTjALIfujdOOqGxAsULBUZQsvMKbMaLBC0I8/GAPuHTX54Rm7ZcJfvg6/NUzKO2aUXloNAbGjMZtQI70rixkvbrSzz29iW79iC5rXmzp+JAJh+Kwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=C881xpbS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pbTi2MVf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="C881xpbS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pbTi2MVf"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788650129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SiDXFGa23Fp54xARcEvJJTEcjmmDUs3g5SjxYCl8aw4=;
	b=C881xpbSKqnTxNmsY5wUhADTe8+MD2MohoNicU+Evq27egUKu50oofR1XBsdEJej9q49t/
	n5hqQVxE8spAkH6/QehX6RvuUus4W/3HqKuu2PglyF0JJNp47H9GTBD4C3RQaqInSk5Svz
	4HEfyMzZv4b6Ls/3aQ2A2KHiZR6iS8Mr2OobjyePTwcts5rM9DOa1aJTXcPtAZyrEnL6Xa
	Fyi4tBlwGyXfnKrv1uwvZ5axH30D7oqBVlxkhWB5eqUu47DHkB8XbEuCfEpDNC0C4/ELgW
	7YZhAJ3SS9p2yV6mwYkawwzzZmz2QTBupgPU+LWMiCewmsB4/CAp1s7qp/MCQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788650129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SiDXFGa23Fp54xARcEvJJTEcjmmDUs3g5SjxYCl8aw4=;
	b=pbTi2MVf8WseP/9QXCOFAvdNeBJFPtqdnyQTnoLMFUXi0nVjhdz2NW0ta5XmJWpZEM20eZ
	BeGgKPGaHcvxtTCg==
To: Bradley Morgan <brads@mainlining.org>, liushugao@xiaomi.com
Cc: frederic@kernel.org, isaacmanjarres@google.com, lingyue@xiaomi.com,
 linux-kernel@vger.kernel.org, weipengliang@xiaomi.com,
 wengjinfei@xiaomi.com, xiongliang@xiaomi.com, zhangjiawei8@xiaomi.com,
 zhukaiqian@xiaomi.com, Daniel Lezcano <daniel.lezcano@kernel.org>
Subject: Re: =?utf-8?B?5Zue5aSNOg==?= [External Mail][PATCH] tick/broadcast:
 Plug clockevents
 replacement race
In-Reply-To: <347CE2FE-3675-44AA-80D4-1CF8632C8C9D@mainlining.org>
References: <20361A3E-0D14-4CC5-946E-D75244CB4A45@mainlining.org>
 <87h5k34cob.ffs@fw13>
 <4FDB69E5-7DEE-43CE-A66A-23A2D8DC987C@mainlining.org>
 <87bjab4avu.ffs@fw13>
 <347CE2FE-3675-44AA-80D4-1CF8632C8C9D@mainlining.org>
Date: Sun, 06 Sep 2026 01:15:28 +0200
Message-ID: <8733vn47e7.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Sep 05 2026 at 23:06, Bradley Morgan wrote:
> On 5 September 2026 23:00:05 BST, Thomas Gleixner <tglx@linutronix.de>
> wrote:
>>On Sat, Sep 05 2026 at 22:24, Bradley Morgan wrote:
>>> On 5 September 2026 22:21:24 BST, Thomas Gleixner <tglx@linutronix.de>
>>wrote:
>>>>On Thu, Sep 03 2026 at 16:12, Bradley Morgan wrote:
>>>>> Hi, I have a pixel 7, if I could be asked to backport this, then I'll
>>be
>>>>> happy to, for the fix, add:
>>>>>
>>>>> Reviewed-by: Bradley Morgan <brads@mainlining.org>
>>>>
>>>>It would be helpful to respond to the actual patch and not to some
>>>>arbitrary reply. That way you might avoid your tags to be overseen by
>>>>tools.
>>>>
>>> Sorry my mail client sometimes glitches,
>>
>>I fail to see how your mail client is responsible for you to hit reply
>>on the wrong mail.
>>
>>But what do I know about all these new fangled mail clients who decide
>>on their own what to do. When this happens to me I'm 100% confident that
>>_I_ got it wrong and not my mail client. Maybe I'm just too old-school.
>>
> Remove Daniel too. Bounces.

Sorry no. That's not how this works

 #1 An OOO response is purely informational and does not justify to
    remove the recipient from the CC list just because

 #2 A bouncing email address is of course a valid reason to remove
    someone from CC, but it is a matter of courtesy in the context of
    the Linux kernel lists to lookup whether the person vansished from
    the planet or just changed the mail address. That's what the
    MAINTAINERS file is for.

    The thread you responded to was from TWO years ago...

Aside of that you did not respond to my actual complaint about
responding to a random reply instead of responding to the actual patch.

If you fail to review what the AI agent of your choice hallucinates
then so be it, but don't be surprised that I'm going to put you on my
ignore list as a consequence and recommend to all other maintainers to
do so as well.

   Thomas



