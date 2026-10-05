Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89E02222A9;
	Mon,  5 Oct 2026 12:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204799; cv=none; b=PCY4+Unej3Qn3uPjz663eMnS7Mp7Yxd/ME8vAivoyAdvoLODmTs7kv11vANxsLF8XW05ePNapsbkIPA4HJvY90Bu5oWCUPymn7AyoUxdK6Yil777xJMtUnePZb8YCuX875ATWc45wrRSgu1Lv4OlN7IS8BLeuI41jveCE5ApbKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204799; c=relaxed/simple;
	bh=KF89xN7LWcJxQLJOSiQz5dyhpQ+4VE8l+ffOrnkWtxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWRh69aqwBYnl86K5RbmMYrB76Dp9PhgrPINKVTXMfNauLJsMM1poSj65WML1Z0uRKYlUsAtJmHbV78Y1Kteae+6IoCYrCMBP9DaHr7A0EKpimEF6rI3TJJPuO+dAT1KoeaLIXXdsq4PheGBRDeY56rz/qjmj3IHaFqbHagMLgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XkAqgIQY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XkAqgIQY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F661F000FF;
	Mon,  5 Oct 2026 12:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791204798;
	bh=U8AFDU+LFjF6B+vrehediUAtTZxRnyyp8l15J5s5Kqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XkAqgIQY4q578qwiT47/vdaZgpLQQi6v6w9CCAfK1mmEYI9kF35aKtUwo18s5qrTb
	 sh69i/Oi+45jOn2qlNAUvLBFs0VzRSW0eocL2wYc0XcxLVpXfPr4BCNHFskJ+k6OPI
	 vI8rGNrQsOYN1JpINjgWkjA/I7sCK1aTT1a+cpshRHwwPw1Otp6U0RcbcIcG2Ovq5t
	 S+Ites+DMaduk8cRJZPfT8HIhC7cOHOS3FHJ60l8GJpn0vjCwmGDKm2YjqZRsmXIHa
	 +E8QSUJ4f0B6ilVuVtalJF48vlXD6Jw0Haz1tE8VZQ1PpbMbXj7NuaqVsv391rAWiB
	 WrwX3nRAiUj9A==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 13D601AC57CE; Mon, 05 Oct 2026 13:53:16 +0100 (BST)
Date: Mon, 5 Oct 2026 14:53:15 +0200
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at v7.3-rc6
Message-ID: <asOduws6a46W1B7B@sirena.co.uk>
References: <d21da1e4-f6ff-4a78-85ce-146c6bb4a9bd@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vViEsHxIWDQVUnKk"
Content-Disposition: inline
In-Reply-To: <d21da1e4-f6ff-4a78-85ce-146c6bb4a9bd@sirena.org.uk>
X-Cookie: You will forget that you ever knew me.


--vViEsHxIWDQVUnKk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Nothing much to report this week, things continued to be very busy last
week but hopefully things are relatively quiet with so many people at
conferences.

Trees being held at old versions:

  landlock       	next-20261001
  vfs-brauner    	next-20261002

Trees with signoff problems:

  clk		(missing committer)
  drivers-x86	(missing author)

Non-merge commits relative to Linus' tree: 13010
 13320 files changed, 858506 insertions(+), 322485 deletions(-)

Top trees adding commits to -next:

  1707	drm
  923	net-next
  716	mm
  562	v4l-dvb
  424	qcom
  388	sound-asoc
  386	bpf-next
  330	perf
  329	char-misc
  282	arm-soc

Trees adding duplicate commits to -next:

  25 amdgpu
  23 drm
  14 drm-intel
  12 drm-xe
   9 nvmem
   9 clockevents
   6 phy-next
   4 slimbus
   4 i2c-rust
   2 vfs-brauner
   2 tip
   2 sysctl
   2 socfpga
   2 fastrpc
   2 devicetree

Thanks,
Mark

--vViEsHxIWDQVUnKk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasOduwAKCRAv73Ows9A4
iRzrAQCZDXNLqvak7Oj90i56avJVwJcxfmWzzLxbl8fieuyhugEAtwyMpet270mU
N0y9D59QvPlS6ZkAcnjbbvnTDJXA0g0=
=6ynB
-----END PGP SIGNATURE-----

--vViEsHxIWDQVUnKk--
