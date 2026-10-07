Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4ED47534E;
	Wed,  7 Oct 2026 09:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366911; cv=none; b=G4RSo6X3//xK6R6sVq0HqnXLPFFq7ULuE3k/PebURAGhqns8oHc1iW42LEI/5idtS899J0NRcRN2yGLbGdID0/amx1qJfB+4e8WxTWpKcQPSQeomqygi80T1JNmvlNvGkGb2M6z1lAK6z65e8as8QbjFdH0+hEerNH8Mgk5BeU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366911; c=relaxed/simple;
	bh=8JDCl8OrL+mKV42Pt6NN+0hbgXtTIi+Z0eAqdjwBzyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQxVnDlRq7KMXE3pSWnnzrLxEUHd8agvKrRhii9/SJVV8r+h5GIqeApEqxYiW5YMSCvXo6AmV3epYVeMZJNwgqvE5r3dvICiRSleFT/rUt9WYinunjwJ9+QYC1BxOOS3Cf//ol3CKm3ckdhcsFYGmH6ODgwAjiEPPkKAX9t3vsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ny1lOyzE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ny1lOyzE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E6E1F0089E;
	Wed,  7 Oct 2026 09:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791366902;
	bh=8JDCl8OrL+mKV42Pt6NN+0hbgXtTIi+Z0eAqdjwBzyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ny1lOyzE2RwWpchdltjmSQrwfW0ie34h908cxxMrEkbATAaqzTa3i7wVAYW2cgzKJ
	 GyWtZJ18tFh9CBXdU/QhZuNEn0eYnlS6I8Kh3TFBiPGJxJ4ubbVt6kQ91Y0sXRwTdT
	 Hoy5BAemJEgRiBA34YSPb3BY78WM7r0xFFVsq+A+iAazU9Yx8bgS7y0I3g+yz1fdC3
	 Wt0g9X0yTkw2bT1MaDkX7Dce4S7zpUanapN8ZQJqKJaOOVDH2stEknH7dYTh4wncno
	 cOSNd/CKKuGfFP3m94LO+QbIwaLCm5cs9ExdOdseUA6lIJ7w8vtv8VVZSc1Y3hLcIT
	 dy5JYSAu1tmBA==
Date: Wed, 7 Oct 2026 10:54:56 +0100
From: Conor Dooley <conor@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: himax,hx8279: add
 vddp-supply
Message-ID: <asYW8MysZdSHdiZo@squawk>
References: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
 <20261006-panel-himax-hx8279-vddp-v1-1-50d884b42aae@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MMrK/lZdGg9SD1J/"
Content-Disposition: inline
In-Reply-To: <20261006-panel-himax-hx8279-vddp-v1-1-50d884b42aae@baylibre.com>

--MMrK/lZdGg9SD1J/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06, 2026 at 03:25:01PM -0500, David Lechner wrote:
> Add a vddp-supply property and make it required for the Startek
> KD070FHFID078 panel.
>=20
> The Startek KD070FHFID078 panel has a separate VDDP power input, which
> feeds its DC-DC converter, in addition to VDD and IOVCC. On the MediaTek
> Genio 520 and 720 EVKs, VDDP is switched by its own GPIO-controlled
> regulator, and on the Genio 1200 EVK it comes from its own PMIC LDO.
> In both cases it is separate from the other two supplies, so it needs to
> be described to power the panel.
>=20
> Making it required means existing device trees with this panel without
> it no longer validate. This is ok since the Linux driver will still work
> with them because the regulator core uses a dummy regulator for any
> missing supply. And anyone who sees the warning about the missing
> supply should add it to their device tree.
>=20
> It stays optional for the Aoly SL101PM1794FOG-V15 panel, as it is not
> known whether that panel has a VDDP input.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--MMrK/lZdGg9SD1J/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasYW8AAKCRB4tDGHoIJi
0vXbAP9Pa+6o9Kvfp8rFOQt+MoySArv1ZxQQvEAhhO5aRzql7wEAsA3Sa8wW8ZfX
tpdF/lVwu2hYNt2s6KZ1TfaX77j5rgw=
=Mwgg
-----END PGP SIGNATURE-----

--MMrK/lZdGg9SD1J/--
