Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CE04F6485;
	Wed, 14 Oct 2026 11:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978911; cv=none; b=BiLTVFU6ixQT7RtucFp6vjJ0dODbD1gcQ6T2Nw64vYw8ZC6Wdmf2bveAcBeBfwywrB4P325M+b7jUXfGSxuGaVe5wjJXpBGKvleGUAiebmUyP2U3AjXkfcEdDWmNBr5l1sYFxTgORSnS2rZx9dw2evHEvZZSygXgtVip9uZ4kcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978911; c=relaxed/simple;
	bh=/g7MCk/Gsb7irDnQX7W9ONQLd1+H+J5E0tN8p6IXwwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXChbp6h6Jxouhed92eCjo6UMQ4G750gWnZHSeepUiGv8x22OpGwzA0oq2iDwldpxFOCifQpYPN8FvfWpwzSU5uyV2TYIjS6609GHRnpFhvq5/cdJ91QoV2UcSbeMh5SdUZtbw00IOT2XroGwFR2H0RqwJ9slNWTGuEi5WdWyVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V7SdfNiF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V7SdfNiF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0321E1F000FF;
	Wed, 14 Oct 2026 11:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791978909;
	bh=PJKVNYTz8cEA7hGglxgr5GsM/gY51wMpyvw03FfWbN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V7SdfNiFCB2UnrrV45qpKp1QdVKNEWYhnuhe1atCP2leLhMfwEOJaxgTODJ6QnOqI
	 4FnyA8xntx/xbNhnRqQ1onqAk9VbCtI2cWAk05QSvZniWTxZH14BPG8tlOjJVFBPRi
	 s5x5fdhwsAsgAg5+/gr7NAdaHH4sosnOBqTonp027Nq/FTBQKfeKnQ50OtDE/kmq8J
	 dW1EMcKHRnOz/J4aSJsKhcDyAM2WcKhB+FmaMgPAc5pIltlPPCsQRMvTXaQnkYGrIV
	 9MRMd3tqwAkfYW1UfkIlAnsZOqNE35u4//il60S6pcVFdtoOd9EBgABNo9OjZiIu97
	 WNH+yZekVcFQw==
Date: Wed, 14 Oct 2026 12:55:03 +0100
From: Mark Brown <broonie@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, yung-chuan.liao@linux.intel.com,
	Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
	venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
	Mario.Limonciello@amd.com, Richard.Gong@amd.com, Poojitha.N@amd.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v2 00/10] ASoC: SOF/amd: ACP7.B support and ASP carveout
 firmware loading
Message-ID: <1736b25e-608e-41ac-8e8a-4b0a125766ab@sirena.org.uk>
References: <20261014100902.1215212-1-Vijendar.Mukunda@amd.com>
 <a22f2a9b-3bb9-40d0-80d6-4ce36758c4f5@sirena.org.uk>
 <031c7453-9652-4573-9de0-5db2a795562c@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DJ8TnKPIJwrD5pi4"
Content-Disposition: inline
In-Reply-To: <031c7453-9652-4573-9de0-5db2a795562c@amd.com>
X-Cookie: Live free or die.


--DJ8TnKPIJwrD5pi4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 14, 2026 at 05:21:00PM +0530, Mukunda,Vijendar wrote:
> On 14/10/26 16:14, Mark Brown wrote:

> > v1 is already in my CI queue, can you send an incremental change with
> > the new stuff in here.

> Posted an incremental patch set on top of v1.
> https://lore.kernel.org/alsa-devel/20261013154644.3788064-1-Vijendar.Mukunda@amd.com/T/#m6b17b469c043e46ee50a3a85903324c896c81c4e

Thanks.  If you're sending a series as opposed to a single patch please
always send a cover letter, it makes life a lot easier for tooling.
It'll be fine in this case, just a note for future stuff.

--DJ8TnKPIJwrD5pi4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrPbZYACgkQJNaLcl1U
h9ClEAf9E1iR7hCm+zDfCPNCNxOS+S3V475PoRtG/TmfBbZjSfoOOw29uu5HLg0R
qxGj6pLhkKs5wKkRNPgwvOEW3WdXvlD4g+9RqIvF+seqYwgPJIeEuv5EnuWerhyn
pQdcz7/5H2WIJQe3+nMkotDXKCRq9+8KLx5mMABAkZxzSEfhaHEDcDqVXDQezNnk
hJlHMv3C+QmxKfOb/cAjmsaLIp0S34DjdQw84pW0v5m5HTRZWvSlEy003ju6VK3K
fNmai/07viSQVnXIAH/TKuwlGfX/2709lZA/MQRcOlH+404QAzWr/tOkIRh+IKA4
0S7mvuNP4zSg3ORKxR5iV/ilC/lRUw==
=vqcW
-----END PGP SIGNATURE-----

--DJ8TnKPIJwrD5pi4--
