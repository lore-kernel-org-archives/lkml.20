Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5B23D3324;
	Tue, 15 Sep 2026 08:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460182; cv=none; b=pXBB00b07MT4Aqnrt6h7DOydzSBo9B9bgcH7qwLeStjFMyJImsUgUx9XfVZenFCeEuoPTPwNYzUBfAJSSF4TPuKvf+R5dLZsfqJbMCFLN1SbMea1KqFEkw/AkvISdbRx8chUbLzitbtgS4wVioNgk6QWcnRDqnUUblQn2E5bJIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460182; c=relaxed/simple;
	bh=XagtcxOa8xvSZDgu/L/xg7xq53FaRi0iTygmi79Ar+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PPI3G9wqW+vTDiAhsHaIa9mvNMZx7l1/nelaQ329y7nPy/V0MwetTL2KnGhc5EA4psn2DuSZc3mi8BKODHJ121X5u/7OtPXvR+YkCiizNf68JeNPw8vgoBqt3HtAwPNi/uEJFmne/pf+8q/PTLAQho7mtxitrwFRCDt+rYM5+vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e29SXYqT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e29SXYqT"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id A1CDF1F000FF;
	Tue, 15 Sep 2026 08:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789460180;
	bh=mkRsG37yKsoQNolMKPENxObXk4yYEmyNG/LIkUxCBRk=;
	h=Date:From:To:Cc:Subject:Reply-To;
	b=e29SXYqTNexTQGXWrwrbMOMuszqj2fBjfIOrQdjUS3ZKXRNw4GMnyW7Yl43BIszjz
	 W9+pqxgrWUT1JGOAbfEWXFNpOluvHBg05ynG/OiVNcAod+3cGDSFY/AJ5DbsXlxyZh
	 LFq0716JYv6qSWTJ8XJMpcK1IhARmZaxpGF6J9NCyRG6SfCfEehdpwMdt1j1L5rd1D
	 YztjE9rzFSCsWt0XHOQY7yi3Secc0nqXY8N5cLlXibdoML5ZA4n4r3Is5MfoWJFxCY
	 u5FbhJRRwK2VaBrlCzifJC0PltUwlZexxuvlLl/sYnNHmdT26D2fbigNG655HkBGJm
	 vgn5m+XHVeTug==
Date: Tue, 15 Sep 2026 10:16:10 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: users@linux.kernel.org
Cc: linux-kernel@vger.kernel.org, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, lpcosse-keysigning@baylibre.com
Subject: PGP keysigning at LPC/OSSE 2026 (Reminder for registration)
Message-ID: <aqj-ylAvjuHZeOan@monoceros>
Reply-To: lpcosse-keysigning@baylibre.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="upyugubhpcr4clyg"
Content-Disposition: inline


--upyugubhpcr4clyg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: PGP keysigning at LPC/OSSE 2026 (Reminder for registration)
MIME-Version: 1.0

Hello,

this is a reminder for the PGP keysigning event held during Linux
Plumbers and Open Source Summit Europe in Prague this October.

While it's not mandatory, it will speed up and simplify the processes if
you register with your certificate for the event. Please do so by
sending your public key to lpcosse-keysigning@baylibre.com until
2026-09-27 08:00 UTC. If you saw the initial announcement[1] and thought
it was still to early and I'm on vacation, please hit reply now and
attach (or include inline) your certificate which can probably be
generated using:

	gpg --export --armor your-email-address@example.com

.

I will create a list of all registrants and their certificates such that
you will end up with less small paper strips to handle. It will also
help me to estimate the size of the group such that an appropriate place
for the meeting can be selected.

Note the list of participants will be public. It contains essentially
the info from your certificate. If you have concerns about that, please
don't register. (But note that if you're using your key in the
community, the same information is out there anyhow.)

As long as my time permits, I will also look at the certificates I
receive and point out things that might be worth doing before the event.
So in your own interest don't wait until a few seconds before the
registration deadline. Also if I don't reply that's a strong hint that
Google didn't accept your mail. Sending your mail early allows to catch
that.

If things are unclear, don't hesitate to ask. I created
#lpcosse2026-keysigning on the libera irc network for that, or send me
an email to the above email alias.

Looking forward to meet you in Prague,
Uwe

[1] https://lore.kernel.org/lkml/lpcosse2026-keysigning@baylibre.com

--upyugubhpcr4clyg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqo/sgACgkQj4D7WH0S
/k7zMAf+NH5aIY3+jw3kCIXDlbBywk9X11kadXNUEc5AjXcpmIHrgyCyP0uxi0fy
QFXpqIcxzwoBFwxeb+/F53+kwoYeLiU31VhnGr9z6NghI2UwO4T+lIEN+I3X0y2J
Xj5P5v5JLN7mqK/02jPRXEhabEejldTknPKV0AZliBTFnsNC9AwrVOT17xMreskt
14WB7GiRSkrltBHfPiL2TumFbhNLOc0uUlE6q7jdbNSEQ11uomqZCmag+kla9glg
M3D58GAcIqWGPn+qJv6Tl0mm040U/73w4yJLmo1IifWD0FOWFXlZ8IKQv438dXCk
/y8FTZcXQRDeLHO538Qs/wZ8/yvW5w==
=lwhB
-----END PGP SIGNATURE-----

--upyugubhpcr4clyg--
