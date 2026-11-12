Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495768;
	b=B8UWS0IF79Cdfvxa7HHunf/A78hn/FIg6CekNeSb21gyiya0PWt9B9SeM/OkF5Kq0ScY
	 mI3mFRgNfzq+Ob9HY2fJBcp8manN5P9uLZLaaKYWZd3D1C7/tYwZivt+17hyc/OUYR4wH
	 k0QpAT+5qq2Wmwz3mMtF3h+hgdnb13DTMm1jVdyeN10VMRR9I2Euw2dt5V/2zCgMoawXK
	 QdA3a28FFz8BFYfhmoh8Y3g4MqFmYH2UKYo6WGEhEEqQwMhRAlT0dDvmnaTX9N+rLvUz5
	 7PPmczaj5t/NIpy6Opq2LYl/CXYsLwNxPVoDDnqEg5jQi5V8/SUz4Qime3E7mD+PYeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495768;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZlolI9vENTEl6C1rNaluT0xNLPmhG2Q3ZnlKVC/ytPQ=;
	b=AcGeDmzuifMoaf2uYH5Xy67cbYXuTRoJC3Dv2FEMbQPdwR/0cfwMEqo8e0yAq2tGP9mu
	 S2E9oBkFgj41EN+55VyvvLMSoAPHKtMQBan2EgsreUnFoNJd6oFy4gfdda2PC5UTpQJIB
	 BGaK75Nlp4+c1S4sphFL6bSK1dINx7MkcTvGubGxFPmR9KGjsPIyDnKvbtIz5540Sy7lq
	 umis0T/e5XezH9nkLkt8x2T9VRFgx7NRjyzb63RsV29UMQk7uE87Rd1szq7Rrl1kXZq92
	 fyyq0BnJgDCI3kvnnYwBxJWJ8rWN3vO2nmOvXcXaFkE/djA7C3tWpstPDvzbNidruqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=hf9VL5zH;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9343A606A895;
	Thu, 12 Nov 2026 15:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9343A606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=hf9VL5zH
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 50DDE2316A;
	Thu, 12 Nov 2026 16:02:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794495766;
	bh=ZlolI9vENTEl6C1rNaluT0xNLPmhG2Q3ZnlKVC/ytPQ=; h=From:To:Subject;
	b=hf9VL5zHqWKbkMYu073oF0sO54UDfRzqxdjbI+Oacu/1Fhk4IbojbcW5Lw93OZIJ6
	 SF8qFUm5nXE3X9di6utHHX/xS7s5n1NhXkUl4fbEpLlyAyhX3w3ebpNPWmJikyMXaa
	 WSQhdUk19Bsa5WeB3cvMAm4RMy5bohFgTliqFkFLGX2bJLyvVSr7F6aekWru3mxr2L
	 IsCjQ3QcHvZzZGU+jZtnuLNwmnPfhu0fNFlnLXnQwqO/f+l7rIhOgNWaio/2kyirn5
	 jS8YEtshE6dxqAnR4agZvytoVyHowV3uR4YiWA8Xrgr8jb6lAlAnrRvzfoQRT2ylKh
	 Ym0/pxMC7D3vQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-bsp@toradex.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 04/11] arm64: dts: freescale: imx8x-colibri: Add SPI alias
Date: Thu, 12 Nov 2026 16:02:26 +0100
Message-ID: <20261112150236.164850-5-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112150236.164850-1-francesco@dolcini.it>
References: <20261112150236.164850-1-francesco@dolcini.it>
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

The Colibri family pinout defines the SoM interfaces, SPI being the
single SPI bus available to the carrier board, implemented by lpspi2
on Colibri iMX8X.

imx8qxp.dtsi numbers lpspi2 as spi2, so the Linux bus number in sysfs
and the spidev name do not match the Colibri interface. Add a spi0
alias in the SoM dtsi and delete the inherited spi2, so lpspi2 is
bus 0 and carries a single alias.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
index 2415487d3a5d..8f04bc3decda 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
@@ -6,6 +6,11 @@
 #include "dt-bindings/pwm/pwm.h"
 
 / {
+	aliases {
+		spi0 = &lpspi2;
+		/delete-property/ spi2;
+	};
+
 	backlight: backlight {
 		compatible = "pwm-backlight";
 		pinctrl-names = "default";
-- 
2.47.3

