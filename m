Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1618D3803DC
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789924305; cv=none; b=ZTKkNdXswMBYoDyJKPqzyw37XYJpM/g/V6cVMtT/jG+5nCAA9NeoAdoztvSyAK3GYO/ihjpYc7eoPLz5tU2huqVJZhoWU3OYFx5DE534Paj/HhFzyehEkLkubP+DJoFRIJ0rjNU8IedxcOgTUAuO0yRPJDcb8wAN/QW7vdzgDYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789924305; c=relaxed/simple;
	bh=JIViuTTa36vnm4LKlDozoMNmblMxizZrvdorz5RucFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XzQiZeS/v0dWyxlQp/QPf5rmkx9XVspbzWJekF7saPHORFgOdefNtbF4fjcJ+d6FG09Dpnkobo7RO8sx0BwlKWEFZJ8pUFl7/4X1ITWRH89BgWh1sJg36/nFEpH6fQRymeSr3pJcm96qEgkGnYhvY6DHwG2Pc39YIqnSylHulws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=obzSfb20; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="obzSfb20"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B0A1F000FF;
	Sun, 20 Sep 2026 17:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789924303;
	bh=YUp2D27cXCNMEfO9EkW5EKw+NqkIliLntU5xcCUr0W4=;
	h=Date:From:To:Cc:Subject;
	b=obzSfb20veuYhMmI4VjcQGh+gCsiY+Xf45fWHTAwHa5vABbaYqkkyM9m4L1hD22Ot
	 rl1/A4+kNHXZtGuQSszJIJdUMSNcNYXeV6K7je6QDRnVPjp1mtYvC14KkrlGpycXlN
	 2e/OaNnczLw9DLXCOOyr4X+aznNAVa6Ct5G93SPeepsjyQ03yu7xlauabE/m12xMsy
	 GlEZ61gBa16nXp1CuoeOaTW5n8drLlCU1YR07+ioTdW6Sy6ZU0/lyP8R5VFwD8GLxd
	 l9isquvf0F/WYeHjJgVNFrah/cqTVUgfUn5oSD7hiknC6upMC/pg0rvigpqEKiDHg3
	 HiXYSPdRYbbSQ==
Date: Sun, 20 Sep 2026 22:41:39 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [GIT PULL]: Generic phy updates for v7.3
Message-ID: <arATyx8IcifVCpp8@parshuram>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d+gREyX0Hg9nRDqN"
Content-Disposition: inline


--d+gREyX0Hg9nRDqN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Linus

Please pull to receive the fixes for Generic phy subsystem. This
contains couple of driver fixes

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git tags/phy-=
fixes-7.3

for you to fetch changes up to 486a70ef848264dcf9a57f0bb0452848db9537de:

  phy: mediatek: phy-mtk-hdmi-mt8195: Fix TMDS clk bit ratio setting (2026-=
09-13 16:05:23 +0530)

----------------------------------------------------------------
phy fixes for 7.3

Couple of driver fixes
 - Atomic context delay in renesas driver
 - TMDS and PLL rate calculation fixes for mediatek driver

----------------------------------------------------------------
AngeloGioacchino Del Regno (2):
      phy: mediatek: phy-mtk-hdmi-mt8195: Fix PLL calc divisor overflow
      phy: mediatek: phy-mtk-hdmi-mt8195: Fix TMDS clk bit ratio setting

Claudiu Beznea (1):
      phy: renesas: rcar-gen3-usb2: Avoid long delay in atomic context

 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c |   4 +-
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h |   3 +
 drivers/phy/renesas/phy-rcar-gen3-usb2.c   | 310 ++++++++++++++++++++++++-=
----
 3 files changed, 270 insertions(+), 47 deletions(-)

--=20
~Vinod

--d+gREyX0Hg9nRDqN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAmqwE8sACgkQfBQHDyUj
g0er0RAAgkcE6ycPdAkDcHYCngc6HdT5+kE4WGhEteOyEd0BRJRbADJN9+0FRpFd
PvUCz1QG8iRGlIZkYpDXInBRK6rrY5xp04jSQLzz+ZFTPXMtH+frYDqw3rKtQ+OD
CzZ3BkDIowI4vmaTkAgCFyh4y2XJutfU+VpqkroEgmVPpynKJO7fkUiqrE7XSCXK
Pstr40lo67UIY3rmkYzUWX5CV2YfZzPJR4TajKHSujtIjSDxgELMoS94Fn21f9mm
STZTzdRbbJhrI59zpDHyZC89CGpvqspUCGYNfs6/LZ2foC3VzaLjh6b59bEx3elt
bqXa/XsJJzMIuX2f6L1w2YpVUfww5SKezf9LH0sx91bWxYuK2LfqK4pimwUoED7a
kuVBv7agN/0MBFfndEpx+QosJy8nngy1jhZdToHGLdLuX6o56UOmV+hd8XEFdRWS
tRj85ssZnl8LcI4Ql73gQomnUhCdi4POMuPT4Ucz9uaAhnc2lTgUBMLO5SOhodyk
yIh0b9cBiuI4KKAGcnWdwZcbkvrbtki0J/O/1lvkS5Eowb4mh3hL3QzOHOkIg4hQ
5QAKaP/i5VKplO/B1Ksz1fg3ps/ASQMAiGW51/K+kBFa/jIFGCuSWM8bEqSnrQ/B
2fs4LRyyV5JRRz/Jt4KhUh/9DMpTAgWJT4EQcZ1CURRKIea45Js=
=9Heb
-----END PGP SIGNATURE-----

--d+gREyX0Hg9nRDqN--
