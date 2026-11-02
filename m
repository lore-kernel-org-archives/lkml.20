Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619524;
	b=ofopgGJiooOV0Q/t4llowa1KlKPMEDuq3GhCHL0aeLEH2AFbAAawvyG1+rXs/KzErRta
	 +2Mjn7wYvJSrVr7HpWw+7vTULjK88TO3WgypHsqHh10+fudKPCvIBbz6010hZ4A8HHg7t
	 8e/UoyZFqEo/R7t83lUpTws8KpsklHv2JJn8hu/H7UvpK+3MZjxvuQSJ7z5SoxlrSWcAd
	 O4N06DDvFnqBB/48O7U7qE9TUwDmT4BaTuxL/YSoh7oXamOaqwRx+DaP7fKlQ+Qhd8eJ6
	 PsTqDe6SXAA9N2F2lOAMXua9kmsvUj+nwExp4m0BP5R6ulVC6h/GMwMDK9yv7xKpvJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619524;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=HWGQoaD7P9s/RjbLOv//zidTL5KhcWgX4mwAfVdecpc=;
	b=wb+wx87tvn73nCqEdNMY3PkFHikcbxLM31Xrhl4vNuX0XJXSTrOj0n5Th4gb1bVU4Lky
	 WVs9TsLq/4bmgy45oi62dqsUR2yTBO6LiXrU8oQYg+Vm/6bpJB9cOoEN97Y+G3Jrv+/qa
	 Rv8IUeGS9t/ojyq5z2v+CsbhVIHX7vo6UWVS6ne00N9ePpZPRtwDt5iOc7+MrJxVZvwcF
	 wYwotq2NsWFtvp+8RK4ul06MNMbBPHmlWa1NZmdylrtXN5ju3JedUwQMfboCKgfKLz9gz
	 FXnVt2s66+PGXT5sSd+g+8lqwibVdgfaODOFYQ6mSlR9gTaRdyIWuh+KKUJSa6UXgtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bq8GBsD5;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Xogj3Z3O;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB11606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFB11606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bq8GBsD5;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Xogj3Z3O
Date: Mon, 2 Nov 2026 12:38:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793619521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HWGQoaD7P9s/RjbLOv//zidTL5KhcWgX4mwAfVdecpc=;
	b=bq8GBsD5vjrGLecfpl46vwFX8kQTZHA84Cn6nnxQRbIbqfC5/5ltSta3pubGBMg0yzGYmp
	vWkBVblzLdKwWyjeE+WZhLsuNqtN/BpXGAdMRmo+c5FMCJ5xz+VBMIpZ+sS/jsu31Q9cXm
	IClSZgVoJpEyPekGMNSB7CztdENa5+cz2syg/UhiyxWhbdtgYSZacokcKHuwXxjX4Dlj60
	tTrw8gaEUdKajjdDlhuaHVh6W8OOpQf9V/NomApCdc1YeCk4jAwOrToAdr0Zyv4yguPG0f
	BI8gBvvKjPZ7IeHn+vsT2xOgE9SFiXgcU60eSAxaRShUE2a643WUNcQdWMH1GQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793619521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HWGQoaD7P9s/RjbLOv//zidTL5KhcWgX4mwAfVdecpc=;
	b=Xogj3Z3OuSSmpCH2F607iT70zACv4k4VIovUDsLVsY/+6puTtE3e2i1vWamW4qYkLrKJdZ
	1Oh/wsUccL0s5vDg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Petr Mladek <pmladek@suse.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tycho Andersen <tycho@tycho.pizza>,
	Namhyung Kim <namhyung@kernel.org>
Subject: Re: [PATCH v5 2/2] kallsyms: Don't leak pointers for unresolved
 symbols
Message-ID: <20261102113840.5NM0MeG9@linutronix.de>
References: <20261023-vsprintf_kallsym-v5-0-57ff92187c1d@linutronix.de>
 <20261023-vsprintf_kallsym-v5-2-57ff92187c1d@linutronix.de>
 <auDKjGxSieq6WAmW@pathway.suse.cz>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <auDKjGxSieq6WAmW@pathway.suse.cz>

On 2026-10-27 17:00:12 [+0100], Petr Mladek wrote:
> Both Sashiko and the intel test robot reports that this triggers:
> 
>    kernel/kallsyms.c: In function '__sprint_symbol':
> >> kernel/kallsyms.c:486:44: warning: format '%p' expects argument of type 'void *', but argument 3 has type 'long unsigned int' [-Wformat=]
>      486 |                 return sprintf(buffer, "0x%p", address - symbol_offset);
>          |                                           ~^   ~~~~~~~~~~~~~~~~~~~~~~~
>          |                                            |           |
>          |                                            void *      long unsigned int
>          |                                           %ld
> 
> So, it should be:
> 
> 		return sprintf(buffer, "0x%p", (void *)(address - symbol_offset));

yes. I do see it locally after double checking. Not sure how I missed
it.

> >  	offset -= symbol_offset;
> 
> Otherwise, it looks good to me. So, with the added cast:
> 
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> 
> There is no need to send v6. I could fix this when pushing.
> I am going to wait few more days for potential feedback.
> I will queue it for 7.5 unless anyone complains in the meantime.

Okay, thank you.

> Best Regards,
> Petr

Sebastian
