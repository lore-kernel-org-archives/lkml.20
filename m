Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EB64DDB5C;
	Tue, 22 Sep 2026 09:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070786; cv=none; b=kUrAq/j/Cqbrd6/XQosegMxg8G9NE+fegdDLA/X5GVf7QpU9tNCA1D2ZfQS7FhSeB5Nhcwfk6AtBxO6fXT4glL68fb+qGr08k9Rfy9hXulz/Ou7kIMhZLTEP8OHGIjAW2weSh4wh76HxvHDTWdeoA0Y2w55R4Vwg8DK5w0ReVVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070786; c=relaxed/simple;
	bh=waQg2ujP0aUmO5NUWplq2PDQJEwHtoE33QRboY67UHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YlFBdHdVXFOOHILo4ncbciwvfwXBA7MFL/OhnWMg0KYMyoppTEdmF7dvjPYenYicUJUoBu85R0kacri08BVYOFd9vtCy6DB2gx+V/BwkE6Yk0vN7wS+q5pAptyyta+yVu48H+T1esiaBFenJQT0FrcasX/N+9v1WTyZ2YxnR5E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nEitEp8X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nEitEp8X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338E11F000FF;
	Tue, 22 Sep 2026 09:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790070784;
	bh=nARjhrFD1a4uFrGP/wTAfcQAeQqUTGrmqUP9jR7qHek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nEitEp8XesXa66ohsqaPXQhbL3xF2VPi5jxpeHfvNKIelbcU57N2LlISpDXR4evDD
	 vWNbSH91JwOgPgmdtya5yFo+mSJVrjLJj3A465KYYbP/dN41QMpwIvWzr/Z4EaQVLB
	 FI8W5AaB7aug9wFKd8IDgPQ92g22Dd8mLQPvHEQO83K4yoViaHkQjKh5wBmUZZcTlw
	 OsKFoOoHj9WgXWXEk/y+PFkIsojPUo8YD3iG/fp4lJ7AwCXb5e9Y6Cs/GfQ4KhWley
	 dl84p0fnYpc9aSNLr5eovi55Wa8ABpuLhiZK7BdLN8Ig9pzkyA13/USzmDMzuA4Djp
	 6PITUPc2KwKiA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E17FB1AC56BF; Tue, 22 Sep 2026 10:53:00 +0100 (BST)
Date: Tue, 22 Sep 2026 11:53:00 +0200
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
Subject: Re: [PATCH 11/28] ASoC: ops: Introduce 'snd_soc_deactivate_kctl'
Message-ID: <arJP_AjGtyaIOg6m@sirena.co.uk>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-11-741cc20a74e5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mNc7H9Mf9fLW1Byg"
Content-Disposition: inline
In-Reply-To: <20260920-macaudio-v1-11-741cc20a74e5@gmail.com>
X-Cookie: Too clever is dumb.


--mNc7H9Mf9fLW1Byg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 02:53:50PM +1000, James Calligeros wrote:
> From: Martin Povi=C5=A1er <povik+lin@cutebit.org>
>=20
> The new function can be used to deactivate controls -- either a single
> one or in bulk by pattern. It is something a machine driver may call in
> fixup_controls.

> + * Return number of matching controls on success, else error.
> + * No controls need to match.
> + */
> +int snd_soc_deactivate_kctl(struct snd_soc_card *card,
> +	const char *name, int active)

> +	if (!hits)
> +		return -EINVAL;

The comment says no controls need to match, but we return an error in
that case.

--mNc7H9Mf9fLW1Byg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqyT/wACgkQJNaLcl1U
h9Bvewf+Iop+x5OZDye45hxw6ccSgPW7Odu2Npcda77dIryeRPAjpXLVz6dcrc8K
4TJrQC+WG0m5H635RmrywLTgJyupe4kIfVxZ/86xfmqvkRBrDFRpSeb/scudUuRp
zoa9hMGNFAw3qTIa+ppM7BLfb9zrs/ykSC3r+c+fwXEFrh/fnRBbbLtmRbN5rnkD
OLbvOykV5l8HTXUrB1duSzCZS9dWNoHd9Dyg8b3fFhE1cIXNYbcUUaJ8Yv4Jplx9
Jfz8kxonRvN8YUbcAL60O7PNAGtFdzOCr02Qv9/d5jrDQi9Ae4UXm63i4/umUXRg
3gUTHLNhDGEH2e8PtdKXh5uH43Ww/Q==
=khxA
-----END PGP SIGNATURE-----

--mNc7H9Mf9fLW1Byg--
