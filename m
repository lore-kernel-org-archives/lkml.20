Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242847;
	b=EU+cM/otft1woR4qWScwvxfFe4jKLw33Cyp1hvrj1Vo6O76QaogVPHp7anNxbs65Fv1n
	 PDeOwnncmcZz+zXCz02XK4//cuRQjVOd89vVIUBk3UXBDqs35/Ecc4i5D0vMbXCCgdrDk
	 TvweLEc77whCEUTQ/SsKt/u7WrQIeNXB6u2crS0Qd4H1TOdDdxOuXaK1odtczRKSj8Y88
	 MWee9aWXdVgh9UB6/LD0q5+4ImK5NIJhBXRzTafPskzrcI64907HaOxmA9QkZ66CCLE/Y
	 tM8cTjnbZ5tIH2ix3O5/WK0Izz3JDuYGif2EXXFAB5LrCeMIxjC/u1Snegb2WsQz5Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242847;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=7QCQMX1YjQnxjMAljTgB/goZ5DEceQMQpw/VVgpYcMs=;
	b=WkYvv8oDaKsovz/sOzNS+G01X4b89xCMSLFH8qUVwIZ1avEkz4DiPsvWenf68wXq5VZL
	 KIWN41xU/yVittOzv7u2ESQfuOVYzzvUiUlPOsFWw0qvBgxKWm6l/u4YLLcdivXwKs/89
	 h+gEbKosH+4lkPlwKYEOwFuhimR4ga2rhLnksO9UjkFQ1f9hjCVzgIKBoHhhqwo8F+uLU
	 23+vC6ZLs8GTOpq7VBD3O8blOzL8IE22iZ/alydvHhvTcmaBWB/Y9VE55bZ2NPqQTwMYR
	 Yyv9UPkZ1p2TSNV7gvUjcNw3qmszCDsMOgP/sBAg2IzPdFeXTsnjwP4VEC7uzwa/QOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=IciOi2Ea;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F39606A32A;
	Mon,  9 Nov 2026 16:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57F39606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=IciOi2Ea
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7QCQMX1YjQnxjMAljTgB/goZ5DEceQMQpw/VVgpYcMs=; b=IciOi2EalUVDjRbB5OUGTXNODO
	rkV1/LhYzpmiMWNxS0A1xxFKSkiO+QzI9vFplgW24p1OsTEo1caT6bzeikKmDF4Q9X5KhWYJD+/1Y
	TqF82KfcRoWLVw7tEVIqeo4cEIQjdfc3t5Zz1+GRePy3z2ZiNiWB9lkf3Y/rUQdryHdbgYSEchuBE
	cILT3sN0O6thFzOaI595Wijdsny8EfeIoGfeYVp2zvtY7gmxkOTcjeI5ymgOtE0DMX0KURnSyEVJv
	ZaUjQhWtX0593JC4Z8Z7s4Cu2q1QIismwYYjKtu8afkDVizNAruRpmJ90N0G92cy4Z0kY/H5iAuwg
	vtO5znfw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xQSWd-00BlNJ-1a;
	Mon, 09 Nov 2026 16:47:19 +0000
Date: Mon, 9 Nov 2026 08:47:15 -0800
From: Breno Leitao <leitao@debian.org>
To: John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, printk@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH printk 3/6] printk: Evaluate flush policy in
 nbcon_allow_unsafe_takeover()
Message-ID: <avH1ZVs2Hyx62jgQ@gmail.com>
References: <20261109123127.489676-1-john.ogness@linutronix.de>
 <20261109123127.489676-4-john.ogness@linutronix.de>
 <avHTDeox8nDGLC6Q@gmail.com>
 <87qzgunkof.fsf@jogness.linutronix.de>
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
In-Reply-To: <87qzgunkof.fsf@jogness.linutronix.de>
X-Debian-User: leitao

On Mon, Nov 09, 2026 at 03:34:32PM +0106, John Ogness wrote:
> On 2026-11-09, Breno Leitao <leitao@debian.org> wrote:
> > That is coming from:
> >
> >    550 static int nbcon_context_try_acquire_hostile(struct nbcon_context *ctxt,
> >    551                                              struct nbcon_state *cur)
> >    552 {
> >    553         unsigned int cpu = smp_processor_id();
> >    554         struct console *con = ctxt->console;
> >    555         struct nbcon_state new;
> >    556
> >    557         if (!ctxt->allow_unsafe_takeover)
> >    558                 return -EPERM;
> >    559
> >    560         /* Ensure caller is allowed to perform unsafe hostile takeovers. */
> >    561         if (WARN_ON_ONCE(ctxt->prio != NBCON_PRIO_PANIC))
> >    562                 return -EPERM;
> 
> Wow, you managed to get a hostile takeover. Out of curiousity, do you
> know how dangerous this really is? Can this basically just result in
> garbage on the network? Or is there dangers of running into the forest
> with NULL or garbage pointers? And is the danger acceptable?

Sure, I was playing with different scenarios, and this was done with a
test module that forces the takeover:

1) Acquire netcon_ext with nbcon_device_try_acquire(), so the console
   is owned at NORMAL priority and in an unsafe state

2) mdelay() for a few seconds without releasing it (simulating
   a possible netpoll busy TX queue -- or some other networkdelay)

3) echo b > /proc/sysrq-trigger from another CPU

--breno
