Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620968;
	b=r3KAj6kaWKW0GAc+Ptff/xmkXVrr7ED7f1OI+wkC6lFkLDYZP4sD9y+KFl2r5kSx8E2Q
	 JzVfV5rK0fX+0je99lxL8apK30QYRiDe5qjaKKdVpRJBiQDtpy956x3+agrSptT5eN4r8
	 6gzWkvNgOO820cJ7RyqXluoiIPZx8rBaG6MWvIQv4Vog32/f4iv7gmKXp4lCoWqM39V6s
	 xCnwbYPnhELk2XkHuTE6XZ8qMW3BhQsFNyKe0o68UOQ+FClFqblCG4lPhap81gehcEkve
	 nP3gcOUz0/PSlWevF506PrrnFQHiG66HIsYGaS42YebL0hZryHc6BUZzQTobziuFdRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620968;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=EcZZcR+j7klFX/DTJ2GLRDMqMpj1vpPCfVf5foVRPkM=;
	b=lslmgaqmY7p105x496fF7YezslHuTs5l0jedjD0nvdkXnC0FwssuG50cAqZ16PSA5O72
	 mmg3VhwEysHYY76cSmUO63xuj7R03cDygz6vHjdLvvYBwjUuJ1vZbwmn3i2Z2dWzeoL2p
	 gsylAo2QF2W1yx8vDiJHLWk0sX+dCJE19pXQsgi/+nLCgN6UINpUz36PTxpr8P9oieOaF
	 YOCJ+S+WCAAuycvjI8Jq0GQbRzcIq4DXu5f7uAWgkXivP6poZF5hpd9kSuIAJL1FXdUw6
	 tjmRYcAAI8tmFO60Ex09lMcjfOBSmKWLtGaJ3Gmw9hIGU2Qw385M7wZEPysK1uU33Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bnlu3lz0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30681606A975;
	Mon,  2 Nov 2026 12:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bnlu3lz0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3385B1F00A18;
	Mon,  2 Nov 2026 12:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793620967;
	bh=EcZZcR+j7klFX/DTJ2GLRDMqMpj1vpPCfVf5foVRPkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bnlu3lz05LNqPTN1A9cNFp+3Tbfr+giiaEUYe8kGzg4tTuE/XHZV6KJN8IGqC4tF2
	 VWWgagg46unmKLvbWb/F50h9kAZeSIw04jd/AZJxEz6BxWUkpXyLTb1bFtnhNsK0mp
	 aq9T8J7LysoHmzefdyg7dhWaulQQ3qb/w32qM9CjXZDVHhnKtMhVOeKeYCV5PbF5Gf
	 eE2tlAC9sQJw7u2BeVYGgil8ihiII/CCAS9DbEMw+4lAjlnWlyAWhpVzpSE77l5InC
	 sJc1RU2WA1W2z1PjCMkMhjj47tzVoJSlULhwc8yCqa+fHDezxRsyfZ1oAtNlfdCbs9
	 GVSKk8EmvF2qA==
Date: Mon, 2 Nov 2026 12:02:43 +0000
From: Mark Brown <broonie@kernel.org>
To: yo@miguelrevilla.com
Cc: Vijendar.Mukunda@amd.com, linux-sound@vger.kernel.org,
	venkataprasad.potturu@amd.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for HP OmniBook 3 16-by0xxx
Message-ID: <a3824f2b-8468-4eb7-912d-495ea47851c5@sirena.org.uk>
References: <CAG9fDsV01JJx6=xbts1XJ3+utG5yzys5BqJ5UcHWp6-_wDKpxA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Np8ZQHrdHf164aRC"
Content-Disposition: inline
In-Reply-To: <CAG9fDsV01JJx6=xbts1XJ3+utG5yzys5BqJ5UcHWp6-_wDKpxA@mail.gmail.com>
X-Cookie: Used with permission.


--Np8ZQHrdHf164aRC
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 11:18:13PM +0100, Miguel Revilla Rodr=EDguez wrote:

>   DMI_MATCH(DMI_BOARD_NAME, "8DC2"),
>   }
>   },
> + {
> + .driver_data =3D &acp6x_card,
> + .matches =3D {
> + DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
> + DMI_MATCH(DMI_BOARD_NAME, "8EE3"),
> + }
> + },

This has been mangled by your MUA so tooling can't understand it, all
spaces look to have been stripped.

You might want to look at b4 to send the patches, especially it's web
submission endpoint which avoids having to configure mail:

   https://b4.docs.kernel.org/en/latest/contributor/overview.html


--Np8ZQHrdHf164aRC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmroe+IACgkQJNaLcl1U
h9CVCQf+ISpDPoJiTcOIXHjhK6mWD3FaA+MfF+myVfyvSxfVQPzcH4owi4YEG9IC
MjeqfXdiEpL/PEbxkUEKsavE0YDiQeLMb0+4KZHsJbpVJ79U4/VqCZGTY4i01tg4
IbaoHYyn6ofYUaTUGFyVko4zWLVbDTm3MaPUr0fuoIPQW0PGZc/eZf/xY5sb678P
mRJR3fEPrHYF9IxtGnYG/Lshq5MhS3q+7oZgoH3PQVMdGHw1Yt5KYBub5oetcDLT
2jSnRZrIxhRvYj+2EwYc1SZL26UqhL6Hvt916dZPicupxkBAKQyqR7j4trG04BGj
twDj+s9VEO5f6OsxqZ3k3EPV0w1nFw==
=hSu7
-----END PGP SIGNATURE-----

--Np8ZQHrdHf164aRC--
