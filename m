Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF44502542
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488449; cv=none; b=cUyPYjSNiU1IlJ9nqEONk7BojTlQigS+7SqhpG7L8+oITXcL7wADRi0YxWCQzPX+zlKZCl5J+A1LmC1KkURY2dCHdnTL1KgZ3a5kjAUF4Q+9YNL3C1ECJUd1uQnqosxIMkgU9RWFlifmOf1qkeKUgkQnOqUX5hQUozHI226PySM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488449; c=relaxed/simple;
	bh=5AReXrC4FLJO1biq7t78AJouBrM49sHmYzFp01FRQsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H/wiZYm9C3Mx+yhT4XXhYwhgdRFuCfnp/wErwr8KXc/T2Nw6vNRFf4bxnASsCLaFkfoF7NJQvz7EYg4CTEAZYo5w8gS+9N6CzzR0ZjujQmbxjvIn0ipx4u/1sFp+LebTK+iihw67HNgbRuziKN4IK8pd79/xLcGeqY7823Cwm8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rLnnDKqX; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rLnnDKqX"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so29368325e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488440; x=1792093240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=32knc5yptOaSTzPqRswLQEdRMbmmyBGuNbQZiUAho2s=;
        b=rLnnDKqXBen/xcbw6e1LeaIiQ7oQzIvRUO/Jnw3FjxdZV5jylhI9M4LSrD9cgEvIDK
         zvyFFX1IrWTsoswqVQnxpeGmCv9dYWup15sSq90zQdOgy3V3EjkGcBcwDZ0R5Kq/CLLQ
         qddC3AZHJEkh/YRjoFfkZAwd2pK873LTxc11m9ASaQpUwKGaffSbEegILAJbzsJEeKPX
         VxMdxLpC7mAZocj8gu8/D1Y/uhIRQpyOlVp+fyWQ1SBWO8j+XxTGFgqLISFIoK73YLii
         EQJnnwCv3kZ7Baiix6YEGo0xR5rAR523KKOuLtgNhfFSZWqlMWM7fg7YLP/wCfvudEiR
         4pmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488440; x=1792093240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=32knc5yptOaSTzPqRswLQEdRMbmmyBGuNbQZiUAho2s=;
        b=Z/uZhGrYtUhuIeLEU5k7NMsg46Dl3KVUva6kqoUsM+t71e9QdpAAeGuq97rQ3qp1MH
         F5gj7rMIA7EAdbQG2uFszSu1GNdZn68EAcPqVV3ALhplVvk7NCIQb5Nc9ZqmF4IhqCEB
         RRoGWuM6FWCU1ojuVZkpQQb9E7wBX1qAjX79p0asNvtIX1hnGfUlUo9Q7CIr4TN+OML2
         gCtFjN279Yl8evK7IRCum37t6S6mYT3fTTd8lrNJZHZm3L0B11IBVTC3Qo1NMuBiyPIw
         yXVj2Xd9/mFiMwDEmaWjbfzvHTmZYbOS1H0xGz9wjgyrpXP/epgsteFotc9+MDCPj99z
         a2CQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGHFZvtjyp3jhl37/kKocBW7llKXPHvCOzebparaVlOibwIoSE3MBUO5iA/oumgCED6UgAGCXQO3Uy6sc=@vger.kernel.org
X-Gm-Message-State: AFuF++mjNy8Thd8wmGspAwNGpZe4fLNDPqpNCA6mlyMdZKTfh9yv+5dD
	ibKpB3yfalbXMijxWHNEQGK3kKOJEo991UbLw6aJbx6iUWlL3C1Mrvke
X-Gm-Gg: AYBFou2yKK2HPd6sG675ZxZQk/beU9Eno6VHNaaydm4MTEIz4fyzAKKQL0mqe8mOBP9
	+NApdJ/pPBRSfkghjYqHIvTt6TpU1dpJU8lVpaO2YMiUbSWsfcV/nWM60lrs1DoPSAF6pjPSoQi
	EUd5+POfdoQ8qHrLunvQBiTngak4ZtPE2r2Kk54+B4zRRkrPzhlwhQC0/RbYtWHnRk7y+jQiKFb
	mN3dkr48fm92PAgTWPmLiSHyGOnkIoUKdF4ntaf+jU9RYzKsQXifIidZ31m2Ogdjn5+CJ7rGtI6
	RCdMn9kiTAINctEqoY699HUrmsG1l036vqgeoOZNxjIEdE8nDJw4fjtyYGQY1TDtPR7ZMyuIfc4
	5VzdTsz6K8YVO1I2f1HF3l+UMjs2TRJpdQ90f5F2zuXHjLn41gtpwqRkAUge/Hq+yhmSNml9aFX
	QPJxCHv8rSVoiKsOAwcWMnFAPSuXkh0gjZus4Sh4OLSBpIgX7d82YQOwCh/p4AcQh9gffeVfvuV
	WtwFlGYz3sqHMKZ8KgLBzEd+Ovd/LeALEo5D5hrS4lQXCvkcdYJ+D8Wvxr58o5StR5bjGcRVUF7
	rnkSyhifdBbW99L917GVPg==
X-Received: by 2002:a05:600c:3b8d:b0:49f:fbad:29c1 with SMTP id 5b1f17b1804b1-4a1806611acmr136284345e9.33.1791488439940;
        Thu, 08 Oct 2026 12:40:39 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:37 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v5 10/13] ARM: dts: imx6ul: Share Variscite PHY clock and update PHY options
Date: Thu,  8 Oct 2026 21:37:50 +0200
Message-ID: <3d7cd1dc732ff0dcb378ba8f41d06a06eaf1a850.1791487179.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791487179.git.stefano.r@variscite.com>
References: <cover.1791487179.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Move rmii_ref_clk from the ENET2 file to the VAR-SOM-6UL common
file. Symphony needs the same clock but must not include the
Concerto FEC2/MDIO configuration to obtain it.

Encode the Micrel RMII clock selection as <1> to match the updated
binding.

The existing Concerto descriptions hold PHY reset for 100 ms but
do not specify a delay after releasing it. Use the reset timing
validated by Variscite: assert reset for 10 ms and wait 100 ms
after deassertion before accessing the PHY. Apply this timing
through the shared Ethernet files to both the existing Concerto
boards and the new variants.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - Replace the broad Concerto conversion patch with a focused Ethernet
   update. Move the audio, storage and carrier consumer updates into
   patches 7-9 alongside the corresponding shared-file changes.
 - Retain the existing ENET1 and ENET2 option files and move the PHY
   reference clock into the module common file for Symphony to reuse.
 - Encode the Micrel clock-selection property as <1> and apply the
   validated 10 ms assert / 100 ms post-deassert timing through the
   shared Ethernet files, including the existing Concerto boards.

v2->v3:
 - Use the shared storage and wireless option DTSI files.

v1->v2:
 - Use the shared WM8904 codec DTSI in the existing Concerto boards.

 .../dts/nxp/imx/imx6ul-var-som-common.dtsi    |  8 ++++++++
 .../dts/nxp/imx/imx6ul-var-som-enet1.dtsi     |  6 ++++--
 .../dts/nxp/imx/imx6ul-var-som-enet2.dtsi     | 19 ++++++-------------
 3 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
index d2a9877344ce..ef838ae07297 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
@@ -20,6 +20,14 @@ memory@80000000 {
 		reg = <0x80000000 0x20000000>;
 	};
 
+	/* ref_clk for micrel ethernet phy */
+	rmii_ref_clk: rmii-ref-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+		clock-output-names = "rmii-ref";
+	};
+
 	reg_3p3v: regulator-3p3v {
 		compatible = "regulator-fixed";
 		regulator-name = "3P3V";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet1.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet1.dtsi
index 6b1e34347bec..ace6d9f35b87 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet1.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet1.dtsi
@@ -5,6 +5,7 @@
  *
  * Copyright 2019-2024 Variscite Ltd.
  * Copyright 2026 Dimonoff
+ * Copyright (C) 2026 Variscite Ltd.
  */
 
 &fec1 {
@@ -37,8 +38,9 @@ ethphy0: ethernet-phy@1 {
 		clocks = <&rmii_ref_clk>;
 		clock-names = "rmii-ref";
 		reset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
-		reset-assert-us = <100000>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <100000>;
 		micrel,led-mode = <1>;
-		micrel,rmii-reference-clock-select-25-mhz;
+		micrel,rmii-reference-clock-select-25-mhz = <1>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet2.dtsi
index f0ed71798617..a207a720bd30 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet2.dtsi
@@ -7,15 +7,6 @@
  * Copyright (C) 2026 Variscite Ltd.
  */
 
-/ {
-	rmii_ref_clk: rmii-ref-clk {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <25000000>;
-		clock-output-names = "rmii-ref";
-	};
-};
-
 &fec2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_enet2>, <&pinctrl_enet2_gpio>, <&pinctrl_enet2_mdio>;
@@ -33,9 +24,10 @@ ethphy0: ethernet-phy@1 {
 			clocks = <&rmii_ref_clk>;
 			clock-names = "rmii-ref";
 			reset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
-			reset-assert-us = <100000>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <100000>;
 			micrel,led-mode = <1>;
-			micrel,rmii-reference-clock-select-25-mhz;
+			micrel,rmii-reference-clock-select-25-mhz = <1>;
 		};
 
 		ethphy1: ethernet-phy@3 {
@@ -44,9 +36,10 @@ ethphy1: ethernet-phy@3 {
 			clocks = <&rmii_ref_clk>;
 			clock-names = "rmii-ref";
 			reset-gpios = <&gpio5 5 GPIO_ACTIVE_LOW>;
-			reset-assert-us = <100000>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <100000>;
 			micrel,led-mode = <0>;
-			micrel,rmii-reference-clock-select-25-mhz;
+			micrel,rmii-reference-clock-select-25-mhz = <1>;
 		};
 	};
 };
-- 
2.47.3

