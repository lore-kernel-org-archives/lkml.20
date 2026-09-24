Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CDF4A0134;
	Thu, 24 Sep 2026 16:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790268874; cv=none; b=lkjt+jMQ3+Q/ToSA+6pI9MJiMbRKAbGchS6qD85WCJ8hUinVevirNcFJACmjNqdxkYRzuKbiL3jzqyoau9NzdSzWm1Lhvm/ElHO26VLm9JgRsFT40rYh4APFLo9ElmSLpPfo5DHu3GCudo7ucGX43zPKkEAaqrVzor4lCIPOV0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790268874; c=relaxed/simple;
	bh=ej7ynPhVNW1HHrrZ+64/Zrm/RLpj3ZWMpW3KkYztt9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Va0gtHNSrDZ+bXaTLSSI8RTaLxFLz+Hh7Sw0/Wi3HzZkU/fJ3CulLhYJBQQn4c9ibV4tYt9x5HTtGGVo4TaPaDFd7DVLtgeyge84ZL0jaPjaMQvV4f7Ml0KuoqPnT+6x+zoNq+JhVPcmG+WzJJvAyWO6O+ecAWo53+zMjWllL/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kNCdcQU6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kNCdcQU6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D6081F000FF;
	Thu, 24 Sep 2026 16:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790268872;
	bh=BkzAkiWdzegc3H0KCcLioXPh2WESOPx/9LTCwHSdQDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kNCdcQU6ajBlxqBQ4LfRJawizexIf/eZEFukJwJ57sYk18nimzTBcWPVDNFLDHySK
	 rCpOtZA+6PjhIT0E19ZwrY6scDJaa+kMEqqFeyfTdgpH8EUcEUxWofrpidInfRhorz
	 EV6X5OWA1t8WELdvJb576pvporyY7+awdjs7lKrT6+Ll1DoQ31/5LDLw7+QWcbP3nj
	 Do3oI4kuwVWIkgszw5O7APGw5hxlzcMtvWkXf5Tvxv/FI94tneDDkfx7FjvLobLgrB
	 n1n3FLH+U0uyRftC8u+m/goilZncfB7C00KlmZ6CLUe0kDbxn5ZbDuYeweKevJcCBv
	 Mw8EOwFeVQHaQ==
Date: Thu, 24 Sep 2026 17:54:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@redhat.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <4ddbd29e-3524-4f4c-b6d7-1e2e677641b5@sirena.org.uk>
References: <arPTRF4qS6o1Q3vD@sirena.co.uk>
 <CADnq5_NUH1MBU15Vs287by4P37YV+6F1Q3J1e4Q4KuOvPwK9Fw@mail.gmail.com>
 <arPhsTaiqXPgCqAU@sirena.co.uk>
 <CADnq5_OJ=kP+0=iXbpcjsWbTx8=sNfov0wLSW53qLcFU0fmVVg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TfUEtMAqWQQDRMnd"
Content-Disposition: inline
In-Reply-To: <CADnq5_OJ=kP+0=iXbpcjsWbTx8=sNfov0wLSW53qLcFU0fmVVg@mail.gmail.com>
X-Cookie: Memory fault -- brain fried


--TfUEtMAqWQQDRMnd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 05:57:24PM -0400, Alex Deucher wrote:

> Your reports are valuable and we always take them seriously even if I
> don't reply as quickly as I should.  For the issues at hand they
> should all be fixed with the following patches:

> https://patchwork.freedesktop.org/patch/755725/?series=3D174828&rev=3D1
> https://patchwork.freedesktop.org/patch/755741/?series=3D174834&rev=3D1
> https://patchwork.freedesktop.org/patch/755769/?series=3D172614&rev=3D2

> I'll push a new -next branch with those fixes later today.

I'm still seeing at least:

/home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/dm=
l/dcn30/display_mode_vba_30.c: In function =E2=80=98UseMinimumDCFCLK=E2=80=
=99:
/home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/dm=
l/dcn30/display_mode_vba_30.c:6666:1: error: the frame size of 2064 bytes i=
s larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]
 6666 | }
      | ^
/home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/dm=
l/dcn31/display_mode_vba_31.c: In function =E2=80=98UseMinimumDCFCLK=E2=80=
=99:
/home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/dm=
l/dcn31/display_mode_vba_31.c:7460:1: error: the frame size of 2128 bytes i=
s larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]
 7460 | }
      | ^
/home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/dm=
l/dcn32/display_mode_vba_util_32.c: In function =E2=80=98dml32_UseMinimumDC=
FCLK=E2=80=99:
/home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/dm=
l/dcn32/display_mode_vba_util_32.c:3278:1: error: the frame size of 2176 by=
tes is larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]
 3278 | }
      | ^
/home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/dm=
l/dcn314/display_mode_vba_314.c: In function =E2=80=98UseMinimumDCFCLK=E2=
=80=99:
/home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/dm=
l/dcn314/display_mode_vba_314.c:7546:1: error: the frame size of 2128 bytes=
 is larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]
 7546 | }
      | ^
cc1: all warnings being treated as errors
make[7]: *** [/home/broonie/git/next/sfr/next/scripts/Makefile.build:290: d=
rivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_util_32.=
o] Error 1
make[7]: *** Waiting for unfinished jobs....
/home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/dm=
l2_0/display_mode_core.c: In function =E2=80=98dml_prefetch_check=E2=80=99:
/home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/dm=
l2_0/display_mode_core.c:6821:1: error: the frame size of 2160 bytes is lar=
ger than 2056 bytes [-Werror=3Dframe-larger-than=3D]
 6821 | }
      | ^

after merging amdgpu today, note that this is in the -next merge and not
just the amdgpu tree in isolation.  I am currently holding drm and
drm-misc at next-20260921, there is a conflict with the old version of
them though that was just comments but they'll be in the history at the
point I'm building so possibly whatever git did with the merge is
causing issues.

Any fixes will also need to propagate into drm and drm-misc.

I'm also still carrying a build fix marking the display KUnit tests as
BROKEN due to the issues with the conflicting changes with drm-misc
which several people have noticed, for example there's this from Arnd
last week:

   https://lore.kernel.org/r/20260915201006.3526945-1-arnd@kernel.org

None of the mails I saw about that or the issues resulting from my
mismerge got any response either.

--TfUEtMAqWQQDRMnd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq1VcMACgkQJNaLcl1U
h9DVrwf/fFeeDT5pfDcxHGFhYdqb+fTkCDcSDPtwkCUrKEHGBTabJ2uY/V+h36yq
BgYE6dIWD14pzaSAhnum5ZSwk8Ht2+mf9uJFA9qx5Pa/TCLMZmkMijGwXMLR7vNe
oUOINfjXh2fVgdOZ0EfDoFOdOV9xtGI6Ar3sQV5pqvcFg7I5H4xUx8RAQJQdNBUC
kEB/dcwF2sLC7sHhaTdbkbnuRBgC9fkQbvurG8VJE35xKbd8x3xs3PTUbm4Egx6b
q+V4Ly9Qm8NZbNu1EvLy8XvgXfR+lpDJ5YjrQpBWPBkTVNJ/9O7dW/rItnEPHdEF
zbarZkyx0UmPvj5Aw1uvvvcWaAatPA==
=O+Zt
-----END PGP SIGNATURE-----

--TfUEtMAqWQQDRMnd--
