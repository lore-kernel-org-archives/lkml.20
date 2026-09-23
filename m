Received: from mail-wr2-f17.google.com (mail-wr2-f17.google.com [74.125.225.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A606C531AFF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178823; cv=none; b=sBohqMKrvVxlo5YOoPt518iBUJxxaVqoaU3cTNtucezqyfT0atq88ZmsGUIh/AS2UMXmtTOXcQQtWC+C44Mp4Ugg8c4t6bv7MF7Z/wokZzHL3EcvfuHOekV2WZo9DhL+avXt5ndPcomfPSR/5yDlStw9MvS4OGMZCnSwJinXoHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178823; c=relaxed/simple;
	bh=BPXZnHuQvAcbpuPqPEcW37BwqUhd9iWtifkbdPGoVho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=am9o/cx3PFg1vLmZw0X5f4aEiRl6KPsFtcBJB/byQev8DjT1YVMZckNJmgPvbAtF21pnURMPyzrZqv7lAn540fqsliTelI1ydcC21zKXFyfHp7TRZLflBV3Ie+r4+gMwvCh30AAkjCf+TmRtvqXdL2qK1bj0yVcEKst4uIeSG6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=FcoLk1NS; arc=none smtp.client-ip=74.125.225.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="FcoLk1NS"
Received: by mail-wr2-f17.google.com with SMTP id ffacd0b85a97d-484366874b0so726199f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790178820; x=1790783620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RconBTXU9LPf8lTB0K4UrjmNoGQpku4smOvmK7csrbk=;
        b=FcoLk1NS3b+o3852ZcRtvVOIZ0uokcnY1Jq6F2WyD10UoHNdLPT2aCLxdHBUEAdNi5
         QxMc2OQbVkgv72+4RnyLDogZj3HsDFsW4hSa47IDinrkwciC2iADCUqiXzNN8i854aUq
         kY6mkAyOVnVWiTv5bJylH23qTVjBBNgY0waO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178820; x=1790783620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RconBTXU9LPf8lTB0K4UrjmNoGQpku4smOvmK7csrbk=;
        b=U8a2dCg19lKtTIj3UTLeqbyEAtNc1Mp8ogdYnorrVkaQXknoYNRi8kt5KFw52lr8zf
         sz9/ENs6UO2ZT+Wlgaxe+q1Jwr8qhZNdFGPHPsOTsuwnqUFhozfo5FyNOGrBwMv9Q4yo
         ozACjkjG1Hz/tDPt17r9z7ItmNcOOCFnITHKTSVgglryVN82aqTwjHT5CXIu6s+q15Yv
         XJFGaxEwI5yzmC0I053p3TL5QmmOsxNFbpqbx0/oqV9F46fXUaACaaMC4F9QUZDYccoJ
         VmBV5JY5ujsHBH2QK3XkkN9swLjn/Lj7uNujQ9sHZNZakbfm61ELowz84T/WxjQ4QLKr
         zMvg==
X-Forwarded-Encrypted: i=1; AKwUvByIapD/4L2pjTcOrp7UI2h8xfvpFkXX11Hd6vuT1S0/wmsNFhtSY7ODES9Shn8W7eV71hbKY0gtBp+snCo=@vger.kernel.org
X-Gm-Message-State: AFuF++nW+dfVzg7aDnVOmV14tYXHC2peiw3ePqREqhdLiNTZ1ah7sLft
	KMrUXozXUo6bQb07HdRK/J/7sU1RmcHzV7xEe/YPFTLMIvxu1SOZjIV3/tAut1zio/Y=
X-Gm-Gg: AYBFou16PEmUheCMMj7iQvgDHgde+nUDMYkGe3X8XnJSuuM/ip8xiKEPJvV3+VnA0iL
	CrFSn+xTL6jpVN/fAuKP6XxyZdFNBgRHKR3Lo3oXifHKioCsOkGCsytMkGgW12Uw8LchtoD8MAK
	56ONkSrmYrdqMgByagpTTNy9fVzHw3EOOtp12uDnCHbJJp/YNRHc7eGAuwJLimGhyUzaUBOJ1x2
	/JnXKVmBhRu681iZD/kEp6sfgHflyst6H68cGnqZVgQdVd2OIPN7XMmICzGXbR5zPWrZ0rzfQP4
	OTs9v2+AUPCa2BwMpABJGcvE7D2PAJkno0HtM6FgKhhc7AJkbvZX4U+6/jW2GRtvvqYjiO0qVGJ
	Nu8Z+v/MzT0EN63SxeIb2yXJZn1vohAkwTi8AT+u4RtQPlDihjgfDMcvAmtVWDpxCMYeTTd3LcC
	iE7pxR343uLr1HthuFiJMY4Xqe2A+PYdr7/q6Z1tMJiblfu4vtHzSKCekS3iNBozujGMzvSu7g1
	dImJKP/xvs7HB3+qbHqedNmID2iK0yTjwDzFUJjfhqWycUWGOWPq7O5Wtjxdp4AtFXude5I1vP+
	0nc=
X-Received: by 2002:a05:600c:1382:b0:49f:ce78:3566 with SMTP id 5b1f17b1804b1-49fdeffd72cmr43711015e9.23.1790178819775;
        Wed, 23 Sep 2026 08:53:39 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:12f8:fcfa:728a:2514])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1d5f10sm81858555e9.8.2026.09.23.08.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:53:39 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: michael@amarulasolutions.com,
	domenico.acri@engicam.com,
	linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@nabladev.com>,
	francesco.utel@engicam.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [PATCH v2 2/2] arm64: dts: st: add Engicam MicroGEA-STM32MP257D-RMM LVDS display overlay
Date: Wed, 23 Sep 2026 17:53:10 +0200
Message-ID: <20260923155333.610134-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923155333.610134-1-dario.binacchi@amarulasolutions.com>
References: <20260923155333.610134-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an overlay for the variant fitted with the AM-1280800W8TZQW-T00H
10.1" 1280x800 LVDS panel. Its touchscreen is connected over USB, so
there is no touchscreen node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v1)

 arch/arm64/boot/dts/st/Makefile               |  6 ++
 ...gea-rmm-overlay-am-1280800w8tzqw-t00h.dtso | 67 +++++++++++++++++++
 .../st/stm32mp257d-engicam-microgea-rmm.dts   |  2 +-
 3 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso

diff --git a/arch/arm64/boot/dts/st/Makefile b/arch/arm64/boot/dts/st/Makefile
index 218ff7fdf576..7f657d2bd629 100644
--- a/arch/arm64/boot/dts/st/Makefile
+++ b/arch/arm64/boot/dts/st/Makefile
@@ -1,4 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
+stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h-dtbs := \
+	stm32mp257d-engicam-microgea-rmm.dtb \
+	stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtbo
+
 stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a-dtbs := \
 	stm32mp257d-engicam-microgea-rmm.dtb \
 	stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtbo
@@ -7,6 +11,8 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32mp215f-dk.dtb \
 	stm32mp235f-dk.dtb \
 	stm32mp257d-engicam-microgea-rmm.dtb \
+	stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtb \
+	stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtbo \
 	stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtb \
 	stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtbo \
 	stm32mp257f-dk.dtb \
diff --git a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso
new file mode 100644
index 000000000000..7655c1bf56b1
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2026 Engicam srl
+ *
+ * Ampire AM-1280800W8TZQW-T00H 10.1" 1280x800 LVDS panel. Its touchscreen
+ * controller is connected over USB.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/st,stm32mp25-rcc.h>
+
+&{/} {
+	panel-lvds {
+		compatible = "ampire,am-1280800w8tzqw-t00h";
+		backlight = <&backlight>;
+		power-supply = <&reg_3v3>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&lvds_out>;
+			};
+		};
+	};
+};
+
+&framebuffer {
+	clocks = <&rcc CK_BUS_LTDC>, <&rcc CK_KER_LTDC>,
+		 <&rcc CK_BUS_LVDS>, <&rcc CK_KER_LVDSPHY>;
+};
+
+&ltdc {
+	status = "okay";
+
+	port {
+		ltdc_out: endpoint {
+			remote-endpoint = <&lvds_in>;
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
+		port@0 {
+			reg = <0>;
+
+			lvds_in: endpoint {
+				remote-endpoint = <&ltdc_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			lvds_out: endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
index faedddc2c914..96b7cb6b5bc1 100644
--- a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
@@ -43,7 +43,7 @@ chosen {
 		#size-cells = <2>;
 		ranges;
 
-		framebuffer {
+		framebuffer: framebuffer {
 			compatible = "simple-framebuffer";
 			clocks = <&rcc CK_BUS_LTDC>, <&rcc CK_KER_LTDC>;
 			lcd-supply = <&reg_3v3>;
-- 
2.43.0

