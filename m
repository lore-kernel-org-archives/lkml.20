Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0294FECCB
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488436; cv=none; b=Imm3FKTxPmlkcN0pH2gUWp3lEdoeXPstHRDy03pBkje9tRetHtXFMAQPW3wipgU45zoUru4Mh288v4I0TTEXHNyvW9r08bkI2aoc8Z3uKPILapmRoCfu/B0982OjejPsq6JWQXeop7L7ylz62uUDTZvxkuCCvHFHWxRXPKh6vaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488436; c=relaxed/simple;
	bh=uYnoAlVMzjPf1koqMWb3wOPeMUNPpHGIO7RXL2fZKnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s+rAU32FzBcenrBExudqKRGZi2c/CsT8mg3gUe6pOLHNyxrHWySv67kIXjq9YpBcgxomLrYtzqJ4u9MaEe7f6yhPNDJimja41r8MjW2MylDXr7Mnk9YKlPHnMTpKX65gc4afBin+vdCThe1ItdH9VH0okhTgQGQsQxrU1tTYWFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1xeIeMF; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1xeIeMF"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so21750595e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488429; x=1792093229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hRkcPjZLCx4KGQ69YlsYx3CS01joHDVdS8gNEI5i67g=;
        b=i1xeIeMFOaDcs/qDd6ECvx3yo7CACdrr2Pd5y7ll1sFrQNfZEWM0/UXdnVFeeGy65h
         M0J7AmBaTkmaavHSZ2iV5+pXoJwCxroLRXqdEutYsXC4I1Yv3gPzXVHeC+LFEo164QRj
         kbWxUXQ+5qYwtkQzlt82aP8s+bzKm4EuM1ZL7OJPKVZDJWGqQUm1hsYLSbYLGZCCFSsY
         YJLCyziM+Uw19TMZkBFC9aXYneKuRe87JdkKuqWxXOTUYEC6C8qd63BQ51lNA5yJSG/3
         eUfb+NTeCx7u9M7U4q7f6l2CHoEI7ebLQwDJV+PvbpZ1QJ7nlWNHSegmprc3EVVvLGNp
         D/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488429; x=1792093229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hRkcPjZLCx4KGQ69YlsYx3CS01joHDVdS8gNEI5i67g=;
        b=F2/3f/btd7eKHIrwZ9dR1VcgzgPKvun1FUM1tujULQzF8IeFwRK6RdQ5QSZp6BSGJQ
         kIeuGZlv8cZZVDpGJxmFa0EVesmcb3tovtpaMQcsz3bf+yVkWQ65d3251T5k7zNEKx1Q
         gmvRXm/bJbcbuIZ0W9xW2M2YCgnRIlIdnSqYr3DPkWpSy7xKIZ3Z1lag4dZwoRSJf+sj
         /x/5CbEaQsHtRI+9Wn0oNqTG+oHSOdVdO2p5HApwuKO3CpyH+jfYymDsI18876uyDP2B
         x6RJEVIibmOD+WoxjlQghPBd7dZXuP5Bx/bm7UqSr7ju+H918YkTIdzX2ltUo00H01Bc
         pdvg==
X-Forwarded-Encrypted: i=1; AKwUvBxcfXRAWOMwtediQ8YqhkjhkDzy6WnPu0Ms65Z61Qsi0UXJocQLzzlgRzT4hXEmn7ydmA8xG0+ghUfGiA0=@vger.kernel.org
X-Gm-Message-State: AFuF++lTxdpQHn8LohNuGkiiT8sWPkhq6/vgOfU53D9pCecc96QH6nRn
	h7Gfg+LfV0D6VeQw0H+ffwM4Njm1g4gOVxBsiFBbYbdxUZaB8B3Se7iw
X-Gm-Gg: AYBFou1+XHCyIN3B8CZE2BUr8XMCpj1z/KcDUAjvL7mheYzTiy7TUSF+87zXgODAdTM
	ZSCozMYdMSgsbcSWJZA4MNXTVvkZ4ZytW50caH9kb+qKseeLne3Mi09JP9Bwz9SENhYuUPqhb4M
	r+eHu7RA9pOaZ/0opDSSaJCkG/J+RlLUfXB6YCJdLCxHNT61dinQS1+fWOxlyayW6oS2smTBzgc
	NQ2udoia+JgYkdpq0IhvvSesjb9YPcN0s7zdPmlIy+EXH6zCoKh5lz+6fKjtcgXGTe73m8XJCpd
	fJ7xK8A4KyB4vumagLum4ZCptQfmjj1Oz+S7AaHZVsrNh8A9e3+d5IlVfhd6jdCqR3sd/U4F1xR
	fnej+lkGlU1EqvFlS3iv2CYxK6lfssmmmozMk7b84CxAipKC5ThvgXn11SVqFX9IvpTkoUioMvb
	LQcv6l6IKGjt9LQfdgX9hvjUySkOBGQpw2/a3wL64jXYWP/iZTr9vHw/mTdmQyvi3g7OD+tkgf1
	oBtMeoVp3a8+eK8Aj9rnud7QhShuiZgpxW1uLXS7pQKnshUhapxX590Ly09DjV4KCNxlDiphLdz
	jlHBy9pLXx9Q4tCVJ8qnKA==
X-Received: by 2002:a05:600c:a00d:b0:49f:ce78:356f with SMTP id 5b1f17b1804b1-4a18065f30cmr122465985e9.32.1791488429121;
        Thu, 08 Oct 2026 12:40:29 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:28 -0700 (PDT)
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
Subject: [PATCH v5 07/13] ARM: dts: imx6ul: Add Variscite WM8904 and WM8731 support
Date: Thu,  8 Oct 2026 21:37:47 +0200
Message-ID: <50f74f31925dd5d43d5b6578888c33875d8f2a20.1791487179.git.stefano.r@variscite.com>
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

Add shared WM8904 and WM8731 codec and sound-card descriptions for
VAR-SOM-6UL and DART-6UL. Reuse imx6ul-var-som-audio.dtsi for SAI2
and select the clock setup and audio routes in each codec file.
The DART-6UL WM8904 wrapper adds the IN2L, IN2R and MICBIAS routes.

The existing Concerto DTS files enable SAI2 but do not describe a
codec or sound card. Include the WM8904 option there to connect the
codec on I2C2 to SAI2 with the module's audio configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - Reuse imx6ul-var-som-audio.dtsi for SAI2 and its pinctrl, keeping
   codec-specific clock and routing settings in the codec files.
 - Add the WM8904 include to the four existing Concerto DTS files in
   this patch instead of waiting for a later conversion patch.

v1->v2:
 - Share the WM8904 description with a DART-specific microphone
   routing wrapper, and consolidate the identical WM8731 files.

 .../imx/imx6ul-imx6ull-var-dart-wm8904.dtsi   | 17 +++++
 .../nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi    | 50 ++++++++++++++
 .../nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi    | 68 +++++++++++++++++++
 .../nxp/imx/imx6ul-var-som-concerto-full.dts  |  2 +-
 .../dts/nxp/imx/imx6ul-var-som-concerto.dts   |  2 +-
 .../nxp/imx/imx6ull-var-som-concerto-full.dts |  2 +-
 .../dts/nxp/imx/imx6ull-var-som-concerto.dts  |  2 +-
 7 files changed, 139 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dtsi
new file mode 100644
index 000000000000..236022f3da10
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dtsi
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+
+&sound_wm8904 {
+	simple-audio-card,routing =
+		"Headphone Jack", "HPOUTL",
+		"Headphone Jack", "HPOUTR",
+		"IN1L", "Line In Jack",
+		"IN1R", "Line In Jack",
+		"IN2L", "Microphone Jack",
+		"IN2R", "Microphone Jack",
+		"Microphone Jack", "MICBIAS";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi
new file mode 100644
index 000000000000..ed9af0a39714
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+#include "imx6ul-var-som-audio.dtsi"
+
+/ {
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&sound_master>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&sound_master>;
+		simple-audio-card,name = "wm8731audio";
+		simple-audio-card,routing =
+			"Headphone Jack", "RHPOUT",
+			"Headphone Jack", "LHPOUT",
+			"LLINEIN", "Line Jack",
+			"RLINEIN", "Line Jack",
+			"MICIN", "Mic Bias",
+			"Mic Bias", "Mic Jack";
+		simple-audio-card,widgets =
+			"Headphone", "Headphone Jack",
+			"Line", "Line Jack",
+			"Microphone", "Mic Jack";
+
+		sound_master: simple-audio-card,cpu {
+			sound-dai = <&sai2>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&codec>;
+			system-clock-frequency = <12288000>;
+		};
+	};
+};
+
+&i2c2 {
+	codec: audio-codec@1a {
+		compatible = "wlf,wm8731";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&clks IMX6UL_CLK_SAI2>;
+		clock-names = "mclk";
+		AVDD-supply = <&reg_3p3v>;
+		DBVDD-supply = <&reg_3p3v>;
+		DCVDD-supply = <&reg_3p3v>;
+		HPVDD-supply = <&reg_3p3v>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi
new file mode 100644
index 000000000000..c95dbf3824af
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+#include "imx6ul-var-som-audio.dtsi"
+
+/ {
+	sound_wm8904: sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&sound_master>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&sound_master>;
+		simple-audio-card,name = "wm8904audio";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"IN1L", "Line In Jack",
+			"IN1R", "Line In Jack";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Line In Jack";
+		simple-audio-card,mclk-fs = <256>;
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai2>;
+		};
+
+		sound_master: simple-audio-card,codec {
+			sound-dai = <&codec>;
+		};
+	};
+};
+
+&i2c2 {
+	codec: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&clks IMX6UL_CLK_SAI2>;
+		clock-names = "mclk";
+		AVDD-supply = <&reg_3p3v>;
+		CPVDD-supply = <&reg_3p3v>;
+		DBVDD-supply = <&reg_3p3v>;
+		DCVDD-supply = <&reg_3p3v>;
+		MICVDD-supply = <&reg_3p3v>;
+		wlf,drc-cfg-names = "default", "peaklimiter", "tradition",
+				    "soft", "music";
+		/*
+		 * Config registers per name, respectively:
+		 * KNEE_IP = 0,   KNEE_OP = 0,     HI_COMP = 1,   LO_COMP = 1
+		 * KNEE_IP = -24, KNEE_OP = -6,    HI_COMP = 1/4, LO_COMP = 1
+		 * KNEE_IP = -42, KNEE_OP = -3,    HI_COMP = 0,   LO_COMP = 1
+		 * KNEE_IP = -45, KNEE_OP = -9,    HI_COMP = 1/8, LO_COMP = 1
+		 * KNEE_IP = -30, KNEE_OP = -10.5, HI_COMP = 1/4, LO_COMP = 1
+		 */
+		wlf,drc-cfg-regs = /bits/ 16 <0x01af 0x3248 0x0000 0x0000>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x0408>,
+				   /bits/ 16 <0x04af 0x324b 0x0028 0x0704>,
+				   /bits/ 16 <0x04af 0x324b 0x0018 0x078c>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
+	};
+};
+
+&sai2 {
+	assigned-clock-rates = <0>, <11565177>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
index 725f34d6b7ee..66c9deaea083 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
@@ -13,7 +13,7 @@
 #include "imx6ul-var-som-wifi.dtsi"
 #include "imx6ul-var-som-enet2.dtsi"
 #include "imx6ul-var-som-enet1.dtsi"
-#include "imx6ul-var-som-audio.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
 #include "imx6ul-var-som-lvds-panel.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
index c249e15772b8..4905abf5aa08 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
@@ -13,7 +13,7 @@
 #include "imx6ul-var-som-concerto-common.dtsi"
 #include "imx6ul-var-som-sd.dtsi"
 #include "imx6ul-var-som-enet2.dtsi"
-#include "imx6ul-var-som-audio.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
 #include "imx6ul-var-som-lvds-panel.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
index 1b7c1a3383ee..880b72833091 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
@@ -13,7 +13,7 @@
 #include "imx6ul-var-som-wifi.dtsi"
 #include "imx6ul-var-som-enet2.dtsi"
 #include "imx6ul-var-som-enet1.dtsi"
-#include "imx6ul-var-som-audio.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
 #include "imx6ul-var-som-lvds-panel.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
index 9c9d16eb1a11..c481839a98a5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
@@ -12,7 +12,7 @@
 #include "imx6ul-var-som-concerto-common.dtsi"
 #include "imx6ul-var-som-sd.dtsi"
 #include "imx6ul-var-som-enet2.dtsi"
-#include "imx6ul-var-som-audio.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
 #include "imx6ul-var-som-lvds-panel.dtsi"
 
 / {
-- 
2.47.3

