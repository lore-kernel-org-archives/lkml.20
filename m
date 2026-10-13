Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060D648D862;
	Tue, 13 Oct 2026 18:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791916456; cv=none; b=mQ9rElsnlOI5DQFUG2EAWrb8b4hp1CzBM4ZwjHrBoE7GvYjD6+Z9AQNxd2sUpOvzVFZMoV5TwpKZkFCJ3Syv5uh4G3QHXgSjDfTFqXlcxJ26nIJx5JF0vdNV7tgTv6HBXfaShAyfnX712J7df0gLDsY1eqNyXtHq7V3THM5qrQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791916456; c=relaxed/simple;
	bh=DWf4qAJy69dY1ozVthBYbI8nOUdOUEW1qdCmzi0RzG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LmUs7PPQj+fqX3JQWwx4CkK30b4RbDLMJOSy1VbLy1nJm5iDV2zKmwzSi0sfVEbZCod8QC0dLPvuXiVs5J7/6JXSn2YC4cdy8URQUB2iwuHtzje97k4Z55VAk70gCV6C139pORx8opXTcKfMMsy3aBIoZHCzJECA1bsa/bJRsuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TH3dcqXc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TH3dcqXc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D1C1F000FF;
	Tue, 13 Oct 2026 18:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791916455;
	bh=DWf4qAJy69dY1ozVthBYbI8nOUdOUEW1qdCmzi0RzG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TH3dcqXcx4pOBLUIJD8x0Dyex5n7gN5uw7Qc1/lEfmC7gtVFqH4+EAwLofx2rn/b+
	 tSmB5neCDlzBWwUKTvxgl/QJtuTV/g6Edb7kka4Kq/FF4+oqNPdJyIdwyShDBNNTub
	 nu0+xTSiDK6LIgI6E+m3x+yCjgJRKQR3Sl1LvGYGiahwPSgzHe08VLhzI7ei31MSAq
	 sm36Bk5WeC4FKAIFUwIR+VGvH5pwtKq0uGzVKKcSSdYMMETSZit27A38EPPMfTx+JY
	 wqzBW/i4xLcDaH+gl0E4Gni8mgyLg+c5w2I5yeNcWhhZwNiIGxU40rkUQsDsK+mkms
	 QSZHZw3ozpQ5A==
Date: Tue, 13 Oct 2026 19:34:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] ASoC: codecs: Add support for Fortemedia FM34NE
 DSP
Message-ID: <2670ea8c-f8d5-4986-b358-17ca112301a2@sirena.org.uk>
References: <20261013175735.473704-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zLW+L84HSkzgEgMQ"
Content-Disposition: inline
In-Reply-To: <20261013175735.473704-1-clamor95@gmail.com>
X-Cookie: Some equipment shown is optional.


--zLW+L84HSkzgEgMQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 13, 2026 at 08:57:30PM +0300, Svyatoslav Ryhel wrote:
> The Fortemedia FM34NE is digital sound processing chip used for
> active noise suppression mainly on ASUS Transformers.

This doesn't apply against current code, please check and resend.

--zLW+L84HSkzgEgMQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOeaIACgkQJNaLcl1U
h9DGdwf9FZkHiEv38iqNA5DsX+jReKG3haKbU4vU+LCbeqboKKuP5p5fJJYpLpm/
nGhFiZJg3/Jmt9vgtNmS/xjxvTOr7TH+wjxFo+feuSB/SlnrGk+2Sor3MzHI8frZ
7NTXHlDNJUVLBWlkh2BK7NeXQmhm9FfZNdolGEcJRg5g8rfPrA3b27ihpjvZ7wuj
ttQU4//1un1o8qe7aylqztffAeNcm1S/hDLxso4FOcgrhylkusYkxDpHtkUF0JY5
xW4rD/3lOoj0j+0BopIyHRXMR+WXcNhguWGovie3L9H1i+fGqleVk1uFCUOMe+iY
7IKFBiyUGrnyNAqL2dRRRPC9ew7GRQ==
=rEq8
-----END PGP SIGNATURE-----

--zLW+L84HSkzgEgMQ--
