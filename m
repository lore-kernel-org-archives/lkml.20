Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496141;
	b=V8g9cRV0we7FpLrQoXcb3V654oaMs8S8ApKIYfv8D5aZZ4UeQvmI8HXgC2/hJQ7KWi0h
	 qV2voVYircntDYVRQdp7dD4RU5dZxpO9sgDyGFAPW0LxDmXyPspJK+tNJG2ve4A59Djig
	 phbwLMOm1MZ5tZYT52di2Iees+rovpLuOkS0cj0y++nDBP8dTPsrgF+A1PwmCEBirwLOI
	 ite3FIJgaAHVAHTfn1KHqRgD4/8ujpux7YSEQd64eFcnTR8DFk8wRyIa/TTbGMxK+sgg0
	 NwuZ8FCLM6sYMZCgYtVOm9ADjEQVEoT5Mks8dbch92i+HRuN1zfTP88YMzetPuQ7uig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496141;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4BLb/sTmHcdvT/KPX4mCF8s9/Po9DtJLecT3pESMZQU=;
	b=ML2kHSnyjWEEHw3YklidCvkgLLn1o+lmJ/KfCtOyg2uv4418zUX/BbTd/YQsOXwRqPK8
	 ekP4rPyMiP4IoIAjulKRsHKus6Qh70Oj7LQufStJOCLKKn4JtfNCQI4hcb729RjgZMPe+
	 mAk8lluwDc1KEqufKxaLdogyX4Hvz1U2jkSuj6H650HG7Y7jXu3RMPpzm4uM2V47vHn9b
	 jitkP78GnZJwys/wf//KfkFzbG2OHU00k57MeQ7lKv6nr6uNbSmf5t9W5hsZbStLI5N+7
	 9bMI0GRM5ZxQ7ntzykLwrXelXSBzrVhbZnnJWnYbIN8BXJfETU7u4OX8qWlSWzRC8Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=GQrVkre9;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FEB606A337;
	Thu, 12 Nov 2026 15:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49FEB606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=GQrVkre9
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 2957F231C8;
	Thu, 12 Nov 2026 16:08:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794496139;
	bh=4BLb/sTmHcdvT/KPX4mCF8s9/Po9DtJLecT3pESMZQU=; h=From:To:Subject;
	b=GQrVkre9+v8hJLbkaFxXKlOzi4d/GqdyAYCwlRboM8YntBXYzqVqru6QODFmonWvB
	 UYIi8nkth7OrhmX01+hZyG604iUDOcq1hD3aLEfjEW1nfBnYLZ/c7mI9KWN4ZCcbwi
	 ZWkoXqDBgC2wJOUsjs5euJUaHMvGDscTjUuuD/HF4j+PqpHW/S+gjLMOb1EvE8VyPO
	 GKL2suoYo8Z/CxisoTw3AR5ELN/SAMJuqq/eXmZEk2GmfIpVchoXIm9h+690PUEOul
	 CYBUZ/SlibCmca0TsiWCFt7rga2k3+kGn3Lq4Dyf7zVfTcK4BqKmbssG4zXeZ7b3K7
	 fCaMFMqXBxFUw==
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
Subject: [PATCH v1 3/4] ARM: dts: imx6ull-colibri: Add SPI alias
Date: Thu, 12 Nov 2026 16:08:47 +0100
Message-ID: <20261112150849.177133-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112150849.177133-1-francesco@dolcini.it>
References: <20261112150849.177133-1-francesco@dolcini.it>
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
single SPI bus available to the carrier board, implemented by ecspi1
on Colibri iMX6ULL.

imx6ul.dtsi already numbers ecspi1 as spi0, matching the Colibri
interface. Add the alias to the SoM dtsi anyway so the mapping from the
Colibri SPI interface to the Linux bus number in sysfs and the spidev
name is explicit at the SoM level and does not depend on the SoC
default.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
index 1eb1cf2d7395..6de474e4f73b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
@@ -6,10 +6,11 @@
 #include "imx6ull.dtsi"
 
 / {
-	/* Ethernet aliases to ensure correct MAC addresses */
 	aliases {
+		/* Ethernet aliases to ensure correct MAC addresses */
 		ethernet0 = &fec2;
 		ethernet1 = &fec1;
+		spi0 = &ecspi1;
 	};
 
 	backlight: backlight {
-- 
2.47.3

