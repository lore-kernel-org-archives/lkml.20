Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8D73D1A82
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791567411; cv=none; b=hdMNYgs5pMapPBRDQWGFYMJZJoK7THQOH3a3406dCPZPVENV9Zit8V6xgvFjzGQnjMa5hJEOlnE47yxieJNhBMb0RF2gPA8nAM8AzLycd0dlPOJwgUKh83l7GWXZ1DgE0iEYgBaV2OAi9SIn6O05f5oVui2hhSGtAtxklo1eUNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791567411; c=relaxed/simple;
	bh=hmScNbhHpQEdh0jHezEe4irPwmth2ZgOPAFEmTLrLcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y9vSUEcpD3vYx+2d2ohWiouCYH7DfLlSl3I+c4RynFDX+LvpWta0WlHZohlUvn/CAqQooTYlOC05ydGDta2taHQF4vCIQo5JBChNYJFIAsJzRY9S4EKi56OYQX8UtNMtQvUsbILFBP+6aWoVimKt0w5+10Eqgo4usd8QEaMXysU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=jQz9mo86; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="jQz9mo86"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1791567405; bh=BXtUr3dZINZu+CEqNINERyUDGN1UDWWUbKnHYQJae6g=;
	h=From:Message-ID:From;
	b=jQz9mo86eRH3k3kClHk0yzWDS2CfRPQEwUP82rhviVuW/606vk1Cc3s8bnX1Gn9Du
	 yVX06AV+6JA06+cpWbotuMjcsQXTAzuZXAgyGMtRmadUEiAi++t+DIuX85GcB62Qvz
	 3OwIlps+ExRdHYRpnDFYdXYtRayVs8+f5na+54v0=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 39FF9C090D;
	Fri, 09 Oct 2026 19:36:45 +0200 (CEST)
Date: Fri, 9 Oct 2026 19:36:44 +0200
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
Message-ID: <askmLHdIBmy6NjDL@1wt.eu>
References: <asjrq9g8EoUGepcH@pathway.suse.cz>
 <20261009152627.285d814b@pumpkin>
 <askBpT-dk59MzcTP@1wt.eu>
 <20261009183427.7a7d71ba@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009183427.7a7d71ba@pumpkin>

On Fri, Oct 09, 2026 at 06:34:27PM +0100, David Laight wrote:
> On Fri, 9 Oct 2026 17:00:53 +0200
> Willy Tarreau <w@1wt.eu> wrote:
> 
> > On Fri, Oct 09, 2026 at 03:26:27PM +0100, David Laight wrote:
> > > On Fri, 9 Oct 2026 15:27:07 +0200
> > > Petr Mladek <pmladek@suse.com> wrote:
> > >   
> > > > Address    : printk@lists.linux.dev
> > > > Description: Linux printk and kernel string formatting development
> > > > Owners     : pmladek@suse.com, john.ogness@linutronix.de, andriy.shevchenko@linux.intel.com, rostedt@goodmis.org
> > > > Allow HTML : N
> > > > Archives   : Y
> > > > 
> > > > Reasons for the list and additional info:
> > > > 
> > > > Honestly, the main motivation is to allow sending Sashiko review
> > > > for changes in PRINTK and VSPRINTF subsystems as a reply to
> > > > the mailing list.  
> > > 
> > > There is also the smaller/faster printf code in 'nolibc'.
> > > Might be worth mentioning that as well.  
> > 
> > Better not mix the two, nolibc is purely user land code and doesn't
> > have the same constraints.
> 
> The kernel version is actually horrid, rewriting based (loosely) on the nolibc
> version might be an improvement.
> But I'm not sure how I could do it without it mostly being 'one big patch'.
> The nolibc version is much more of an embedded system version and a usual libc one.
> Things like not calling a function to add every character to the output help!

There's obviously nothing wrong with taking inspiration or code there, but
I meant we should not pollute printk() discussions with nolibc's constraints
and use cases.

Willy
