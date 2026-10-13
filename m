Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F115349DD;
	Tue, 13 Oct 2026 18:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917388; cv=none; b=UfvVLJzVfJHj5hNH1q/WF2ow47ARxfap6fMi8ghBorKiQiJKA1GdQwSyK/HRYIRTggKxc+A8MNFeWQXdM+plYgpfYw1WNF5mzrzJNhIkr+8zUIrpeaXpMhX1Ze8EZ/vgeK1iX0ZaHgw3iXSGs7E5ExczgQkOXW9nCU0438+JBMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917388; c=relaxed/simple;
	bh=2hgOvZw3kNSqCxlZci2oAYXD7N2Bd+0CQorMdKpwmYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/HCdKfoG2LYL5YgVBbAqGLFASf1yCDlM6veCph3bFOy3vamLvAF5LfcUlHwKM+YAcuzA3wkOCdu94uWCoabNP0tAt1ko4B6l5oeRmFHh5bq4hxw6Mw88UWNmPY6WttCNa5ZnC9vXAFeZ2R/hE+LkVwdlYBO8sFllWC0BOkPM0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XkqyyUkM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XkqyyUkM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 517921F000FF;
	Tue, 13 Oct 2026 18:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791917387;
	bh=2hgOvZw3kNSqCxlZci2oAYXD7N2Bd+0CQorMdKpwmYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XkqyyUkMMfO6XOG4t0n8VrIRXLBViT54XTKerD04IYrix2p4+uSgR8/t5Y3bdU46A
	 bLgCLdKhZBZt/1CAJyfVFbXi1MZFFXuJBSlrY2vIXNqd3Ha7CEY7NB7auJ5myCWaU8
	 Lw9hjAnXLnD48s0iW2vSRbDfg0kCCgSvJNp84hfH5fcV9tWTEPCfBFWUBp6oKZkIr1
	 LimJ8JX8qtK8dFfezPQxZiqIdmMCFNkMQC2vA2xrqz8ALaevOoGqtrmrlpy4szHT1R
	 QPkEMHZwrMTs9CvydZf2IkNscF0GZdlfmR3TIrFhmLmjE8O6WGoqnHLnPnl2tX4Wcm
	 rOWtpLmZgsBdA==
Date: Tue, 13 Oct 2026 19:49:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2 RESEND] ASoC: codecs: Add support for Fortemedia
 FM34NE DSP
Message-ID: <ebfcdeef-d0dd-4c4a-87bf-4ef3fd505b5f@sirena.org.uk>
References: <20261013184755.530392-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EpxNXgxlQQ8aoE/S"
Content-Disposition: inline
In-Reply-To: <20261013184755.530392-1-clamor95@gmail.com>
X-Cookie: Some equipment shown is optional.


--EpxNXgxlQQ8aoE/S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 09:47:51PM +0300, Svyatoslav Ryhel wrote:
> The Fortemedia FM34NE is digital sound processing chip used for
> active noise suppression mainly on ASUS Transformers.
>=20
> Resending since previous attempt seems to be malformed.

Please send a new version if you have rebased, tooling gets very
confused about which v1 it's talking about.

--EpxNXgxlQQ8aoE/S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOfUYACgkQJNaLcl1U
h9Cf2Qf/ab2mIIZbOJnQzp6aTP+sgDe5dnkhSCQjRG2SX8vFG64LvhoVOQ7F47NM
Os74DVb+v4fH0QOI1nxdC3hUZoh7PUjoxErBaahpjW0hW+3Jvkb3+yQ8dz6MpJno
Mm5ZLqvTF+9UJRX4NFazvptGch153CRnWjcgEzsYo/ExJ2sj/Ljtj7yd/AbbTyw/
u2YWAkp2+0MVo5FyOjjnyCmQP4fKQG4BszU8qqQHhiFx/CZcHgjebQzWbpZ9EbcY
MdC2ckdfbyMr1U5lYYMPFPLzsio29cqjufP+bMaaE5478WTNuJD9CqIOORfUQ0JH
qEUFF80AjouxfrD6UM8t5qzXvjM7Uw==
=EPkF
-----END PGP SIGNATURE-----

--EpxNXgxlQQ8aoE/S--
