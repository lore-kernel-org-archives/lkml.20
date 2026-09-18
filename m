Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF2C22F388;
	Fri, 18 Sep 2026 12:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789736309; cv=none; b=CFB1G03KuyEOIIB75D4TQVNKmIXSlZjjG6WRIKkj1TcJQy5Mw4y3yPD1YVaxqj0JBqxCTY59utVNsDWV2KmjJ5o7ovJQZHO0rC3Q72QoMMWvPO8bpKXp8r9D4cdG0cgRTstZ61jxwjGYWpy8UlAaDAhSMPlwAVO3pGW91/nsRTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789736309; c=relaxed/simple;
	bh=wh++EqrOBPnGZ/ARtdplZFDl3TNJ4RAP5iWDWRqtUuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oex0AhK/vcrDdfCDj2Fh73BYlkkDdCWFHIvGs5HnGlU6WAxlJVERAa1ws0C+Dlcq3iKow1WzvSl05oEe0WQsRe4AmTNVfw2o9r/To3RfEHOWSxm06vt8uJ6ou/7x17ffgozU6eUoxDC4ckCCnk5MURy+teEQbUzHskCUIIoFuVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8O4Mfr0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8O4Mfr0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD981F000FF;
	Fri, 18 Sep 2026 12:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789736307;
	bh=+jZjMknHkx8BX5rBouTl+QaAXJkEXnMFJLCmzg+gkxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q8O4Mfr0Su2K5lTU44Xq3rNWrYkvq42k3ONRlPM4rj9vUnnVa6GbPi/LCJQl/V3kz
	 G5MjEpO6KYM6JrVteRD2Xs3uQ1Q6bU4bGyiaOWm+kY6l88yKFUNFn6kv5KHEBL/yvY
	 Yke5LJKkOiBBnnXAjwLtotYXygQ4PPx2hOAe3b2Nu1+uidlTjZMlhCintKK5gd6jeJ
	 o8gw+DUvOIJ2D5cKPtdawHT0LarR6NSuFknqFx5O2WAuo45pTxSXOo+TTKvLoiGFVU
	 troKaVmcL036hWbESJIMB2+2pk0HYI/a1HF/XsnjpPRouSPCZ2hvDLJBTPcffrm7hZ
	 Mudx0iBNw5A4Q==
Date: Fri, 18 Sep 2026 13:58:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Mizuno Miotsuki <founder@crepuse.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>
Subject: Re: [RFC PATCH 0/1] ASoC: codecs: rk3308: add support for codec
 revision B
Message-ID: <cb148119-a746-4b9d-8a3d-fc209ca6adf4@sirena.org.uk>
References: <20260918125711.94361-1-founder@crepuse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qvbS5Oge9x2b8SxP"
Content-Disposition: inline
In-Reply-To: <20260918125711.94361-1-founder@crepuse.com>
X-Cookie: Dental health is next to mental health.


--qvbS5Oge9x2b8SxP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 12:57:18PM +0000, Mizuno Miotsuki wrote:
> Hi,
>=20
> The current RK3308 internal codec driver detects codec revision B
> (chip ID 0x3308) but explicitly rejects it. The initial 2022 driver
> supported revision B with a monolithic power sequence; the later DAPM

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--qvbS5Oge9x2b8SxP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqtNW0ACgkQJNaLcl1U
h9CTNwf9GJmFyuc4fcVhx8SuWBebDybhaOwU0LFcm5L8TKMj2CNRjpPGf1e2+AOE
QF2Nm2Wv/SRiraKuRy1qAcp8dJZ1L9iq2oyXtmi6OrOgo3E3DFOhrSB4S3RH+vPb
j103vXQXYPbRyL6WU4Or0+mYZI3Gk5XjMjrhTMF4YM0B231P8sQ6HCNbU+N/pHjl
yzhUq00NSYmxJNCfuHicITvfTTzM3wK7K81HiiPLd/0O6nQEV4K800KAl6GaKuGE
WVk94TD69U5VHjztI8bF1Eufv6+JRFBvcYTRJZs4GuffVMpjJcHbQXzBOHxyHszS
sOZe0f0UAJDhNbkXtss9PJwYbJv1Ug==
=6+fK
-----END PGP SIGNATURE-----

--qvbS5Oge9x2b8SxP--
