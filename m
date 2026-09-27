Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B8D394788
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790514547; cv=none; b=n+PTA3Jp+AauvgWwfdEg2Rty2gXLZ+vBVkYVMznhF6v/57eSEqX7ydfNVpcbMgCyX0659iNIytSz4hrJujiV9oy9bxmsPsDGWKZT49Zd3fgXqT5wZDR6Bh7hS3bwcR3UEzyg6EmaGbpxPVx17lA55QEazHmsVo4wZ+Ms0bFo+qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790514547; c=relaxed/simple;
	bh=p8cuTqB63Yb52it0uQ1rI/16o4t7JWON0vFkBE7SYyU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Xeousrjs2e5P2vhEJV0FsERRJXgGU8DTLPi3hS/zXBdlJrWD67QmOoxuxaPrSFZWHZpYtfscrW9tVrt75Dq9k9K1zqazipQJLWdlm0KmU0oIrI2U1BMoRNuZRrYtvZX8dV9LrVc+ittcPnYCDsQN8U+L53wpR4kff20LOee4wXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=I0EJGoaX; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="I0EJGoaX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=p8cuTqB63Yb52it0uQ1rI/16o4t7JWON0vFkBE7SYyU=; b=I0EJGo
	aXQeaHIsce+0XKsVJZATDIl5O/bQqt+cvO/3jkNeh8StPEWJzCHbdvUs6KCbPRB0ndYxgBBoSwEta
	i1Vtcy2Cdeb7hV/9xlXwXadRqjYQFUtl41PMZ8N6oq16mbJCFJH4ABHd4w+IkjCKUgNV3nHod5H4P
	s1pzK8lbK0+8WD1i4MvBKA+dqk9K/eCqgTj92D3GhcIze1ixWEMiFmYXKjJh5qdx6fSH6q32lJb77
	7CiUhRlcXnxT8eaRmac36+qwFaF7hGLd98EFfstlgBFLHNoDPTUXvcb7RNRM2tuqUJFgYq5o564Mj
	c3sRMir7urgYsvg+dCy3dMeW+D2Q==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xAocX-00000008JaD-33OC;
	Sun, 27 Sep 2026 13:08:45 +0000
Message-ID: <ad2b5eaf6ec0d238ef42d4791e3754b73cb540ed.camel@surriel.com>
Subject: Re: [PATCH v2] tick/nohz: Avoid unused timekeeping_max_deferment()
 calls
From: Rik van Riel <riel@surriel.com>
To: Usama Arif <usama.arif@linux.dev>, anna-maria@linutronix.de, 
	frederic@kernel.org, linux-kernel@vger.kernel.org, mingo@kernel.org, 
	tglx@kernel.org
Cc: hannes@cmpxchg.org, shakeel.butt@linux.dev
Date: Sun, 27 Sep 2026 09:08:45 -0400
In-Reply-To: <20260918133408.2834751-1-usama.arif@linux.dev>
References: <20260918133408.2834751-1-usama.arif@linux.dev>
Autocrypt: addr=riel@surriel.com; prefer-encrypt=mutual;
 keydata=mQENBFIt3aUBCADCK0LicyCYyMa0E1lodCDUBf6G+6C5UXKG1jEYwQu49cc/gUBTTk33A
 eo2hjn4JinVaPF3zfZprnKMEGGv4dHvEOCPWiNhlz5RtqH3SKJllq2dpeMS9RqbMvDA36rlJIIo47
 Z/nl6IA8MDhSqyqdnTY8z7LnQHqq16jAqwo7Ll9qALXz4yG1ZdSCmo80VPetBZZPw7WMjo+1hByv/
 lvdFnLfiQ52tayuuC1r9x2qZ/SYWd2M4p/f5CLmvG9UcnkbYFsKWz8bwOBWKg1PQcaYHLx06sHGdY
 dIDaeVvkIfMFwAprSo5EFU+aes2VB2ZjugOTbkkW2aPSWTRsBhPHhV6dABEBAAG0HlJpayB2YW4gU
 mllbCA8cmllbEByZWRoYXQuY29tPokBHwQwAQIACQUCW5LcVgIdIAAKCRDOed6ShMTeg05SB/986o
 gEgdq4byrtaBQKFg5LWfd8e+h+QzLOg/T8mSS3dJzFXe5JBOfvYg7Bj47xXi9I5sM+I9Lu9+1XVb/
 r2rGJrU1DwA09TnmyFtK76bgMF0sBEh1ECILYNQTEIemzNFwOWLZZlEhZFRJsZyX+mtEp/WQIygHV
 WjwuP69VJw+fPQvLOGn4j8W9QXuvhha7u1QJ7mYx4dLGHrZlHdwDsqpvWsW+3rsIqs1BBe5/Itz9o
 6y9gLNtQzwmSDioV8KhF85VmYInslhv5tUtMEppfdTLyX4SUKh8ftNIVmH9mXyRCZclSoa6IMd635
 Jq1Pj2/Lp64tOzSvN5Y9zaiCc5FucXtB9SaWsgdmFuIFJpZWwgPHJpZWxAc3VycmllbC5jb20+iQE
 +BBMBAgAoBQJSLd2lAhsjBQkSzAMABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDOed6ShMTe
 g4PpB/0ZivKYFt0LaB22ssWUrBoeNWCP1NY/lkq2QbPhR3agLB7ZXI97PF2z/5QD9Fuy/FD/jddPx
 KRTvFCtHcEzTOcFjBmf52uqgt3U40H9GM++0IM0yHusd9EzlaWsbp09vsAV2DwdqS69x9RPbvE/Ne
 fO5subhocH76okcF/aQiQ+oj2j6LJZGBJBVigOHg+4zyzdDgKM+jp0bvDI51KQ4XfxV593OhvkS3z
 3FPx0CE7l62WhWrieHyBblqvkTYgJ6dq4bsYpqxxGJOkQ47WpEUx6onH+rImWmPJbSYGhwBzTo0Mm
 G1Nb1qGPG+mTrSmJjDRxrwf1zjmYqQreWVSFEt26tBpSaWsgdmFuIFJpZWwgPHJpZWxAZmIuY29tP
 okBPgQTAQIAKAUCW5LbiAIbIwUJEswDAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQznneko
 TE3oOUEQgAsrGxjTC1bGtZyuvyQPcXclap11Ogib6rQywGYu6/Mnkbd6hbyY3wpdyQii/cas2S44N
 cQj8HkGv91JLVE24/Wt0gITPCH3rLVJJDGQxprHTVDs1t1RAbsbp0XTksZPCNWDGYIBo2aHDwErhI
 omYQ0Xluo1WBtH/UmHgirHvclsou1Ks9jyTxiPyUKRfae7GNOFiX99+ZlB27P3t8CjtSO831Ij0Ip
 QrfooZ21YVlUKw0Wy6Ll8EyefyrEYSh8KTm8dQj4O7xxvdg865TLeLpho5PwDRF+/mR3qi8CdGbkE
 c4pYZQO8UDXUN4S+pe0aTeTqlYw8rRHWF9TnvtpcNzZw==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-09-18 at 06:34 -0700, Usama Arif wrote:
> tick_nohz_next_event() limits a CPU's sleep interval to the maximum
> deferment supported by the current clocksource when that CPU owns the
> do_timer() duty. If the duty is unassigned, the limit also applies
> when
> the CPU's TS_FLAG_DO_TIMER_LAST flag is set.
>=20
> After the early timer checks, the function currently reads the
> maximum
> deferment unconditionally. It then replaces the result with KTIME_MAX
> unless one of the two conditions above applies.
>=20
> timekeeping_max_deferment() performs a seqcount-protected read of the
> shared timekeeper and follows its clocksource pointer. Check the
> do_timer
> state first and avoid this work when the result would be discarded.
> This
> leaves the resulting expiry unchanged and reduces accesses to
> timekeeper
> data that is modified regularly.
>=20
> On x86-64 this removes 18-20 dynamically executed instructions,
> including
> the call, from the common non-owner path when the seqcount does not
> retry.
>=20
> Signed-off-by: Usama Arif <usama.arif@linux.dev>

The changelog confused me a little at first, but after
reading through the code it all made sense.

Reviewed-by: Rik van Riel <riel@surriel.com>

--=20
All Rights Reversed.
