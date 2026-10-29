Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271495;
	b=lOw6xeePPq80qbTIbPzPannDJl3KdiBVQtb+52MSbmtpwV+kUdGsmNu7EzgFWpP/pCrl
	 81DM4WCdyITgLKRCGu4BX/ISnA0YgH7hBNnzyqCrd7t7nFEkqQNgIX8S4smSDlDXCfszj
	 syGwVpXkXNS0PZJ8MiYAPT/y50o6qYY6YAsDdqYlAatzgnURoMH9ARrdZFqiIiZVPgEWU
	 yEyIsVNToFMajnG8kczhWrCpVJPJzDBjWnkIeMP+OEdNzVLtlw0fu/ofYWethoQZxt/CI
	 R07NqdXNImHmdd/Y8PjcxkAIXYHevn4ZMCIhobFIo/dbNT/ggxxFsbFIraPpJRC6azw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271495;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=AVmPmd/rgZTsm982vccuMWQZMWw/wnO5wAJb7t7wqkg=;
	b=RPv3PMPZeYxiZdTEdyuJh7MMUQzQmTHjKXdl03LHXjL9y61ivOd8NKbFdftHaLqBD4sA
	 1CJyZNez7qVYwm2ST8F2mP8XC8/AA3G1Sr06Tr/EwC7MB8tUePAK2J4YSuRn7fueppzYA
	 6dbnimKDXcJhBkTwz96weuSDjXLudQ9dgpfXB4xcK81R+WoRci6+OFQ+aFxgx9EqODCbx
	 WN+XQNhJTYdRK0hdTuEX8uF+rEsCeZpvOd4SawBn7dNg4HG7SVeKwUdn0gjJVjahv58L9
	 u1nk3avtpuEeFi2UeUrx7IoWR9IZgrSv+uJw9g11Jzv6ibDB8guFMh3sHqzqsOpg48w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=SG5hTeXV;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C1D606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5C1D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=SG5hTeXV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AVmPmd/rgZTsm982vccuMWQZMWw/wnO5wAJb7t7wqkg=; b=SG5hTeXVyxOEMtvBoUXsWEkkXY
	KbvvSfqsy+9npCPv7XxqNIDsw7xlUbLvEAMWYOAhxau41SUxwqaoeTLtDq14b0euhHvgiYBESWbN8
	9MX1CofrfYEubgbMCC1w2XMYgyJY+oci5q6eJHcSANouKMbNV0IR62ROM/doB1V4+ME4kvkPBKJPh
	Y6EFMvChn49ZOHwacI3RYjVIMGeoyuSZrgFeT97rxy1jDkbA7s0RjFW9V3NxgZv+kwQqtS5WS63o+
	ellrDlx+StQLqptXt0FNSy1Z3HBYZ5l19SOPCAwtoqdgWiiRKvdI9dGXevAVd0w4yjMyvGa6UOB9v
	sYkUpAkA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xMNpf-002yIC-1J;
	Thu, 29 Oct 2026 10:58:07 +0000
Date: Thu, 29 Oct 2026 03:58:03 -0700
From: Breno Leitao <leitao@debian.org>
To: John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Rio <rioo.tsukatsukii@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] panic: Flush unsafe consoles before panic reboot
Message-ID: <auMmQjcy1A6E0eUm@gmail.com>
References: <20260915100140.3631650-1-ryan.roberts@arm.com>
 <aqqU3I7d9lMAjSvy@pathway.suse.cz>
 <87bj8kkfwk.fsf@jogness.linutronix.de>
 <auHNz09oyGFJPTKg@gmail.com>
 <8733tphow9.fsf@jogness.linutronix.de>
 <auI40MZlSYO0oAAS@gmail.com>
 <87a4nwyiaw.fsf@jogness.linutronix.de>
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
In-Reply-To: <87a4nwyiaw.fsf@jogness.linutronix.de>
X-Debian-User: leitao

On Thu, Oct 29, 2026 at 10:26:23AM +0106, John Ogness wrote:
> On 2026-10-28, Breno Leitao <leitao@debian.org> wrote:
> >>>> For consoles with CON_NBCON_ATOMIC_UNSAFE, the default would be
> >>>> unsafe_panic:0. Otherwise the default would be unsafe_panic:1.
> >>>
> >>> How do you plan to use 'unsafe_panic' order exactly?
> >> 
> >> Currently at the end of panic() an unsafe flush occurs by simply
> >> iterating through the list of consoles. That list ordering does have a
> >> fixed algorithm behind it, but it is quite hard to follow.
> >
> > But is that flush invoked at all on the kdump/kexec path?
> >
> > As far as I can see, nbcon_atomic_flush_unsafe() has a single caller,
> > at the very end of vpanic(). So the unsafe consoles are only flushed in
> > one specific "kernel ending" case: panic() with panic_timeout=0 and no
> > crash kernel loaded.
> >
> > I think we are mixing two different topics here:
> >
> >    1) How to set the order of the unsafe flush (per console, from the
> >       cmdline and/or sysfs).
> >
> >    2) A hook at the "kernel ending" sites (the panic reboot path,
> >       __crash_kexec(), ...), so we do not forget to flush the unsafe
> >       consoles there.
> >
> > Should we split them? 
> >
> > The missing hook in 2) is what drops the netconsole panic output today,
> > while 1) is policy on top of it.
> 
> They are separate but related. We need to address the missing hooks. But
> we cannot simply add unsafe flushing to those hooks. We need to allow
> policy for that.
> 
> First we need to make sure all "kernel ending" points are doing proper
> atomic (safe!) flushing. Ideally these are either graceful endings, so
> the kthreads are properly shutdown and printk naturally transitions to
> atomic printing. Or they are emergency situations and printk must
> forcefully transition to atomic printing. (Netconsole does not yet
> benefit from this, but we need to be sure that safe consoles are
> covered.)
> 
> Then we need to add an interface to allow the user to specify policy for
> the points to determine unsafe flushing. I would request that the
> interface is such that we can extend it to allow ordering of that unsafe
> flushing.
> 
> Note that the interface may involve some significant rework on how
> netconsoles are managed.
> 
> This all needs to be coordinated with other things already in the queue
> due to the overlap in code and features:
> 
> - preferred console cleanup/refactor [0]
> 
> - CON_ENABLE cleanup [1]
> 
> - introduction of per-console loglevels [2]
> 
> - per-console replaying [3]
> 
> I am not suggesting that all these things must come first, but we need
> to keep an eye on the big picture rather than hacking in some quick
> workarounds for netconsole.

Right, thanks for the explanation and the links. Here is my view right now:

1) Converting netconsole to NBCON caused an undesired "regression" for
   users who would prefer the messages go out, even if unsafely. (as
   Ryan and Meta)

2) It seems the proper solution for this will take a few cycles.

3) I would hate to leave users with this "regression" we have today.

Do you have any suggestion for something doable in the short term?

Would reverting netconsole's NBCON conversion, while we address the
dependnecies above, be an option?

Thanks,
--breno
