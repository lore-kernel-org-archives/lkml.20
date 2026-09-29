Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EBA4E433C;
	Tue, 29 Sep 2026 22:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790720712; cv=none; b=ofMGJM4YBfidLKi/9h0zbKUC0aI/OKM+SyVg2B6R5xqrRIkRu9wt11ojXwjtcNeljSVHy/Ie5oIso3faYEQxn0lddDp8p7hWJltQPrwaRdfaOWSa6G08xKmLub7rYmABAD3ja6PrmaQPqfuelDRo7OroVeX7FC+cGfvpEtkT/Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790720712; c=relaxed/simple;
	bh=ENNBz7pIjVLACCw4kTVPcY2lldiQqSGmUUVdhKiZy2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qRQAOhHq1FaICaJ4XN6hx9V1EF6GE6569MHPBE4hkb8jR4eJ3Hjxd0X/KhuVaHfrM1yhU+slMcU8G3K4SX4awC4+GwvvadYvKkPEJyBr8fXVYvurBG3o0L51JrhQcQTj6QxOaMQ1v6sZgvy3pRDbR+l2hmR5tbitaRv0d3XBnUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jagWTpPQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jagWTpPQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A871F000FF;
	Tue, 29 Sep 2026 22:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790720711;
	bh=BtEVrfA5U8YlVw8CgPkSuDt/UcyRuQN2Ek0KyAhl7kQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jagWTpPQiNaydyApd7D0ZLkxQjK5guYS1l+oP6x/deJNNaW0JM5Y//+gVlZjw197b
	 3Im1aAx1+1sSqRPMtECuTBnXq60fqiEBuRGq3rXvJyJvTzj39xd/oyLna0PEla7Y47
	 /u8J2i5cQCPWb0Enc8hReKop6Q8fng9N48SvJZZlHvuctIvsN1njVZXUQY6VCAN3oq
	 YlybCl5XmGTij/ZAk3q/zqI5+nS2T9BorGFOZil6MCejBznJXt1fHs/6ehCQXjta3c
	 pjCcgd48WrxCvzDmk0c/kucoXhNZqmyT+TIRe1w/Ln8RkCVAqOBMoMf+pHbHt/9b8v
	 tBb6vCsCseIAg==
Date: Tue, 29 Sep 2026 23:25:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Andreas Axelsson <andreas.axelsson@androscientia.com>
Cc: lgirdwood@gmail.com, shenghao-ding@ti.com, kevin-lu@ti.com,
	baojun.xu@ti.com, sen@ti.com, tiwai@suse.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: tas2781: Skip calibration data for other SPI
 devices
Message-ID: <d0169d44-af4f-4ebf-9e55-371ac1ebe0fc@sirena.org.uk>
References: <47904337-8887-4623-83df-c370a26adf03@androscientia.com>
 <e97bc4b2-69f7-4a71-8b32-9d3c60b2ca60@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rdht2h76iR+DhBuv"
Content-Disposition: inline
In-Reply-To: <e97bc4b2-69f7-4a71-8b32-9d3c60b2ca60@sirena.org.uk>
X-Cookie: 1 bulls, 3 cows.


--rdht2h76iR+DhBuv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 11:24:07PM +0100, Mark Brown wrote:
> On Tue, Sep 29, 2026 at 11:53:03PM +0200, Andreas Axelsson wrote:
>=20
> > v2:
> > - Rebased on current code. The tasdevice_process_block() part of v1
> > =A0 is superseded by commit 513480da5e9c; only the calibration part
> > =A0 remains.
>=20
> This applies on neither for-7.3 nor for-7.4 of:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
>=20
> As a fix I'd expect to apply it on for-7.3.  I'm also seeing a conflict
> against Linus' current tree.

BTW you might want to look into using b4 to send - looking again I see
it's not actually a conflict but rather a formatting issue:

Patch failed at 0001 ASoC: tas2781: Skip calibration data for other SPI dev=
ices
error: git diff header lacks filename information when removing 1 leading p=
athname component (line 13)
error: could not build fake ancestor

You might want to look at b4 to send the patches, especially it's web
submission endpoint which avoids having to configure mail:

   https://b4.docs.kernel.org/en/latest/contributor/overview.html


--rdht2h76iR+DhBuv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq8OsIACgkQJNaLcl1U
h9BUJgf/Uoj0yyEPcpJMRfq+dOg32n/S6sIUJI9o/bVT9s4DCfeGa/hlHeJglThx
aFLYSEnhxMalIUQqFK6ajitddfeWyppZXytcAAabjgw4b2lX/t1akUmnUZjIjqVJ
AnsSTgpjJ/WWdOXuNAlmy68U44P82smjHiUtvBpPPvWys5FvABxvFGQT4ejdyTTV
pzKVlsjR+dAW6P3aUIQCWFRA2NOcO0ZgkJYVOS4C1t9aREaGKvrhGXOgbYwDHT8j
guLT0gvlji9d8HL5XGtbvNkineGb9NK8CI0cJcyFedWgTz3piUGNaD9l6D5zYMF/
662137eSX47nH/NeQ+hd+VlmdlXBpA==
=crho
-----END PGP SIGNATURE-----

--rdht2h76iR+DhBuv--
