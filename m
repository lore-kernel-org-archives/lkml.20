Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794241053;
	b=s6AOixDvewVLkPCiU0gHZsIPCGrMsp2wnYbmwCd31t54EdxSnX661Qlbu161NrH4eyBZ
	 MixgWSjIvZWWxdLewCxa5ge/fVLkSppnNFIgF/vfhXIUDti2fZyymjaaCpP+IIMUj923N
	 xlsvdDFVmwxmmVBCDM7tYpOZGl1LlfXvUCK3BnV/uqJMzaHUJP3wjkXoyh6IEFNA4LV9S
	 0qiqTNgl1P2gAe+GYky8jfmfWNfJV6MYW+EzZcHK6S+Jnu+es7zi5gy4D3oNtzwtKCyXD
	 3oNxH1hiUCtJHjwZcjOSgPSEuOhrGOwLowKw1UyGNOoWH8Ol3sxmfXL0QrjnefLA8Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241053;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v5L08Jod6ZO59LdGm3Xb4YC2Fa48wRZlTTU52Vj5qtQ=;
	b=Uua/as9usIm+QscH/ENjmW8+CvCRx+w7dXfYsDvhxEfJyBTmmkKg/DRi/Vix1SvpDIG3
	 WR3lg/pLHvkxk/NW+vFZV9xopb+T8djy8Jd6iSTxfiJsSFDCInhfp28NSfsB3D28zAoqG
	 GodUmM7xesd8tuXJ4vMr65hq5jVPRZVhJJCsqS4jbWeE6QxD9WtH/jwO5Q5k6aAydW0m6
	 z88EuRGeKLIK1MyPwIKyQKpnxVHOKNZGjzeg7iboJFBB3PcGxJ6oYVuaVZ9v10dhCRZ+a
	 YQC4eM9ETaZvvBf705OMaP88UcZTdQe1odOG3x3NmaV3vflTrC7yZ4g5kkj1kDNOgPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dY67sa80;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28905606A321;
	Mon,  9 Nov 2026 16:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dY67sa80
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 225B61F008A1;
	Mon,  9 Nov 2026 16:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794241052;
	bh=v5L08Jod6ZO59LdGm3Xb4YC2Fa48wRZlTTU52Vj5qtQ=;
	h=From:To:Cc:Subject:Date;
	b=dY67sa80Cm3J6+iuhMA+b5YW0Gj5WLhiCYUvoPc06cssx30tP/K5YwSY1lF1MIztM
	 QWjHvDaC+LJA1u7RCgDfLJZQ8oGXb8YaJSmNjju5mbbqbGiSYNCfa97Ajvrn2fOw8j
	 xj+wuYWwwRAXhGOrYopgWdVkjIf1C2iMG9CoOCFw0tG4b+a8foERSuoU+Gn8MWjJD1
	 tiuRgWktEeEOIqgl64J6bnjXEoqw7nUOwZygJKwv/Bepmhg0c1Jo2BuNQRZs4mxSUk
	 DOfWy55aCD2Nlv1Gd3X8i59xU13KFWq4QspfnmUszR9+4mjbQfc0H5vegGh5duWDEk
	 GYpc0bEm6Cr1Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] ARM: dts: nxp/imx6: Drop unused kontron-samx6i .dtsi
Date: Mon,  9 Nov 2026 10:17:12 -0600
Message-ID: <20261109161713.3618477-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These 2 kontron-samx6i .dtsi files are not included anywhere in the tree
and can't be tested. The kontron-samx6i support is already in place in
the imx6(q|dl)-kontron-samx6i-ads2.dts files which just include all the
necessary .dtsi files directly.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v3:
 - Drop pico boards and reword commit msg
---
 arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi | 12 ------------
 arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi  | 12 ------------
 2 files changed, 24 deletions(-)
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
deleted file mode 100644
index 5a9b819d7ee8..000000000000
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
+++ /dev/null
@@ -1,12 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0 OR X11
-/*
- * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de>
- */
-
-#include "imx6dl.dtsi"
-#include "imx6qdl-kontron-samx6i.dtsi"
-
-/ {
-	model = "Kontron SMARC-sAMX6i Dual-Lite/Solo";
-	compatible = "kontron,imx6dl-samx6i", "fsl,imx6dl";
-};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
deleted file mode 100644
index e76963436079..000000000000
--- a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
+++ /dev/null
@@ -1,12 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0 OR X11
-/*
- * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de>
- */
-
-#include "imx6q.dtsi"
-#include "imx6qdl-kontron-samx6i.dtsi"
-
-/ {
-	model = "Kontron SMARC-sAMX6i Quad/Dual";
-	compatible = "kontron,imx6q-samx6i", "fsl,imx6q";
-};
-- 
2.53.0

