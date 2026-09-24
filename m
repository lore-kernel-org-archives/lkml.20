Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4A64A0EF3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263350; cv=none; b=Y0y39f9OLMtnN4WgDgsU4hCZR/mdN+k/YI293fldSunZnTZYETFGdGHbhlua9OzngnIS305wPy2pqpOq26iIJwW2lyqCPRo300PrphYWYB8sdTW+L9OAj+AcecM3DA4wIlhPEYsbXCsGCidTCOP3WiHYYvBlYUcZcU9cRIP9nRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263350; c=relaxed/simple;
	bh=gy0Cq5Nf4xhfo88W93+N+0w9AXoEE74EW7msY3z9pu8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XsNYPH/g16oLE3avh2UYRJhqUNZqzw15j7VvwqVz+RnAErlwe9fSgSs3A5zjFFsGt4B9TeZKeCHpziSAtQ8h7/A+jgbhOXZzKKM65q4nfyDihSEmg4ujGqQxg4sm089tfUmRurXz1F5kxGvS1WZZUXq+JqCSmkqgdq2SAh4H9yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GiF1JGTz; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MjwpfEBG; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GiF1JGTz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MjwpfEBG"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790263342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r8Ay6B3pde2Qw6QSifBjiU1xjG3RDjgIXb53bOdgio4=;
	b=GiF1JGTz/SMBdQ87nHczSVRBAIneNax77+XsLOc5dmXOTzAUkZ0W5S2WqZkWQJs7cwsb3i
	gsVIjXALwfnJNOK5HV8ZzDbhDEqHb6WCRJmee5NlYqQR5oUEuPzkfkhPJ8FmTYmmx4mIEw
	2EKLSLMJawWChn01Fq6RWK5o0BAyKY4xx3c4+bZGAQbuYFt9fU6T2LXn+22T6QlOF30eJ2
	jS5lV35GfKDHo+WzZw70t6Isfm1g2kLIrBXWJUzDw7IOrKXAAq2FayfNoz7uX1DrTe3a3K
	4HKHY1SocnhHcn+PEx2GtZLCm98PCJsjb5+xKGq7aU1q2uufWFmF+tf9LD6KaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790263342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r8Ay6B3pde2Qw6QSifBjiU1xjG3RDjgIXb53bOdgio4=;
	b=MjwpfEBGjKmKN1FYbgmp17F0NO4QQCs28lE2iB8bcJ1pAJvc8eC0xxGLX0B1Ey25KrvfJl
	BqNjPCp84/ul5kCQ==
To: Tzung-Bi Shih <tzungbi@kernel.org>, Petr Mladek <pmladek@suse.com>
Cc: Kees Cook <kees@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Tony Luck <tony.luck@intel.com>, "Guilherme
 G. Piccoli" <gpiccoli@igalia.com>, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, tfiga@chromium.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] printk: Introduce loglevel bypass for pstore console
In-Reply-To: <aqj426Zjg8pw1I97@google.com>
References: <20260831070346.3490745-1-tzungbi@kernel.org>
 <aqEmwXTLaTyUhhYG@pathway.suse.cz> <aqj426Zjg8pw1I97@google.com>
Date: Thu, 24 Sep 2026 17:28:21 +0206
Message-ID: <87cxu2u11u.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2026-09-15, Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>>> Currently, offline consoles (e.g., pstore_console backed by ramoops)
>>> inherit the system's global console_loglevel.
>>> 
>>> In production environments, physical serial consoles (UARTs) are often
>>> heavily rate-limited to prevent verbose messages from causing severe
>>> execution bottlenecks.  Unfortunately, this identically silences the
>>> pstore console.  When a kernel panic or lockup occurs, engineers are
>>> left inspecting a crash dump that has been stripped of the verbose logs
>>> that could have identified the root cause.
>>> 
>>> This series introduces CON_BYPASS_LOGLEVEL, a simple flag that allows
>>> specialized offline consoles to request unsuppressed logs directly.
>>> 
>>> Patch 1 introduces the CON_BYPASS_LOGLEVEL flag.
>>> Patch 2 adopts the flag in pstore_console.
>> 
>> I believe that a better solution for this problem would be adding
>> the per-console loglevel feature, see
>> https://lore.kernel.org/all/cover.1764272407.git.chris@chrisdown.name/
>> 
>> It is currently blocked by a cleanup of the console registration code,
>> see https://lore.kernel.org/all/20260604101459.393162-1-pmladek@suse.com/
>> 
>> I am going to send v5 of the console registration code cleanup soon,
>> hopefully later this week or the following week. It would be nice
>> when it gets some more review.
>
> Thanks for the context.  I completely agree that the per-console
> loglevel is the proper long-term solution, and I understand that console
> registration cleanup and the larger printk reworks are massive and
> complex efforts.
>
> Because those foundational changes naturally take time, I was wondering
> if we could consider my approach as a narrow and localized exception
> just for offline consoles like pstore.
>
> Given that we already use LOG_FORCE_CON to bypass loglevels on a
> per-message basis, introducing a symmetric per-console flag like
> CON_BYPASS_LOGLEVEL might be an acceptable short-term solution.
>
> Would you be open to a localized flag like this in the interim, or do
> you strongly prefer to hold off until the full per-console loglevel
> architecture lands?

I agree with Petr that we need to go with per-console loglevels here.
However, we really need to prioritize our efforts to get that
per-console loglevel series mainline (which means getting the cleanup
series mainline first).

@Petr: Maybe we can find some time in Prag to sit down together and go
through the rather large queue of various printk series that are waiting
to be reviewed.

John
