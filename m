Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDB319DF62;
	Thu, 15 Oct 2026 04:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792039118; cv=none; b=T7yTVKKpf22F+ColqAyDSUCdegpBcn1AjGFSb3k0vdN3TdJiAIICspOSJxNnOEikyAUuL0+71YoDRz0EqV327PsdypdZjUpahhLQws/bcn/sq9XZt6hSys+K2ePbxeNxiKH3Vfx/oG2JvAZ6vU0JRakOm1fqfyZm25QivD41ZK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792039118; c=relaxed/simple;
	bh=zrCxM1Z8Ln43pKllhc7ExMt4XHr/FbkHu2DnzRLllhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IrZWk7ltd46eUVtgIfsF9Incn2eRPRFtoZG5V8lsSClaKqM5hAdmI5qHsxdHaKRN+MXaMunKc9qDESBzHwfXGS4Ukw6rc5aRN02XnebxBHAZxKfp5arN8+dG5qhEyk1zVTK9dEpDnhzSbUJdf6Qkf6xvR+b1a3lBtg9LoJJ/Efw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+2oOwwY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z+2oOwwY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4021F000C4;
	Thu, 15 Oct 2026 04:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792039117;
	bh=QMdbQQ8MSxOvImF8HNFP4RPydFgLhwcIAf1buxq3ETs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z+2oOwwYeiyDfIcRFAUPdkerYZ6fzMooWEnD3ZvppyjeXkFeHpES2pASe1+cGfHoI
	 D0bNlUzJeaHh2CBgDYJETgB2dYCg1UcGsBs6T9qE7wSLVMT8zyQYtmN73KXdUcrL9K
	 /8EcuD0UBO/eQtmhMx4DWn9gscB9SRuqL/I3FRJ3ZppO8XKXmOWaxgdVLE3XCwtVqt
	 WQoGgjiv1Fx4lVSDANmOiAA8Uu83Evp7eD1bkqP6klH73PZOFudfhHUxpoQH83XtkB
	 VKw+xsdpHhAZpyjSsxLEAo9/cQgT66hNr899ecfJjVg4Fu21DX5EcsK4CD6DDRvRyS
	 jPUdlhPHvLZWw==
Date: Wed, 14 Oct 2026 21:38:37 -0700
From: Kees Cook <kees@kernel.org>
To: Petr Mladek <pmladek@suse.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	David Gow <david@davidgow.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Laight <david.laight.linux@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	John Ogness <john.ogness@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] hexdump: Allow skipping identical lines
Message-ID: <202610142135.0326EA9C@keescook>
References: <20250319-perso-hexdump-v3-0-a6ba3a9f3742@bootlin.com>
 <as6TIm6xE8Izccb5@black.igk.intel.com>
 <as-iBP1781DVuZ7p@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as-iBP1781DVuZ7p@pathway.suse.cz>

On Wed, Oct 14, 2026 at 05:38:44PM +0200, Petr Mladek wrote:
> On Tue 2026-10-13 22:22:58, Andy Shevchenko wrote:
> > +Cc: KUnit maintainers + Kees
> > 
> > On Wed, Mar 19, 2025 at 05:08:09PM +0100, Miquel Raynal wrote:
> > > While working on NAND issues, I used print_hex_dump() a lot to compare
> > > data. But I am mostly working on embedded systems where the kernel
> > > messages go through a serial console. Sometimes network support is an
> > > option, sometimes not. Anyway, I often print buffers both in kernel
> > > space and user space to compare them, and they may be full of 0's or
> > > 1's, which means lines are repeated a lot in the output and this is slow
> > > *and* hard to compare.
> > > 
> > > I initially hacked into lib/hexdump.c for my own purpose and just
> > > discarded all the other users, but it felt like this might be a useful
> > > feature for others and decided to make it a public patch.
> > > 
> > > * First patch creates a helper named print_hex() with a prototype
> > >   containing a flags parameter, instead of an entry for the prefix type
> > >   and another entry for the ascii boolean. print_hex_dump() now
> > >   falls back to print_hex().
> > > * Second patch adds a new flag to possibly skip the identical lines.
> > > * Third patch is optional, and adds the offset at which the dump
> > >   finishes in case the last line to be printed would be skipped.
> > > 
> > > The Cc-list, as provided by get_maintainers.pl, was returning 330
> > > e-mail addresses which felt to much, so I ran the script only on the
> > > second patch (the printk/includes/debug/Doc changes). It gave this
> > > Cc-list which sounds more reasonable. Hopefully this is a smart move,
> > > otherwise let me know what you think would be best.
> > 
> > Sorry for the so late response. First of all, a bit of a background
> > development on my side. At some point a few months ago I asked John
> > Ogness to give me a private dive to the printk() guts. He explained
> > to me a lot about ow printk() circular buffer works and that the
> > implementation is nowadays done in the terms of circular buffer library
> > and printk() front-end. This gives a potential to get a clean solution
> > for the testing how printk() actually behaves.
> 
> I am curious what printk() features you would like to test.
> 
> > The main issue with the
> > real printk() is that the buffer it's using is defined globally and
> > for clean test cases the printk() can't be used. We discussed the way
> > of high-jacking that by linking an object file of printk() implementation
> > to the KUnit test, but it seems quite a tricky if ever achievable exercise.
> > 
> > Meanwhile Kees Cook seems found a nice workaround for the similar use case
> > in his recent patch series [1]. The idea is to register custom console and
> > provide a custom .write() method which is the heart of the solution. On
> > the writer side user prints something which has unique prefix, while the
> > console callback recognises that pattern and checks the rest of the line.
> 
> I ask because the solution used by Kees seems to be quite complicated
> and unreliable for the given purpose. In particular, printk() does
> only the best effort to flush messages on legacy consoles. And NBCON
> consoles drivers are even offloaded to a kthread by default as
> pointed out by John in the other mail.
> 
> It seems that Kees just want to check some particular printk() calls
> and what messages they print. It might be easier and more reliable
> to redirect printk() to an alternative implementation via a hook
> in vprintk() in kernel/printk/printk_safe.c.

Yeah, I was just trying to "prove" that seq_buf_do_printk() actually
put something onto the console (and to match up what was written and how
truncation behaved). :P I'm open to adjusting this however it should be...


-- 
Kees Cook
