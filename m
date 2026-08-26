Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82D146EF60
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766569; cv=none; b=e+83/aBWr404OH9vWlITi6Dm3Vn959i8qiILw5aoyoxhNv3s/IDOXXT6qd6zjOXGqZ5qsxyU+zVb+2ZD07UtfmBpwTC9qLKS8FwG0zhjrUQMQRGQADeiOQpNsHGEDlS0NbA/TfVULBdz4qm6/dyRUE2XamhIJ/sqn37qk5Lb5vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766569; c=relaxed/simple;
	bh=NEQELcWLrh6lyQ3u3x7gFjM/nDh5lCBM/682xmbNGeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jCSM+eUl3tXIO+x5ae3/0rIXicaW5gl949w+Q1chyRtfrqvkziSkEg+0eSg5ZwXKke4eKoqjH3L6pINvBp2x5bk8gT8ayiPC/U9M1W2S3w9dsbTYIQVGlKTnA4i0KJgFq6dRlwh1QCj2xt/U5Caf5dn2NtvxkkkoAi0yiE9SVkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjTfOaBs; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjTfOaBs"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c20e70a0962so189756866b.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787766551; x=1788371351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RKiyzRh3KPaW1CCmMsZdFblYmNZk7dBeoJ+HxLixX+M=;
        b=bjTfOaBsB2PJEPKAxKdeiHr+sYHvwdqe1kaxiis2AIw8poJEFAxM5W+94wbf3I75co
         VmhHwwRXU/tQ6u/3TWVXow0Z9o38wld6cZ3yJdN6cwhdx1TDLdrrRxk779YZP0BbcJ9u
         NUNM5A0RJcfHpycGAbQtqQ/nBJd1Y/s1Ya82g1Lknn0d2h2Qi9pnqZ6iIeSyqNrA1c5A
         YOQbqaGirqYU1TMx1z5BBzB2FygNHfDJNCSWTa47leUOzlvpe9cu/gKbTHtjT/TQK+Wb
         HDZh4v3iwQGsVrcR/n3TZqILX19mHJW7AACdtuaJHT0fk9xxf47RfgTLxzttzkQN8oeY
         ncXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766551; x=1788371351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RKiyzRh3KPaW1CCmMsZdFblYmNZk7dBeoJ+HxLixX+M=;
        b=es0HWv8PfGWwyGc9E2rET4osCfZBeBHgqmAbKm087xI5SKO8ymeCM+K9zIxBO4tBoq
         C7NHggTHs13APHd51jDuGdlvUH1785bBOhmiA1nYSHyGSDQGX6+j7NQU2QTubgU4RvFQ
         eHGu33t087KIDZpLmqjEnxehIGo5I68B4xmtDqzarQq4pPC0px3evraMwz16ITB+TVCz
         qRXF1YKJXEvLixS/L1DRFR51WjNUs8IpmH95aGFWbQBbFtUq+rBtQztq7eMtu1vVypIg
         TgAygEk1Y+kB7hz+UQ921MyNo4/wCvz9ZrSE60QWXcY4eaSwaPbMXfZMC8H9AXHOr7tX
         yByg==
X-Forwarded-Encrypted: i=1; AHgh+RrjItd/MfQa1p+QRfCJdpHIfpJwwKo1ejCizVE4u7knKvUHRss0V7KIAKtv4EGfnqR4t22V0r0Cba0JK/Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mPSGcpNq5gzXR6gBsrQC/hggsJ8aTC0E3AWeSWGRDmtp+OtZA4
	RlH3f4JDnUKGruIoZBjfp03pvlwCjoJaPj9myg2kO2KMof2Lf6B/hIV+
X-Gm-Gg: AR+sD131oTgKL8pJsOueeOGYAUSn3VMD9LJwopqqqZYQY+4ndh6JKEgG9RHGA2YmcH6
	FIeFsTJVDaK1ZMOrx+8BotrcHkojfDRzD//uPgz95mf65aw1T3BYYRJSCQkOb/7wmcVhLlaJZ1K
	A70yd6o/V6D+6UwEPMMqGiToKNTzEvZG/wOnPBqbHS028agb+ybmN6KiKH6Tizgfl9+G1wODRSB
	nv2be4eF2CqmmWlazU553XDNMaPQo5MH+vY1Uo0KRCabXRnKEcgCyDH3N5o45PzxhEMpAcAREnc
	i/cAzPzkDvEV6fJrrPICOCs6mZUQaHcASTvyJ65TEO0jSkUDI9LiTmxuh4GrgEcOhVTEFfYVObl
	VX6Da/TtQoSv69jlrdVf22DXLDjvpQvf6d1GYKGGSB0dCER65Gk8z9iBIBOlcFLBuavSbC+w3+r
	RetbjLlkpf9ciTruDmRhYVfdaqhtK9wBGYhbbyEPniBjKrC/FHbQZ+0G7e81yTjRfOiES97J32E
	SIDOxmZ3G9GQArzTwraVS13Ew==
X-Received: by 2002:a17:907:d642:b0:c20:74db:50c7 with SMTP id a640c23a62f3a-c250c2ef6b0mr1308054266b.13.1787766550737;
        Wed, 26 Aug 2026 10:49:10 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac7fsm777752766b.30.2026.08.26.10.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:49:10 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 13/13] arm64: dts: renesas: Add LVDS overlay for RZ/G3L SMARC EVK with ITE6263
Date: Wed, 26 Aug 2026 18:48:47 +0100
Message-ID: <20260826174854.199139-14-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add a Device Tree overlay (r9a08g046l48-smarc-lvds-ite6263.dtso) for the
RZ/G3L (R9A08G046) SMARC EVK board to support LVDS-to-HDMI output via the
ITE 6263 HDMI transmitter.

The overlay enables the LVDS controller and the display unit (DU/LCDC),
and configures the ITE6263 on I2C2.

Update the Makefile to build the overlay as both a standalone .dtbo and
a composite .dtb (base DTB + overlay).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/Makefile          |   3 +
 .../r9a08g046l48-smarc-lvds-ite6263.dtso      | 104 ++++++++++++++++++
 2 files changed, 107 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 8c6a44890715..3cecc40204e9 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -190,6 +190,9 @@ dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-dsi-adv7535.dtbo
 r9a08g046l48-smarc-dsi-adv7535-dtbs := r9a08g046l48-smarc.dtb r9a08g046l48-smarc-dsi-adv7535.dtbo
 dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-dsi-adv7535.dtb
+dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-lvds-ite6263.dtbo
+r9a08g046l48-smarc-lvds-ite6263-dtbs := r9a08g046l48-smarc.dtb r9a08g046l48-smarc-lvds-ite6263.dtbo
+dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-lvds-ite6263.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso
new file mode 100644
index 000000000000..95e1f411fa04
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree overlay for the RZ/G3L SMARC EVK with ITE6263
+ * connected to LVDS and LCDC enabled.
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h>
+
+&{/} {
+	lvds-to-hdmi-out {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			lvds_to_hdmi_con_out: endpoint {
+				remote-endpoint = <&it6263_out>;
+			};
+		};
+	};
+
+	reg_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+};
+
+&du {
+	status = "okay";
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	it6263: it6263@4c {
+		compatible = "ite,it6263";
+		reg = <0x4c>;
+		data-mapping = "vesa-24";
+		ivdd-supply = <&reg_1v8>;
+		ovdd-supply = <&reg_3v3>;
+		txavcc18-supply = <&reg_1v8>;
+		txavcc33-supply = <&reg_3v3>;
+		pvcc1-supply = <&reg_1v8>;
+		pvcc2-supply = <&reg_1v8>;
+		avcc-supply = <&reg_3v3>;
+		anvdd-supply = <&reg_1v8>;
+		apvdd-supply = <&reg_1v8>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				bridge_in: endpoint {
+					remote-endpoint = <&lvds_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				it6263_out: endpoint {
+					remote-endpoint = <&lvds_to_hdmi_con_out>;
+				};
+			};
+		};
+	};
+};
+
+&lvds {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+			lvds_out: endpoint {
+				remote-endpoint = <&bridge_in>;
+			};
+		};
+	};
+};
-- 
2.43.0

