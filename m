Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794358366;
	b=JZgSTGfmSGcZjRSmpWM/kixuek0vDZj4SHMg3dhvE5YXHRs/PzT2/yqJNOpSo4nNmSrz
	 8Pj6WFL1Jpq4/bVZdsZJ+VHBL4Hv/4cxidkteq4O3ztmckTmWOF3rwiePyahhARE6JQJa
	 NtTfLHtGZ6yEtGVAWYmoBH6nJmhtqgJupjf4d8IzlcLGshz4WM7Ds1Wc5p0PzgXmgGW5p
	 bcIuNiL5egkA6gEC6VWZgi+9sumX3nahi4TlReOETw4NdSv26gkLyP6Bn4wVBA9PmMdiS
	 dHEXWf5Pzx7phVbYqpfTfazQUE9O9Xink62QJZgZOdBxiLedX2VMJZPF5FeEkQb/Pzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794358366;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=YMyutFEugDgQRViMx4h+fLyzjQAiATXS7cL+gnKt9H0=;
	b=KP464pIpbwsTmPPDqf6IDUYatJG2iYDzcZ5fVZi2u8zi636vJoZJdKuIJC7VM6DGB/la
	 Xwkiv3qNJHd2ErQHOstJKVUflX3M5YJjkawRd2wfLSYt2TCiVPnqBQq/+cdLQmsnCVfHJ
	 lnVKH01PkNiJ0ofCYeBI+uoMHlce63PYoJbvQ9IT92onBgvQ36DFCj1taJoqid0i5/oXZ
	 VF3i/IRWq3CuX5wykRU/TMQ9SSVNfeKLDIV6lEawjyhOlwWGe2yuhmK6fjNvS0Jt4wDBh
	 0W8tp1DF+rj1DWgVL2lvR6n8RzJpVKp0KFigs7ic/hlzAYlC6nwyzMpQB/HJF/MVhAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OPeETZni;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07338606A31C;
	Wed, 11 Nov 2026 00:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OPeETZni
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03DCE1F0089F;
	Wed, 11 Nov 2026 00:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794358365;
	bh=YMyutFEugDgQRViMx4h+fLyzjQAiATXS7cL+gnKt9H0=;
	h=Date:From:To:Cc:Subject;
	b=OPeETZniu5d6wPvMima8rknOenjAp7z+jKvR4Pdjjx7DjHMRKsXnVYz3AsGvJRk9/
	 resH/YHJOygSaCg6+g4DF3muGs8W98rU8OYLZH7IXs3ROVmANbWhdj9J/925unCeEb
	 8WswN4aaNPan3lBbW5oDNgKOzFWHI9ynhNWiLKbe754+FpM/oOSOVc3/upjdJOFqv2
	 um4QFRee2YDs9bC7Ksx03F76qXv4VPP8Wpu0J3rmpR1ywQuk8Ce6ysFBjCm+XLcQjA
	 z5ZXzUMaIAlVL4j0U2sua1DHbQWExKalNVXRLSq0bWwdaFjLkGy0shSsc3OaHQSsCs
	 Ufs71HLR1Ho9Q==
Date: Wed, 11 Nov 2026 00:52:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>, Mark Gross <markgross@kernel.org>,
	Muhammad Bilal <meatuni001@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drivers-x86 tree
Message-ID: <avO8Wax_1SEQ3Yy5@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="apjTMldALHbD2LvJ"
Content-Disposition: inline


--apjTMldALHbD2LvJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the drivers-x86 tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: drivers/platform/x86/hp/hp-bioscfg/hp-bioscfg.ko: symbol 'strnchrnul' undefined!

Caused by commit

   e7cf4282a8694 (platform/x86: hp-bioscfg: fix heap OOB in hp_enforce_single_line_input())

I have used the tree from next-20261109 instead.

--apjTMldALHbD2LvJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzvFgACgkQJNaLcl1U
h9CKjwf/aH77X4uQaMn/aq70REgB08ZeZfCIlqDskJ1hqYSL8UHGkBfWA+dBKUHm
cuwY3D35UjPlRcFjO34qgFPu509gPkLkRW24gt+RMBwDr+Fzkj7QYMF/Ax8CY3i5
qwawOFj2UpEXpUNXDXvZVt7ua+/fm4U+DEQL9KDavArYHtuJK4hjPneiKhliMwaW
OqvhQ+4kZFw8T78K7xWAgoJBS0HuvvE8Vgj7i2Md+nknjeBWvs7Ntsnp3irZixdI
teZDr+NfHZmUfItVHCkEsRXN3S5b3c2xV8UQUD5CMOEWK5U/Ty8ZxwBPRH0IiAUW
HwbxPv+F/BOFNS/dLROc5zvCo4TjnA==
=nyqO
-----END PGP SIGNATURE-----

--apjTMldALHbD2LvJ--
