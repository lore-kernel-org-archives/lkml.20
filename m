Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C77A4908A7;
	Fri, 25 Sep 2026 14:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790345927; cv=none; b=Bam3cHcwLD/bvl8Pvk4chDEfjJBcN1V0bXSqq+g0hIjNAKY+VeqYMTcE0LFXL4mcM9ZQm577BoNH2mq9sM0C5gZ5ipvI/lsD7XOQXwV7bEML1Hy+rAxEoXvDR9OLQCqGh4RGOD6MCC6EO2xHruChL5GjmocjIsSY2UiTA9EDBmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790345927; c=relaxed/simple;
	bh=gfZe73eROlgP7ifuqB/QUbG/ocamsjz0EBFAYb6z/to=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lml4cPlyQr2VQHmrMOuDgtw2xr607xqmaGt8bzjG0eLD37aGmgBmvuIJQ0KX6vPu22vc2aEB7Qf87E0VO4ER4eKiEOo5dA8/ZSO/gn6esP+iG/B4gYInPSD3hzzA3HY9UdAG+IUl/nIZJpnsHN2OmHPIMzXVBXS5CxkMqmo0rhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PJcO0UZR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PJcO0UZR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 477401F000FF;
	Fri, 25 Sep 2026 14:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790345926;
	bh=VoGcfkdD5SkPp5ZIcp/ccfFrvE7Iga2+NMsGRE/mIMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PJcO0UZR6Ec1zhyOBwTunpaO9EEiCAm+Px2nB9/mQg3u2PXgoPiAJbQjWc4YIxtoA
	 T9S9zGuQTHYPAC54hlVsZIv8M2GywTf8ncufl92VHSevApwkGgd6Bt6mgbimuuw42B
	 HZJ2pW28QxVKzhdCXi1N3hFsrVy2s0QJfbSUU+Fe13mXn6IanhpjhQEwrVxzprSBeH
	 ZS3XWqEFW2OcKO1Zzvoi6xLEzcUZrc+SXNWI7v1CfRMVEDFD0kPcDs/znJeqWJ513t
	 C2wmmkJDbLpInfy4mXw9w/dceq0+vWZr2vZmpfLCD0D8BYvyJPJkKD14BTTpBvKIqF
	 E114U9hNrZtng==
Date: Fri, 25 Sep 2026 15:18:41 +0100
From: Mark Brown <broonie@kernel.org>
To: webgeek1234@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Val Packett <val@packett.cool>
Subject: Re: [PATCH 6/6] ASoC: codecs: aw88166: make volume control usable
Message-ID: <721467a7-6b7e-4234-8321-660eb43f1f9c@sirena.org.uk>
References: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
 <20260925-aw88166-cleanup-v1-6-11f74cb5fe28@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dJCplXDiFsaSrND+"
Content-Disposition: inline
In-Reply-To: <20260925-aw88166-cleanup-v1-6-11f74cb5fe28@gmail.com>
X-Cookie: Love America -- or give it back.


--dJCplXDiFsaSrND+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 02:47:34AM -0500, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
>=20
> - Invert the value to match userspace expectations (in the hardware,
>   positive numbers represent negative dB attenuation)

That's a very bad compatibility break, if anyone has a profile saved
they might get excessively loud volume from their existing configuration
which could be distressing.  It might be better to rename the control.

--dJCplXDiFsaSrND+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2gsAACgkQJNaLcl1U
h9AvcAf+NQOUjx18PCv9xSpcC9KTn20iTdx/MD/9suRhv52JVKyG36/F6nAY+MSt
yCQ/wTG8lQdVYrTB/405AulUcRFb2gUk3ZcjmSqrTedk+bPjmNOwdziE5RngjBSY
AUFW/dczzXf3QRLxspzpfJ4ktgblOY0dX8213XEYFi8j8oxTxF3DIfFmeBNuVvUG
PuVX4tEj1J8ax8n15glyiV8R8DQCz43Knc6EmqclreC1B1fBFpeavaXsGyho/Hx7
vfUNIdNzVtXXJ5LabRkwGv4RZGWIn55THjfbbJj6nubSBoSRmDXz+LTW+VnHv4lJ
DqBsaA35AVlU35IY/bN76pbSa3xk8g==
=2wmR
-----END PGP SIGNATURE-----

--dJCplXDiFsaSrND+--
