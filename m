Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29C93AAF62;
	Wed,  2 Sep 2026 12:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351092; cv=none; b=qWVuA9gnl0KnB6QaiSGVjUiUeKiT3NedUriMMb9hYW/XiORfNGAX22EF8RE+Cv7oCh7SOq/zo0DDJXzgcpkv1GCDC9nTYj85YGxfUjpOA+KCDuaDdTE23hcA7dqLxYRMvtu8/W4nsBbpncqsZl0xbZbHGesABQOr9Dj+R9yQV2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351092; c=relaxed/simple;
	bh=XMbIoouHhEHobeMNjktuEmq7HBDFT54hB5VH4UV8c18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NfKpXnOeTcD80WJ+jQqngWmdoQ1U8oLOx+obrYbnU6EhcGwfjTpm/RGygP3gnT//7s98JYLuCp8mi8MZIJLFNQ45ylzdnt9KUZ8HxaNN0Lm1wPm1PQGgEVeIOj+zKYfYjFO8/DgOPGEYDV5EXbHxkwkGtXbMkRIfDF40mhFKMFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5gAWdxS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5gAWdxS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D471F000E9;
	Wed,  2 Sep 2026 12:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788351085;
	bh=XwpTOnFpFlsR2IVVNgUhsYAsd1JKHnUT72fEns1VyDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J5gAWdxSbtz7dP1JzTLOnxnAJOhAgY2MQnAmvKT59vnDS3SEApgcm9S8d0qj7qoP3
	 4lnWz3ClvHf7lYNCO/2Zwgwi4LSUrmXo9Soeu8mAUnck0kILcMmShlCdFtg9squIY+
	 q6CmXwQZ9UixX552ode1kvcO6x572+2Tr1mlJ+DrlcLsLpBSl7LP2blMgp28ukS5yB
	 0C7s1kuhwMtHweFVnFYVwr2khieCmSH5SijKuModD9gnHBB6utuMaDVDE8ZtYuQDPw
	 wFM3FX2IY171fpBn8XL/Av4APOehNb2BaVqzbdpn15tWBOehvZX0kB/zP/c5GssCep
	 4ULDVF9+wll6w==
Date: Wed, 2 Sep 2026 13:11:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <64bdb5bc-ced6-490c-b4c8-fd3dcabbbd4c@sirena.org.uk>
References: <apbbvQSfUbzYRFaw@sirena.org.uk>
 <3cd2c640-3ce8-4163-9f7b-3abba46ae072@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Sh0NKln0pLxJxfm6"
Content-Disposition: inline
In-Reply-To: <3cd2c640-3ce8-4163-9f7b-3abba46ae072@gmail.com>
X-Cookie: Prevent forest fires.


--Sh0NKln0pLxJxfm6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2026 at 09:52:24AM +0300, Ivaylo Dimitrov wrote:
> On 1.09.26 =D0=B3. 17:05 =D1=87., Mark Brown wrote:

> > /tmp/next/build/sound/soc/ti/omap-hdmi.c:408:6: error: no member named =
'card' in 'struct hdmi_audio_data'
> >    408 |         ad->card =3D card;
> >        |         ~~  ^

> This seems to be due to an interaction between two patches:
> 1. 9af2c1d4f847 (ASoC: ti: omap-hdmi: remove unused *card) / 875e906efdc4
> (ASoC: ti: preparation for Card capsuling)

Those are in -rc1...

> 2. 699e5975e2a53 (drm/omap: Report HDMI hotplug events to the ASoC HDMI
> codec)

=2E..which the drm-misc tree has now merged so I don't expect it to build
independently of any other tree.  I'm a bit surprised this wasn't caught
when merging up -rc1.

--Sh0NKln0pLxJxfm6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqYEmcACgkQJNaLcl1U
h9CEEQf9Hk/LuaEd+ZaphNyNmIa5ksIVwyIWx4i/IKB/nh2G137vfaU8FFpD/vhj
8WKJSFftQk6eVmdAsWmCM25R5loZcWfm8V5L13khKtvU1L4v47HyYKLj5PmGgUTn
DQ8uVo3aXmGo8KZNmhraFEvy+5bFzMfZHXLxHoDDSARdX+/TvDRkt6za2HJCqU/a
+QVCadknLQdCuP0tqXuR0xu1iS3K3vrKzGGNL84Gb5yKX3REFNUZpc92p7FY/tDs
SSrzi7yQ7Cpihkb3N7Opn/CHgslSso627hKcTcdxaDBWAahBaN7W7+3KnGLE88Ow
5Kz5rXtGyIsruw0tdirhWAr/SEOQew==
=xwIZ
-----END PGP SIGNATURE-----

--Sh0NKln0pLxJxfm6--
