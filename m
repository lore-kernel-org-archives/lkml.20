Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117541;
	b=S7N/swJ7/J+pgoh/ah7TLEY9JCdmESpCapSC3q3am9v7twIsp00C1KH2qY7NTR2y7p/R
	 QRLt03mItxd6M/W0CiSxhbFIbvcmeNSpSdwAzosqEF2oMOK26+LrYIxYMMxOgeT4xR9vo
	 qRVCOavtnwD4PWNlg2Yw0vVEHVGGqiaH2x896BuzIXjVgExhZsYVz2pnkADV9jEq/axn/
	 ImU9moznntWnPoblm28g5fXKO+n2RZ7uXXSoLm1jjaMyrp78tAd8XYojn+zbJLBUXaf5m
	 8CLKy4///DwiAUsIYil7zD4ZxGt5MpMSyk4jKlKjvUORDdA+76hkGKleqLn+gH/1e/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117541;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=XqbIHLFdsXyVkuJgdDLCayfeh03Np6T/BV+S9W3GA4g=;
	b=FVkoinTw7vQ9xH9xvetp9INYIYmYR5OT5UJZFeeNIG8Kuy0iCKpE3MYdjHf9qB7cBKtA
	 bhuAjJgihzPuKWF3rfInC//salGCETOOSj46neAjvM8KTEbL+mLCmTFfme1nwsyuDYdpg
	 DrJUcgddTAFtc/nI+XAmIVh36qybiKA6wF60qNKgnZ8iqOfUqyaglqNZP55HKrQUel63s
	 bxyXQiCH9bdfNrBH2VW1VanzjTGkUNP1w4t2mkjZ2QRW0tIwtxE3/I0vXdwlWOl7IqK7c
	 T5B4gbWOfIxg+Dh7pYhLHTc4rMiDxA907UaicjFmcfGKsWB/nbCQfvRLyOj0mtr6SHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=r5lOOUy9;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6B0606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:12:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A6B0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=r5lOOUy9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XqbIHLFdsXyVkuJgdDLCayfeh03Np6T/BV+S9W3GA4g=; b=r5lOOUy9agjKeSf2geXClhnRhS
	x42fF/fiE4xOq6wgM5aym6FUTHzZxMnOoO7ekAODq5vKGfotJYcQNnS2U7U46Aw9LYtguaM0Oygov
	Ox1D0G5fqCIlVvWFHqpmkArxgE6GeDUeaTVEQiHfV3Pe2C6iqeqVK+zl7m9IlRwoThnAE+6HS/Txw
	Ql0+sVrK7J2Vx7fEfvcsDwt1Erxc22pIy+HEFikqzhz650SaRkyrFjCetzlJvibexK4m12qdwB+LX
	nMgFnZWwfrNYvTTF1g0WmCRAUPsGo6rtPtj+gcI83LVKQqMJoR7WUfe5yAgV8ikWxBzKtclCDLzmi
	nedyzPIw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xLjmY-001a2B-1O;
	Tue, 27 Oct 2026 16:12:14 +0000
Date: Tue, 27 Oct 2026 09:12:09 -0700
From: Breno Leitao <leitao@debian.org>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, 
	Ryan Roberts <ryan.roberts@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Rio <rioo.tsukatsukii@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] panic: Flush unsafe consoles before panic reboot
Message-ID: <auDM_p2_nwVkw_0n@gmail.com>
References: <20260915100140.3631650-1-ryan.roberts@arm.com>
 <aqqU3I7d9lMAjSvy@pathway.suse.cz>
 <87bj8kkfwk.fsf@jogness.linutronix.de>
 <ats4n8snmReT7Nc9@pathway.suse.cz>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ats4n8snmReT7Nc9@pathway.suse.cz>
X-Debian-User: leitao

On Fri, Oct 23, 2026 at 12:36:15PM +0200, Petr Mladek wrote:
> On Fri 2026-10-23 10:03:47, John Ogness wrote:
> > Sorry for the late response... this fell through the cracks. Response
> > below...
> > 
> > On 2026-09-16, Petr Mladek <pmladek@suse.com> wrote:
> > >> In older kernels (v6.19 and earlier) netconsole is able to print these
> > >> panic logs while the system is configured to reboot on panic. So from a
> > >> user perspective this is a regression caused by commit 7eab73b18630
> > >> ("netconsole: convert to NBCON console infrastructure").
> > >> 
> > >> We have automated test systems without BMC access, which rely on these
> > >> two features working together.
> > >
> > > I see. To be precise, I would say that the primary culprit is the
> > > commit 187de7c212e5fa87 ("printk: nbcon: Allow unsafe write_atomic()
> > > for panic"). It adds support for consoles which will be flushed
> > > in panic() only by nbcon_atomic_flush_unsafe().
> > >
> > > It is a big difference because printk() tries to flush both
> > > legacy and "safe" NBCON consoles directly in panic(). In addition,
> > > they are explicitely flushed by console_flush_on_panic().
> > >
> > > console_flush_on_panic() is called more times in panic().
> > > And it tries to flush legacy consoles the unsafe way even
> > > before emergency_restart().
> > >
> > > OK, we should close this gap. But I suggest another solution.
> > >
> > > We already have the following functions for flushing NBCON
> > > consoles using write_atomic()
> > >
> > >
> > >   + nbcon_atomic_flush_pending() - flush CON_NBCON consoles
> > > 	using con->write_atomic() but only when safe
> > >
> > >   + nbcon_atomic_flush_unsafe() - flush CON_NBCON consoles
> > > 	using con->write_atomic() and allow unsafe takeover.
> > >
> > > I suggest to add 3rd variant, for example:
> > >
> > >   + nbcon_atomic_unsafe_flush_unsafe() - flush
> > > 	CON_NBCON_ATOMIC_UNSAFE consoles with con->write_atomic()
> > > 	and allow unsafe takeover.
> > 
> > nbcon_atomic_flush_unsafe() already includes CON_NBCON_ATOMIC_UNSAFE.
> 
> I was not clear enoungh. The purpose of the 3rd variant was
> to allow the unsafe takeover only for consoles with
> CON_NBCON_ATOMIC_UNSAFE. And rely only on the safe atomic flush
> for consoles which support it.
> 
> But it is likely too complicated and probably not worth it.
> 
> 
> > > And I would call this 3rd variant in console_flush_on_panic(),
> > > something like:
> > >
> > > void console_flush_on_panic(enum con_flush_mode mode)
> > > {
> > > [...]
> > > 	printk_get_console_flush_type(&ft);
> > > 	if (ft.nbcon_atomic) {
> > > 		nbcon_atomic_flush_pending();
> > > 		nbcon_atomic_unsafe_flush_unsafe();
> > 
> > s/nbcon_atomic_unsafe_flush_unsafe/nbcon_atomic_flush_unsafe/
> 
> Yes, I am fine with this.

This fixes the reboot case, since console_flush_on_panic() runs before
emergency_restart(). 

But I got the feeling that it does not help when a crash kernel is
loaded, which is a common production setup, and how our fleet runs.

With kdump, the kernel kexecs before any of the console_flush_on_panic()
calls in panic():

 1) panic() calls __crash_kexec() before panic_other_cpus_shutdown(),
    or right after kmsg_dump() with crash_kexec_post_notifiers.

 2) On an oops, oops_end() (x86) and die() (arm64) call crash_kexec()
    directly when kexec_should_crash() says so (panic_on_oops, oops in
    interrupt, ...), so panic() never runs. With
    crash_kexec_post_notifiers they go through panic() and hit 1).

So netconsole, or any CON_NBCON_ATOMIC_UNSAFE console, prints nothing
on kdump hosts.
