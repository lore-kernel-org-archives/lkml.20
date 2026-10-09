Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDAB4DE727
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791558060; cv=none; b=CZXSAJ8I9OWnEruln1zv8/qqmwuyEjlrPzHgiIjrlJFlgDKRXe2pu6l6MBiz0oJd6JdKSne/RWnaE71ZyyBUkq4V6h+y6cIyUME1y87WYMJw3OZfAGNjKKpOAA+aNNTRq6X/4JKrGCOl5tfT8PR1i1J3NKPXs0aZvZco8vp38Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791558060; c=relaxed/simple;
	bh=YQK5RixacK5RQjP4UDPsEkn0fWpzOkWOVPDhy/6TiTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qpr+0JzpS3grrLX8qJp6Qut8NOgwwvUyv2lzS6H2UyqlPX/tLSyXagV04DhYvdYfXsXvN4MEsLgg6ndZggroE4p3RY+UJ5GoxTQ5k+c8YYr+cl7NjocLWb4D8kivBufB6gNVBldXBIn5eVpADIM6y1QOb6P0kTwHp0tXzi/bpFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=X7ecGWu7; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="X7ecGWu7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1791558054; bh=eEDb3cnRE64Dq7ctMIBJ7pYPNer/KDWKdy4mDU4Xcpo=;
	h=From:Message-ID:From;
	b=X7ecGWu7wcPsl3PsLBgsSrkhw6Z7SHIKNorBcpHHm45de58pst+QV7q+MCW73kJ9H
	 IEAAn3sU1LPLzwvBZYqMl0OWRTmmmD78dDEcuP6Z7AfSSfOIGg/IOmxcwkUo12QteL
	 1h2Gs+EzVZe1smA1MWk54VDn97vVq1nGM/I/j+o0=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 07C5FC090D;
	Fri, 09 Oct 2026 17:00:54 +0200 (CEST)
Date: Fri, 9 Oct 2026 17:00:53 +0200
From: Willy Tarreau <w@1wt.eu>
To: David Laight <david.laight.linux@gmail.com>
Cc: Petr Mladek <pmladek@suse.com>, helpdesk@kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: Create printk@lists.linux.dev
Message-ID: <askBpT-dk59MzcTP@1wt.eu>
References: <asjrq9g8EoUGepcH@pathway.suse.cz>
 <20261009152627.285d814b@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009152627.285d814b@pumpkin>

On Fri, Oct 09, 2026 at 03:26:27PM +0100, David Laight wrote:
> On Fri, 9 Oct 2026 15:27:07 +0200
> Petr Mladek <pmladek@suse.com> wrote:
> 
> > Address    : printk@lists.linux.dev
> > Description: Linux printk and kernel string formatting development
> > Owners     : pmladek@suse.com, john.ogness@linutronix.de, andriy.shevchenko@linux.intel.com, rostedt@goodmis.org
> > Allow HTML : N
> > Archives   : Y
> > 
> > Reasons for the list and additional info:
> > 
> > Honestly, the main motivation is to allow sending Sashiko review
> > for changes in PRINTK and VSPRINTF subsystems as a reply to
> > the mailing list.
> 
> There is also the smaller/faster printf code in 'nolibc'.
> Might be worth mentioning that as well.

Better not mix the two, nolibc is purely user land code and doesn't
have the same constraints.

Willy
