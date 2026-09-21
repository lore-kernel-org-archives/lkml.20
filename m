Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865D748F83B;
	Mon, 21 Sep 2026 14:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000470; cv=none; b=qjd7mbc4NkyFyXtUl/zVm5i7OQKOInUlFg9ZAIY02srOOdeW0E1SGR75b+rgqVBOhEp8OEwC1dhMTaxppUje3b1K/3BXexJcJ7BbqGT6RlMJndlUv70ImGahqt9IXgGU8cvmrVs5s3G8GAr3nam1aYR7e36j/UoWOb4nkQfduXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000470; c=relaxed/simple;
	bh=QXXni/hZSc1dDyycmuJLhy5vuiwIv5KHR3cuzL3D2bQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H6imXczHIBLLzvp/ycMKhbNzmeRtSVI0N8b6kZvdL9qwAVOMAZtkLAdtNWh6cLLrgCA2qFsS5Njm7KgJnSItxKtI/yKawy24aO2v/PzE6P1RmsRfJ0hURMBzcEoXwRJHCEmvmHPMOgoB5s0x24ouEU0G2dldFE+Ns/lqE3hk3dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIF2J7Is; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIF2J7Is"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E5A1F000FF;
	Mon, 21 Sep 2026 14:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790000469;
	bh=tc6pVSq50Y1t7AsIiwGBpJ25VqrMeGiz6HfYLVj+vyk=;
	h=Date:From:To:Cc:Subject;
	b=MIF2J7IsqKunySN91X8hgpXIkTPcQavRAPHPWCz7lhDmfNFWdpRnIbtdyerPv4NdV
	 cIMshnh3apVfZQOr/Sf3J8sQE+BJwWxUH2doyr4g1xjq6KIWozfeCRILi4ZJUv7eRP
	 w5gpRYcYivS1xwqIBS+7fZdu/4s8rfx/GgOVKhoH7nlPlhUDjGJCwGIvohmyB6iNO+
	 l/LfRAWLaIeszh7db0bRAJLO1nRFg2vqOFAzqKc75JDQktrcUGiLCbExGwr97AReRu
	 ROZ40P5rVP1cokWToNOvUdEhjUGTofBaMpy4gNtKvl7ygjVIYIP5b3B3r50BjZTdpj
	 M4+SlE+MMJV9g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 0DF9C1AC55A7; Mon, 21 Sep 2026 15:21:02 +0100 (BST)
Date: Mon, 21 Sep 2026 16:21:02 +0200
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at v7.3-rc4
Message-ID: <arE9Ts2QCtLLuOXj@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IzY9lI7d+jvDs/kR"
Content-Disposition: inline
X-Cookie: Too clever is dumb.


--IzY9lI7d+jvDs/kR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Things continue to tick along in a farily normal pattern for this point
in the cycle, quite a few conflicts but nothing too remarkable other
than continuing issue stemming from the messed up merge between amdgpu
and drm-misc which none of the DRM people seem worried about - I expect
that will be resolved in the drm tree before you see it.

Trees being held at old versions:

  amdgpu         	next-20260917	(clang symbol length issue, not
                                         related to the merge issue)

Trees with signoff problems:

  vfs-brauner-fixes	(missing author, new today)

Non-merge commits relative to Linus' tree: 7602
 8221 files changed, 431806 insertions(+), 139589 deletions(-)

Top trees adding commits to -next:

  1064	drm
  526	mm
  471	net-next
  256	v4l-dvb
  225	sound-asoc
  200	qcom
  180	drm-misc
  178	bpf-next
  165	tip
  147	iio

Trees adding duplicate commits to -next:

  16 drm
  12 drm-xe
  10 amdgpu
   9 clockevents
   4 i2c-rust
   4 i2c-andi-fixes
   3 drm-intel
   2 socfpga
   2 pinctrl
   2 configfs

Thanks,
Mark

--IzY9lI7d+jvDs/kR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxPU0ACgkQJNaLcl1U
h9AIsAf7BEHMS+GzxHEMU8MMCO/Ite1L0FD3X2o6/X4hAeld2dj1wojYCItMFC5s
52g+SkZ+p/of6YtginDw9DrRYRhSxBoxasyzJ3DJJNDynOf2x35epHJiKADttDBL
kov2suQqFvuM6Z3ZAsfaIbmvesRGv+mk4J5V6rnfLiWGtzMHykO9mLAOf+DVsJy+
t0ZJBwlRAttKKt3DScnY9SEC07LIbLzZd768K5ZsBZz33e/nWnoZX7vMtrjSlhj3
9pBdm2NjZ+HUEXngLwl92DHJMiZQ/DYx+MUgzCws+8WeA/DWz3rzMmCzlqFkQ0HM
sesso75h6tyQOWskICekyw5luY5EpA==
=ZQlT
-----END PGP SIGNATURE-----

--IzY9lI7d+jvDs/kR--
