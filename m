Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47E655930E;
	Tue,  8 Sep 2026 14:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876438; cv=none; b=UubNf3QJHjhPX7w4PRyhCWug9f6zMg3DvAmAQgojq4bCbA7iFZKqk7FBVhvgXmpQ06So5xIIq0WEO2Dv70gFEUEUn0FQSf3mkXKjeathhs2TAfnRbSkg60h8tTnNFu6T8w1mOa2SrxGaT5CdYxOZxRukrtvbesLpTOww34DWCVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876438; c=relaxed/simple;
	bh=A6ErJUzN/3d+hkswBOGN9aGW81VCvFSDRXx4S8LOvGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sUU8piQ44cvFjCswUfrX447hiNWyMI4cCDsZ6Xbzqk7IFGAL4BoVwSEO8gWynS//AXvwj4y8kybT6QqPhd6T6FuoxNQT/8XWM+6oLCOdoHklQXZ9ph+IXJxDgx6Vu/YEaqQaXrjDypkHOtxyaUouWUHgpGdbrnlDhbEClxm112A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBBFB1F00A3D;
	Tue,  8 Sep 2026 14:07:00 +0000 (UTC)
Date: Tue, 8 Sep 2026 15:06:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>,
	Alex Huang <Alex.Huang2@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <5d3de44a-c382-4ce6-8f52-62696e67fcd0@sirena.org.uk>
References: <aqAVSgsypMch2c0v@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lOeEdv7AiO3TZxIk"
Content-Disposition: inline
In-Reply-To: <aqAVSgsypMch2c0v@sirena.org.uk>
X-Cookie: The heart is wiser than the intellect.


--lOeEdv7AiO3TZxIk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2026 at 03:01:50PM +0100, Mark Brown wrote:
> Hi all,
>=20
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> ERROR: modpost: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amd=
gpu_dm_connector_test.ko: symbol 'parse_hdmi_amd_vsdb' undefined!
>=20
> Caused by commit
>=20
>    65198b3d0738 (drm/amd/display: Use HDMI FreeSync range from common EDI=
D parser)

Sorry, that should be f65198b3d07389afdcb48e4ad00fea2aded95dfd.

> I have continued to use the version from next-20260831 instead.



--lOeEdv7AiO3TZxIk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqgFmMACgkQJNaLcl1U
h9DHlgf/bWfZ0Bc/2mHhv2tpOgPyltTb5KGNuzhTCET0U2SXgPR82UeHYmsnUBCF
fT2zq3X3e4Q5MWIWcGElfhJ1F7m24HK9ZAHjRqdsV4+rZt7smt1C2oJDfbRa3/i6
e/E7RcBk4x16bTBHFf+83uw5GRZ+JSB8YGu7UHlAoNJOQ1KfHXAV0LAWsqr/PNpU
TBHMEpnf+K06ArjafUUXDSiVN2sClsyRiBr/hMXaRlUwFhcVfjfvT7YPKi2HxiNm
27Jhv9hK7/Eo3vz9Ud+kGd8Z+8kAZHlkB5hE5ewn833JVjk05JxSeej9R/XdTLqY
Oems2SAKeHZW5+ktGduJHrQzaKQQyw==
=ic3F
-----END PGP SIGNATURE-----

--lOeEdv7AiO3TZxIk--
