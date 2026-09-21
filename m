Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EC849B5CB;
	Mon, 21 Sep 2026 13:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789996635; cv=none; b=FwWVMrzKl/qvgcM1caF1zMm8WpKy8JaAokLLd3wGHGLu2SzFbw+4pybAliknblckhXO5IaYU/oRV4/eWPV7q6e16Zj6P2cU6Q1yLTwG2Bhfdh8K08WTrPKmKkub/l4MD4+izHeEQZSLXux9kdFPscYS1F9gA0hh8+0FYF3iwqwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789996635; c=relaxed/simple;
	bh=hUlZOxiPqaYeyhAjcneShlAmQuBczSGK+w0NobMzCgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UGxh3UO8VZQW3jPFRYoD8UBQSAO2ky/10tN7o9hCkkAleW0/FmtHCId97KOcP/pxaL+396YdNmFFB3+2/bRcPRsB2dhZABCtGeYKtSsbCYdQGBjFzZ/hZ0gk7RjfVDlxdK+/X5q+XbqVkzNvSEzao2v+WN2ctk+crYZPfPDbiW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D79ZY4ew; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D79ZY4ew"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 634F31F000FF;
	Mon, 21 Sep 2026 13:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789996632;
	bh=hUlZOxiPqaYeyhAjcneShlAmQuBczSGK+w0NobMzCgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D79ZY4ewCJ0VKDoutfkRTAEzYxc8Xrq8rscEUJPMYw/cd5e9Nmfxc/YhVQ2JE4O4e
	 3lmtrAEci14D0ExE2smWHtVk7CTaPJIMpk72Qatz81XlF2QkoVwtAGrF2Dz1P7HbV0
	 tK1Uph6pnViITA4Z2EIiOHHcpdEU+Gjz5DHjSy4YZqimix6pvWcES5VmYoosPCoBNv
	 dwi7copD/3bGbgjYFSiKomO9uQnONNl/n8kG8RNgRgwg6SVWQfQNEPnrkIUGYOIeAU
	 AXot0/5sZBcjoqdbpcusgED7AhLuUUvYi2kL1PQw1rzEgQh6F/88Onj6fPpQQ6kBEI
	 7mYWFzjSbbC9A==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 044111AC55A7; Mon, 21 Sep 2026 14:17:06 +0100 (BST)
Date: Mon, 21 Sep 2026 15:17:06 +0200
From: Mark Brown <broonie@kernel.org>
To: Chancel Liu <chancel.liu@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 06/21] ASoC: es8323: Move mclk acquisition to the i2c
 probe
Message-ID: <arEuUlpxzLbIYetu@sirena.co.uk>
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
 <20260921104640.1941554-7-chancel.liu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N8ldy4y5k8ZVllNZ"
Content-Disposition: inline
In-Reply-To: <20260921104640.1941554-7-chancel.liu@oss.nxp.com>
X-Cookie: Too clever is dumb.


--N8ldy4y5k8ZVllNZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 07:46:25PM +0900, Chancel Liu wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
>=20
> component->dev is the underlying i2c device whose devres is only
> released on physical device removal, not on ASoC card unbind. Getting
> the mclk with devm_clk_get_optional(component->dev, ...) in the
> component probe therefore leaks a clk reference on every card
> bind/unbind cycle.
>=20
> Move the devm_clk_get_optional() to es8323_i2c_probe() so the clk
> reference is tied to the i2c device lifetime.

There's also some devm memory allocations in the DT parser which is run
in component probe.

--N8ldy4y5k8ZVllNZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxLk8ACgkQJNaLcl1U
h9DD2Qf+Mue7REYnjbGxAVFVTwgQ7tvyrhMo5iaNlvGtBuR6e4KKR9tdCKNj/Mc/
27ncil6aN+zIU+aiWbayQzVdw5izaZUXgygX6GgufuC2YQhqtDtrT60IAsJfLYS/
ZAXfZAbGMhFbPNByyr/pXm6Auhp8rlHf5VdD838d+pMFrLZGxrVWoTJXid4/eu91
6ExAVgLgMnrRTAJuKF1qqGtQAuHSWNXouD4YXnF6AuRy0/T4XsaX95VG84hrKs7P
meN4B9e4kl735REXCdq1K0qvRnJRL2FVF0pxfeUZhRmZwH09OGavS+sHslKlrwnr
rW8eYW2u5H+qW+Ufjusbq63/DxkrNw==
=lYJq
-----END PGP SIGNATURE-----

--N8ldy4y5k8ZVllNZ--
