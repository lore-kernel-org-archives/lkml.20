Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792858233;
	b=YsB+OTKOz2iBEknWXRVcouzGNkMZ21PxjAJ7S0cXcFXXjHsVgvOTseumEC47GmsG0k0g
	 PXpkwsTQwJyVyO+6byFsh1EoDeJRAgh8i3Z9xhk3C2jGWcvZcoe6YxUISAOvWE1GGSDQc
	 I1eOjvJ/MQE3X+LpCwYT9sNKSd1fj0MXEpZtrwmguLofhaSKsI4ATO88EtSsxLi2ayuZF
	 RXsLkPgoyBWL+mXDSuQEwelCTXfQ/Wm6jsAjCLu52f1CCjo4ll9vp9DFmwhtEQPD+QvBz
	 9gXqQmupAr3o53hpuI24qeEBjGJLVfAiTpIOtg649tvdo+hXp+u5QKfp2wzcqr0G+lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792858233;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=ufq3sDd1FSxfZgFeudS3ne2WlrQEClvC18GjxGikWDE=;
	b=qXjNhUkdEXjf9LMFRvRRM+g6RFleYBazEsjjIxT8SbZcVzVKO5FsE4hpoSzwGsFlXgiA
	 +y1tZwaaFvqMvGPTngoU5EAECa4AJE+sArFXK5bz6y3JtZyf6kTpz/1gZVhHLlECxTxc5
	 BXVaytBY2U3A0/CYmeZhuV492De/RrzT0pvDWitDAw5bc+ECP8H5WE8lF80ykg8ImDGMu
	 d3MGD+Ou5XGIDD+UrV+I+9eTbVZ0dbteCkcmc5uwr+GxcHYUhw7kKSSCQ1e1WjP4BSCFz
	 XzAUPaiovnrm0+V0HSSfVRZJ67fkJOuluFWVq9F0O3CozDCmGvCknYSNc8LOmQu0Juw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nO823rJK;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=nm9SQ0M5;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C74606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26C74606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nO823rJK;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=nm9SQ0M5
Date: Sat, 24 Oct 2026 18:10:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792858231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ufq3sDd1FSxfZgFeudS3ne2WlrQEClvC18GjxGikWDE=;
	b=nO823rJK/hrW8zpXfwD6pgjJdbnmsxKRgX5u/CezGNXmEUnmIFOOpaAB9aDJtqXLbUKwkS
	7PEYQh0RhZNerKDwSGRXG4Q0UKwpP0XylFGWgz5QUA6gTY1XZLzou2E2Bj7n6CS2zxIhwf
	kFmGoop9SGKlCE1Naw9uZe0M5XuA9wql/8oXGbFGELTQBxFeJsggxqVkvVUT9flKov3V/o
	n9QBtM3G9/X6wfdJ+HwXrp32f/yukm3y8qKT1dczlbjdsFyxVNTz2CXDN4tjRfBsbWDDQ4
	tge8gpl7QYnJd6Yy95+M+6u/6WvJNSfQEsqWzY42YEVvDRLUGl2at/ZqiSDokw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792858231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ufq3sDd1FSxfZgFeudS3ne2WlrQEClvC18GjxGikWDE=;
	b=nm9SQ0M5yfWirs7prXy5T3C+odi5UcRnCfcA3m7bvPsk8j6k+rcCZW9RjHPXC/DSn9JrnG
	aNu1HErekdLGRzCg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <kees@kernel.org>, Petr Mladek <pmladek@suse.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tycho Andersen <tycho@tycho.pizza>,
	Namhyung Kim <namhyung@kernel.org>
Subject: Re: [PATCH v5 2/2] kallsyms: Don't leak pointers for unresolved
 symbols
Message-ID: <20261024161029.a52VJ8Bg@linutronix.de>
References: <20261023-vsprintf_kallsym-v5-0-57ff92187c1d@linutronix.de>
 <20261023-vsprintf_kallsym-v5-2-57ff92187c1d@linutronix.de>
 <atyDTcu92iqtQ0h3@ashevche-desk.local>
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
In-Reply-To: <atyDTcu92iqtQ0h3@ashevche-desk.local>

On 2026-10-24 13:07:09 [+0300], Andy Shevchenko wrote:
> 
> > -		return sprintf(buffer, "0x%lx", address - symbol_offset);
> > +		return sprintf(buffer, "0x%p", address - symbol_offset);
> 
> Hmm... Do we need a 0x here? I believe it's embedded into %p output, no?

No, it does not. The %p does a fix digit size (different between 64 and
32 bit) without the 0x prefix.

Sebastian
