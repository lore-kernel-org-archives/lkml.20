Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A17B44CAE4;
	Mon, 14 Sep 2026 13:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393676; cv=none; b=VJTwMqwrOUuKFGmXitcw132ndqwjjMdhJ2GJ/0qa4z/IEmhoVU0lDdovtgCSzA+bANAVSkR7/nVodRiMqx++A1KDo2afyyQ4Q1m/BjyXJsQIYQVFhHnVNa6Ts0+NwFuUniY32DhN07XFMC9KzLfSHxkiF1QYC3ShYuHv2Mi67Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393676; c=relaxed/simple;
	bh=CAgTSnv4pnIZV7i1R7rWbUvRIm0BwUUIKHgMWoiXJek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RFttxrl5HAXygOMINQpI3oaSuoTyO5tNdudxtpePrY046+s+sfsOTdF0/joLXmCfN+u5R5leNfMCiKwwMWXYAsGnsWmmt7mlAj11n5SdRuu2h0W82vhEYMflduAag+AepX1eGSrvA6mSM0DAzChHk2dLIJqCFZV1UkeiZ35c6+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y3b6l5Sy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3b6l5Sy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1F431F00893;
	Mon, 14 Sep 2026 13:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789393674;
	bh=N+C6bJ9lSz1Jpov7bJ535G9We/yIWpPULTUgpYQ3bu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y3b6l5Sy5djH0Axzhiu2XWukfUdypi5qXIMoXVqOrigWayJq8cIShonF7uT2jWATm
	 sPpyh+M/4iWRegTgf/c7cJ8TPe0E1PgC+w/QDMmLribgTuI25QmWAsIy/KZ+DQc0M/
	 kSVRdlHbj2AzsFvGYIJK8zlTXVi8G/1gtwP9UYyoF1foMNVWouRr9j0xohnjyo9puy
	 LaBdzW3iFMoflmlxEv1t85yXhToQ6KPFqqkM9fwlMzLKN8ZsoW/3dCFOR7Mvhb/NXF
	 2vXAaETbhb2us/gfKAQVPapIDHhE4meHEU4bP50CBmqi7RS0AaQkaUDwge0Q/1SRzo
	 pbzTRF3S6BIkg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 345AF1AC52F1; Mon, 14 Sep 2026 14:47:51 +0100 (BST)
Date: Mon, 14 Sep 2026 14:47:51 +0100
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: phucduc.bui@gmail.com, Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>, cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/13] ASoC: mediatek: mt8189: Propagate APLL enable
 errors
Message-ID: <aqf7B_E7_Gv5iK2A@sirena.co.uk>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
 <20260914072842.24420-3-phucduc.bui@gmail.com>
 <07add31d-5622-40eb-9bcf-f7cb2396fee3@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P/tFBbzpIceAToQ8"
Content-Disposition: inline
In-Reply-To: <07add31d-5622-40eb-9bcf-f7cb2396fee3@collabora.com>
X-Cookie: My vaseline is RUNNING...


--P/tFBbzpIceAToQ8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 03:22:21PM +0200, AngeloGioacchino Del Regno wrote:
> On 9/14/26 09:28, phucduc.bui@gmail.com wrote:

> > +	ret =3D regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
>=20
> Well, this is a bit of defensive programming here.
>=20
> The regmap pointer is already checked by the previous function call, and =
this is
> a regmap over MMIO... and MMIO writes can't fail.

Oh, you sweet summer child :) .  Though practically speaking the error
handling ends up being the same as if they couldn't fail since if
something goes wrong it's generally catastrophic stuff like locking the
core up completely so the end result is the same.

--P/tFBbzpIceAToQ8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqn+wYACgkQJNaLcl1U
h9BSxQf9G8Xdq5Mf7AwqiSpgu3Yw8i7t/TfDP30tuFFmVeW/ZnYzfZDEBEpqtW/1
Qjmdx6+OOp1KgYt3l6QLlZbYtHEBOZBGM5eJsqTcDLSk8hVK31B8bFhIRsY5hL1d
5O6xK5ZInZA3H/PtHbkWq0aqZg3cPA4ci/SyZ4xNmDjyV4bOP6gaSm2acMzSPLXi
AkdU2FfuRVfcOMh4C2UzY5MmmKzJL2BOI+KthHTluYVZdcNQleVv/Pgrwm2hpxcy
gXJ8CB55QEgkmY+6azNck8vAbUC+RK2vXpPbvbv3pOAM7NPXvP+i1PlNXGgDMAUF
6rpD0iFE9TeOFOWBmNioVfZZJrkaWQ==
=ffDW
-----END PGP SIGNATURE-----

--P/tFBbzpIceAToQ8--
