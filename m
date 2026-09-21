Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76E84A6CE6;
	Mon, 21 Sep 2026 15:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004150; cv=none; b=LJWT0dTjwq0myjS4Xno87igdCF34uPcJYVbT/3ijhuvZODl9l4XqFOms5Zlo2wMKDZ5q8rBryFNZ/Al+DGG7Cu1XrmuiH1rs//lqkoITUN6EsAI2a+JgTx2kIwKtoQyNQcmDozXjp14OU+u+TDB5MbUUyM/1LwKTTIZV28DOA7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004150; c=relaxed/simple;
	bh=VXUsg3+dZhmol/9l/MYhF/EWP685nUKqfT/ZySayUhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GcGAeakSXStGRtNgpbkGao6GsVzPqwX0h8ghjsViNp3QgDHAUAhE1bdybGfpNtjrsydxjl1VfLEr9/ruSlAJZbk3kjb04WB2FzJUDcBiVSquZe84eq4Q4NFE/BXSQZ0xAz5Kv+BpH4Nno5ZiYwmPay+syCYVWRLVApHmRaBGrcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C2ZU9Id/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C2ZU9Id/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 521351F000FF;
	Mon, 21 Sep 2026 15:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790004149;
	bh=bOzR8GVrme4M89CxBLevVcZ1IZiI/sDrZnX7jk52Wno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C2ZU9Id/+o1irOenoCt9jM34dfFp6/t2bWH0fXwvb2Jy9dd0QU7QgEOUE6aaFSh24
	 ToidA/ICs5d9V0HBZPj9oTwsLLE/lG+jfwZ4qNdgQ3J2mVj6aNrHZJeXB9uPT6/ezr
	 gXQVF4K8q7fJBfeInuGl2eceBeaRH6wz6s46Gh8KJc3HrDs3zH4dQIjIU0cvlbiSbj
	 NuE943hL8XPvQt6FSMoxRLuOaQgZnCm/MyA9lsUapoUk3aeDQr/qjeVHR2chXn8lK/
	 fnevuSvK1Qjau09aVKkyer+OS5zMNmo2RkEil1IK4TTwuUiid4f4jF8L2Nd6tQKvho
	 tS+6MZU40uEcA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id B5E3B1AC56A7; Mon, 21 Sep 2026 16:22:22 +0100 (BST)
Date: Mon, 21 Sep 2026 17:22:22 +0200
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
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 01/28] dt-bindings: sound: Add Apple Macs sound
 peripherals
Message-ID: <arFLrr23j9QVjKp5@sirena.co.uk>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-1-741cc20a74e5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9DlXPXtwe81yJB7g"
Content-Disposition: inline
In-Reply-To: <20260920-macaudio-v1-1-741cc20a74e5@gmail.com>
X-Cookie: Too clever is dumb.


--9DlXPXtwe81yJB7g
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 02:53:40PM +1000, James Calligeros wrote:
> From: Martin Povi=C5=A1er <povik+lin@cutebit.org>
>=20
> Add binding for Apple Silicon Macs machine-level integration of sound
> peripherals.

> +      - description: Machines compatible with J293
> +        items:
> +          - enum:
> +              - apple,j493-macaudio
> +          - const: apple,j293-macaudio
> +          - const: apple,macaudio

This doesn't seem to correspond to the DT for j493.

--9DlXPXtwe81yJB7g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxS60ACgkQJNaLcl1U
h9CEPAf/dQqOTFUfSqvlY/jmFLZk+OUZk4RtOYaqTJ/vfY4z/YQ/sCnFIXYeZnin
TSXdhiD4jqVa4STh+dsIzzsnODcQyStOhfCGFXIYzSoV9gdR00T3DwHlTKU6zrlz
qDFc3jxbaHcdW2VZ10YmawxZ9PIjGevKTgKQwrLLD9rxjWEa64yVb+1hgc8jAmWv
vn8e4DnGoR0qfJvzIJ/GgiRmwEY2EK2zXw4x+QtQzFVCrV01QmrIuQIvKKXlFkmQ
BiHssUi3qgPFuaWRNe6yubT8pq/8qGFBiBtr/YMoYPNv9vGp0Tr0ARhCo8ycHTsH
yOa386ia8Ee7BbOlalJdhEWFxxxwqw==
=e0C1
-----END PGP SIGNATURE-----

--9DlXPXtwe81yJB7g--
