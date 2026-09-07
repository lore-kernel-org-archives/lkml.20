Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3313AFAE6;
	Mon,  7 Sep 2026 19:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788808811; cv=none; b=NYIOkZOTk5PmqsLb0xsLgJ5ClRU87uf9ITu+qPwZ5gCkGpu4sq3uNz7QLkQw1UZ/NWVDa9o5Neaoff3wug2AtJpwCNXtVLfZUolgIFlc2XdR0Jdc6dQACes+jb4/+HhTqaeJz0eWyqkSPcB4CiAl6qA9HcyI4O+K7usUL9Gsjfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788808811; c=relaxed/simple;
	bh=B2X4bWGMk/FhaOtRzqPtbwCBIe/I5ub1vzMOSMrZ/dE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rkLyQn5SqpwbxC+tyEESi0sY6Rl/C4hQrmAkodYXyUbNGzGOQS0f2GmlLhJVIDsu5gJiwqFcgObeYyFCZwHAPHYCCNpIxduH6ze0UyMvsragFMk4T2Be5YDa8Rtf0RqeLsYLwdXZiiZ2nG00vt0wO8gTGW++LUm1fIIYjF2l5q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QaR7vrOi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QaR7vrOi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42B101F00A3A;
	Mon,  7 Sep 2026 19:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788808809;
	bh=MBF954dvFmkhgI0aFSJi7k7vhmBty1EC28SfxK4YPSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QaR7vrOijinEhd9KEUPySAQE3a5WYYOYaTpktNd01h4PBTdOoQkU6YsCp7p5g/BsY
	 aJwOxHZY3o1ftkakOMn1ObMgdgNw0emPrxgS+f+HDR707+J3NtHKfVJ1jIi1oPPs+h
	 4yeGJ60ThUsimj53ngWWMom4pLdSutXUP8DZNpics1uAwNhw6Qq9kIGpk2JEZ4hze0
	 m72fTjg3Y6PkDfxCTRqp8EX0oEFOnVJPri/3WR3D9O2CvA9pdCdwY2e975FaMcu8d3
	 WQwN/zeCQDNFMzniwOwoyk9BCjUExOKRwSBZxgRpv4hHDBPJT/zkMqf2UJFfuS/lM1
	 hFbG8MAS4m53A==
Date: Mon, 7 Sep 2026 20:20:05 +0100
From: Mark Brown <broonie@kernel.org>
To: David <mafiatamilan@yahoo.com>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: amd: yc: Fix internal mic for HP board 8C30
Message-ID: <0b298bc2-ae48-4e08-823e-25be3ce09382@sirena.org.uk>
References: <178867857905.85694.5014721659216165123.ref@yahoo.com>
 <178867857905.85694.5014721659216165123@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jp8fH7H7p8UsvJg1"
Content-Disposition: inline
In-Reply-To: <178867857905.85694.5014721659216165123@yahoo.com>
X-Cookie: Who's on first?


--jp8fH7H7p8UsvJg1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 06, 2026 at 12:39:39PM +0530, David wrote:
> The HP laptop with AMD Ryzen 5 7535HS and ACP 6.x coprocessor (PCI ID
> 1022:15e2, subsystem 103c:8c30) requires an entry in yc_acp_quirk_table[]
> to enable the internal digital microphone (DMIC).
>=20
> Without this quirk, acp6x_probe() returns -ENODEV and the internal
> microphone remains undetected.
>=20
> Add a DMI quirk matching vendor "HP" and board name "8C30" to enable
> ACP DMIC support.

Does this already merged patch:

   https://patch.msgid.link/20250715031434.222062-1-queler+k@gmail.com

also get things working for your system?

--jp8fH7H7p8UsvJg1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqfDmQACgkQJNaLcl1U
h9BxRAf/cCwAPCz7cNsbjofRRmDXMH/m9AKzvJEsnuD7GpCSiicCsjawdk7l3AOb
IkmiHFAUALP+2WB+7c0iptxSXLnz1VR8CEsb2WRYDsgrTS5K9FKIOfHeJEK5D429
VC+XjJ+Adw72DDPpi55/it6s4HvnAzIZg5nVbXkteBvfeeLJ0SlzHjLTgQzqkLok
ePAnR8sL9KfacqImhNCZ0LwWJi79SNBmi7Rn9BIV7kuLIOCV7zXJUWWMl6KslA1X
KLPjovqr+zhe14wd5f1NW/F0ZYSI2mUOPPadX2RQizWg0Np4KuSRD1pXM1TRCUk5
ivwrwR6N/q754SDrB7NqZtpzfTXvBA==
=dQrf
-----END PGP SIGNATURE-----

--jp8fH7H7p8UsvJg1--
