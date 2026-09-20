Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8364C3612DB
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789924190; cv=none; b=SvVPbk4L9b+GFsFwL4F92orRxAb1zBi3K3ozPo79P7rzid20sGEmglxPL48dSiCknIyLi54HQzUR2NbM0ZN21+OMIvsv54y+fZIvO6Gq0QC6Ji1bK3kipJ0JVXEW07AB3uk3SVAB+C0l2z7qFcSPN62sLWjA+2wriygeqpEb/ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789924190; c=relaxed/simple;
	bh=ZdRWLrR4A1gbWGq8ZAtbfeXtpJu0FTk/M6U48Lz4M4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U3E+eBlOPMAxh9CEiSIelDLAET20WI4RcTc9ddPwQHppZnB22ox17+hed9CpKCnCRA6cBLclnE18LS1gvovodqeS+oDi5V9SDrtbY5EXkioz5EYB+ZsfdXcXxNip3m+0YuymYQC8gDB6Fx1AEa8KmrGbytE0rWqeYLOfV8+boZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NHg/qK13; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NHg/qK13"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8ED1F000FF;
	Sun, 20 Sep 2026 17:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789924189;
	bh=P+BBJ8yrUQwA+W2Gb5++J4RtQ7JEyuDaSZDBZOdlhlo=;
	h=Date:From:To:Cc:Subject;
	b=NHg/qK13oaa317T4IPKegy/NKIqWMwMHJyUNVbMznwv5FS6n8Q7md6yF225GKdalR
	 rTH+cIFFlozByDflcDeAVMV4VC+PrlmNLh8qWg483slf8sfQiNQpZm12JGao2mpB45
	 fn8HhEENnv+M5+98wOybuYBwop5pIch/SQs37m4hT/u6VizIaSXGs33rWIoscNccbx
	 /jlT+bOqHzb9fn7UiDth79HU5g9B8rzMe0JwL376HLeIjroQsZhJqY7HtmOFZCqySx
	 tIqkhXPn7tigLD4WJJaiCCQUoKu/Iu/pebiGtWGRd9juJOIOVEk0G5/CjWMB5jKyn1
	 bHYBZf+ndoctQ==
Date: Sun, 20 Sep 2026 22:39:44 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [GIT PULL]: soundwire fixes for 7.3
Message-ID: <arATWGT1OwkvzZ1i@parshuram>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a/oxL1JCG0jLfdHq"
Content-Disposition: inline


--a/oxL1JCG0jLfdHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Linus,

Please pull to receive couple of fixes for soundwire subsystem for v7.3

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/so=
undwire-7.3-fixes

for you to fetch changes up to aba7b41faeecb7692458095ce6fafc341fe0b80e:

  soundwire: cadence_master: wait and cancel cdns->work before clock stop (=
2026-09-08 19:19:42 +0530)

----------------------------------------------------------------
soundwire fixes for 7.3

 - Cadence ensure work completion before clock stop
 - Disable ghost Realtek on Asus GX651AX

----------------------------------------------------------------
Bard Liao (1):
      soundwire: cadence_master: wait and cancel cdns->work before clock st=
op

Ian Luites (1):
      soundwire: dmi-quirks: Disable ghost Realtek on Asus GX651AX

 drivers/soundwire/cadence_master.c | 7 +++++++
 drivers/soundwire/dmi-quirks.c     | 7 +++++++
 2 files changed, 14 insertions(+)

Thanks
--=20
~Vinod

--a/oxL1JCG0jLfdHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAmqwE1gACgkQfBQHDyUj
g0fpZhAAuSLvoI4adE4+vpHTmZlN6Rd77bh9Ng8ZOlPPevLVgSjn+PuLkm+bmhyH
qQRm5V2X574dBYOBu/EepbjnkcfiqeHJnBQkvn6SOjPZcjDKtj578NMDbfo/aMNK
IVdBC/itV5ofFR4yIQMKhSzqVVMNG90DGMNYDsITWypFMz2+Grv0GqE74WlGCfQ5
JF76ZiUdHi70yjUb0mouIS5/BW1fWOUL3WAtS9yUK8K+egfb++koZoV7LH0oe/mC
Hy14llcsfl+P2AS5HKR78LcVw7sPLzuy4BUjAsl4JxK1Gv5MKsUllfGH28e/o2k7
hC8nf5ct/eT8FmOIUTkeXL3kpU/XC31ilNBbzzHIR49+9T4ts9W40Mh7viXFY+UM
qsQ/xMJ9KrLu/hYNAcSTsOzd8MlHLykNlyV1DYDzzXJmFzQNy2CMJrZ9UJI0oiXR
ANuqfQYUk30/FmVPl0ACn9KNV+LdecACEnKwB3YJFDrvEU2zddKDq5/n3W7iU2jv
m0IflvurH7AfJYr02Ki2Ia5I/D8TKUR2buCCTSTvjnsy00oJFPLzTL32z9oAqPHz
uOrMeaumJiziy5JIwNnbKzTDnN4aV9Ubb0RTZCwvALfI9BUBsDrl+mzpD8POvdtE
NBnQB370JMbMB3FHwODdWE0skiXP2/pftDS6MVsgnICkXQhF1GI=
=vsKy
-----END PGP SIGNATURE-----

--a/oxL1JCG0jLfdHq--
