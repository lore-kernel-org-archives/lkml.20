Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794067221;
	b=JYuverc3J9GIYlZcOrqkLouMa6IZUrNAoRVrh5FJ9uOZ3gbT/0FoqBWUY+CuSXUQz3Dl
	 6mqTt8OahAdQ/F3iYYL2EGSTo1OnuLafG2eEqrOwjJ6x8Yofvm8l4Xog3K03fE7VCkEcf
	 mP2gpnmDWMP4UMigX0zbx9qASdLu8h3mUylJPgYsKg4iVRbufZGEVTU1Px/mTdqgyFVyp
	 xX3ODbNumc8wh6quWJ31GCmyz3LPTIt22LyqCYEBw6qACGznUQbbzE2hqOhDPib+AucUd
	 ddKH652HBuoSm+8fFro6gW5l9UCnjwJ9asHn9ju9B2aiHWoYFC261Rfss0KnPvHkLww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794067221;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=ArOxjA9/kNed9+49iETydsddSuLzELHsS2ZSf7G4VZw=;
	b=OFZEIvnFfAYF60vaiG43vZPVjHmeX7zBQAiLLfPoYkvEc+Wrha7kMr955Ou55N/R9DIB
	 4tXZDVQN/rvVwFBhbJL1y4kFKqo4FvSc0sKv+702UPGc5xFaf3bln24mTAOA70wKY7k6v
	 jR1wlLqz+K+hnaS6Dp1pibQliHVyhLM/WV32waKMzdTbF72lfzSZ/dsMLe7dO/Tfq0ddY
	 QHUNyXg/AUFb3w8O8qibGlliyzHZjJ/ZcXtyt7dyaCORIHP1dc7swB9SY22Js6XmPdp7o
	 rXXMnXjAcT73O2/4SMKwGk61mSxwccX+h1LEAWwk2YdOiAigpkUIdc2Jef9YwRasIxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m0iRscL1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE30606A326;
	Sat,  7 Nov 2026 16:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m0iRscL1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DCB71F0089F;
	Sat,  7 Nov 2026 16:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794067221;
	bh=ArOxjA9/kNed9+49iETydsddSuLzELHsS2ZSf7G4VZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m0iRscL1Nf8EfRCl/yA11zT79f5EHr+rAOw79/Ks6ImTlLGyTQSUFugaZlcT8yNj3
	 9cvfc2TvrORa0cccyrlEOObHXRzeHQ4kiG1F94M7wIPPrYoSp2Ct65yHqMNHAcb7tz
	 7lYPcoP6Rv5fO8RkLCnFNdoWcT4LuvfPPgP1W/fsBst9OoYpWwoOkM+iUsGI8p/yE8
	 PdYGCat4cK8OtSq6w1Fi+km5PQSkehP9DBGrPt0/W+sg9dveKMeY9zGUDcZdygF3Vo
	 a5Fw1/Ps2PRfXgfYNI9j6FtW5gr+sdGvBx1TyD9s2i1JQsuRG0DxFtSbIDcND/sHW4
	 /tMm+7a4adPEA==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 0E5842B35F00; Sat, 07 Nov 2026 16:00:18 +0000 (GMT)
Date: Sat, 7 Nov 2026 16:00:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Chancel Liu <chancel.liu@oss.nxp.com>
Cc: shengjiu.wang@oss.nxp.com, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
	festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: fsl_asrc_dma: fix error handling for DMA channel
 retrieval
Message-ID: <7a9ae82c-838a-4543-91f6-e4f6397c4e91@sirena.org.uk>
References: <20261028025921.4155551-1-shengjiu.wang@oss.nxp.com>
 <11ef44f7-e268-438f-8a42-c3bb89e42cfc@oss.nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0T4D+cL7iXVxGEVX"
Content-Disposition: inline
In-Reply-To: <11ef44f7-e268-438f-8a42-c3bb89e42cfc@oss.nxp.com>
X-Cookie: Whoever dies with the most toys wins.


--0T4D+cL7iXVxGEVX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 01:50:46PM +0800, Chancel Liu wrote:
> On 10/28/2026 10:59 AM, shengjiu.wang@oss.nxp.com wrote:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >=20
> > The original check used `if (!tmp_chan)`, which only catches NULL point=
ers.
> > However `asrc->get_dma_channel()` returns an error pointer. The NULL ch=
eck
> > will always succeed, so replace it with `IS_ERR(tmp_chan)` to correctly
> > detect errors.
> >=20
> > Fixes: b4136c0d69ea ("ASoC: fsl_asrc: check the second front-end DMA ch=
annel")
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>=20
> Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Note that if you send from an address other than the one you're using
for your R-b it'll be ignored by the tooling.

--0T4D+cL7iXVxGEVX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCau9LEQAKCRAv73Ows9A4
id2uAQCPedGJPX4573rTGqBo52iWaNHcKDS6Cnz2BWtcJ4ZmVQEA5EwLlQBDtobL
U9++hIw2RYpFKi+l4LjOjVTs6aecsQs=
=1zZq
-----END PGP SIGNATURE-----

--0T4D+cL7iXVxGEVX--
