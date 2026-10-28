Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793222131;
	b=HkT3vVrK9hynq+raZvazz4vHqxyDTLTEIwSpbeLw4y94ovI5lVA+l3zmxaS2lMLXbZ2U
	 9/gI1g90twb+aJTBxqWHFL4RZQYLWHx+TSUTRURCkn0GWHV/pu9SlhXiqLFAmJzMgX/Ux
	 ZuvX0bPGsP7iAf6zqU3s77TPcC/OeAkCTjJQk6Ums0hPyyQVIBVKGmDr+Bm7Lb4FNYsup
	 m04GQlLGjgK1HjiXWeQs1mwl/rBcjgpRonCTLvdzdBKGUnFLsoadTOc4d/1tQ17QmG6CW
	 8dkztcsCV0/SkcTPp4nRc1WPJo+euImMmfazx2QmH9k9rFlbuPMdYyXkmuvsQh2CauQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793222131;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=DJw/P/p13sGLrgQy8K+iNcdauxRi1zjpnlKKuDVJEpQ=;
	b=Z3UOgThD6FuQftH81NHsEAFkCPP59j9YTK/dHdkMnjG+iWr8CLeDlInVD76uGRe3l/bZ
	 0NkCYROVEyUsYQmZNwHJh7WzJsmXMpXuVa15+eBNPPGWcFrZIAmsiLYsvHCi1RpJ1iA/N
	 6KMyshL6w5OGANpPIfPJfnAXKnv7HFxl0TItzL8M1WUy5JqjbcnW7SaESwi+gcUXgtp7t
	 pq9C3Ya8FdzSt1xg8KUTPFumQI5uNKXb4mfnwNp/v9DBthbzlHZChKFRjs9SZH/X2wGVB
	 aGK/qD5savE7KoefWv5GR/q6FB9L/DGCjnZr5g9Kzlvpw3yRm1yczK7NmSsaujmj/hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=Su4CJ0ij;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF322606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:15:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF322606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=Su4CJ0ij
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DJw/P/p13sGLrgQy8K+iNcdauxRi1zjpnlKKuDVJEpQ=; b=Su4CJ0ijklPuOWVq8DHU11eLmU
	lN0qlCnxA3LcmBef3kgq0i/HUMMjYx2FEsdFWfo3wzLv5y4j0ulfgAsOa2cUQf3epA0/aUQxFiyFe
	3NK/SivDLZq87LQLYRTeW48coAnzqABSzz/t5+NFwfk/LCrfoIp/x5ahG5tZhuozOjD1Rg0ocXPMi
	ZsZfljWZ7hsZ2FU2Gr8EeMoLPdyv5DuY23elnFZJdUk1UREmxoEd8yYFMKaIdZoqb30utF+4VWkiz
	/wVC78Xd2BUcbRfbnIYIxT9NwLRkg23+UoJy3jRbiv7Xb/U383nOcT8Cz1I9XkSfKqUzGxFu3aNAw
	dK5eUrjg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xMAzJ-002Wnj-3A;
	Wed, 28 Oct 2026 21:15:14 +0000
Date: Wed, 28 Oct 2026 14:15:08 -0700
From: Breno Leitao <leitao@debian.org>
To: John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Rio <rioo.tsukatsukii@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] panic: Flush unsafe consoles before panic reboot
Message-ID: <auI40MZlSYO0oAAS@gmail.com>
References: <20260915100140.3631650-1-ryan.roberts@arm.com>
 <aqqU3I7d9lMAjSvy@pathway.suse.cz>
 <87bj8kkfwk.fsf@jogness.linutronix.de>
 <auHNz09oyGFJPTKg@gmail.com>
 <8733tphow9.fsf@jogness.linutronix.de>
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
In-Reply-To: <8733tphow9.fsf@jogness.linutronix.de>
X-Debian-User: leitao

On Wed, Oct 28, 2026 at 03:43:42PM +0106, John Ogness wrote:
> On 2026-10-28, Breno Leitao <leitao@debian.org> wrote:
> >> For consoles with CON_NBCON_ATOMIC_UNSAFE, the default would be
> >> unsafe_panic:0. Otherwise the default would be unsafe_panic:1.
> >
> > How do you plan to use 'unsafe_panic' order exactly?
> 
> Currently at the end of panic() an unsafe flush occurs by simply
> iterating through the list of consoles. That list ordering does have a
> fixed algorithm behind it, but it is quite hard to follow.

But is that flush invoked at all on the kdump/kexec path?

As far as I can see, nbcon_atomic_flush_unsafe() has a single caller,
at the very end of vpanic(). So the unsafe consoles are only flushed in
one specific "kernel ending" case: panic() with panic_timeout=0 and no
crash kernel loaded.

I think we are mixing two different topics here:

   1) How to set the order of the unsafe flush (per console, from the
      cmdline and/or sysfs).

   2) A hook at the "kernel ending" sites (the panic reboot path,
      __crash_kexec(), ...), so we do not forget to flush the unsafe
      consoles there.

Should we split them? 

The missing hook in 2) is what drops the netconsole panic output today,
while 1) is policy on top of it.

Thanks for the suggestions,
--breno
