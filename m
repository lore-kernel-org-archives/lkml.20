Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB932F8E9E;
	Mon,  7 Sep 2026 23:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788822818; cv=none; b=QXJqWMA929tC5wzntD0WjkuZKeketqKnmihQeU7c/3hW1AXAHA+P11y2LykR4t3k03JIpepQWtCrvpVdnyLPDKJAZ7uXKt7WMOrdAH452FfTPewjkg3iXNxLuxLqd254h79u1yd9k2EC7BlUr76fuYpR+ArPVTog1NBNbe7TGuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788822818; c=relaxed/simple;
	bh=uk1pdyVzDsTu7GC1qMKEd4/WZdFg1KMG3Sg9WK2XXEg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SaFmaoesShbHOAN6+NW4rpVbfhiHNw1zOzWxjBleLAoqUo2oM395yKBsyyLoZ9nyhlBTuSk5E3WdpgmYTOsbApSIz/+8jzpZmAayo2DVA2N16Wrf9QOfwXIjF37IuZXNCIszqge4N15cmeCOKck7R/Z2TcwYmKqbG7P9NGnGsrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFeHvM9T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFeHvM9T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF4141F00A3A;
	Mon,  7 Sep 2026 23:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788822816;
	bh=9A2NUMWmoLM++ZG+/uFRYfcoAPURZEdnC+k1UEK6FXU=;
	h=Date:From:To:Cc:Subject;
	b=mFeHvM9TzBCmRcCNl5PHUvaTSFNZbfCHtlstV2QROFJJ5iX0u9vkkJPZ1fH1wAme3
	 wPC8zfHj46BYVihlo/8B/G639i1NX9bB61fkC9sRgTgjAG4H0p5UCNY8kcUo1ruf70
	 +FatWc54MRN1wLEhiv9EXoN4D+PU+YNrYLDGiSKOc+zMfYiaV2xIyeBPRbytE7Ur36
	 J49tQlP+TDL6cJm60Q/q4tMfkAx+ATrkNbJPzWP6AdB0e+reiPu1Rw3agp8XiDX1xi
	 ik7D5jRgnKlYmLuqFoo4nre+Elrqc6UOkl2KhL5jo7JFF2oPsgK85hotuuf1MlHReA
	 7EGda4tlsDqNA==
Date: Tue, 8 Sep 2026 00:13:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at v7.3-rc2
Message-ID: <fa64b953-6919-43ef-a937-d09e881bf2fd@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X474A4E54OJf20oK"
Content-Disposition: inline
X-Cookie: Who's on first?


--X474A4E54OJf20oK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Things are still relatively quiet, not much to report here.

Trees being held at old versions:

  dmaengine      	next-20260903
  drm-misc       	next-20260831

Both are trivial issues with fixes available, the drm-misc thing has
apparently been struggling with some process stuff which I think should
resolve shortly.

Trees with signoff problems:

  arm-soc	(missing author)
  arm-soc	(missing committer)
  bluetooth	(missing committer, many commits over multiple days)
  risc-v-fixes	(missing author)

The Bluetooth stuff might be partly that they didn't tell me about a new
committer so missed the notifications, I've queried that with them.  One
of these days that borked arm-soc commit will get dropped from their
-next branch, but not yet.

Non-merge commits relative to Linus' tree: 3715
 4019 files changed, 235867 insertions(+), 54978 deletions(-)

Top trees adding commits to -next:

  586	amdgpu
  262	mm
  142	qcom
  132	drm-xe
  125	net-next
  91	bluetooth
  90	bpf-next
  85	vfs-brauner
  83	iio
  72	xfs

Trees adding duplicate commits to -next:
  36 bluetooth
  20 amdgpu
   9 clockevents
   8 hyperv-fixes
   8 drm-intel
   5 vhost
   4 i2c-rust
   2 mediatek
   2 drm-xe
   1 vfs-fixes
   1 tip-fixes
   1 fs-next
   1 at91

Thanks,
Mark

--X474A4E54OJf20oK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqfRRwACgkQJNaLcl1U
h9A6IQf+KdxfzAI8SrGx8FX2I1pZOZZ2lAD6jgUfhrQ3l40FVHSvoJ+Chg3XxnIp
mBolJw1SbnlfgmWqLpGxy/abbPhAdvEqqB0m2E5XIbR1ke9xB4J5pAMpzJdgh0jW
KQQq8j9NLJflAr3QIiDeToN9x2iVXPoVXwipiowzpcmhOBUrdvp39sJ5ZKvP7OA4
Gb/GzwRWDZPDmmPLqK4UYANlQN0Xy66V2JBvlrJQzc8aZggTuXj0IQGCctiMZfbS
R93PRQNYz26/hxcli5y9XUKGbQ7sYIhC/TWWlweN34LTRmBORR2rt2TvL/dIaIKU
knng6T3YtPUN/kjnURCPBoqrdmW9WQ==
=ZXQo
-----END PGP SIGNATURE-----

--X474A4E54OJf20oK--
