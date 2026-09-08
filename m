Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A50D530E1C;
	Tue,  8 Sep 2026 11:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788868106; cv=none; b=uAajshpCsMjo+9CuxCPI1pPr7BXY/V/GLZdd7TZA1ZP6CpJBmh75RF2U81nFCJrC6yikRQw1Yrc497gRFmBX6lMWN/SqbCihRsgDdxBx0+Bw0efMZ/+TvjC36gVnoX97OdeCpyGL2wCxC+CftjjEcmn4ruhAuto/m3cTE/6bI4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788868106; c=relaxed/simple;
	bh=TWKqHdN6L0y46sYgi5xmbzFxgLjwUpw3dmVkGrxVTqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETpxz5ankDT/kEO6zlUTn6Kl8SB/kRP2BSSUwfyCAVdyXKWi5sSzlN4tS5ABtsCOQRXkDAIeXk2b+FMAZpB0ea7JIUY8VvQaMARII2aUGMuUNnFvVHJ9iQusf+TswiU+pmaTv6ESgimoIBqNTxgcpgTO5eYAw89MCSpvxIgoeSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1A811F00A3E;
	Tue,  8 Sep 2026 11:48:13 +0000 (UTC)
Date: Tue, 8 Sep 2026 12:48:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ASoC: codecs: fix typos in comments
Message-ID: <9da7e3b1-2974-4b0a-aceb-3f3051414645@sirena.org.uk>
References: <20260908055328.22099-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LARM9FGqbHRoIBNc"
Content-Disposition: inline
In-Reply-To: <20260908055328.22099-1-hemanth.selam@gmail.com>
X-Cookie: The world is not octal despite DEC.


--LARM9FGqbHRoIBNc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 08, 2026 at 11:23:28AM +0530, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.

This doesn't apply against current code, please check and resend.

--LARM9FGqbHRoIBNc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqf9fgACgkQJNaLcl1U
h9CLYQf/YsReIGWagJgooJEAkQPYLOMYZbD8WMc5KaKGkjBJsiCvt6DRvK80Tl/w
As03RCIR3Tz5TPIpGqUvRQzRCKmBqH58ircOovG/rAkxpzoiICi0fDLWgkNcrw5q
2mJOfphdBXS3Ho7YkfIkkLz23XS6cTMa3k7vMkuPcHV7/w5JSz8bva+gp6PuEFZG
rgRZOPAWY+qtcZUIPek7Y2iJsADxAdMtfCR2Z7sRKK9gwi7NS1T311q9F6unpNfL
bYBTPuR5pLKbu0/sd5gUbZWk/ySaYVKYyNGvn113KL5PTCmo0dOF4hrDC8KCZkUn
Lcd0nTi4TaqgrHt1TeW1o/zySoe75g==
=pPzD
-----END PGP SIGNATURE-----

--LARM9FGqbHRoIBNc--
