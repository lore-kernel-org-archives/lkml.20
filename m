Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BBA53F6AD
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905912; cv=none; b=DpHRBnfpomPeiC9fsyBlZfY67/SCBWe88MumadinRlPNm6++gRcmkAT9u5QXI3JIfZ8Vp37KxIwB+vlKnZKe4dkkBnq+UFVvoS9c8EE+AQ9yFuYZh/EpOn5k2wuKTsuUo8U8Dj+PaKBJnlkGm7bFH1m40WGJrhrkTCUqVfQAkCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905912; c=relaxed/simple;
	bh=1/fxJrG6/91JCycp9Vhwu/h9lhclwWHuy2a6SZ+Itw8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SYyXNNMjQiOljOMmB75ci45B9zxQQQDZ444uUwm9LXkWYKk7IfCiuv6Jn1a1Z246N2GWw88mklvGmYa/dPQdOpbD/V4L/6r6g3hPfhx8pdds9/c1eHwUocffTeMmMvyU6KXu5+n60DfPR9slWyEL297gMjjaDTp5XWFb7G/4PtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5MRWl7q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5MRWl7q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 893021F000FF;
	Tue, 13 Oct 2026 15:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791905911;
	bh=N5Oj7Rkk38MwzvIcIM8NuJ7v/KOF73abuNQ17LhAzq4=;
	h=Date:From:To:Cc:Subject;
	b=Y5MRWl7qm1PyyvXnY8GILGL4uJXUB7tJICIK7eKfbDsVOewYl8ws1qMNp7/svlJDK
	 5y8EsOnX5a4+6T+Y5txmHhsYqkyRzTUcwVaExN4poswdlpYLtI9QJ6g7UQe5PoKwMo
	 W+lKGNIrQGE59jxm0T8ztiZJ6h7lf1KIwmWKXbpM22cuWMBLz0fRsI30tfYSHwITmW
	 b40v8EWrQXBGhV/KCYd/LTh5belkC/lGbEigMUj9p71P/c/QZVQV5iof0OO1Htmjwl
	 dZ1tAY9PS02KIG56ZJ3N1S6qUpAkjqTyWQb39CUAjJt/pwTsHGFWyd30oJyeHLbl2G
	 wLgq8LO+BXigw==
Date: Tue, 13 Oct 2026 16:38:28 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL][3/4] RISC-V soc drivers for v7.4
Message-ID: <20261013-glitter-lingo-dce2f8d724c9@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MitpuVuUhMgl0OnZ"
Content-Disposition: inline

--MitpuVuUhMgl0OnZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Diff here contains a lot of clock bindings, so I've provided an explanation
in the tag.

Thanks,
Conor.

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-soc-drivers-for-v7.4

for you to fetch changes up to 6f77194e1147d85c10b4964edee7091c701a25c2:

  soc: mpfs: use kref cleanup on probe failure (2026-10-13 15:43:15 +0100)

----------------------------------------------------------------
RISC-V misc. soc drivers for v7.4

StarFive:
Syscon bindings and a socinfo driver for the JHB100. There ended up
being several clock bindings here also because the clock tree needed the
whole lot due to headers and I envisaged this being part of a three-way
shared tag between my soc driver branch, dts branch and the clock tree.
Due to timing, the dts branch didn't get this content, leading to the
slightly odd branch here.

Microchip:
A bugfix for teardown code in the mpfs system controller driver.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Changhuang Liang (9):
      dt-bindings: clock: Add StarFive JHB100 System-0 clock and reset generator
      dt-bindings: clock: Add StarFive JHB100 System-1 clock and reset generator
      dt-bindings: clock: Add StarFive JHB100 System-2 clock and reset generator
      dt-bindings: clock: Add StarFive JHB100 Peripheral-0 clock and reset generator
      dt-bindings: clock: Add StarFive JHB100 Peripheral-1 clock and reset generator
      dt-bindings: clock: Add StarFive JHB100 Peripheral-2 clock and reset generator
      dt-bindings: clock: Add StarFive JHB100 Peripheral-3 clock and reset generator
      dt-bindings: soc: starfive: Add StarFive JHB100 syscon modules
      soc: starfive: Add socinfo driver for JHB100 SoC

Guangshuo Li (1):
      soc: mpfs: use kref cleanup on probe failure

 .../bindings/clock/starfive,jhb100-per0crg.yaml    |  70 +++
 .../bindings/clock/starfive,jhb100-per1crg.yaml    |  70 +++
 .../bindings/clock/starfive,jhb100-per2crg.yaml    |  76 +++
 .../bindings/clock/starfive,jhb100-per3crg.yaml    |  76 +++
 .../bindings/clock/starfive,jhb100-sys0crg.yaml    |  63 +++
 .../bindings/clock/starfive,jhb100-sys1crg.yaml    |  71 +++
 .../bindings/clock/starfive,jhb100-sys2crg.yaml    |  64 +++
 .../soc/starfive/starfive,jhb100-syscon.yaml       | 115 +++++
 drivers/soc/Kconfig                                |   1 +
 drivers/soc/Makefile                               |   1 +
 drivers/soc/microchip/mpfs-sys-controller.c        |   7 +-
 drivers/soc/starfive/Kconfig                       |   6 +
 drivers/soc/starfive/Makefile                      |   2 +
 drivers/soc/starfive/socinfo/Kconfig               |  13 +
 drivers/soc/starfive/socinfo/Makefile              |   2 +
 drivers/soc/starfive/socinfo/jhb100-socinfo.c      | 105 ++++
 include/dt-bindings/clock/starfive,jhb100-crg.h    | 554 +++++++++++++++++++++
 include/dt-bindings/reset/starfive,jhb100-crg.h    | 189 +++++++
 18 files changed, 1482 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100-per0crg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100-per1crg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100-per2crg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100-per3crg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100-sys0crg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100-sys1crg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100-sys2crg.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml
 create mode 100644 drivers/soc/starfive/Kconfig
 create mode 100644 drivers/soc/starfive/Makefile
 create mode 100644 drivers/soc/starfive/socinfo/Kconfig
 create mode 100644 drivers/soc/starfive/socinfo/Makefile
 create mode 100644 drivers/soc/starfive/socinfo/jhb100-socinfo.c
 create mode 100644 include/dt-bindings/clock/starfive,jhb100-crg.h
 create mode 100644 include/dt-bindings/reset/starfive,jhb100-crg.h

--MitpuVuUhMgl0OnZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas5QdAAKCRB4tDGHoIJi
0jH+AP0aVmvcevkuXqE6dzgDkjyO0XSwMne8cPLhcSO5ptt3egEArnvMedLcdF8Q
oI1swvs1+0c6K14n6Q8ftzqm4wHXMgE=
=35bQ
-----END PGP SIGNATURE-----

--MitpuVuUhMgl0OnZ--
