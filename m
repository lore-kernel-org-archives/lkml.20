Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F3E47DD48;
	Tue,  1 Sep 2026 12:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788264943; cv=none; b=kYMPThvgQC8bUCKoWmRDAUU1HZDVF8bwZjHzIvCWadz+Bz1EtRbNEsOKAZsreG9ZUKdYXJcqobJuz4+dnLjuKHsxbdvG9D0XvppCn29IQG8BvFsD8F0skAJiMTHToz0GpvB+7cyrMxVFAkaMJxi+WyrMDTacsIkQG7rrv/VH5OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788264943; c=relaxed/simple;
	bh=U0nlzt3GQrEhW9lHsZWaloQdOHudVOamVF/QIb8C8ms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ft6yoqxABiLSmDb4ktzn2SbKXOc10YsHs+Glot/gC9eXVl/nhAwitFZAEHnxrpQSPHHxcx+VQcIb7HlGqDMchToe8Xf/XBw7bGku0k3AT7Tv3RxSusG86D2GoM2eQemXD3jlNLhg3SvuDpkkuP0eYLdl/BEC/BimurbWCbTAs+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mSE4ZrSI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mSE4ZrSI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1EAE2C4AF52;
	Tue,  1 Sep 2026 12:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788264943;
	bh=U0nlzt3GQrEhW9lHsZWaloQdOHudVOamVF/QIb8C8ms=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mSE4ZrSIbBufXBA82eLDZL+kdH09S4hm8kyLadSDY8ekMVE4jZC1vuMlQzqFVyHXN
	 xUFDI/5l60iCpTUIi2USEEYPzeHRWaHw+2cKdd6yWiGJjFdwvCbVaaQKIRr6Q9WrtZ
	 sUKOhCFmAG5U2bSqiV+uCbuUFKaAVc0MzXEz1Y6DJWGfTy/WTPg9x7q+CI9kMvvwQy
	 YJhFYzVi05yTZ1eR8n0Xb2TDbhtjOJJMx3iyOZsIVHCMjziduINj3hNo9hBGY+Fo4v
	 l6JYw1k3rB0CBEWOTGrA7DM7MFE3F/y5gjUg8O91VuSWvXg0H2mddPy+aHBo/s+ODM
	 sR1sLgWO3dSJw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D2F3C624D3;
	Tue,  1 Sep 2026 12:15:43 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Tue, 01 Sep 2026 20:15:23 +0800
Subject: [PATCH v7 08/11] ARM: dts: aspeed: anacapa: evt2: Add shunt
 resistor values for HSC monitors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-anacapa-devlop-phase-devicetree-v7-8-0bd71d2e0105@gmail.com>
References: <20260901-anacapa-devlop-phase-devicetree-v7-0-0bd71d2e0105@gmail.com>
In-Reply-To: <20260901-anacapa-devlop-phase-devicetree-v7-0-0bd71d2e0105@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>, 
 Peter Shen <peter.shen@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788264931; l=2046;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=3PJIko2HxXfn3+qbGJ71r5pZFx7EAq9CZKMxe8Oqcys=;
 b=VdT2ZY1Sy1/ZuhfWeDB3NI57vohjfLLT5uykMW0yx5Npe3R4lMpPLOXY2tNdVrgwOthCKpaIa
 tB+X8TmroJHBpF2J4GktUGvER/5UHdxuqJ7QqVqEAU6Il7fq8aojxxJ
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Peter Shen <peter.shen@amd.com>

Add shunt resistor configuration for LTC4287 hot-swap controllers on
Anacapa EVT2 platform.

The resistor values are required for accurate current and power
measurement by the driver. These settings reflect the actual BOM used
on EVT2, where different sense resistor values (150 uOhm and 250 uOhm)
are populated across rails.

Without this configuration, the reported readings would be incorrect.

Signed-off-by: Peter Shen <peter.shen@amd.com>
---
 .../aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi   | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
index c0b2976ad9e9..92be113463de 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
@@ -38,6 +38,30 @@ gpio@24 {
 					"RPDB_FAN7_PRSNT_N_R", "RPDB_FAN8_PRSNT_N_R",
 					"", "";
 			};
+
+			power-monitor@42 {
+				compatible = "lltc,ltc4287";
+				reg = <0x42>;
+				shunt-resistor-micro-ohms = <150>;
+			};
+
+			power-monitor@43 {
+				compatible = "lltc,ltc4287";
+				reg = <0x43>;
+				shunt-resistor-micro-ohms = <150>;
+			};
+
+			power-monitor@44 {
+				compatible = "lltc,ltc4287";
+				reg = <0x44>;
+				shunt-resistor-micro-ohms = <250>;
+			};
+
+			power-monitor@45 {
+				compatible = "lltc,ltc4287";
+				reg = <0x45>;
+				shunt-resistor-micro-ohms = <250>;
+			};
 		};
 
 		i2c@1 {
@@ -52,6 +76,24 @@ gpio@24 {
 					"","",
 					"","";
 			};
+
+			power-monitor@40 {
+				compatible = "lltc,ltc4287";
+				reg = <0x40>;
+				shunt-resistor-micro-ohms = <150>;
+			};
+
+			power-monitor@41 {
+				compatible = "lltc,ltc4287";
+				reg = <0x41>;
+				shunt-resistor-micro-ohms = <150>;
+			};
+
+			power-monitor@45 {
+				compatible = "lltc,ltc4287";
+				reg = <0x45>;
+				shunt-resistor-micro-ohms = <250>;
+			};
 		};
 	};
 };

-- 
2.34.1


