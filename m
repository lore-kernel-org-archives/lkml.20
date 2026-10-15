Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6263A40B11C;
	Thu, 15 Oct 2026 22:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102428; cv=none; b=OI1mRaZtpWtivYXiW6ddcitcgbBq7ylF0GTAPZXqrf+vztwQclE2Fg3f8vmfTmEo/v+towuwFijSFZNGk75zM/zkT59heUGNy4HcHa5W/4kSK+qVueVOJaclBMdPaHvNgwWlpjNRrHc6klKE8Jd7FufmLZBdTkLneEBnbE6Fc2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102428; c=relaxed/simple;
	bh=y+VasQ4aL7Focz6vi0d5xxW7JpBpA1cs6a5hhY6eYl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bmdLJpdl7VPmzI7wjecg+ahc73qyrQHg8Qx35x+rt11wbdAEkWrf2FyxWFRcRYUpin8BLToNHlG1mQz9IjRxQXHCpYucBUELmF0+FIfWjWr6o5ASf7dE6lEKdIkaakq/ptmer7pa+woBhVMHzYWlXB6zTAAMo+zJUQWi3djEUbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TXCHMCyN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TXCHMCyN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D293C1F000C4;
	Thu, 15 Oct 2026 22:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792102423;
	bh=ZXpkbDlDApBPK2KQbFof91uesi3/H9UAD12pf5U8tvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TXCHMCyNp2JOwUejlUfnkxZWaLeT4HaVMFnZqFsrKaM/J9Px3R5A/U7j+XSunbaxH
	 9g6TO1gL/135Hl2NX+CaWIMiThGZsb/uLMlectAmqPLla97zZ1XUjRaydVxLeLZ4I9
	 06jhT6MiqqHlnsr2TUMfgvXTT9I+DBtlobnGNhFT1d7Gie14XKYKZWXpzjPy9eCPZZ
	 iK+P7DTPCRyX3U/b5XG4K8z6k59jzB6YcxQuxlWYiUwi78VRFtapi8KTbWdsAi0vIO
	 v/0Vz15L52x55UoQmOpbvC5/xHDtbLNoMJIVsYg8djeQQ7NUTJm+wmhMIlb3ShZRcJ
	 9tOMUj59lSKSQ==
Date: Thu, 15 Oct 2026 23:13:38 +0100
From: Mark Brown <broonie@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, yung-chuan.liao@linux.intel.com,
	Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
	venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
	Mario.Limonciello@amd.com, Richard.Gong@amd.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org
Subject: Re: [PATCH 0/9] ASoC: SOF/amd: ACP7.B support and ASP carveout
 firmware loading
Message-ID: <894dae20-5574-4b88-99f2-55df1861e3a2@sirena.org.uk>
References: <20261013154644.3788064-1-Vijendar.Mukunda@amd.com>
 <179191856632.42298.5680316320552393906.b4-ty@b4>
 <247100a4-3dec-4257-abaa-2b311deb842b@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RSd1CeaTP7vu4YSv"
Content-Disposition: inline
In-Reply-To: <247100a4-3dec-4257-abaa-2b311deb842b@amd.com>
X-Cookie: <<<<< EVACUATION ROUTE <<<<<


--RSd1CeaTP7vu4YSv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 15, 2026 at 05:30:01PM +0530, Mukunda,Vijendar wrote:

> I noticed that the incremental patches sent as replies to the v1 series were
> not included in the applied changes.
> https://lore.kernel.org/alsa-devel/20261014114446.1476489-1-Vijendar.Mukunda@amd.com/T/#u

> Please let me know if you would prefer the incremental patches to be resent?

Those should have gone in separately on top of these, that was the whole
point of them being incremental.  Due to the confusion with lack of a
cover letter they used some slightly different tooling, pulling your
patch out of one series without a cover letter really caused problems.

--RSd1CeaTP7vu4YSv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrRUBEACgkQJNaLcl1U
h9A/TAf/egWlpMYt+GYuZvSVWwehLO4+S8F9z4nYIIc4K+mxgrc4XCtXVZr89bD5
YQFXej6tWdftFrsCyjLTEl/p51oVBJIkvvjtYpCuK/vImp6nwaVfhyd5xEw+thI0
Ki1cbQ7Sh261plY+dkEteUqEd2lP7+j+49iUG++F1PD0/YVfZKDfF/vCbZ0QXJq6
FaLdyk80ShECn6MTgh1yVJNyXX6Ma4sFVKqGULXeew+TyHXtM4kNsUfawgC0M2vQ
hZNdVQDcYnySCD82nN9gMULllLHslgbVp5q+7HD+euYS0bpURpSXdfBuqz/+eTxf
O8jAWoNqMpcljEVN30Gtz8ye43pD9w==
=ZsMW
-----END PGP SIGNATURE-----

--RSd1CeaTP7vu4YSv--
