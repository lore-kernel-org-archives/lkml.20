Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784C43E51D4;
	Sun, 20 Sep 2026 10:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789899019; cv=none; b=qY6zCmrKBg0DdT/ypqG/oXlS/lj8FyBAIjqO61ovaGv+lzxem9mpwjPmB08yQ8bkNAQPtfof/DaKH6g6Q+nBvjtKSJgm7pSrAZnQfqtak4tqu6/am4r3sKNWDoxfoTsosWdqd8bqXwtTvTXpsZcxxcvoI8OO3//ZXHExWTiD24o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789899019; c=relaxed/simple;
	bh=Az9x9Mk4SaaV3J5fxq5sZTKbV0Vqdtzji+xpH0pL0I0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bF3M5jrsxL42pccRLusAHh6EABsSLW8yUmPvDWVRxAOibDZMtPgmGvTYIOEa6K9mSjM8K3C3ySyY474wJsdG6aVSd1NO5xmt2dlGDsAAt1+m/D9YazJ+C4sIaOorzvrh1FCwWEjDc9tpLMTKxape7ySj9se+wzvvgqMIZnydl6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bbng4Gzg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bbng4Gzg"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 647511F000FF;
	Sun, 20 Sep 2026 10:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789899018;
	bh=GeuD9wvoIfPdEDdzWaQKdWTanlPA8SiZGuucbOYAj7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bbng4GzgNfDj0gxWGpc2bsOqId7NmjYk7F0QVz7q5mWA9CZFLJJ5k7gu9gzhSTCVN
	 nIsRb/auNXN2d9/cW+lmnqAIpQufsifugJrq90nozEstw0xhN2gjPAJqmdayyzGhoc
	 DJbAmw9n/WRZe1qpezn+m4/P1YRjwZIWy/wE1l3/YeDwBxkz/ePgWtpmPpidumKFI5
	 f9BxE1vdtxAwOhuv3IwctNtYow+tgqQHwqSSp226mdX9Qz2aYBL4qbfdDlkKiJKr2R
	 M79rtPxGF16BT0opGCGrmtCiEKevfwOCncrBabn2VMGsyf3KAAbgx+vTv540aho5hG
	 Acm64ULOfpnfw==
Date: Sun, 20 Sep 2026 12:10:15 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: users@linux.kernel.org, linux-kernel@vger.kernel.org, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, lpcosse-keysigning@baylibre.com
Subject: Re: PGP keysigning at LPC/OSSE 2026 (Reminder for registration)
Message-ID: <aq-wN34RCBNCRGK8@monoceros>
References: <aqj-ylAvjuHZeOan@monoceros>
 <CAMuHMdXXVabVQq9Y_H3NKWTHciBuqZmkzrr78wGMi76DBZoVoQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ssc76yvltvhejjlc"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXXVabVQq9Y_H3NKWTHciBuqZmkzrr78wGMi76DBZoVoQ@mail.gmail.com>


--ssc76yvltvhejjlc
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: PGP keysigning at LPC/OSSE 2026 (Reminder for registration)
MIME-Version: 1.0

Hello Geert,

On Sun, Sep 20, 2026 at 10:35:36AM +0200, Geert Uytterhoeven wrote:
> On Tue, 15 Sept 2026 at 10:25, Uwe Kleine-K=F6nig <ukleinek@kernel.org> w=
rote:
> > this is a reminder for the PGP keysigning event held during Linux
> > Plumbers and Open Source Summit Europe in Prague this October.
>=20
> Thanks for organizing!
>=20
> > While it's not mandatory, it will speed up and simplify the processes if
> > you register with your certificate for the event. Please do so by
> > sending your public key to lpcosse-keysigning@baylibre.com until
> > 2026-09-27 08:00 UTC. If you saw the initial announcement[1] and thought
> > it was still to early and I'm on vacation, please hit reply now and
> > attach (or include inline) your certificate which can probably be
> > generated using:
> >
> >         gpg --export --armor your-email-address@example.com
>=20
> Note that this would include all your expired/revokes keys (if any),
> so you may want to specify the key ID instead.

That's right, and that's why I wrote "probably" above. So if you're
unsure, check the output of

	gpg --list-key $whatever

to match what you intend to send and only then do

	gpg --export --armor $whatever

=2E

Best regards
Uwe

--ssc76yvltvhejjlc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqvsQQACgkQj4D7WH0S
/k4vLAgAsnc/zmj9mplPTdFj/5wDVCsVhKXKl8a3g3R0KamCTPy/hKSXfgWqODzp
CxTKPh/rLwq+zkTIN3e5DcVcme/mh63i8e+wdLQd1IaaROg8fs8fO0+yJiDZFbfa
O0TcmsKD8y5FzzSnxkN2jZ3PTmt+kWcI8rfGOPL39wdLFY8Bn7Xz/NWUriG8bRd3
ApHxn1mXGlgAuoDMfhc0iLtcT4AITfUZsPQS8sZMyl90YtWJNh6qjb1hPNPBEgGl
kPO7+SymjzGOpryP9o8Yf60Lah7bdmyzKpkyNctlwIlUKL0tLGBYHpanaLefLLAP
37wg5AhQ2ZTCbGyJZC5lRI8lPj8uww==
=ICq5
-----END PGP SIGNATURE-----

--ssc76yvltvhejjlc--
