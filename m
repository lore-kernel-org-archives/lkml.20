Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826DA39099C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407030; cv=none; b=O7aSVep2+kYJ/C4BWa6ksWdvQf554QvQF7XMNirUaZ6hM3I2TmKuAIKFeOXLfZEAOuK0zLONqmjkcM3+npI8ANJ8DTZibzXnLL06P9M/WxVgVobAMstcNX8ALeMUKiCketiWpGIgVIf/qByyafkB43aLB89KLME114TEP/apqMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407030; c=relaxed/simple;
	bh=YsTsTeFoeCwo8+srhCtcZ87XVyWzNPPwlmnTwnGEAys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l3DGPW6gYx02pPEulNwyd4wqPRHuNE9FFxS7/XqtIOaxSxV91OzisHj8g3j76cA5/FpwnU+DPUYuppxu9PwXSQgmRx5gOmDX3HZzITAvZaEx54ZzStRzI6SV9oAxI/jwrqp8GTywX9aWzdtfl4VEfEGzrisHw5PtrQgauHfBlCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=z3oAwF8G; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fQRGicHE; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="z3oAwF8G";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fQRGicHE"
Date: Mon, 19 Oct 2026 12:50:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792407027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8+PVV7/whYFtSqBfdnBXs5v28cnxb5MGWJ4ygFMh/Vk=;
	b=z3oAwF8Gw/So+wJ4h+oNhEQajyp20cgmJgixg8yZ2dn4cHAya2icsktlCkQZbHrWo4CTWW
	lw7e4XHQgLfXUDEGpgXOgnYtoXonQLIl7r3acysF/JvUmla36Qgl/hYq1MmFsneveqDlSi
	Ou0e+0v2psClUs6YpJJpojIqmaZPtNn6NIvNlbSuDDpdwZGN2ahVFI2EuVUcg0JuXwT2+9
	YFm2EZxuYYoHNh9eYmvZUcVVrKKK3zxlc3wd8FIwXvURpQ7M2ZAu2bsDJ0VGB9yG8FV0vX
	iVILImmjmlPfhK30FCSU15/y3yk0yQTgIpXJHjeIJXwLPojfCsIP0b9KhG/IFg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792407027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8+PVV7/whYFtSqBfdnBXs5v28cnxb5MGWJ4ygFMh/Vk=;
	b=fQRGicHEkvAg+7+Ij1daejndb+uN0q7M2CzbpnHlEoTbkWy9xe/8mEAYp7yPRWL4W+j2sx
	4ywkelVvFt9b9FDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <kees@kernel.org>, Petr Mladek <pmladek@suse.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tycho Andersen <tycho@tycho.pizza>,
	Namhyung Kim <namhyung@kernel.org>
Subject: Re: [PATCH v4 2/2] kallsyms: Don't leak pointers for unresolved
 symbols
Message-ID: <20261019105025.igQtXzuZ@linutronix.de>
References: <20261019-vsprintf_kallsym-v4-0-ffd3c012d00c@linutronix.de>
 <20261019-vsprintf_kallsym-v4-2-ffd3c012d00c@linutronix.de>
 <atXyO26fEVPx2qDP@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <atXyO26fEVPx2qDP@ashevche-desk.local>

On 2026-10-19 13:34:35 [+0300], Andy Shevchenko wrote:
> > +int snprintf_default_pointer(char *buf, unsigned int len, const void *ptr)
> > +{
> > +	struct printf_spec spec = {
> > +		.base = 10,
> > +		.precision = -1,
> > +		.field_width = -1,
> > +	};
> 
> Isn't it the same as default_dec_spec?

Except for .field_width, yes.

> > +	unsigned int w;
> > +	char *endp;
> > +
> > +	endp = default_pointer(buf, buf + len, ptr, spec);
> > +	w = min_t(unsigned int, len - 1, endp - buf);
> 
> May we avoid min_t()?

min() complains about signedness (len unsigned and ptr diff signed).
endp is >= buf so it will be unsigned.
An alternative would be manual comparison if the buffer size has been
exceeded or not and act upon it but this looks simpler.

> > +	buf[w] = '\0';
> > +	return endp - buf;
> > +}

Sebastian
