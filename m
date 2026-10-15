Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D8E51A74D;
	Thu, 15 Oct 2026 13:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070211; cv=none; b=mBX/qdx9EQMb6oA6saf8BQOPP7+4fFJqpG2G3xvVpsaZ1k+bXoaQTuPBwIHo2u1b5MtQXU7f9npoiDRt/2YMV+iE1DSX07T0EohFvqBwAD/nbD5Jbzf/IVAXW91/vQkvX/OZYfdw0MJfzQbgCFhf6/H+3Y5nvcC8WW9Vjji0GeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070211; c=relaxed/simple;
	bh=xphmFiHpnI/HmhlmkPm/h3prswLmj4PwQpyRncK3sKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tMmV6t1QEVwDc6W2xn7nlo+GUu+SwaqT2MFQYOleRORgYqbzwZKfK1WXqttji+t7V4Dpygam8GJca0FcD4PKIj2G6KASLaJxde4m504ghucSenhjUwduLL5WsDoh6jxIBqfUh3gDGtwq54JUth1s9nv9ETWnqTdzlp1OziwZePM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nJZqkXRM; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nJZqkXRM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792070209; x=1823606209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xphmFiHpnI/HmhlmkPm/h3prswLmj4PwQpyRncK3sKg=;
  b=nJZqkXRMMu7Fopf2mmMuFnEkojkD4LcgV5lsdzKoR4GJPGvvTkrFTIZU
   UfBm8XQcC0hxRfreYKL2gdIB+UrFOw+6kiH6YdIGoZYQCHhHwkFlUydP1
   LBq7Vn5l6ZfieHdzq555tMwqHoeVxtoOWRxWVE00BizMSQV2/VIXK8ZUX
   VETOULvktZd9dhRDb69foPXfOWMZdzKRrJwLImGkcShTxsyxX8xWeRLHa
   lEnXpwEjg8jo9ZXKsyiS++OgtUR4aBD2bK2JrsxI5DDlyfOx9+i530xZU
   S/6+N6M015tNhO/dH/aWZ55FWCV/Knl61oO8pNaOGC/v3e3y7iwHJTfvm
   A==;
X-CSE-ConnectionGUID: G8GhbtnHR125CKqBZYB8gw==
X-CSE-MsgGUID: teZ+qyBfSsGA3pLR3gopCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="724144"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="724144"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 06:16:48 -0700
X-CSE-ConnectionGUID: 3XtOOWnuTwOuHWs75W8FAA==
X-CSE-MsgGUID: EzCabojDT/eI9tS8qVy7/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1786153"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 06:16:44 -0700
Date: Thu, 15 Oct 2026 16:16:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Kees Cook <kees@kernel.org>, Petr Mladek <pmladek@suse.com>,
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
Message-ID: <atDSOfZy1RDhB_ff@ashevche-desk.local>
References: <20250319-perso-hexdump-v3-0-a6ba3a9f3742@bootlin.com>
 <as6TIm6xE8Izccb5@black.igk.intel.com>
 <as-iBP1781DVuZ7p@pathway.suse.cz>
 <202610142135.0326EA9C@keescook>
 <87se27wdzl.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87se27wdzl.fsf@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 15, 2026 at 10:43:26AM +0200, Miquel Raynal wrote:
> On 14/10/2026 at 21:38:37 -07, Kees Cook <kees@kernel.org> wrote:
> > On Wed, Oct 14, 2026 at 05:38:44PM +0200, Petr Mladek wrote:
> >> On Tue 2026-10-13 22:22:58, Andy Shevchenko wrote:
> >> > On Wed, Mar 19, 2025 at 05:08:09PM +0100, Miquel Raynal wrote:

...

> >> > Sorry for the so late response. First of all, a bit of a background
> >> > development on my side. At some point a few months ago I asked John
> >> > Ogness to give me a private dive to the printk() guts. He explained
> >> > to me a lot about ow printk() circular buffer works and that the
> >> > implementation is nowadays done in the terms of circular buffer library
> >> > and printk() front-end. This gives a potential to get a clean solution
> >> > for the testing how printk() actually behaves.
> >> 
> >> I am curious what printk() features you would like to test.

Besides the case the Miquel has I was think more of the testing the front-end
part of printk(). The back-end, id est vsnprintf(), is well covered already
since we may control the buffer the vsnprintf() prints to. With real printk()
there is no control of the buffer, and as you explained below it might be
required to add some more hooks and code.

> >> > The main issue with the
> >> > real printk() is that the buffer it's using is defined globally and
> >> > for clean test cases the printk() can't be used. We discussed the way
> >> > of high-jacking that by linking an object file of printk() implementation
> >> > to the KUnit test, but it seems quite a tricky if ever achievable exercise.
> >> > 
> >> > Meanwhile Kees Cook seems found a nice workaround for the similar use case
> >> > in his recent patch series [1]. The idea is to register custom console and
> >> > provide a custom .write() method which is the heart of the solution. On
> >> > the writer side user prints something which has unique prefix, while the
> >> > console callback recognises that pattern and checks the rest of the line.
> >> 
> >> I ask because the solution used by Kees seems to be quite complicated
> >> and unreliable for the given purpose. In particular, printk() does
> >> only the best effort to flush messages on legacy consoles. And NBCON
> >> consoles drivers are even offloaded to a kthread by default as
> >> pointed out by John in the other mail.
> >> 
> >> It seems that Kees just want to check some particular printk() calls
> >> and what messages they print. It might be easier and more reliable
> >> to redirect printk() to an alternative implementation via a hook
> >> in vprintk() in kernel/printk/printk_safe.c.
> >
> > Yeah, I was just trying to "prove" that seq_buf_do_printk() actually
> > put something onto the console (and to match up what was written and how
> > truncation behaved). :P I'm open to adjusting this however it should be...
> 
> Just to redirect the discussion towards my initial goal, what I would
> like to bring is a userspace-like hexdump output which allows to skip
> identical lines. I am printing a lot of flash content. Empty flashes are
> full of ones, I mostly do not care about them, yet, during
> tracing/debugging they take ages to be printed at 115200 bauds. So I was
> just proposing to skip identical lines (with a '*') like in userspace.
> 
> Following my proposal, Andy requested that I would add unit testing of
> this outpout. At that time I refused it for two main reasons:
> - it is mostly a debugging mechanism, so if it ever breaks or changes,
>   it is not (IMHO) a big problem;

I find this feature is good in general and maybe actually part of the real ABI
or just beyond debugging.

> - there was no accessible testing infrastructure that would not be
>   overly complex for verifying the output of those calls.
> 
> I am still convinced adding testing here is superfluous.

Petr, also note, that this series doesn't use any modifications to the
hex_dump_to_buffer() facility as it's done on the upper layer of the printk()
that is not anyhow covered by unit tests. That's why I was insisting on the
test cases.

And since we want to cover lib/ with unit tests, I tend to try to fulfil that.
However, if there is a majority of stakeholders (Miquel, PRINTK() maintainers,
and reviewers) think otherwise we might do no tests exceptionally.

> Andy and myself met during LPC in Prague. Andy claimed that we might now
> have the relevant infrastructure to add the tests. If there is an easy
> way, I will just do it and move on. But based on the recent exchanges,
> that does not seem so obvious.
> 
> So, what is the appropriate move here?

Yep, we need some discussion here how to move forward. Again, I like
the feature, I just don't like it may go without testing.

-- 
With Best Regards,
Andy Shevchenko


