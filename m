Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378162;
	b=heQs6x4nMwktVQrtsmm8xyEvtuy8YNE/s3wk/VEk0GSFwSvujQJnnNZAYo17Kl1/hq72
	 o1I0ij6cbeU2ZnjdL4FBdAGT3utXM6TQ10Vha2P1Vj9zC5nkrMfLLdxmyCSIDODgNiDKd
	 tSONOJGBY9yH6zWrgTHhAy39AS4tTVFXq8CoFrPVzlUaDWYWNQ7KKofc7i3EU4XGAWzts
	 Z0i7dB8+PAxbQQLno+Na1emJymeu5dEzFSv8Uiez5K29dC1k6qGMjwFG3DDUAe1GcnN/1
	 LPF4N4ZxW/bfGcoqNkT2cD3YXw5C0CsZ+oA7sYiii/spxnnYXouCrOIO21BfY8NcDHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378162;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gUs/X1k3020XOzDHuwUgAfsc42+/e4lW6AF2roewp0A=;
	b=dRjXbz1DVUdalQlrHcXgp05FRycUdcFV7Uz+NmD3mUy3O9efkQsaXDBMUCPWmoeT5zCk
	 hSLYeVzykMZBxgv2x+/E5XrdwnL5cuSAm0Fu4L7xZ35xbMSAv0cWFyUT7EptVVOP1GJY/
	 z4mM+swI8NJSpqR/BBu40GWONsyK2oJR6nV6PdJVVqumT794xo9v2oek4I70g7Cr1hIHY
	 h2w5/VMQUBdnG5q4DU9G8LVVOLUf+Fhv87jKz/rkJKlKQFsWA3vepdHjzEZbctnrmZdud
	 CiFMWKpWiNmGKbbaWBvWiDGXFCnON8kfrYIlI2iUG7ojvz/7XbsxQTSi3aoss9h3mjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=gG00vMm1;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCE5606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FCE5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=gG00vMm1
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so9990835e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793378160; x=1793982960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUs/X1k3020XOzDHuwUgAfsc42+/e4lW6AF2roewp0A=;
        b=gG00vMm11F+7oWZc5zROjmaG+NajYhaJdFYxFLmYhLBMqAJpF0A7nX5JRQC6/KerNC
         YF1xDIlIh8pJwdqqdQeDkhHNmJ3BonH2TkPHpyo+4CVeQGNRtLr9pn1VHw+aW/AbkVek
         zXYFJfnH2pjikT11js5uosUFsXjAYo8a2JVvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378160; x=1793982960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gUs/X1k3020XOzDHuwUgAfsc42+/e4lW6AF2roewp0A=;
        b=Fos30wBiQ1nnirOU7OJ2oprqcEk4+iFmUudoVdaFUXzXhXlOK5oQ4v+mk6uXZGDKhE
         HW6Ed2EEn8RGAO21M8hMcqyFcCivDC2sfCIgwChHLV1Sk+SR8XgENRLhasaS6003dkaO
         59JHFdZMfQixV4XgV9OBWKNT6wUiMlRSy+s7OHxBTH9JVzNLlzKkzvYRm7QXic7FcmDc
         q6XXuIPh1uQVOkgaYgGqswBiJ2xWe4hevYAqejzhnJLNcL1WO3S0OmX/aLN0dcfKzZJZ
         rn+FpfbdA5SryH7XHVtlVljoaFr4DP53tt8VdydSWAJrD+FBze2o7EzTE3iXJzi3IhZc
         P17A==
X-Gm-Message-State: AFq9FYKsG14GB+vsyGTIyfu/CRgxqLpzsbVggxbpJMBxheFcM9Bz3xQc
	Kmv7E+JBftQIfn9H/JwTU3I7Md1cT/5LnDTXHYxZFEdPpZ2rEJ0kTlYgil3+P7Lo3nGb1zrJNvS
	7MN5G
X-Gm-Gg: AYBFou1jKqtP5QCwvvvyUz5JA4KCZP6NbgWzFS5K1FlnHi0L9cMSBuXdDg8POiRFACI
	ZLjCAJpn8ePdsIYplwzVhKk0To7/OwZtmitJID5SVLYiVdnxJBc9sN6BLqDZEtIxCTm9zhbyFKy
	WFYw413KavG2mPAv1aq88DcIZivKYsoqulgw6177tLVNaL2QSfttzhAbaiht4cKHoeCPqyr4Yn4
	hxequ/JOW01/cTbjbWlkjoVL37AcrkpZgOn3bwWsEiZWONfVlei7KvUuZ5TMAk+icQLxHAeOYU0
	gfTK7WKIhwqS0hSOPXnY2Gcy7jH4nJQqpwbAU5ilW0rQp7RweDoeUNkUNxJD1aw7715ywh/J4Ek
	LU17u1nJveBwlFE38Jt4Al6Bt7mbI/jMnx0J+mAygHO8yWaQvhKaeUXUmKtzWaLxSq48Dbn5pMZ
	gEL5Jxcd8mrQqGXhl7OCFrjyRJFg/WKbSzhZsvdI82XhvQpF9sjjZf5XE8IgYpXhARwtZACc/UF
	0r+OwTIsUU/idjfGxDMs7Sk4vLfKAeaODxT/jgQ9EdJif7AJhv2k1kMo1zLjv5GMdwxkZPw4Jv4
	lls5XjKiaoplip/Z6ExHW3CdXbty6EDKrQ7PkjlMcGsAcn8fuREku+unyB2AnFot/3omI9Pp1OG
	AMWg+3agChDRI6A+zj4ISDLlWKAdbUnxG2oQkocT6Tw3Sy7EcQSAy521KqqGJyjjNbVaxkZwZh4
	qLBR/rj/ziVMRNySXvTklvkFvGaw==
X-Received: by 2002:a05:600c:46ce:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4ac189928e9mr64953775e9.29.1793378160492;
        Fri, 30 Oct 2026 09:36:00 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723fcsm4084806f8f.14.2026.10.30.09.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:36:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/5] arm64: dts: freescale: add Engicam C.TOUCH 2.0 LVDS display overlay
Date: Fri, 30 Oct 2026 17:35:44 +0100
Message-ID: <20261030163547.2682583-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
References: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
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

Add an overlay for the C.TOUCH 2.0 carrier board fitted with the
AM-1280800W8TZQW-T00H 10.1" 1280x800 LVDS panel (C.TOUCH 2.0 10.1"
Open Frame). Its touchscreen is connected over USB, so there is no
touchscreen node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm64/boot/dts/freescale/Makefile        |  7 +++
 ...ctouch2-overlay-am-1280800w8tzqw-t00h.dtso | 53 +++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index bf324cdec879..a3dce3310fac 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -656,6 +656,13 @@ DTC_FLAGS_imx8mp-hummingboard-ripple := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-ripple.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-fe-ctouch2.dtb
+
+imx8mp-icore-mx8mp-fe-ctouch2-overlay-am-1280800w8tzqw-t00h-dtbs := \
+	imx8mp-icore-mx8mp-fe-ctouch2.dtb \
+	imx8mp-icore-mx8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtbo \
+	imx8mp-icore-mx8mp-fe-ctouch2-overlay-am-1280800w8tzqw-t00h.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-iota2-lumpy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-bl-osm-s.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtso b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtso
new file mode 100644
index 000000000000..d5a5eb96101d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtso
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
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
+#include <dt-bindings/clock/imx8mp-clock.h>
+
+&{/} {
+	panel-lvds {
+		compatible = "ampire,am-1280800w8tzqw-t00h";
+		backlight = <&backlight>;
+		power-supply = <&reg_3v3>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
+			  <&clk IMX8MP_VIDEO_PLL1>;
+	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
+	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 2 * 7 */
+	assigned-clock-rates = <0>, <1013600000>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+};
-- 
2.43.0

