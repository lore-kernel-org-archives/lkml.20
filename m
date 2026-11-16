Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866496;
	b=cVC4dMKXQphTHguyHd/SL3lYZVDiFFU60ziw+DiRCFRPqwE5VsDL6+8D0YNBAt1L4jPx
	 ZDGgIe3imgn8KM6Ug7Ui+i8sPVvD9eDL8OTOpRlF/WBqdtGlk074Sz3LxoQKFib07w2kD
	 H94aPcb5Pjz+SbNVR5pKuFUYR7I7GbkXH6bSnU8cVMR+lhfJZxbkmDkmCcIjJ3yujveal
	 xyxbXsKSE1hgKmzRM6jGbpEooiGIr6bwtqy+XGLoNrenXYzaq/MH4WV9IAkl2G7cSOx+U
	 g6goOYC2jmkbNUshkmULlepY1Qx3mMj0HEXh1Z+50ZYhZPIATSs98odZE3G6qjst5Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866496;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:X-Cookie;
	bh=XoglGBXtMhmw2VSet8h2skltaKtapwd1Z8U+JqkmCYI=;
	b=PgQT5nyrDCyvBpQ89JT3k1UkJHCfKp3a9x6Qy88go7RN2x2ABBGJH0ZNZAoVSqlnDvMt
	 UllnE7Vu3OFHnf1mIm4EpGuioL/oow21vMKwJeWoNI6YUl/DSsjCObCTBhFbv1AC8lz57
	 YS3Qw2OoDPVaaN8kIcTvqcMbBCAXjB8r196cv4Kl3oDgNH5S5Nav6BEXxjSi4qOmaBYUV
	 PZZxqHoCcYKrH+fZwPFsHy/8oPaN7OVJhAK+LeTCzZHOmJJlZgxLWWRAzbtpIluGi4ztJ
	 FBg3pNWyAAuv+9YQPiWX7Jk1wUzJpQ7o+aLwSL/PXTQe1WkfNixAkFz18jIDwZoRlQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KWPwb5la;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20186606A323;
	Mon, 16 Nov 2026 22:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KWPwb5la
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DFFF1F000C5;
	Mon, 16 Nov 2026 22:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794866495;
	bh=XoglGBXtMhmw2VSet8h2skltaKtapwd1Z8U+JqkmCYI=;
	h=Date:From:To:Cc:Subject;
	b=KWPwb5laFONGOrD5gWELHBaUKjdSq7XrYIasSM6rxnOlTFuZEceCN1Ce/rOk6SLAd
	 CvK1eTcuwdhZcFeYvM1TfOHrq+9c3jwaMElvi3w1TX3z98CHofN8T/8et+1/7bX88+
	 UrtShOCaZGVtvl+c9OnNfu2FEBlm62ihJQM3OOSti7JjqHRVUbXaS+m6DvgzPftC9+
	 fQMGDjeKmpvqTzTtKFEn+kY7v05DZFzDlYhNe6y8zk+LqONo4wdc61/LdcJYUhCS4x
	 UzMy0T3Dm3Q3DXfgewbHYZTHfUDLZ7iBaKY6FBcVFy98jOh8wKKQGBKfvoMTmkn/Es
	 y8NtRUmyk7mmg==
Date: Mon, 16 Nov 2026 22:01:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at v7.4-rc4
Message-ID: <fdb4a794-36cd-457a-93f4-7196d2d03e33@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="oityfXyK739OE9Zm"
Content-Disposition: inline
X-Cookie: Madness takes its toll.


--oityfXyK739OE9Zm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Other than the issues with the kmalloc_obj() treewide change things seem
to be fairly standard at the minute, the number of other conflicts and
build failures seem relatively low.  Commit volume is back to normal
however, last week was a scripting failure rather than a reflection of
reality.

Trees being held at old versions:

  battery        	next-20261113

Trees with signoff problems:

  asm-generic	(missing committer)
  thermal	(missing committer)

Non-merge commits relative to Linus' tree: 6550
 6825 files changed, 328142 insertions(+), 125221 deletions(-)

Top trees adding commits to -next:

  885	drm
  314	qcom
  305	bpf-next
  297	mm
  248	net-next
  212	hwmon-staging
  189	iio
  165	mm-nonmm-unstable
  157	vfs-brauner
  154	drm-intel

Trees adding duplicate commits to -next:
  102 amdgpu
   50 drm
   20 vfs-brauner
   20 drm-intel
   13 btrfs
   12 btrfs-fixes
    3 perf
    3 drm
    2 sysctl
    2 mm-nonmm-unstable
    2 leds-lj
    2 drm-intel


--oityfXyK739OE9Zm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr7fTsACgkQJNaLcl1U
h9Bqkwf/RGGEHZQGLTsCdOTyCU9uRETBZun5AsvkhR00rP+v6anXxbs00hzBc1HF
BdEFTPf5dJIsdhvFsiDYQIAJPu3DadPiqsV2pfFFRVSI8ovAmAOOz5+ISZxI90+X
b8X1qwZ14kcnnzRIltoxYzJDlDydKH2e3gU017BFsj+nXODE5WL15m4evsoC5Bu9
7q87j/xFzUxaOcYEb2WEKNxlwZbHczTtiqh5WhDCK80mFNay37Y+FO7NbuOMI7Vu
CgLyPbrvcc3kMR/ZNjZGSpca3TwtkrfPtW1Jd6aLv7Cv0siep3hd1tHwTac+gbyn
rsBZPRYVRyMNMYeS4rTcxaUiMIAtfg==
=QxB0
-----END PGP SIGNATURE-----

--oityfXyK739OE9Zm--
