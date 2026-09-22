Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6865352FE39;
	Tue, 22 Sep 2026 10:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071951; cv=none; b=rdGRw4uT1cuD4GmNwfY0ixu8M6mgllIwAZHbTca6ajSvWg/rpoG5//X4IVX8W32IL2ErtX9357MdBG61zHXaIbmVfCqSmzEnVpgvXqHhS2m/73WhFGWVRexGZRGgi9iQ4gLxlhR5SO6sjx9lAyfB3AXV/stFclYhh8GVlmbhhNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071951; c=relaxed/simple;
	bh=RCczAd6rRCjl+z1bCRL9mHWnCXKdbTyfadA77NuaG/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tby5us85BO+JKhxveboAgfZcleiVPDxEEye/zhcsOgzA3RVUSyA1AeT5f8qXtVrL2PrnVYX/icu45w4CltSyNqFvGdvsu1tHwE2lg7vY9HsCeEOSwE9hF5KUj7Hzs06+49cR4JUGqioTmSErUV2DavkWTuQSGOL8ZPUYEEehFrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fG+6R961; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fG+6R961"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309971F000FF;
	Tue, 22 Sep 2026 10:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790071948;
	bh=RCczAd6rRCjl+z1bCRL9mHWnCXKdbTyfadA77NuaG/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fG+6R961EA4yrEigbIif5vmei3DVEwm80+ODauHnon7uJ1tcU4/BLWyevxnbqN8Er
	 3yx5z+Dd/GmgfNmm8CKcebMfTZzMXiMH0Imxm1rHZrKnXkpJFDqw5/UsPMEFAHSY2k
	 8MABgMWnWJmgbtIxw70uBIY0C5PrNWwVbF+SkwVxQG7kF9+bEQ3HMhTVPZmTidEDqu
	 pGfu983jjupSUjJVC0g0lBBoFAdQxU8PDADuQFWhwdF/2W6DCBIkCaATiUYHLIwK8t
	 SdmRF2DXQQp4wm4DNnMGckojCSCMRaOSBmbX+QfjQ0eRi2ntqs6IDBk2sh0XwkxbUq
	 J6GtaEQHbOlhg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 2934F1AC56BF; Tue, 22 Sep 2026 11:12:25 +0100 (BST)
Date: Tue, 22 Sep 2026 12:12:25 +0200
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
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 06/28] ALSA: dmaengine: Always terminate DMA when a PCM
 is closed
Message-ID: <arJUiUjJXtFkIIy7@sirena.co.uk>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-6-741cc20a74e5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sT7HIJNNlVwRAJA+"
Content-Disposition: inline
In-Reply-To: <20260920-macaudio-v1-6-741cc20a74e5@gmail.com>
X-Cookie: Too clever is dumb.


--sT7HIJNNlVwRAJA+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 02:53:45PM +1000, James Calligeros wrote:
> From: Hector Martin <marcan@marcan.st>
>=20
> When a PCM is suspended, we pause the DMA. If the PCM is then closed
> while in this state, it does not receive the STOP trigger (as it is not
> running). In this case, we fail to properly terminate the DMA, calling
> dmaengine_synchronize() nonetheless, which is undefined behavior.
>=20
> Make sure we always call dmaengine_terminate_async() on PCM close,
> regardless of whether it has been called previously or not in the
> trigger callbacks.

See 6a7db25aad8ce (ALSA: dmaengine_pcm: terminate dmaengine before
synchronize) - we should already be handling anything that's already
saying it's paused.

--sT7HIJNNlVwRAJA+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqyVIgACgkQJNaLcl1U
h9DhyAf/X6q2AWvRH1MFMzPD/e8912CrW4cklVOfvh51L3pxhjQ/6JFWDI+pyTLs
AVff/x4OgIlUuhgxgEk/Y99g122aZRx91ZsDmQeKifSiJGXwxKsk2ZmW4lZb/VNL
ncqE5q63FDDYPIUoB/bBfQ6GfuhzZ7p0+oB5+U8Ec+mRaAsicuIIUZPPaeFVx92V
+nRFciaP5xg9bFFIDNX0jkO7TdqR8VbuJ3qmomHv7hUi3ZsYrUoPG+qI3o4Gc0vV
JRiMoaUgQihkntAo4L92KjTNkNJrcezERaU3xjd0x0q7IPAtr9sHwpaTdS78IV5T
dQGbVZsRQq3iRrdFnJqwezyQXWtfUg==
=I6pM
-----END PGP SIGNATURE-----

--sT7HIJNNlVwRAJA+--
