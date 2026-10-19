Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0544E73B4
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412076; cv=none; b=iaI0MICEWipn/w3j4etxsKyi5g37k0ljyWulGzXMVkG+TMpMEQ4qIPat05Y/r/pnVIPLNi/JHWDL4KP+bi+MV8qfKDbZUL9bHwhOFtjKiYB418gLvSbmJYcyFntPtGnmAKw/t0y8gKqIrAXAJSOmN5gabOoQ9Hfk/p0KWBLk8RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412076; c=relaxed/simple;
	bh=3dfOERGYJvWRqzMemmEHyGaDXFSamk8J/3vp1Ec2y44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ncS07ynVcyIvwLBn2fWESE4TEqXxQsZ2ioP4H3H0a1iRwtLV9O6MPxMAHK2UHYK31B5gYHKUa/UDOTBuPp8jNH2hS3pOkqVTS9oweR0i+ItsGhxw0kfmI2sh3ebBA9oMs/Lp+xabGffQ1qUfkWFWBDLGM5yDtPahvFmKWL9v81w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ybWxPwld; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pwstxUIa; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ybWxPwld";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pwstxUIa"
Date: Mon, 19 Oct 2026 14:14:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792412072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sZXSlnzWa8HAfmGNxZoTYyLM6ViEtWa72yt+CJXKbao=;
	b=ybWxPwldImO6MVytv+RbCa0r7d4rICC1YVuMPCIzjxOSRwgUFOZ+Tn/mPfkaqppPXF0YXb
	MroGvbpWMhikGYQwPQOGtO6G/EiSFgYsgBMGHYpBklFAYn5rgqlEdlLzm4UPENrBA8bTxc
	zoBr1HSvfs1ReryDR6Fu7ORd0f4wreDlagCS6OW0Q3eqp2FCwiC9RD4lA6AZOe3IdOKz6x
	3CbrnEQ+aRKuY2kOi1Cd2cTCINkanApdzoq3qevYj/KB9/54nfWeM0tW3gZkE79H/gWpc+
	McY4uFj86cd1nuDEoKkENU94xxUf9CW9CmJrhH4isrTWzwUYv5dA60UTeHFtVw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792412072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sZXSlnzWa8HAfmGNxZoTYyLM6ViEtWa72yt+CJXKbao=;
	b=pwstxUIaxnJNCjMTikD0UMVKe1eqs89wcQUWdlZQXrsUNBchY84EDiD6N91aeP3MN2wQq4
	YRRAzP/OWFUJUgBw==
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
Message-ID: <20261019121431.nrxar7EO@linutronix.de>
References: <20261019-vsprintf_kallsym-v4-0-ffd3c012d00c@linutronix.de>
 <20261019-vsprintf_kallsym-v4-2-ffd3c012d00c@linutronix.de>
 <atXyO26fEVPx2qDP@ashevche-desk.local>
 <20261019105025.igQtXzuZ@linutronix.de>
 <atX5kxXueI5tjoYa@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <atX5kxXueI5tjoYa@ashevche-desk.local>

On 2026-10-19 14:05:55 [+0300], Andy Shevchenko wrote:
> On Mon, Oct 19, 2026 at 12:50:25PM +0200, Sebastian Andrzej Siewior wrote:
> > On 2026-10-19 13:34:35 [+0300], Andy Shevchenko wrote:
> > > > +int snprintf_default_pointer(char *buf, unsigned int len, const void *ptr)
> > > > +{
> > > > +	struct printf_spec spec = {
> > > > +		.base = 10,
> > > > +		.precision = -1,
> > > > +		.field_width = -1,
> > > > +	};
> > > 
> > > Isn't it the same as default_dec_spec?
> 
> > Except for .field_width, yes.
> 
> You can update it there. I think in all other cases (I briefly checked, but
> haven't run any smoke test with KUnit) it should be an equivalent.

Okay. So lets give it a try.

> > > > +	unsigned int w;
> > > > +	char *endp;
> > > > +
> > > > +	endp = default_pointer(buf, buf + len, ptr, spec);
> > > > +	w = min_t(unsigned int, len - 1, endp - buf);
> 
> This also won't properly work for len = 0, I assume? So one can't make
> something like kasprintf() on top of this.
> 
> > > May we avoid min_t()?
> > 
> > min() complains about signedness (len unsigned and ptr diff signed).
> > endp is >= buf so it will be unsigned.
> > An alternative would be manual comparison if the buffer size has been
> > exceeded or not and act upon it but this looks simpler.
> 
> It looks simpler, it looks wrong :-)

Could we then exclude len == 0 and keep the remaining bits as-is?

> > > > +	buf[w] = '\0';
> > > > +	return endp - buf;
> > > > +}

Sebastian
