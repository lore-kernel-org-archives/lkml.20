Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751065;
	b=hUoXfcl+vfieq9MvWegfHtPWTJaZ3OXPjArk76tzRmx2QoKwA6gHUyYidL6GvvhwnSVL
	 TTv2xgBjjC5+SU52fJ562ykmG9Y6v1QMvb6++OsdbbfZqfmiZOQ/YkmZw+sZEzIWrdd3w
	 FA2/I3JVcRhodLZoKjUP97xcHSFcVYyqPQ6xlmmF2iU2ksP/tYRFJ0Qmm3LpxvbLk0p5Z
	 Grvb6zSKfeMWX0V+l68KQWLlHWlwllLPIjHh4TpuzkMlpEMJ8Beea901koztNjaZRqGyZ
	 VuxeuK5YcfnV7bOAqQZ5DWL5ZAUZt38w+ioxi6ffFJUl8BDmEcR6YSKyq9JCP6WWLYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751065;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=YUDDCMB8Ncom1Brn64DunMxTfMAb7Xq11EIX175DCyI=;
	b=Pt/a1TTpq+KGcNL2HNqXSA2oQQ1u1+DaqLexOa861Eg9hDgBE42Pgry9N8AmEmi/IlPb
	 HOxHjKCIiIGsu+FZDj5MWv+DYaf19DnhjKn+Vp0uncjMPruDVjVD4YN/Yw/y9I30t6ySa
	 4MvSsJirv8QabC7EpvoL1K/+2UkMfv3ewOkkhXVos1CxtRN+0vaoJGnjG/yB1leuTvQbM
	 cafQhenp5pn43EVxT4UUi5TjvS0M66gBXWdC1pRAWc6vNBPcjS/RV1xhHngmVUElmGMjs
	 D7PMoemaS1uN3g0eKdcuEM9MxVOM19igAeHzmONOnfQyLn0sXnH0wLj1GjsUCOgXIXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=BwQLI+qt;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4C4606A31D;
	Fri, 23 Oct 2026 10:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D4C4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=BwQLI+qt
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id D12321FC00;
	Fri, 23 Oct 2026 12:24:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1792751055;
	bh=YUDDCMB8Ncom1Brn64DunMxTfMAb7Xq11EIX175DCyI=; h=From:To:Subject;
	b=BwQLI+qtN0OH86v3RJgTRy8loOhj/WD7C/ApbZZQzSRZicovFmznn5D5PePGcAFcm
	 ZGjXdNYgPsX1H1psCa6ZZ4oA13+FozEMeoEy79Cj1y6XZDdaB6RZnfpcFhgBM1UyEO
	 W1lNBIlYocwkMdr9nx6Wl6eDUQkPsDcRy9MUKBivZ+6Fh88/B56Y+xzbWuUxaPa74R
	 0pSLX3mhCaEgyXycz7SzXTMEFskVw6B3YW76/vyVITvNMb6tOmBsDzFOmps7qr4kWJ
	 /tCzMxgOaoKSrlokGAFZgAjoa8g8RG1nR42yqyn+Nbsh7SXdtHj4SXppIKitZDdGlS
	 YrPGBULv97zxA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: freescale: imx95-aquila: mark +V1.2_DP as boot-on
Date: Fri, 23 Oct 2026 12:24:03 +0200
Message-ID: <20261023102408.119509-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Mark the +V1.2_DP regulator as boot-on, matching the hardware: the
CTRL_DP_BRIDGE_EN enable line of this supply of the SN65DSI86 DSI-to-DP
bridge is pulled up on the module, so the supply is on by default,
before any software runs.

Without it the regulator is briefly switched off and on again during
the board start-up, potentially disrupting I2C transactions on the bus
where the SN65DSI86 is connected.

Fixes: d5c082ba23db ("arm64: dts: freescale: add Aquila iMX95 support")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
index c5f4cf0541f2..d40514cd2e00 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
@@ -91,6 +91,7 @@ reg_dp_1p2v: regulator-dp-1p2v {
 		gpios = <&som_gpio_expander_0 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
+		regulator-boot-on;
 		regulator-max-microvolt = <1200000>;
 		regulator-min-microvolt = <1200000>;
 		regulator-name = "On-module +V1.2_DP";
-- 
2.47.3

