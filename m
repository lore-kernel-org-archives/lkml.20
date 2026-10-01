Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6774D8D9B
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847658; cv=none; b=NzVimsr16Q5PS5wrL6aE8RuRp4zYnQ3bPtPrUIXchVGdKBvZazhqnvH+cNbQaNAhkTE+nCIw31y5zpGnFIOYCA8qTMK0bdb/eOwgin2OKh63ggl+Cod9jvQ1RyVJnW71F57PP19shqbkrofWF4BbkOrXZgsmIuytRpHcySzwwb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847658; c=relaxed/simple;
	bh=h9GvHYGN8kFsxWomTSL3+w0/DICIY9EnVyVSQNo487I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jeFn9TSEoxkvlexxm4PzGWhilJq99hi1wdRrOdfQK03LjOVMJlTg2JeVx4r/eJKALVSVpAqEXZSWklLz3Wr6GTWjbTxu96oVVO79FWsi/7oTnA1ep4TjEDziJZhxPQAwFHoU3un8P8lguTGkXy7ZG/hOBDw3oa6T6Lwsg5L+IVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gH+XbmRn; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gH+XbmRn"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffed768deso16243415e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790847652; x=1791452452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5cPn6AeauBdz/GNX46uIDkPBYty7pPt2F9eA6YyIANk=;
        b=gH+XbmRnW5/e4TKVQerr4pRIQ64HcgEOFQBwSVlOmnvsknYX73VFLY9k1D+q2pDXnZ
         dRe9ZKkkKiV5pudYu+nI7pNZrj0OSiS7zPD+VoekKTFXGya575DTIFoRfdU8aExW0UKp
         swSgCxiWc46Gmr7ZZsqX7VudaCUm2UH0MUisfPx0lEHGowiJFgGGhtzNMS36m19e6/37
         hIrQ41/5ED9fEAs0Ths0RBIKgKugkXvnKNhlme3rNH/3bcEy3dTqRXm/snZV/p5nAcSn
         51QjTlxgraoaw+JNyzijjsTBYxgJ5vfu1blznoVcTc4dSQFudkTueWEh7OC3QMrf4Zu/
         Jx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847652; x=1791452452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5cPn6AeauBdz/GNX46uIDkPBYty7pPt2F9eA6YyIANk=;
        b=GV9OFwLEVGfv6svWpJUzNAMACqONjZKGe5t81tpcV3AeYmFvXjrTtcy+m7ilCl/XhT
         5HhDmzp0yWWcHSBOQafBK2QTTObkezj0LUH9e4Vw2yhi43wb7ilBIHEv0QFAx/2yRtDt
         buXTiOjcAp/BFUGOF/Wj0RJazsFFG3XHRHgFpFmEMLZidsjfngvqHXuAVZNjkmwY/LFp
         Skb4HXwyf3PyAF/B8D2N7C6cK6MRHp2F2wGn7+bwsw+6iprHJPBC8FSb2YbbObpeE+em
         xO40knXsR5BmPeJzIYZXDDRPINLv/K3H9Fa2UflBVRJEviA/+C3jsIDut2K2pVVhZvcX
         n0Zg==
X-Forwarded-Encrypted: i=1; AKwUvBxCYVrwEnOBO6iEl+s9/4CF1x7y1kzmyxiMK3f7nPhfMZ9hGFhiSxB9qWnozQbevIVwkpU9MLwpsHmsJRU=@vger.kernel.org
X-Gm-Message-State: AFuF++nU4K6qgf0syvSTodUKhaJxWB/nRbEuCAKeDSV6y0Y9bO/BRoL3
	GdCbFTx8lFalDwYZvfjIZcp8ByFkWEILvMeG73ZcuIqT5E3XvScpO0m3mGapBQ==
X-Gm-Gg: AYBFou2C2rQEfF/Zh2KEZzJH1Mby3w5AtRpS4MB+S2wmcrEbZECpJPePO1HMTyVkbM2
	9UX9WbvnvKj2EnRo8veJzg80i5RBFkuYG/5oX8XLfG2M32U5lTwOvJitqnqtLZtXyy9cwD2FPTn
	T7qySL9moVZPb8+gJTiIraHwFq5owvpQ2wElgb9glS+SSFMZL9b1Yjx1hsvUeKeZmvleCm4ZnaF
	tdKyncIEYcLYNvw6bNVcV33KBiwkFhxhO7Xe/ZRa1yGfnsFwbseP7SaSLz4vdgM1V2j52aIcAFd
	9WId7ZLI500re1WUWRmK0DBwxZpIfHXpCo/3D/m4B/UVUyhcGxIXh6aStbBu6UBaQuKVTcTi1nF
	JjRLB7wrKv4hKhWQDpS/DF6ny3ow0rMdBmC2M98VuY+U2wwV8EGgVDC2cluyGdAfLoq16UuHK6w
	dq14iIeI376FjeUohHYm8WQE5EJw8PyR6eKzw4Vlb+7fCPbAq0UlmsXkkGXrZuyUWa3AXkf4USM
	sXo
X-Received: by 2002:a05:600c:4584:b0:49f:fc4f:9efb with SMTP id 5b1f17b1804b1-4a01eb0389bmr43622515e9.7.1790847652365;
        Thu, 01 Oct 2026 02:40:52 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:5563:a938:8fc:9dc5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0226201aasm38937725e9.6.2026.10.01.02.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:40:52 -0700 (PDT)
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
Subject: [PATCH v5 9/9] arm64: dts: renesas: Add LVDS overlay for RZ/G3L SMARC EVK with ITE6263
Date: Thu,  1 Oct 2026 10:40:24 +0100
Message-ID: <20261001094041.135697-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001094041.135697-1-biju.das.jz@bp.renesas.com>
References: <20261001094041.135697-1-biju.das.jz@bp.renesas.com>
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
v4->v5:
 * No change.
v3->v4:
 * Updated license header.
 * Dropped reg_1v8 and reg_3v3 nodes as they are redundant.
 * Renamed it6263 node name from it6263 to hdmi.
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/Makefile          |  3 +
 .../r9a08g046l48-smarc-lvds-ite6263.dtso      | 86 +++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index b9dad3f44ac0..05df4c642e4e 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -267,6 +267,9 @@ dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-dsi-adv7535.dtbo
 r9a08g046l48-smarc-dsi-adv7535-dtbs := r9a08g046l48-smarc.dtb r9a08g046l48-smarc-dsi-adv7535.dtbo
 dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-dsi-adv7535.dtb
+dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-lvds-ite6263.dtbo
+r9a08g046l48-smarc-lvds-ite6263-dtbs := r9a08g046l48-smarc.dtb r9a08g046l48-smarc-lvds-ite6263.dtbo
+dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-lvds-ite6263.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso
new file mode 100644
index 000000000000..3c64db8d22e9
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
+	it6263: hdmi@4c {
+		compatible = "ite,it6263";
+		reg = <0x4c>;
+		data-mapping = "vesa-24";
+		ivdd-supply = <&reg_1p8v>;
+		ovdd-supply = <&reg_3p3v>;
+		txavcc18-supply = <&reg_1p8v>;
+		txavcc33-supply = <&reg_3p3v>;
+		pvcc1-supply = <&reg_1p8v>;
+		pvcc2-supply = <&reg_1p8v>;
+		avcc-supply = <&reg_3p3v>;
+		anvdd-supply = <&reg_1p8v>;
+		apvdd-supply = <&reg_1p8v>;
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

