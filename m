Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46B7577E27;
	Tue,  8 Sep 2026 17:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887794; cv=none; b=Ac4uf/T4j+mB7aQLJoJl98bJ6WLnoOSC6PNbUJKA3TP1WZ08tXbXdbNrTqYHRJ9WHK794bPH6j53s241bx48EqFEJx4FRkUOJbj3REyNmwzOpD0ls4zKaLFWSmJF1GIj/O1eaxN8M8TRbhTiXpOFKaNoy3/unHvAhYWkgPgz7fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887794; c=relaxed/simple;
	bh=VRgB//hzkDY6/MgELEE8teWg70GGQDJSuGgWn+z1Sdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l1tmvHuiGXQHSfwDHw1D1IpF80fSEtSXufWSaHZRJUzMkW0V1/P+pqUjqlcLNPGKO+3AnPqAWsd8+SGRwlkT4pfe3vVsXhA+TKfHK1QA8NtxLz4d9pQQxGXnJxanKP9k2aDcRCsnA2lPs/rn2R2iHeIuM9Ed9h016Ht2r4V1jbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dkKGL+lE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dkKGL+lE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C4B1F00A3A;
	Tue,  8 Sep 2026 17:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788887793;
	bh=A43a9j8fqGC9GLqUB9o9nADRlqMkyUZogeVadR03P4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dkKGL+lEwcPn4w/rE/HJGfaE7dlmte83yGx5X5n//nOTgTDky93vF7hiDIFOZojUH
	 CGmx/rk8miUAcWcteKSWPJMdJfwXVSxF8ajmhTtHmp4NH2+goMjxyZY+GhWFzEqgM6
	 VX7vnqyjQmUMuBtIw5Lt3xrz2YLCTSgJvfnIE7rqA1zyLK4t2c/7yRZun1WNhUjqO6
	 Agcc1tk5GUuwvpPO3yhWVGLbbAFVXWlPN1vhwMDElta91mdLEKIazU+CqJIijwJ0r5
	 cjtJQu7qsyx28I6EF5cGpZMjHMNCe3RxGhK0zRuaHH72AVqhAlY1nTVTSD4JWF9vsH
	 ZaTDYmxECiwRg==
Date: Tue, 8 Sep 2026 18:16:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Alex Huang <Alex.Huang2@amd.com>,
	Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
	Fangzhi Zuo <jerry.zuo@amd.com>, Ivan Lipski <ivan.lipski@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mario Limonciello <superm1@kernel.org>,
	Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
	Tom Chung <chiahsuan.chung@amd.com>
Subject: Re: linux-next: manual merge of the amdgpu tree with the drm-misc
 tree
Message-ID: <042afcca-18a6-4372-ad16-c2096c216b98@sirena.org.uk>
References: <aqA5IjDLvW7ANQ3K@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yqkAhJ13gHOfVvg+"
Content-Disposition: inline
In-Reply-To: <aqA5IjDLvW7ANQ3K@sirena.org.uk>
X-Cookie: The world is not octal despite DEC.


--yqkAhJ13gHOfVvg+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2026 at 05:34:48PM +0100, Mark Brown wrote:
> Hi all,
>=20
> Today's linux-next merge of the amdgpu tree got a conflict in:
>=20
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
>=20

> diff --combined drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector=
=2Ec
> index e7b555fa666fb,57c6b32b95167..0000000000000
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c

The merge here is wrong, and there's more extensive conflicts including

/tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c=
:2962:1: error: conflicting types for 'fill_dc_plane_info_and_addr'
 2962 | fill_dc_plane_info_and_addr(struct amdgpu_device *adev,
      | ^
/tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.h=
:1262:5: note: previous declaration is here
 1262 | int fill_dc_plane_info_and_addr(struct amdgpu_device *adev,
      |     ^

I'll get something that builds but no idea if it'll work.

--yqkAhJ13gHOfVvg+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqgQusACgkQJNaLcl1U
h9CK1Af7BFNLKvhnJ5swA4Q6yYV5aADDjfXvTgWmnlhlZAGPYe8SRZCarL9ojWXt
L/Aj9VDPcLCLk+IOQwBgbncX7GZPcmgF0CLaA0GqBv9i5PK6p6sUASF8I9kp48Mq
AJFEzgywbiq9MfQQCi/tIz6WeBRv+2/ZMkTkc407vuth5qGtBpekYSzjoOS2e8z+
+w+KemYw6dWytbiwGGr7ENva7g3hEa+tuu45VXoMVT9yzPCPgnnSXwfAuVZOICHF
mKsFXA59gPIQ/b7/BSIFNWbdemqlnDoZWwNDg9US4M65ZzdwP9QAsI3+eQsMlvnB
TPi0yv6tltJcmmuKDK4+KKaWwV0L2Q==
=fRgC
-----END PGP SIGNATURE-----

--yqkAhJ13gHOfVvg+--
