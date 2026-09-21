Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C764908CB;
	Mon, 21 Sep 2026 15:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004458; cv=none; b=OgcVMdU5POH8OybBIyekWFFDrYuaCOXZJjSYxAfVsY/Z6GGKzf2GzalN9ewthqK2PWdyFz4pdbpFREzib254EJk6ZbOSIjJeJmNkctNFetK2K6ak1y65SEp4Yt1K+aVolt7181CTeC18F4gtrauOZNaOTdX5+5L5u+yBT5HKDJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004458; c=relaxed/simple;
	bh=KJL6qrJEYWDTW06lL7uDWewZqJ12jjgFwJH9pMNPMEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N1DPj1vjkvSvwQ3gWEwT10LVarcdWa8xuaYO/ILrge4GE1Lyp+EtSsolY7jnX+3rSPOKpRq28YxEiJqVkd+G9ZiERUE12kJeXQtYgrv0QyNhBTXJcAZ1zoTaniB9HWT0mpPKbmgfIKS88Iii4++7RI0VO0u1OL7tdduIOYg1JfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=clldXVd1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="clldXVd1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD601F000FF;
	Mon, 21 Sep 2026 15:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790004457;
	bh=PR3QlLkpOllF17ylDcNIQRMmZtuCsB9dWNGolTVMx54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=clldXVd1qt5JTqeAkuX3EX4mIWHnlMOgEnnMh+oY/nrA318cmAhD5LHyTIc5y2Wbd
	 //bnRA5kAnB6W8JMUS3dmlaIMqgsPMSkZRnBhR8FLjdXu6zzEmylQbDEqFnvs5Kegd
	 B4R67LRz7A2CFXy5oBhEW+5vwa3gwzBB+wCZ0h3n2nNV0r3VAyatsbrKGDs5N6KmJl
	 nVQiXY+jA/6TGI0eQgyN+DPKU9uU0dtSFAbUCmV95QTbJo8vluO6q+yE2CNI49ShaG
	 nxnSwxj7a3Rl8cjTBM/reYdHFLjBsNJ/jFncfOFzTrPYnNKyNFP8eNQFaZv2ozOqJW
	 7iIyz1/esJB3A==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 09D661AC56A7; Mon, 21 Sep 2026 16:27:34 +0100 (BST)
Date: Mon, 21 Sep 2026 17:27:33 +0200
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
Subject: Re: [PATCH 10/28] ASoC: ops: Accept patterns in snd_soc_limit_volume
Message-ID: <arFM5QGrJx1aYhGK@sirena.co.uk>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-10-741cc20a74e5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qy1Q+x+0xkGVmW14"
Content-Disposition: inline
In-Reply-To: <20260920-macaudio-v1-10-741cc20a74e5@gmail.com>
X-Cookie: Too clever is dumb.


--qy1Q+x+0xkGVmW14
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 02:53:49PM +1000, James Calligeros wrote:
> From: Martin Povi=C5=A1er <povik+lin@cutebit.org>
>=20
> In snd_soc_limit_volume, instead of looking up a single control by name,
> also understand wildcard-starting patterns like '* Amp Gain Volume' to
> touch many controls at one.

> -	return soc_limit_volume(kctl, max);
> +	return hits;
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_limit_volume);

This will break the existing Cirrus and TI users which treat non-zero
values as errors, most users ignore the return value but they check.

--qy1Q+x+0xkGVmW14
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxTOUACgkQJNaLcl1U
h9Dkuwf/e+9+p51dk6ApJjuQ0eXbD7tKMLOu2OSHbM26owrg0ihRHT55cBX3KJ9a
YXR3LUhWCtuE3nZLpD15aYVuH8Ix8zzDg7S8e+0X8TIwppv3PJoGL3RFQS8/TMh/
fUwbXTB8oMMTHLZnbJS0L0G6ptXZxb+qYxQj4Sa54U3F3hxla3fMfXfaLPNs0hw/
b/VWJgr72b30FphSIcZDwLs9PIgLWl3sUA2MLNigqhvcyY882sDZmCYlpvmBR0FL
f6q1qYUUd+5Sg0AXe/BqCJGnetxnaM3kfQ4FTgRjbHqx9WahPIj9vORlshRbTzCv
SCf1emZJ+s7LB9sfqe7izn+xljAPrw==
=LUax
-----END PGP SIGNATURE-----

--qy1Q+x+0xkGVmW14--
