Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703215;
	b=f3iMRDhjO7q3rXpxUd95mjJJtnpKQUTFD472r22u60v1/TUYI0WnaOyVr0+khXV7DHvb
	 Nhh6HQYmrtMTQbHs8ohoTJEJGSKlley1G9I/Oa2muW2DQPWL2paJgB5AB53bVtBMQxERv
	 FgHTjAFclEOcn0+gAeLP8X6ob6ZFKjpL7pNoXwRfTkXvM73AbXSf9Gjk26vKbnuNfrmHl
	 zIFO+T57J8F79fdjVkQLt9SCHhqGqlwIwVbhn24FbnzTfqJtg1HiFE4Cuc77VKDqy+Ta2
	 E5myFRJRS1fNrlcWXVMb84TklqVD7+QGfztJnzqnOBF3wOoapz2vIpDE75zoAoqqdKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703215;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PucKNmxJ8X9KZkuPjiBnnnSe7Sz0Xqekz5/GdiUHsVA=;
	b=zo4Mabl0mZl8lkLuyUwrSy0bMew4aWCvSqJdtETHvlCHc84IAxx7MjGgFq94HFg5SHCq
	 +CmelLczyuhZxyL5JfZUz/Oj8n9KEexzcUYA/N/tRVLUZjTLGI+3GiEoZdTxyUIPdb6Ra
	 Adsl/1beLum+WEUBe7+RlEL6ZoArN3a3oaubkUfIbUufrTKedMy3sR2S9fcdsTH6OkLBU
	 nlQnRbPpByL5VxxUGTHleu2q/gs7sVPBFfLXQnPNikU+kBKtVGf2nE8+UspxC6k/0a6gM
	 zDxnTAC49+sD96R16CIRRzo4HRehiGnKmYnipPDZTGwWRFtwMhUx4LCrroj59lvzXog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=WEP8wv3l;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F84606BFBE;
	Tue,  3 Nov 2026 10:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88F84606BFBE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=WEP8wv3l
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 8EEEE1FAF9;
	Tue,  3 Nov 2026 11:53:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1793703213;
	bh=PucKNmxJ8X9KZkuPjiBnnnSe7Sz0Xqekz5/GdiUHsVA=; h=From:To:Subject;
	b=WEP8wv3lFTmygkOzEkmDHEBLmlgoIuB8rpg9pTv7+LCG4jMd3E0ULkGhcE1YntdjL
	 chSHcvrlHCaTXqDCH8+9sLMwDaHOpX7pyMcniFinvcOEAXMnhkCbD8C443t2EiqWNh
	 dNRijXurmNvW0K2sTKivo6UENcEXQw6Xl17LXCg5gm8o/7yiKA+a1EbuKcllsAePph
	 RiMDPxiIQLLDCYt0zl6UjzsQQtDxkiIJAY/4qF2ienx+PziAhDHOlbxkBqfEF9r7ap
	 5OTiLDPiFkgDPVOHrdOFjb4OE4lnSqAnZk9ZhrOBgbeksBrMQvv2+dJYo3hgK2NjPa
	 wLP29x2mGG+0A==
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
Subject: [PATCH v1 2/2] arm64: dts: freescale: imx95-aquila-clover: Keep DP_PWR always enabled
Date: Tue,  3 Nov 2026 11:53:16 +0100
Message-ID: <20261103105323.2394012-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103105323.2394012-1-francesco@dolcini.it>
References: <20261103105323.2394012-1-francesco@dolcini.it>
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

DP_PWR on the DisplayPort connector powers active DP cables and
adapters, which do not work without it. Keep it always enabled, and mark
it boot-on so that the firmware, e.g. U-Boot, enables it at boot,
whether or not a display driver is available.

Fixes: 3f519121e120 ("arm64: dts: freescale: imx95-aquila: Add Clover carrier board")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
index 07bf53240958..37fa107c6fec 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
@@ -41,6 +41,8 @@ reg_dp_3p3v: regulator-dp-3p3v {
 		/* Aquila GPIO_21_DP */
 		gpios = <&gpio3 21 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		regulator-always-on;
+		regulator-boot-on;
 		regulator-max-microvolt = <3300000>;
 		regulator-min-microvolt = <3300000>;
 		regulator-name = "DP_3V3";
-- 
2.47.3

