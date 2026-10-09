Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C527746C4BF
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791528456; cv=none; b=Wto8VZdoJyTHDpqJKKd6lgjSbYXJwMiu/UFTdZkPHM4sC2AzgcZNdvnBvo0dyATOOffZiNajeskHDtAvJ3ejd1yssL0O1vuKzVuVglcJjqbL4qbNXAh+eayvAH5L37v6mHTg5VQjhg5OyWRCqtsn7YTB67rHBJQEoRH1FStg2Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791528456; c=relaxed/simple;
	bh=gOJ3hw8ZQPA3InuBbTmHq+ABxKn7mXvdviQFFb/cxuc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s4qiT1qHuSOoupSxTuMlOOWIbwj5wHDRJ9KXyZLIqzix6xUw9MboBqMprPjA60Z2NMe6pSrIrvHnkAC9ny0Dh5n382naQqAqChobNVLvPnHj/lBkx+C5FlZHSRPOEDnh0VHPQzaXj2blit3sbePupizGbhl9GLjLua7s+ZKXFqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=PPuq+vZS; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="PPuq+vZS"
Received: from francesco-nb.. (90-182-211-1.rcp.o2.cz [90.182.211.1])
	by mail11.truemail.it (Postfix) with ESMTPA id C8EAF1FA63;
	Fri,  9 Oct 2026 08:47:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1791528443;
	bh=wUE2v0QW5+a/Ub6fmgECQzNmuGdaL/exMPYRoSsqo3I=; h=From:To:Subject;
	b=PPuq+vZSDhSo8bEfEH3jnD024MnC2tzVwXmX1k9LkTqzG5UGMexs+6O57/58EOBzt
	 F6WgNvKUi2I2p3lMxChjLrYTtvLOg8mdnUHOYDNB1OF0A80body8ajs16KLnCAekoX
	 DJkmw9lOAScLnhpboyLF8yevStacGglpL/sG2iqvI5FUgvrPfEIOIgdXFeb5LXsnJE
	 Hw2i683LFF//t+18VOj/1EnI+mn9m2/svIX+x0k//ZgL7gXwtQGQuIaEh/WbE0uVb+
	 twUoKMPhxYC/GpMfLrPtsA2Zlxgp+MdcLELhAQgva702H2cG5Tm6SkO2gAXB7bVPJL
	 +jyCl1n5O971Q==
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-kernel@vger.kernel.org,
	linux-bsp@toradex.com
Subject: [PATCH] MAINTAINERS: Add entry for Toradex boards
Date: Fri,  9 Oct 2026 08:47:04 +0200
Message-ID: <20261009064705.10116-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add a MAINTAINERS entry for Toradex board device trees to ensure
that we are included in patch discussions and can provide reviews
and feedback on proposed changes.

Toradex has been developing and supporting its System on Modules and
carrier boards for many years, including their Linux mainline support.

As the hardware vendor, Toradex has access to schematics, bills of
materials and other internal hardware documentation, allowing to
review and validate changes against the actual hardware.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
Frank, Nishanth, Vignesh: up to you to decide who is picking up this
---
 MAINTAINERS | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 483415e46217..fcc2e429bcd7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28088,6 +28088,21 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/topstar-laptop.c
 
+TORADEX BOARD SUPPORT
+M:	Francesco Dolcini <francesco.dolcini@toradex.com>
+L:	linux-bsp@toradex.com
+S:	Supported
+F:	arch/arm/boot/dts/nxp/imx/imx*-apalis*
+F:	arch/arm/boot/dts/nxp/imx/imx*-colibri*
+F:	arch/arm64/boot/dts/freescale/imx*-apalis*
+F:	arch/arm64/boot/dts/freescale/imx*-aquila*
+F:	arch/arm64/boot/dts/freescale/imx*-colibri*
+F:	arch/arm64/boot/dts/freescale/imx*-lino*
+F:	arch/arm64/boot/dts/freescale/imx*-toradex-*
+F:	arch/arm64/boot/dts/freescale/imx*-verdin*
+F:	arch/arm64/boot/dts/ti/k3-*-aquila*
+F:	arch/arm64/boot/dts/ti/k3-*-verdin*
+
 TORADEX EMBEDDED CONTROLLER DRIVER
 M:	Emanuele Ghidoli <ghidoliemanuele@gmail.com>
 M:	Francesco Dolcini <francesco@dolcini.it>
-- 
2.47.3

