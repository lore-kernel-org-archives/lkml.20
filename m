Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242DD3CDBA5;
	Sat, 17 Oct 2026 19:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266076; cv=none; b=VhO5KCMBUzFyUzbEB0DmE+z8ydumHhPgTiX8X0m0htICzRJtOt0B5aK7HKeUjHloFoRgx5vQPZLvoahe58agjNz+eK5qYD/e69wTEEvsygWjeSeewCBPiO1jtyqRAFMFdp5b0IWysR0KNwMtuLL9ES0rRUOldnQBPjmSjSXJS80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266076; c=relaxed/simple;
	bh=XpZ7WtmsjWKKZFQo/IyDyLr3d90h8EDRW9UeTOjlQ1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RoK/j2423jwmkZuWwzD+EgMaR1z4SGr5YwJREYuyOgcf2PnusVkjx9/GEsM/rr8/slGh8dv9erq5fmkQesnT+xuObTG1IAD5HItf2zlP/8Mg36fGsxopaNhyWIhCFYLiOVA4nxHQuQa5shp2K0g46gWR48kvzIUFa+4/P4qjPyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WP1Rzm+r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WP1Rzm+r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 704531F000C4;
	Sat, 17 Oct 2026 19:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792266074;
	bh=qNfEJeCDvn9/jBGM/Gu+ZPbvhFBqtl8LbtoJpfKkK7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WP1Rzm+rI8iWHfl4EBkPGAaDpCdJdRVEyITbbd3JGwOImdDI5ZlV9WM4iVfif/APj
	 aDMbMfO+BxpcnOQ/RYonCwRJh/MGJrxarWN5La3OX4qO/c6SyzbW4VVTyqiQZlBA3u
	 YFb64TT142D+hgT9s6+AXaMiWw9T8Vhk0pbue4gZmpfxAjOToR/1Wi5v4CkHAQWkVI
	 g0D4LCZmuODmdmhq6Tev8qrm1UGSr+pXuyDXIf0WMUnCqWJtpS/GE0vyHq/3UgiLF0
	 2GR25NigO6esrVCaj/QZo5IQHTBvmNJtCZa3TeRn01kGw+XAeTMLh2+MNJDxGmvC9A
	 xEEW3dI6fKG8A==
Received: by venus (Postfix, from userid 1000)
	id 9912F182304; Sat, 17 Oct 2026 21:41:11 +0200 (CEST)
Date: Sat, 17 Oct 2026 21:41:11 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: wsa884x: Add mute control knob
Message-ID: <atPNXkTPuAorOPLj@venus>
References: <20261014-wsa884x-mute-support-v1-1-74d98d79e635@collabora.com>
 <60cd552f-1de0-4304-8e84-bb307cdea45f@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xwtlun4sm6rr26mm"
Content-Disposition: inline
In-Reply-To: <60cd552f-1de0-4304-8e84-bb307cdea45f@sirena.org.uk>


--xwtlun4sm6rr26mm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ASoC: codecs: wsa884x: Add mute control knob
MIME-Version: 1.0

Hello Mark,

On Thu, Oct 15, 2026 at 06:54:52PM +0100, Mark Brown wrote:
> On Wed, Oct 14, 2026 at 07:02:54PM +0200, Sebastian Reichel wrote:
> > This codec is typically used with ALSA UCM, which right now falls back
> > to handling mute in software. Expose proper hardware mute control
> > considering the driver already handles it internally anyways, which
> > allows UCM to bind speaker mute LED to the new control knob.
>=20
> The reason we have the mute control in stream startup is to mask
> glitches caused by the hardware during startup, for example clocking
> random things out of FIFOs.  Are we sure that this isn't an issue?

I guessed that part. My change should leave it working as the
user requested mute is OR'd in. So during stream startup with the
user mute control 'unmuted' nothing should change. With the user
mute control in 'mute' state it will stay muted during stream
startup (so no glitch possible IIUIC).

The only potential issue I see is toggling the user control while
the stream is already running. I don't have documentation for this
chip, but I'm running a kernel with this patch on my T14s Gen6
Snapdragon for a few days now and didn't notice any issues.

Greetings,

-- Sebastian

--xwtlun4sm6rr26mm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmrTz1QACgkQ2O7X88g7
+pp/wRAAkZIccIsqUsrMj5hXHD6h1HrsqqiIuOzxfoLpUMgmmPc8RzXRytJarbWv
nbmJDfBrraqrjbT8t3GOJDw2af6LMZndxFgCC66GqQnmVZ24l+Qy/imSmAHtPuWg
tuk01fdwjlZA8aDMLvVOHwte/BgyfuSh8ywAjMw3bAPnQxhorjysjC7dCOoiJX1K
kMFBxYaNcNZvVAppvB2k9ve7+wcfvKypn/3ZlYv7Ic912eqH4a+1pH15HsLeujIT
iaN1ot1RDgw0/HRStoEsUhqISdl1ZoPHfHGpjMYBt0r5bxyJ7pkfQeuCJaB1EufH
tKymAXX4T2An45abwEZH5jwu+6lqX/She6qvqjW96D7YvArokL3NDI0g4DR8lNzU
iP5e6nojlYJn7/LYECXsqMCAkGfhm4VlPce3wPuEMU99oP07QOOlIloFE6p8VJMb
2ZzACFYPDalPridXrB09MZERkaC6jdDI8cPuYu6Qehk1hzRuV0lU4XNN3jjMxWxy
+NEj4GCMpV9XouJT/Y51C2KW+QQZbzeaCl4pP92V84luIbdW6vqfuqnu8qcpCDCS
nCy7RCl3YSvfZTunVk7X5JarEb5dFx4xufG6tazhJ0uuQ4NeKWGITH56DzdFXjSm
4K5ROtvkElF8O+2KF670MATyH0DTCuqFXNh27rDrYZS56T+6Uss=
=v1E9
-----END PGP SIGNATURE-----

--xwtlun4sm6rr26mm--
