Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EECC47124E;
	Thu, 15 Oct 2026 08:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053821; cv=none; b=NmiEY4i6Wts5eVEd9FwFpLlAIg7d2LGmDaYGOOvB+Oi/BHqv7wvc6oREwW/mOksTb/rl8FoEzXi5L+YvvxgGGY3AIGjCzLWuGjSc1pVYtVXWMDtDRNSc1TpoIrXAmvaEPtq32dcYJtzlB3nFJXK1enGmydLt8cjQR8P34VBbHUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053821; c=relaxed/simple;
	bh=YgKvxDdIrE/DwgcgGoG6EMBpTFfiJDYREx6kNkv4f6E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eH/ysGdaEQIExgN85Sr/snmIcE4J4uItcOj3D6L1dGjEan7HgplmC47k9t5UxLJGrHRrxpyFBt6L/asO0QUH+i7FHl7oMh5+IV43pIwOCr+f3nYY1k63XJ75o5btefjM5mimlV+Daw/P/viilHY1zve3knRr5mkoujGePbwyzZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HZ/8OCjH; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HZ/8OCjH"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 60B524E41247;
	Thu, 15 Oct 2026 08:43:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A74B60360;
	Thu, 15 Oct 2026 08:43:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 068A510328814;
	Thu, 15 Oct 2026 10:43:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792053814; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1M02JcwXO7QeeqbCBZB0mq8pldIjh44mpDvB43Gt0H0=;
	b=HZ/8OCjHNOuTtBwoxUX3dp7AneRXaGHw4uNWKS5gWKctVbkvaJvQ7MheTfr+OqD5snRX0F
	sidtcGOx/HLBEgnuucz6mvvhXBAHysEn4qkb7RbnQWj2uVCkbemcNkJQ/5t+4Ar2OzjT/I
	IKmXkkDfbhmY7+9/gQcLnKVojrh2SbvzKQjYixOeDalG08NwMfRHZZnN1Vqp3laUbBnl06
	7+nAxnbu4zQAAX0nmcWmvCEE27Qi1I+iiL1MvxbucZQRXHfjag/oQ6oY+c+eoYnoEVSkE4
	GkUvNJZJTq7yPSfX8cfpZg854Bnxd0fIA3AQA5srh2uogILJz1JpzRVou25Jbg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kees Cook <kees@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>,  Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>,  David Gow <david@davidgow.net>,
  Brendan Higgins <brendan.higgins@linux.dev>,  David Laight
 <david.laight.linux@gmail.com>,  Steven Rostedt <rostedt@goodmis.org>,
  Rasmus Villemoes <linux@rasmusvillemoes.dk>,  Sergey Senozhatsky
 <senozhatsky@chromium.org>,  Jonathan Corbet <corbet@lwn.net>,  John
 Ogness <john.ogness@linutronix.de>,  Andrew Morton
 <akpm@linux-foundation.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] hexdump: Allow skipping identical lines
In-Reply-To: <202610142135.0326EA9C@keescook> (Kees Cook's message of "Wed, 14
	Oct 2026 21:38:37 -0700")
References: <20250319-perso-hexdump-v3-0-a6ba3a9f3742@bootlin.com>
	<as6TIm6xE8Izccb5@black.igk.intel.com>
	<as-iBP1781DVuZ7p@pathway.suse.cz> <202610142135.0326EA9C@keescook>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 15 Oct 2026 10:43:26 +0200
Message-ID: <87se27wdzl.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 14/10/2026 at 21:38:37 -07, Kees Cook <kees@kernel.org> wrote:

> On Wed, Oct 14, 2026 at 05:38:44PM +0200, Petr Mladek wrote:
>> On Tue 2026-10-13 22:22:58, Andy Shevchenko wrote:
>> > +Cc: KUnit maintainers + Kees
>> >=20
>> > On Wed, Mar 19, 2025 at 05:08:09PM +0100, Miquel Raynal wrote:
>> > > While working on NAND issues, I used print_hex_dump() a lot to compa=
re
>> > > data. But I am mostly working on embedded systems where the kernel
>> > > messages go through a serial console. Sometimes network support is an
>> > > option, sometimes not. Anyway, I often print buffers both in kernel
>> > > space and user space to compare them, and they may be full of 0's or
>> > > 1's, which means lines are repeated a lot in the output and this is =
slow
>> > > *and* hard to compare.
>> > >=20
>> > > I initially hacked into lib/hexdump.c for my own purpose and just
>> > > discarded all the other users, but it felt like this might be a usef=
ul
>> > > feature for others and decided to make it a public patch.
>> > >=20
>> > > * First patch creates a helper named print_hex() with a prototype
>> > >   containing a flags parameter, instead of an entry for the prefix t=
ype
>> > >   and another entry for the ascii boolean. print_hex_dump() now
>> > >   falls back to print_hex().
>> > > * Second patch adds a new flag to possibly skip the identical lines.
>> > > * Third patch is optional, and adds the offset at which the dump
>> > >   finishes in case the last line to be printed would be skipped.
>> > >=20
>> > > The Cc-list, as provided by get_maintainers.pl, was returning 330
>> > > e-mail addresses which felt to much, so I ran the script only on the
>> > > second patch (the printk/includes/debug/Doc changes). It gave this
>> > > Cc-list which sounds more reasonable. Hopefully this is a smart move,
>> > > otherwise let me know what you think would be best.
>> >=20
>> > Sorry for the so late response. First of all, a bit of a background
>> > development on my side. At some point a few months ago I asked John
>> > Ogness to give me a private dive to the printk() guts. He explained
>> > to me a lot about ow printk() circular buffer works and that the
>> > implementation is nowadays done in the terms of circular buffer library
>> > and printk() front-end. This gives a potential to get a clean solution
>> > for the testing how printk() actually behaves.
>>=20
>> I am curious what printk() features you would like to test.
>>=20
>> > The main issue with the
>> > real printk() is that the buffer it's using is defined globally and
>> > for clean test cases the printk() can't be used. We discussed the way
>> > of high-jacking that by linking an object file of printk() implementat=
ion
>> > to the KUnit test, but it seems quite a tricky if ever achievable exer=
cise.
>> >=20
>> > Meanwhile Kees Cook seems found a nice workaround for the similar use =
case
>> > in his recent patch series [1]. The idea is to register custom console=
 and
>> > provide a custom .write() method which is the heart of the solution. On
>> > the writer side user prints something which has unique prefix, while t=
he
>> > console callback recognises that pattern and checks the rest of the li=
ne.
>>=20
>> I ask because the solution used by Kees seems to be quite complicated
>> and unreliable for the given purpose. In particular, printk() does
>> only the best effort to flush messages on legacy consoles. And NBCON
>> consoles drivers are even offloaded to a kthread by default as
>> pointed out by John in the other mail.
>>=20
>> It seems that Kees just want to check some particular printk() calls
>> and what messages they print. It might be easier and more reliable
>> to redirect printk() to an alternative implementation via a hook
>> in vprintk() in kernel/printk/printk_safe.c.
>
> Yeah, I was just trying to "prove" that seq_buf_do_printk() actually
> put something onto the console (and to match up what was written and how
> truncation behaved). :P I'm open to adjusting this however it should be...

Just to redirect the discussion towards my initial goal, what I would
like to bring is a userspace-like hexdump output which allows to skip
identical lines. I am printing a lot of flash content. Empty flashes are
full of ones, I mostly do not care about them, yet, during
tracing/debugging they take ages to be printed at 115200 bauds. So I was
just proposing to skip identical lines (with a '*') like in userspace.

Following my proposal, Andy requested that I would add unit testing of
this outpout. At that time I refused it for two main reasons:
- it is mostly a debugging mechanism, so if it ever breaks or changes,
  it is not (IMHO) a big problem;
- there was no accessible testing infrastructure that would not be
  overly complex for verifying the output of those calls.

I am still convinced adding testing here is superfluous.

Andy and myself met during LPC in Prague. Andy claimed that we might now
have the relevant infrastructure to add the tests. If there is an easy
way, I will just do it and move on. But based on the recent exchanges,
that does not seem so obvious.

So, what is the appropriate move here?

Thanks,
Miqu=C3=A8l
