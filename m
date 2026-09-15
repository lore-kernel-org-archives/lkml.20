Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D359330C618
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789458656; cv=none; b=nqgB2loJadk1aBClIFO8WLnKgmv2MmEavF38bGZB1NWJlSUPx94Mc4ThEfBaEdRbXpBvlxAOWvCmvnxZE6DyXLA0Tq1P4I90zZUUWPSiRCpHOniTsyDIuyGQm2UhiGuXDSNidSuikpy+68cqxyEVQcNUmykgE1/k59vbk5/WXLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789458656; c=relaxed/simple;
	bh=U+1lMvM7Kq/7Oc1lqazrAL/weMJVKlM7jTb492fFhpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJHoCzHjiqivfs/ACesJ7MWCCXNhuvo1OBaHViLqfeBp6Jn54dQcMe/lxwVvm2lZVVLbkDmZnZK33bp/zoUnESWNq/lfWv42KKol2/JxfEy3ldGnQUvx3I2SAq4kpV0FrvkFYeCx3egzktqqt6eeIJv2KkkEtLdiO+IoDFR9gDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lgHiq6iJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lgHiq6iJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA7E1F000FF;
	Tue, 15 Sep 2026 07:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789458655;
	bh=xOZZTAMqyxT0SJ9hM2Vwc5oJ2q8QNjstQzoWrhFGVXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lgHiq6iJBBcBBN4TCTKx9M/ztzio1omV9XLe1ZazKh2UdpDlXmpodJTM2fbZOoOzk
	 iF0bmRwQtRhRtSCG2klQL9meoGD3bAJ4o+xYALJEKPJ+2tbV6yf45iBMgtUqbgmzoH
	 a+36ZOanL2eKBI/35u1fS36sv6U7uC1KimU+2N48sBlIUxLpsFrxqglNp8kdGRRoxj
	 0tDVP3xa2mpA2hOPwyLZNLb+ezp9951Nt+g6+8Hduee3BgjsfzsY4hsgSLwIXhsTUV
	 CeprwFXd0wXh0E8J0OOFWdB8eFwdMW5mUaRoYOHVpGFUbvyLtUkkqbkHtX1UlPxhbd
	 8j5rrY4K4PMGA==
Date: Tue, 15 Sep 2026 07:50:51 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Petr Mladek <pmladek@suse.com>
Cc: Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>, tfiga@chromium.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] printk: Introduce loglevel bypass for pstore console
Message-ID: <aqj426Zjg8pw1I97@google.com>
References: <20260831070346.3490745-1-tzungbi@kernel.org>
 <aqEmwXTLaTyUhhYG@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqEmwXTLaTyUhhYG@pathway.suse.cz>

On Wed, Sep 09, 2026 at 11:28:33AM +0200, Petr Mladek wrote:
> On Mon 2026-08-31 07:03:44, Tzung-Bi Shih wrote:
> > Currently, offline consoles (e.g., pstore_console backed by ramoops)
> > inherit the system's global console_loglevel.
> > 
> > In production environments, physical serial consoles (UARTs) are often
> > heavily rate-limited to prevent verbose messages from causing severe
> > execution bottlenecks.  Unfortunately, this identically silences the
> > pstore console.  When a kernel panic or lockup occurs, engineers are
> > left inspecting a crash dump that has been stripped of the verbose logs
> > that could have identified the root cause.
> > 
> > This series introduces CON_BYPASS_LOGLEVEL, a simple flag that allows
> > specialized offline consoles to request unsuppressed logs directly.
> > 
> > Patch 1 introduces the CON_BYPASS_LOGLEVEL flag.
> > Patch 2 adopts the flag in pstore_console.
> 
> I believe that a better solution for this problem would be adding
> the per-console loglevel feature, see
> https://lore.kernel.org/all/cover.1764272407.git.chris@chrisdown.name/
> 
> It is currently blocked by a cleanup of the console registration code,
> see https://lore.kernel.org/all/20260604101459.393162-1-pmladek@suse.com/
> 
> I am going to send v5 of the console registration code cleanup soon,
> hopefully later this week or the following week. It would be nice
> when it gets some more review.

Thanks for the context.  I completely agree that the per-console
loglevel is the proper long-term solution, and I understand that console
registration cleanup and the larger printk reworks are massive and
complex efforts.

Because those foundational changes naturally take time, I was wondering
if we could consider my approach as a narrow and localized exception
just for offline consoles like pstore.

Given that we already use LOG_FORCE_CON to bypass loglevels on a
per-message basis, introducing a symmetric per-console flag like
CON_BYPASS_LOGLEVEL might be an acceptable short-term solution.

Would you be open to a localized flag like this in the interim, or do
you strongly prefer to hold off until the full per-console loglevel
architecture lands?
