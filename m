Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBEE4B049F;
	Mon, 21 Sep 2026 15:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004780; cv=none; b=Wmxz+N9SWt6GeE20s7DQbp9pPOk4PwgMLuc3/KuyJC3h7gWs0J/gnYNXCL75PfwXknJjfTTD4vx7z9yLo5jkYF4OE8TF+phDz6WKNCTZaG8u+8irJifUTTgthuCSH3sacuPLTYQuKCbj4AAFY9gZU0AYQRVE7jFPclbhn8OItD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004780; c=relaxed/simple;
	bh=W8D2yB3bE6BKhGOLQ/iMBVp9chvKCeuMO2b5VVl3euw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FmYM0+/24s1PUbswOQ7OURqVHxF3VLmjGV9b81zXD1GyFvD0IlGjj4UC7XXPC5i+5hTqQPutqlBl4AkQkxIsENpA9UUkNC3MelMgivic9JJGAVGERDd4E+SxnmA8dI09WpE8OCYOV6RiAcwjH6QdTm9VIOjolsC9+QEn0Le854Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=omqZJTJw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="omqZJTJw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B941F00893;
	Mon, 21 Sep 2026 15:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790004779;
	bh=W8D2yB3bE6BKhGOLQ/iMBVp9chvKCeuMO2b5VVl3euw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=omqZJTJw3PS4Hi5M6+ar0tInmiG98Vpn5CiLztucoUgrYpt+KCEftnxirMgNs2cqf
	 tJvVdi35oPoJcq67aCkSrjwJrX157arhUnBVjKWg90/DLXnvPnQDPIXYQg35dk0BLw
	 8qBG6l4V7Skg36KaxaxwpV14JdTD6fQ1Al1YfXD+egl/AvfPRT9dlu91qVxKC2Zgpk
	 4LSeVRPPqE/uuCMinpgSB/Y+/XNWMMcWXkECW1d7fqV2KW6PRs2Hxrtk8D+xNl2nMu
	 3l6caMeoFxWFt/Ozq46DQ2wUGQEzXsPVicDxx2IUlvl4gXpE1rqggjuoGpDHbwvQnn
	 qSOWCMp8TfLRw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 049A61AC56A7; Mon, 21 Sep 2026 16:32:54 +0100 (BST)
Date: Mon, 21 Sep 2026 17:32:54 +0200
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
Subject: Re: [PATCH 07/28] ALSA: Support nonatomic dmaengine PCMs
Message-ID: <arFOJnILnWgUY59s@sirena.co.uk>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-7-741cc20a74e5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xOqEqatVNA/Q95D7"
Content-Disposition: inline
In-Reply-To: <20260920-macaudio-v1-7-741cc20a74e5@gmail.com>
X-Cookie: Too clever is dumb.


--xOqEqatVNA/Q95D7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 02:53:46PM +1000, James Calligeros wrote:
> From: Martin Povi=C5=A1er <povik+lin@cutebit.org>
>=20
> Add support for nonatomic dmaengine PCMs.

This is nice to have but I don't see a user being added here?

--xOqEqatVNA/Q95D7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxTiMACgkQJNaLcl1U
h9D8yAf/bljkO0Fr3bF7YamCura0DZBNVxUDe198L5l38PN93J+nfGKN1w3Ttw89
OB35EXtVf7Jp6WxjFmNUTfWWT3/BVPMBzoZ+KhamYQYQn0JTPI3SG4W3sxvvWMP9
9LX4NfetIr6oh2gwoJ46XeZhTl36iP72hNbOvxWqdiuB7uU27kDyt+fhgtmGbUjw
T7OZEpb7Zf7fJfaFdJ9wJ5qo3fvE/O8tw1Q/cx+tur3aValh9G21+pQVgVcL6snQ
rCZ/D5M9TSFhACwZHVtg9uaU9KtLXlQob25SUqBRz3+c9h/fgQoKdnJCxkKX0lB1
8j36JXdggD/naDGfRyraCDekc+AjPg==
=i2/i
-----END PGP SIGNATURE-----

--xOqEqatVNA/Q95D7--
