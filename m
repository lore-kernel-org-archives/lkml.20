Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186661;
	b=Of0GXfxj45jdpocQBb+g5j756oFH9WUeSt7Bamu/EgrRZuSxPCodDNr0oE/wgKSzAo0b
	 QnXDBI8MhlV1mzEk+xIqZgPPMqX7QBAQsq/SY2F8CNVHJDUJr2VIEL+SmMG3t4Chfg/29
	 G1oEAfAHLjB2TrRYHzB6WGPPSH5qxO2EnQgmZ8sUXvFMsQ9acCuXZPOnj1GZEvfx7SRjy
	 sONYVNLgfZ+yJtD2YzHPMGNHbcmMd63J5uYFyQTaa5FYaZLKVBd/NwLcZpD6m86NiKBif
	 Ul6PQaHiymEOZu045MqT6PUsVTnuEzAKFME3Y81GiQay3pt81W4fG2iMNzuz3ibV4QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186661;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=jR7Q1br9X0yutGUS8tdSY0mcsHsECiyuejFKIcPDcLc=;
	b=hs4ImTyptSJ2GV3bHx7sDiNHKJ0ysv8fdZYRBWTmFSGKhThdZIa29mZU3oTZwsZ7eXmJ
	 ElUy5nlNOx1vugyUuO6BIocvxw/O8ITH6Q0OzLo9Y6BBPPbyV/eFoZBB6/toFkmhUwfqe
	 D8e4HuSORjYytf8GgkVkAMIjPFAXjbiL1BADqXjF9DFo5/mKOB7CUo5aKyo0PagmhuOqy
	 SmQ91iaSInOUy8FtDyczBRtCzdaONITPZn+4qfX6AehaN/vPeJqqmYIwlGjsBNTw9FQOt
	 Rs1dgsRiOF/LcQyACj9gJN6Ift0UyL+SxZcBbGFFllszRP7U9NCCcZS/EYMMB/ReRng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=eKPFMZD7;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29DC606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F29DC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=eKPFMZD7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jR7Q1br9X0yutGUS8tdSY0mcsHsECiyuejFKIcPDcLc=; b=eKPFMZD7Hjnf1Vc5HfAkAEV0de
	WC8F5lJUwkVncXoluoMyBybmH/dy76hp6cU+7I+YEeMgHkP5sz936fKyDYyB4/S7VOWy3lSaQkfmF
	ZhyhJj/mEnlt+f9ZWdc7xJPUUKEaFrvib0QZVxl8TUvv06vBmCX3Yn0JE6FUZkEYOph+ueE2P7SDE
	Kq80VvYBCPJ4pcu+AQRk3MAGXO+9rDOkqC2mRjczL+/ayo4JxRY9OYciSKmghYeosaDQDojf6IUbG
	L8UsBXknm40joOJv+25iHN6lemKxO1huCHL1rzhJvWHxegAwR/fFnmdmliSHTdu1ZHiSA3hvKS/t8
	ibePmckw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xM1lN-002Co4-2C;
	Wed, 28 Oct 2026 11:24:13 +0000
Date: Wed, 28 Oct 2026 04:24:09 -0700
From: Breno Leitao <leitao@debian.org>
To: John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Rio <rioo.tsukatsukii@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] panic: Flush unsafe consoles before panic reboot
Message-ID: <auHUCbBOJjBwk-ml@gmail.com>
References: <20260915100140.3631650-1-ryan.roberts@arm.com>
 <aqqU3I7d9lMAjSvy@pathway.suse.cz>
 <87bj8kkfwk.fsf@jogness.linutronix.de>
 <ats4n8snmReT7Nc9@pathway.suse.cz>
 <auDM_p2_nwVkw_0n@gmail.com>
 <auDibpMWv7mkdRTW@gmail.com>
 <87v76n2fb9.fsf@jogness.linutronix.de>
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
In-Reply-To: <87v76n2fb9.fsf@jogness.linutronix.de>
X-Debian-User: leitao

On Tue, Oct 27, 2026 at 07:07:30PM +0106, John Ogness wrote:
> On 2026-10-27, Breno Leitao <leitao@debian.org> wrote:
> > On Tue, Oct 27, 2026 at 09:12:09AM -0700, Breno Leitao wrote:

> Perhaps we need to begin by identifying all the sites where the current
> kernel is ending (whether reboot, shutdown, panic, kexec, hang).

Ack. This is what I have so far on the panic side:

 1) panic() ending in the final loop (panic_timeout=0): flushed at the
    end, including the unsafe consoles (d988d9a9b9d180, 5dde3b735413).

 2) panic() ending in emergency_restart(): no unsafe flush (Ryan's RFC).

 3) panic() ending in __crash_kexec(): the console_flush_on_panic() and
    nbcon_atomic_flush_unsafe() calls all come later, with or without
    crash_kexec_post_notifiers.

 4) An oops ending in crash_kexec() straight from oops_end()/die(),
    when kexec_should_crash() is true. panic() never runs.

 5) Other crash_kexec() callers, such as s390 and hypervisors.

> > +                       /* Flush consoles with an unsafe write_atomic(), e.g. netconsole. */
> > +                       nbcon_atomic_flush_unsafe();
>
> I am guessing that the CPU is _always_ in emergency state here?
> Otherwise the flushing problem exists for all atomic consoles.

True. But for the unsafe consoles, the end of panic() already handles
this.

d988d9a9b9d180 ("panic: Flush kernel log buffer at the end") added
a final console_flush_on_panic(), and 5dde3b735413 ("printk: nbcon: Add
unsafe flushing on panic") added nbcon_atomic_flush_unsafe() after it,
to make sure the last messages get out.

That _only_ runs when panic() ends in the final loop, though. kdump never
gets there, and neither does reboot-on-panic or, possibly, some of the
other "kernel ending" sites you mentioned above.

The kdump case is the one I care about most. It is a regression for us
(Meta) in production, where kdump is always armed: netconsole has lost
these messages since it moved to nbcon.

So far we have identified two places that need the same unsafe flush
that 5dde3b735413 added to the final loop:

 a) panic() ending in emergency_restart(). Petr's suggestion to flush
    from console_flush_on_panic() covers this one.

 b) __crash_kexec(), reached from panic() or straight from
    oops_end()/die().
