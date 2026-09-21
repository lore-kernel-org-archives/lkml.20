Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E224B4893;
	Mon, 21 Sep 2026 15:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004351; cv=none; b=e7Ds8z8PNg2H1lEl/x5G+mqXfihiy9w8b0V+qxYMf+PEu6pXAHM5J1PfqV6e+4jddfgGNOFEjJolwYy8JExr9hzOzRMi4PHfj8dD00EIoW/q5/tQsg7onli0f4v9SFAN0SXxLEyrnRANvsqIfoYCrLkG0UaUfmQ99pq5iRC/wcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004351; c=relaxed/simple;
	bh=52tNeDu8Sx+QHd6wEVEFM9NUN84pRBXq3nOTjLgEzE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g/GrFsYM5qEzX3JItTrYGRi3XUUCS4/Ky6Nc8hQ21nMnD9D+PLa7dCw4b+hGMBuQEVXixOM/LMR5iTx0/9OOyBSCL0i7VDAu9iqIHMGumJ6gVjFlorSJasMAB4pEmba+BOeaP+BoRxeH4K5DBaymcRvdT2zKOqtWuEE1wFJUpAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lx18RnvP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lx18RnvP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2B221F000FF;
	Mon, 21 Sep 2026 15:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790004349;
	bh=52tNeDu8Sx+QHd6wEVEFM9NUN84pRBXq3nOTjLgEzE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lx18RnvPmerMwYKQBdZc24TN0CA72fv1PlKnIN7fmREb7z4DLrOzWNxX0v1AfkThT
	 2on/RpJJUThi4V13fYJKL2Orrx5UD2dx4E38CnNYuvwOUU6bgjsNJ5hsuzm1zwAxCl
	 01DDbFqnAHOV56oV49xPxn5toCEHk2gjkb/Po/jisxflIq8qlh9vxjUCN4PvcR9tKe
	 XoOIXln291MBXqB0BLKdNEl0l33QzQpmeM8f0MGLf5uWGgFXm17X6RzdeQu0PIE/AY
	 ptaH/kTFHjN9PS16mhnjg0DVXQ9gvdsqIBHBm/l1M+CRzO4v+FQwld92QZOSh1R6g4
	 RLll6pDrbXqjg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 569CB1AC56A7; Mon, 21 Sep 2026 16:25:46 +0100 (BST)
Date: Mon, 21 Sep 2026 17:25:46 +0200
From: Mark Brown <broonie@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Amit Kucheria <amit.kucheria@linaro.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	James Schulman <james.schulman@cirrus.com>, asahi@lists.linux.dev,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.de>,
	linux-mediatek@lists.infradead.org,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik@protonmail.com>
Subject: Re: [PATCH 02/28] ASoC: cs42l42: Fix typo
Message-ID: <arFMetXGoogEAwmJ@sirena.co.uk>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-2-741cc20a74e5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G0JcrUZHHYSZL8sl"
Content-Disposition: inline
In-Reply-To: <20260920-macaudio-v1-2-741cc20a74e5@gmail.com>
X-Cookie: Too clever is dumb.


--G0JcrUZHHYSZL8sl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 02:53:41PM +1000, James Calligeros wrote:
> From: Martin Povi=C5=A1er <povik@protonmail.com>
>=20
> Fixes: 2c394ca79604 ("ASoC: Add support for CS42L42 codec")

This one is a very clear example of something that should have been
split out, it's unrelated to the rest of the series.

--G0JcrUZHHYSZL8sl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxTGAACgkQJNaLcl1U
h9Caewf+N5iufxYFZ1liCvBd7fhltp9ck3djJSBs5D9F/V24SiXkujxzDT8AQdtt
gcgzgX64NeQHbmgXRupfcESD2zeVGOOzSmbL9Kp3ohp8j5YqYey3hJEerIOlWxw0
ZXWOY0jdi4I3A3PE0Y5H4R6jO044TTmVVNeOFHTHXIN+zxhAVNvnjfuZImzoI8R9
dpGasJ1qTw75x1hZbryAhBcS7ho28ZT9t6kPhehrfRP3iXUinwItU8yiFBghmVvM
FrcKdFdM1AvZjLiIE/rqudAdqlpszUVWDjluAnWdJb0w4onBKbbMgjmsE2KAygHC
75lcoKFZI0G6SoaytCypAVZ/dAJeMA==
=I6dw
-----END PGP SIGNATURE-----

--G0JcrUZHHYSZL8sl--
