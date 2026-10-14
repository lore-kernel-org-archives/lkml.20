Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19ACC4CEE43;
	Wed, 14 Oct 2026 09:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969777; cv=none; b=ezQWZzMYmpRzF/djrVxk/QYZ4u26wofCoRURFaL2+PPQEfg1moc59BUzK7/dI+D3kGnmbikjv5JHg7yPnxawXRLtegZ2iCywvpPz01rq/mK12/hec/SbttlKK0OCK6YSrb9gyf4tD4jcJSp6VzZmyBamXhuyzRMVHI5hc3/qbIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969777; c=relaxed/simple;
	bh=9rhzvPAKI4TkJ08V5C6tMZZ55owFqF76gN6DXwZXbco=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OQSo2YjHFq493C7LwldrSkB+R16eNemuU5IhN88+bJtQR59mPq4uXhIqu5p1ApT5Eu2He3x2SHFYTGtfJE3J9SWx/H6ZXrA8mDedxL+w8nlHkvhN6k6zVwK5hZzl7Wy2HMSa5cUYYPMSPlxfoDCO6s62WOc5f1Z7cWBBYYbVXvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qW2gBKw9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RTXns+4N; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qW2gBKw9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RTXns+4N"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791969768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9rhzvPAKI4TkJ08V5C6tMZZ55owFqF76gN6DXwZXbco=;
	b=qW2gBKw9Z+mZuRY4mAkSJbdvMR7bPjYjphWEDPbxxDLEG/kfI/YdeVoy5sdismi/lBRzkk
	U1zncISua4QmlrXn1nFBtu56bznpBzivgce33p0l6GkteYjuhr5ilAeWUogVMaw0olW61E
	exQ57TWY64c6P1UKVRK1CgIeRnEY2F5LkBTS8Q87Jwbia1tlCx+JV8OfnrGH0qtAJjJycG
	ASTIUC/66dqGmv7x5sDUOuVoIdiibJWjPNU4H1hbgN74/+o6mIX++acyTBOsAGkALJeapF
	3vF+4NbNyubVLk8urWTXO44Hbuh5OD1oz/lUQhxvGq4+wlFjOROX4WZM8mC2gQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791969768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9rhzvPAKI4TkJ08V5C6tMZZ55owFqF76gN6DXwZXbco=;
	b=RTXns+4NcJ6+M07jiNtJqfhHYwl5j9PHCul6gwtkDddBNDfCzIbL5GWlTizbxcRCxSnoa3
	Zws8SmeKrkjprHAQ==
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, David Gow <david@davidgow.net>, Brendan
 Higgins <brendan.higgins@linux.dev>, Kees Cook <kees@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, David Laight
 <david.laight.linux@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>, Andrew
 Morton <akpm@linux-foundation.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] hexdump: Allow skipping identical lines
In-Reply-To: <as6TIm6xE8Izccb5@black.igk.intel.com>
References: <20250319-perso-hexdump-v3-0-a6ba3a9f3742@bootlin.com>
 <as6TIm6xE8Izccb5@black.igk.intel.com>
Date: Wed, 14 Oct 2026 11:28:47 +0206
Message-ID: <87fqy8y6u0.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2026-10-13, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> Sorry for the so late response. First of all, a bit of a background
> development on my side. At some point a few months ago I asked John
> Ogness to give me a private dive to the printk() guts. He explained
> to me a lot about ow printk() circular buffer works and that the
> implementation is nowadays done in the terms of circular buffer library
> and printk() front-end. This gives a potential to get a clean solution
> for the testing how printk() actually behaves. The main issue with the
> real printk() is that the buffer it's using is defined globally and
> for clean test cases the printk() can't be used. We discussed the way
> of high-jacking that by linking an object file of printk() implementation
> to the KUnit test, but it seems quite a tricky if ever achievable exercise.
>
> Meanwhile Kees Cook seems found a nice workaround for the similar use case
> in his recent patch series [1]. The idea is to register custom console and
> provide a custom .write() method which is the heart of the solution. On
> the writer side user prints something which has unique prefix, while the
> console callback recognises that pattern and checks the rest of the line.

The "sbufcap console" is using the legacy console interface. This is
probably good enough for now. However, we are currently working on
adding a "sync" feature to NBCON consoles. This feature would allow a
console to declare itself in "sync mode" and _every_ printk() call would
immediately and synchronously call into a ->write_atomic() console
callback. I think that feature would provide the level of printk
capturing that you want.

It also has the benefit of being useful outside of the KUnit testing
scope. (For example, pstore has also requested something similar.)

Until sync mode is ready, feel free to continue to use the less reliable
but probably good enough legacy console interface.

John Ogness

> [1]: https://lore.kernel.org/r/20261005155653.late.426-kees@kernel.org
