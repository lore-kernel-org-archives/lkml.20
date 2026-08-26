Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC4E46EC8B
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766577; cv=none; b=mVZoOq7S/rZgJCmj9P/sr3ATg8jMvZwgFs3dZDCm5w4c7LZe2X/ERTR/t0yLqAaicUHtFbVWaUKTfzoNewwWENZ52JmMY5JtWDOzuuL3gmIOXC8NsfwtgeCgubg4Qgajn2MbOpN/9wwEYzqZfx+XTu1heSj377BMmrxNmkwJFo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766577; c=relaxed/simple;
	bh=p9SswxHbEsu8/KF0kHQvhtWGdr/Nf0H6i8JYgP4NQuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ee1B5xU2Ic4OVri/563RgWWtQkEwEVxUqHXI5dzaTh74hJSVdSawlYKOU6e5mLOX8WWlvP2n+BmWvfjVlXWsyRmBL5LUUrOdWaKZWW+EJlOOi1J3YDvwsbeXHrpdCZi+l9ymmotDtQIIqhHFMKfsfYCI1kKFIETnXKXIN/sFHk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=beI1EfOz; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="beI1EfOz"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so2107508a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787766550; x=1788371350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pdIXMd3valIFt9nZNwXgENVj3LUWWJ+9bpSH1pG21+M=;
        b=beI1EfOz7lAxQEkhnH9wSEvVNyJXBQXJMXL9FyreZEycHBjd/EELJh7DP5xbC3LkA1
         tOwUNeuYs7rGHgeO9mbU0cc24iYO4cy+QgyqKJ9ZIUmCEZchBqFzSMY5lmSD7paVdj3K
         x1ObyQPPnHrM/mpjY3E54/6evqJZZa/V33eoqFTht0K6blhGTxmPny7H1sV8lvhLeYqp
         zYt9SaaGAlW/mIM6wlqp0+aoQUWp3IcDZtnWIa0K0+M/IuRaQMc+G8HLHHXqqgm/DzzT
         xERplxrAm8yrnYVJ7PQNTg7j+9o+aEomq5gBTYK+/gLM8AfKQRwvBkgWQYcbxY8Yvjbc
         zljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766550; x=1788371350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pdIXMd3valIFt9nZNwXgENVj3LUWWJ+9bpSH1pG21+M=;
        b=ay7+Swe7fVQMopfHR0hA6XGF/qL4vOXP/jy+jfrwl3ybPE4gqyuHw5aGQ4WwWiclF4
         NlD1MtcPwfuiCZNwHkJWUv0v7sSOu4YaZdIjOZwkJQRNG67fWbCD9YQ5ZbzXdCXYuX/S
         UPTauCYfemwAO9RCp9/WaARXbrRcxS4aIsKr8RTzt9yxTKf0e7ajlQtTnRILlQhRVgir
         hyaGLx5WVESkUC5G1mxWrjOxZqW6SlK+7QrObdR908uhDvnpjC8Nfrpty4XzfyFqQBQH
         50F9rTcJ+IJSkaOrJGXpeS8GFyLmXdeXe33FplpDUPwWmec2MYI7M3CWCMyP75dhwnuH
         LRpg==
X-Forwarded-Encrypted: i=1; AHgh+RpIeOwpmI5VGlT9QnE1SUj18I/GS+pDH0LQGuB1AxQeMumnbRCZTFNpcBZkMEiZu2gX2J8vyEAnDr5cJnk=@vger.kernel.org
X-Gm-Message-State: AFuF++nqbmktQ5h1AK+PyfRrR33cbtrnk+P0LEzFjZStUhR9xL8HZvyj
	MWZ3jJbF8ZK+XPf9lESnStI2eOZ6qFhL6Cu2M+TOx/Q9U1jT1+rzED32cMKdVg==
X-Gm-Gg: AR+sD13I5kJxl/BKDH1ifKrsgqD5m3xIC2Yot4QV1Pm0Ew5ynx6TV4S2FV8idFQFlOz
	uccqDWwLUwailUiFWGcBv2D4NbyyKxSp1rYsdY6JVSFtOd6op8ahiCsG/4GH6u+6Kt/cKdOJsFv
	h4wYf6L7KGX9pt40nOdrm3JpDhimLV1LNfAEVAMPStuly4YqsELqiU/1MYoU4W3uHLOvlGM2Ruq
	Y6Eb2KQB3300/dGWwXcwb9Xb2kXX/PsjxYfvfsfDzsXkli3ZRcjSW8A6hI/1B8rNW5z58OCDWPv
	CB4R9HJgP0ccLA7yNU/I469zX2JYhdIBsqZlnekO8NRc5l4XglnU9ENsQO59jjmnNYZwu9LkcTW
	bBaAouGeo2uiUOLN7yhxVAQly475slh8tutL+rBsYLfQhQQyvqGp1RFG0odqGUq2jRcWZ37ThDG
	th2CWvs9BiYdOpIGAc/+RT9d4Epm0M/yfZTyMEW3Nz94/K/iJ8nrBnff+TmrnNJzZAqmgmHofyx
	01Oy7stBrXNsA==
X-Received: by 2002:a17:907:728d:b0:c24:87e3:b8b8 with SMTP id a640c23a62f3a-c250c608d0emr1094954566b.17.1787766549920;
        Wed, 26 Aug 2026 10:49:09 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac7fsm777752766b.30.2026.08.26.10.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:49:09 -0700 (PDT)
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
Subject: [PATCH v3 12/13] arm64: dts: renesas: Add DSI overlay for RZ/G3L SMARC EVK with ADV7535
Date: Wed, 26 Aug 2026 18:48:46 +0100
Message-ID: <20260826174854.199139-13-biju.das.jz@bp.renesas.com>
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

Add a Device Tree overlay (r9a08g046l48-smarc-dsi-adv7535.dtso) for the
RZ/G3L (R9A08G046) SMARC EVK board to support DSI-to-HDMI output via the
Analog Devices ADV7535 HDMI transmitter.

The overlay enables the DSI controller with a 4-lane data path and the
display unit (DU/LCDC), and configures the ADV7535 on I2C2.

Update the Makefile to build the overlay as both a standalone .dtbo and
a composite .dtb (base DTB + overlay).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/Makefile          |  3 +
 .../r9a08g046l48-smarc-dsi-adv7535.dtso       | 95 +++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 8bf155badd11..8c6a44890715 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -187,6 +187,9 @@ r9a08g045s33-smarc-pmod1-type-3a-dtbs := r9a08g045s33-smarc.dtb r9a08g045s33-sma
 dtb-$(CONFIG_ARCH_R9A08G045) += r9a08g045s33-smarc-pmod1-type-3a.dtb
 
 dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc.dtb
+dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-dsi-adv7535.dtbo
+r9a08g046l48-smarc-dsi-adv7535-dtbs := r9a08g046l48-smarc.dtb r9a08g046l48-smarc-dsi-adv7535.dtbo
+dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-dsi-adv7535.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso
new file mode 100644
index 000000000000..cede3b4ba318
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree overlay for the RZ/G3L SMARC EVK with ADV7535
+ * connected to DSI and LCDC enabled.
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
+	osc1: cec-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <12000000>;
+	};
+
+	dsi-to-hdmi-out {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			dsi_to_hdmi_con_out: endpoint {
+				remote-endpoint = <&adv7535_out>;
+			};
+		};
+	};
+};
+
+&dsi {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+			dsi_out: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&adv7535_in>;
+			};
+		};
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
+	adv7535: hdmi@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>;
+
+		interrupts-extended = <&pinctrl RZG3L_GPIO(K, 3) IRQ_TYPE_EDGE_FALLING>;
+		clocks = <&osc1>;
+		clock-names = "cec";
+		avdd-supply = <&reg_1p8v>;
+		dvdd-supply = <&reg_1p8v>;
+		pvdd-supply = <&reg_1p8v>;
+		a2vdd-supply = <&reg_1p8v>;
+		v3p3-supply = <&reg_3p3v>;
+		v1p2-supply = <&reg_1p8v>;
+
+		adi,dsi-lanes = <4>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7535_in: endpoint {
+					remote-endpoint = <&dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7535_out: endpoint {
+					remote-endpoint = <&dsi_to_hdmi_con_out>;
+				};
+			};
+		};
+	};
+};
-- 
2.43.0

