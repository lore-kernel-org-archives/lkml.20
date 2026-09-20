Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3818B470106
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789924396; cv=none; b=VTTApi3ix8ORN8cguMb6+XPSWeLYBY4tRQLG9cnFefI3rQhPn8LOa7cuxawqsX1lYoYBRtJVw6yyXbRWr/rfwwJzVi7/B4gfIxthGuFmvaenTYNIJvcDzn6+OhnVPtpwgS+Pv5WOtKWWkMTCUhu/VTo0rG67MfDU/F8agwh+fno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789924396; c=relaxed/simple;
	bh=4XHMtUgm3sgcuo4YWuWc5ppiXTmx1gNAQR7dNH4QXn0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UJPXEnZiEGKZEUS/YFhyqDJUYIoNeIPbg2pF/Oz6P/GIi8H66o0zmohQjwVDa4qeqACOp55w8t6PwTOh/8Rdl9fTRBhq3byWxpBjWiqwjrE8iioE/7BFOCexagotLAn/EZGapnn1CRgOmAm1QuiTfnM5wx92lZPMJKSbwkNHRhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GIvY/TcP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GIvY/TcP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 208C41F000FF;
	Sun, 20 Sep 2026 17:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789924395;
	bh=EnAjWGagswi06A8rJnCKlXGxrTzgWSsuEouEDlOYwrw=;
	h=Date:From:To:Cc:Subject;
	b=GIvY/TcPRBFt7RJTU7BVG1/fQaDrU4u6S8M8SDxDVN8vOE4s8KFgRAASas8HT7HZg
	 g2UnJVpPaSXm0T7X3uGh72ADY5rgSuZSdi0ZScXLDPzPUNruFKB+vvDZM4hroJL+dZ
	 4nzRtns6F0SHSvlXLAYtcHxI4eDJoBTy+FKAbOaWYELj50jVcqUBpLI7z8QWkmSUVv
	 N1iQOy/temY2B33sqfP0A5EWShAotJx8zg2TOnA4Z7T/8oNy9q0eKFVDjPYxIYJxB6
	 brK3uyHCvTt0COzR/cSQMSjY8ufMc5kP1ebKUe8UZMP0iuTKEKyd86FqXEsRfsLwhV
	 L/zqC6M8zHQfA==
Date: Sun, 20 Sep 2026 22:43:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [GIT PULL]: dmaengine fixes for v7.3
Message-ID: <arAUJaluykugcCzN@parshuram>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="voBKZefSeM7HmAr0"
Content-Disposition: inline


--voBKZefSeM7HmAr0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Linus,

Please receive dmaengine fixes for this cycle. This consists of couple
of patches fixing issues around dma_chan_put() followed by bunch of
driver fixes.

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git tags/dm=
aengine-fix-7.3

for you to fetch changes up to 075bc7b1d3dde5ed43fbaabbc1a69f09b7fc3a47:

  dmaengine: mmp_pdma: fix wrong sg length in mmp_pdma_prep_slave_sg() (202=
6-09-15 21:57:40 +0530)

----------------------------------------------------------------
dmaengine fixes for v7.3

Bunch of core and driver fixes:
 - Couple of fixes in core around dma_chan_put() for kref underflow,  user
   after free bug and waiting for rcu readers for dma devices
 - mmp sg length and wrong extended DRCMR base for SpacemiT K3
 - hardware buffer descriptor chain fix for xilinx dma
 - sun6i fixes for status behaviour and dma position registers
 - runtime pm reference leak fix for sprd driver

----------------------------------------------------------------
Alex Bereza (2):
      dmaengine: xilinx_dma: Fix hardware buffer descriptor reuse order
      dmaengine: xilinx_dma: Fix hardware buffer descriptor chain after cyc=
lic DMA

Alexander Chesnokov (1):
      dmaengine: ti: k3-udma-glue: fix NULL dereference in k3_udma_glue_rel=
ease_rx_chn()

Baineng Shou (1):
      dmaengine: mmp_pdma: fix wrong sg length in mmp_pdma_prep_slave_sg()

Christian Lugnberg (2):
      dmaengine: sun6i: fix non-atomic read of DMA position registers
      dmaengine: sun6i: fix undefined behaviour in sun6i_dma_tx_status

Ruoyu Wang (1):
      dmaengine: sprd: Fix runtime PM reference leak in probe

Sascha Hauer (1):
      dmaengine: pxa: fix double counting of the hw descriptors

Shivank Garg (4):
      dmaengine: add dma_device_get() helper
      dmaengine: Fix device kref underflow in dma_chan_put()
      dmaengine: fix use-after-free in dma_chan_put() and dma_release_chann=
el()
      dmaengine: wait for RCU readers before releasing dma_device

Troy Mitchell (1):
      dmaengine: mmp_pdma: fix wrong extended DRCMR base for SpacemiT K3

 drivers/dma/dmaengine.c         | 19 +++++++++++++++----
 drivers/dma/mmp_pdma.c          |  5 ++---
 drivers/dma/pxa_dma.c           |  3 ++-
 drivers/dma/sprd-dma.c          |  3 +--
 drivers/dma/sun6i-dma.c         |  9 +++++----
 drivers/dma/ti/k3-udma-glue.c   |  5 +++--
 drivers/dma/xilinx/xilinx_dma.c | 26 ++++++++++++++++++--------
 7 files changed, 46 insertions(+), 24 deletions(-)

--=20
~Vinod

--voBKZefSeM7HmAr0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAmqwFCUACgkQfBQHDyUj
g0fZWBAAwoWkmlWGVXN/xSwVy/ZYaQQHDJyJee3IsZ88EzTP0c5xVFxpvkAa+wwH
swdRmg6om5yMzL9P/5Gv8vXWbWiy4aRibdpEjS+2IY6egNnNgocSaSpvHQfwSg8G
hjIZ6DtCiiplH3E1h0LChNq9woo6KCkpcBrOnSwurFWcG+G4EkzBndDEvPqHhogQ
XQNI6d5ISuRyOWJq3Uay06umfpSCbEBEA6if09+5Aic5SVqBaH4upp987bzymHFY
F/Nhb0z0oe/uheIbAceX0HZEAncv31H3kG4jlo4F84UVeHDBvr6gu/0LJL8Ltks7
JnDHboGtQvnVS/g9vREWRaetCo9qvmk9rD6EQELK3uTd7KJWT1E8xcCaHuqkuZ/A
vdG6sbAkyHoTIxTBnWPupqtcT4KpSsFO+4Ikrs6QFIn0An/rNA2ZBC62/qtOquP1
jLGbsRHhVjTX1fJrqHK6XfyZGo6rY7zVhf8+GS1D8xa1xzMjkx9OIvNFSSEu0wgV
DV6M/slsn1dHwoqYW1CdPnBFE3XMZ+8yICNwnLP/aqzrFMq8lSl0bnaQhT+baz+A
C99yLGk6qryoCmp1TUYQG0oX2lq7mp3MG7d952iW+aw5nE3UEhpTYdah+BCgvpx4
TJr1inVzrXzExZyKmySKWJbHL3fyFnEcHpHQZSkFtZVww4U46q0=
=57Lc
-----END PGP SIGNATURE-----

--voBKZefSeM7HmAr0--
