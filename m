Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74D3328610;
	Wed, 30 Sep 2026 11:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766468; cv=none; b=af8Bc9kmuMx9F6N5quGVaab5YZ6xs5wdlyBAhRBeMwkoVYNiTS6LljhMmZmgXvmlpboTVzSp8UwPEW9tbMKbHJXnBCXPCV/gLEc8gHsuz239LMeH7Fee7Nl+pqhZRuexkKN2+seiK7ico1BqPRp8/rovnbwenP+Mxj+mniJXOV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766468; c=relaxed/simple;
	bh=PBmWym/gi9GWabyqOvL9JYC1c00FBUIO+rT65p11xSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDPvY90h/glU242Y5/7TrVY3VYdPeMYy+1SqDylVLfNGR1LOe8k+WGDv6T4F9YLWIohQvm4g+FC+MA6QmkCBMwwcr0DUMdhNG6B/9gRyP3nwvVBKTCVnYCuSL8ri1+oJlP0pQFOsZx4aZTOsI0sbFNi6vtBRHlPr+wFkWl4xglY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nYLkO+is; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nYLkO+is"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5757A1F000FF;
	Wed, 30 Sep 2026 11:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790766467;
	bh=PBmWym/gi9GWabyqOvL9JYC1c00FBUIO+rT65p11xSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nYLkO+isoS2z/prm2bYucFquR9LvaRl4tEtzJsZ0I2dYtjYKwL6d9OtrtRHlMRoSy
	 yFsRP01BJjBqN+l2xh9XCIYrpITGvj/sAocd8kKhLoNjPs963aZx+1cYkH1Hzv/ojC
	 Z3t9rSgqnjKCTsx4p3pHrHLjQxOVAg36lOU1SEU9Lr0Btrh6FlbUQdJc5Cba6SI+Kh
	 0vSGB79OQvSIRik/o+T6V5wPHXFL0E9SmC5hRCXxYrBAVlYHTJ4INgox8AhCSpaRrO
	 RYoAhIT+EoE591x03gVth17J1FDfsRjJ35RsyGqwITFaKFyW/TSAJWFh2v3zkpGPma
	 y0j/coXD1BvRQ==
Date: Wed, 30 Sep 2026 12:07:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [RFC PATCH v2] sound: airoha: add support for AN7581 PCM driver
Message-ID: <0bc0de0f-6b98-4ded-9dac-3c95667e4448@sirena.org.uk>
References: <20260930070717.47487-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Lp+r8yxZL208g7r8"
Content-Disposition: inline
In-Reply-To: <20260930070717.47487-1-ansuelsmth@gmail.com>
X-Cookie: (null cookie


--Lp+r8yxZL208g7r8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 30, 2026 at 09:07:15AM +0200, Christian Marangi wrote:
> The Airoha AN7581 SoC have alternative Sound Card that expose PCM OPs
> dedicated for VoIP application.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--Lp+r8yxZL208g7r8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq87X4ACgkQJNaLcl1U
h9DUqgf/UltVyhZ4Zze8hpd5+BC955h8rJ4fM6qYIL/cdV8OCNl9rBBdjpSRdryc
89clEktrX4gCeqSJNnSmK7iJhFWxZIAJN0exSiLsYUajuFb4i2rOma8qEOGuF5Hb
/fYhzfeRC8fRHsByaHlONtlyOzp00EKTUlvfoRft0PelM2TNKxl1Qm5EL/ueOoxY
WykzMat4DalkHy2xtQw6OijcGjh6MsleYqXW9HEv2T7hJrAxlAnNtD7nWNNA7dTt
eLq6cpZx2ZiwMpuFBOhVkpu9pT7SNj2/kTaTRedmawfwjAYw7oF6tt0DBRPFm3Bv
1zspoxh7z/F8/4a9Tsdsjx/rGgvy4Q==
=ZRo5
-----END PGP SIGNATURE-----

--Lp+r8yxZL208g7r8--
