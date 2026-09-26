Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF6854707C;
	Sat, 26 Sep 2026 21:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790459187; cv=none; b=I8qFrKVmrihq2Hen/AZ9IyIWqScbhDrV0F7bUhCAQwkegkbGS9UGqbNPcmOgTLVoXSclwMAruVapyU8wzRR5caDzQdvTngya82Omxy1u0DIUJyCEDY/4NNgKdS48Z0I2if06v5XuQaVvd4Aw/823Ke52NAFJoMWMrnQo7x9IxOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790459187; c=relaxed/simple;
	bh=4D8j5t2kDiD6jC/kbjpqNtt6dtPvlYzSRbZpma7WIJI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mG8gmrNXlLzmIoTC8hYrRIiD0RxCZ7i7LbX4P8IYTzp2pevLqfrcBmtzlLLYwCqOGdluAszRqsktu49ptVP4I0YQZmiPkkpW8REm4NNH7OjVSF+e2pkrs3OlvoFYNGpslQMombzEGCxPkmmsrxyyh+WYuQgDFJHBpS4wD3mogjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=J4BZIvlo; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="J4BZIvlo"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D1376408DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1790459185; bh=bTdsq5tpkz8OGYcaJQj+Tn3Qgku6M+vrpnf0W2UlFPI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=J4BZIvloxGFqFqxvGuofnZg+vGdusjq1MOlhUgHMJf/Ge0pTPSX/4Q7szpQsWA3+2
	 tHZ4I3r97XexYmpnJikaKxy/pNmvDddciX1v05C94X8TiBMmgs+IYNKN8XoSjhHpVy
	 1opsc3IKTFmAQc/jNdoYTbAclJa6kP96MsWTYatBbqfplVvrnPG/9awxfeBq4OIlfQ
	 B3AWjpdA9JYIL6dZmrir3oMjOLimfUrUbhmtTuBjLaxNSUPBDRKFYHeSnxfgAIEvEj
	 TMQV4qB8y9FVGx2YIsiRd0j0bl1/Zaljrk2B/bigGDNJOKzFdQwEcCXD6ByvBVYQ9Y
	 iOMWsHaR83vDQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D1376408DB;
	Sat, 26 Sep 2026 21:46:24 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Habil Eren =?utf-8?Q?T=C3=BCrker?= <habilerenturker@gmail.com>,
 clemens@ladisch.de,
 tglx@kernel.org
Cc: skhan@linuxfoundation.org, anna-maria@linutronix.de,
 frederic@kernel.org, linux-doc@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Habil Eren =?utf-8?Q?T=C3=BCrker?=
 <habilerenturker@hotmail.com>
Subject: Re: [PATCH v2 1/2] [PATCH v2 1/2] docs: timers: hpet: Modernize
 file references
In-Reply-To: <20260926180838.8145-2-habilerenturker@hotmail.com>
References: <87o72mg21g.fsf@moria.home.lwn.net>
 <20260926180838.8145-1-habilerenturker@hotmail.com>
 <20260926180838.8145-2-habilerenturker@hotmail.com>
Date: Sat, 26 Sep 2026 15:46:23 -0600
Message-ID: <87o6dj4rf4.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Habil Eren T=C3=BCrker" <habilerenturker@gmail.com> writes:

> The current HPET documentation contains outdated 'file:' prefixes for
> source tree references, which breaks proper rendering and hyperlink
> generation under the modern Sphinx-based documentation ecosystem.
>
> Fix this by modernizing the paths using the standard literal backticks
> formatting.
>
> Signed-off-by: Habil Eren T=C3=BCrker <habilerenturker@hotmail.com>
> ---
>  Documentation/timers/hpet.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/timers/hpet.rst b/Documentation/timers/hpet.rst
> index c9d05d3ca..fe02bfd5d 100644
> --- a/Documentation/timers/hpet.rst
> +++ b/Documentation/timers/hpet.rst
> @@ -23,8 +23,8 @@ The driver supports detection of HPET driver allocation=
 and initialization
>  of the HPET before the driver module_init routine is called.  This enabl=
es
>  platform code which uses timer 0 or 1 as the main timer to intercept HPET
>  initialization.  An example of this initialization can be found in
> -arch/x86/kernel/hpet.c.
> +``arch/x86/kernel/hpet.c``.
>=20=20
>  The driver provides a userspace API which resembles the API found in the
>  RTC driver framework.  An example user space program is provided in
> -file:samples/timers/hpet_example.c
> +``samples/timers/hpet_example.c``
> \ No newline at end of file

That last line is something you should really have fixed before sending
this patch.

Thanks,

jon
