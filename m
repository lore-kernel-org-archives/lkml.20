Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4B6380FFB;
	Mon, 14 Sep 2026 18:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789409893; cv=none; b=eWFCnGfWliimf7mUZJE90wjJm6Rs8CD8fZ2C5HvFi2kWsypLG4/UDpwU520/FFONJ6cm/cw6ARx/YCraSq7klqluIV4LKpbkRs4GG9Ow8v1tpDfKHFl1GpFTvelArzQytqhifF0tRiBiH9cVsTpmATBbYZBMNn0D53nqlStsQ9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789409893; c=relaxed/simple;
	bh=LeGJVJUrFccUrTCqBYPQTfeXCn2hPt8IfFObYNGk4eU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LETLpUPFWmRH2iIUobkRC7JtUxPPB1hFNatFKEB4ucN6gS65FgSF3k32coRXsUNebqnneucapRZCvvimfuaflZf3ClBDQIlOQ5XICxOD5/0QWw0rh+L2fCEc/JKq54Tbic+3SrApT6U7uSP5kC/yBHa1/nrr3SzoeCalcE3K8bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDpojIh2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDpojIh2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE94A1F00893;
	Mon, 14 Sep 2026 18:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789409891;
	bh=UfV2+3ufoodcnS2hr2MvymVG9xMpLrrAfO1Pi9klSVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nDpojIh2i5FVIFYzzVAshOI8GnTHsdKHqfOhmt4+rDQ8byU+w+2gVVVqlik8hIy6K
	 35AwBNdW/FhoJf2pIszi34Jfkr97mkz6sVSNjxocSuqf2u0gzNR97iy/oZv3X50Foc
	 cxpJLldl6TiTpdS1N28tSkzl1MV/WAVkffi4mT71XLg8N8kyUPwRF0iUrSR3re5v7b
	 6J3flpuzkP0Yx1DQVaYJ6zfCPjy1HNwJekjW66mO46h5p3UJPZCfZfQ6fCvkWNbwq+
	 6+yj5QSrhJ5MZjydlDKliQLVCmZgQIvdefuUXRWsJsx+NFqIRhtZu/2w5X7Qz8ZF7W
	 nGs0jHncwc+iQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id EAE67FDACBA; Mon, 14 Sep 2026 19:17:57 +0100 (BST)
Date: Mon, 14 Sep 2026 19:17:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Khanh Le <khanh.le.xr@renesas.com>,
	Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	David Rau <David.Rau.opensource@dm.renesas.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Yingkun Meng <mengyingkun@loongson.cn>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Julien Massot <jmassot@collabora.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Shane Chien <shane.chien@mediatek.com>,
	Daniel Beer <daniel.beer@igorinstitute.com>,
	Sebastian Reichel <sre@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: Use consistent indentation in the
 example
Message-ID: <aqg6VUKriyVANv6u@sirena.org.uk>
References: <20260914093657.61218-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lBcZ00JTkHLtIO8U"
Content-Disposition: inline
In-Reply-To: <20260914093657.61218-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Cookie: Orders subject to approval.


--lBcZ00JTkHLtIO8U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 11:36:58AM +0200, Krzysztof Kozlowski wrote:
> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
>=20
> While changing the lines, correct also node name to be generic in
> cirrus,cs35l45.yaml, cirrus,cs42l42.yaml and dialog,da7219.yaml.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Can you rebase this against current for-7.4 please?

--lBcZ00JTkHLtIO8U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqoOlUACgkQJNaLcl1U
h9CLWQf/VFTw/qe/g+8peqE05M8nHdQKkYqM+VK25BVf7NMl4rlEDI4nR8k4bWEW
17u4cI3rTrRngHBJYjWjjUC0UiYUR7325nlIvtC30fNLDIctjAGClIGzHVQK2hPB
XJ7EI7rdJhwcimKRi1SfB7zbKG4fCKI8LWaAQ/mGdleTtwEsCOT44F6Kyx5fVfkX
0RtEzTl7X6PnR1BwjiB4jGSUObEPfPTr5144+S7TCCfzAzAQClmOtcIwyGqZekNu
ByUbfJcB5JGDnHnLkn9NL/QU3J4jNOAwEs54z3SUk1hQoQro8UQc6Jh2KUeNGIHG
CdWnP+p/QA1EiUgQEJpb6pMeRUj3AA==
=TYrF
-----END PGP SIGNATURE-----

--lBcZ00JTkHLtIO8U--
