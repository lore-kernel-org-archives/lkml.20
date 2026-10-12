Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339C4448380
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789950; cv=none; b=Mdd2nVVMzmos+Rt1yf++SY5zuPPMlaxoY2/wQ4p3cB+MXUh9ABiySuPJ3bOvJ1OEkfpmQGsccZrm6WyJNNTnFyR9IIkNd10k6HG+fQXyVUasS0KvajRWBEjdwgTEdYoecBr4ecoFIwwr5xWIgB86w4WmNU2o79yR9b7A8kKDrzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789950; c=relaxed/simple;
	bh=mvjdRzEphXMCTb3g7xXVWiYmQKB3zaxOriOJUT54Q2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e1eAwybNNmG2LVVgJ+6pwD3ME9Q2ifxCjCMWmWXZFjWUTp5wFE0K80Fp9QHXXdKN+mFOypHrfilWI9OVpwyTdCOe/WPPhH51x2P2vbPNO68dfP3YwMytWfY3Z8TdkDa/R0hn/2OgsktXnOgjshB2eVDnGjtqib8JN11AWATPhXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0fkxtvZ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0fkxtvZ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c5358fc28so1060554f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791789946; x=1792394746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVFgubLFwSlRx0dc28Lupwth5R3tDS9aeaXU7vAsa6I=;
        b=L0fkxtvZ4dXv+qaDPrwJnHKlK14oO80JTgrgwmMgwpqe4YC2Gq8tStSkLtRJmnba/I
         hj/8BjYefeaI8wPqGbq079LT/76lsiQ4yB/pHfM6OfUjvISadjH3FPV91AX7k0Q9ouCK
         I9Ba2mq5A79qdK3TTJFFNSuzxDImawGf3fIuiVU1GBU9byPQYR2RV+6yBNUfSc8My+1N
         iMAI6vXmELA2OgU+sV8nMMZ4Y1MGGk2CM/zURXFKXhvQ3O0mfuKyyrzWhT5l8+sGg/YF
         CDZzW5m6yIW3tHvVtj1kH8Jdx+tepFUMfnRV5AQ4ulKIMUW4qHHP0nyOcSDrqSFQEWb6
         9eCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789946; x=1792394746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GVFgubLFwSlRx0dc28Lupwth5R3tDS9aeaXU7vAsa6I=;
        b=P6RxOJf5IkhpAxMC+U4arlCQMLk+7GiPNq6BkLqV7txRdzfp4Z35rZUMzfhg1UebDD
         1k56MMDQ1vr+dS52wYG4sREjoBW9mDbvQUFboHXiux+ZdXOfNfTNHQi46i22Qh3xfs/h
         nzfDxgZY4T8Y/XS4WFhK3vcfKy5u6cUM+BWiCzu6q329kwmzPj4WnuesFcwlQiavOLpm
         3lwlXKEfzfHpnsZiaq7Wq3dTET+H+ghVmnFncQd7OV7TDzsLJa4ZXx/MyG+3rcp4gK8l
         +pHsoikPw+a0UH5Yk54PV91M/93MW/PFglPo0L1rUV9mCfDGJzsZYLXG84VFzA2GRGe+
         lEGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPHsBB6u+XivE6qq/x69nEAQcdGIz4WFaukOwdlaRhv8r/N3blE0i/x21LRdnIrvd4qLxYlWSP2rJwXjE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWX9GngvofGfneOf/P9wXyud5ks/YTxCMIXdhKOzQqL2a1Yq1s
	qBgbtxYH79yEDL5W27+yL2PjH8dWljzs0rdrSSjj+qH+a49QJWYhJGX0
X-Gm-Gg: AYBFou2p5xKW44YJnv8ieatwfdLVim1WYYmbiVqbd2hhfV/EXRRgLT17oyVlGLmX5+3
	EfL03fkQsKsOwJAjy646loG7j/sEkDq3NsaXNRA+2hPBQ/3vdc/tZXKZbBy+z3ihnoXbmz7eS0z
	mWnSU05Vn4LkG7qZnAaoM6MO8HSAn/S9wRayzOvkdRBuV8Ca8d0iX9DEhRE9m68esxPRG3HjZam
	ILwO5wg+upsxTMVX8PNUGb9vziAfWaEIZZMl5vQnMFk2fnaSoef8e2xAd0rDrFsLm1v5mgZtdf7
	cmmdNiMF862rGrnQIiTLOSSLHPCeDKKc6h0y6EWO+epPKe9XRw+FqKHYJt4SRLQoMdZ4LahsM6c
	CuOujVaaXYa1Mkr1tXxjT4A7tZBafGAECBic1okFeQZoYWQ0fIksYOcCv0g5wrAcqhUNcu+LF2s
	pc2J6ARnktLLFQba9GjLM7yGIBhsIhMnXWS+VRuTSg4gD67mxTIgtuv0eo/MBD8Uc0mYDHC7C9Q
	5f562SHaxD69YlKhLcWuW4ZEhFCEduVxz+90dADRtZzvT4v+x91qPunxyn7v65v
X-Received: by 2002:a5d:5f51:0:b0:487:b4a:3f54 with SMTP id ffacd0b85a97d-48dbaaec8f8mr15252003f8f.29.1791789946187;
        Mon, 12 Oct 2026 00:25:46 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aadf9bsm17523377f8f.29.2026.10.12.00.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:25:45 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Mon, 12 Oct 2026 04:25:25 -0300
Subject: [PATCH 3/3] ARM: dts: imx6q-apalis: Add VGA overlay
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-v1-apalis-imx6-enable-vga-v1-3-8905d8746504@toradex.com>
References: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
In-Reply-To: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791789940; l=3858;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=J15XFPQXwHwXqajYWDHAsZeClrpxiXPgtU/y11V0Fb8=;
 b=YNznv4USjYwddWq+/qaJHmbbnVovBRRKYP/qeKShQ1yQNEDDt04txudw7FbYWa1YbUcBfvhlF
 4c32Lwb0NINAXgbhaKdb/hcrLlgT4dfPwEKirLnrKQUQndhNJbVX9qv
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the VGA output available on the Apalis
Evaluation Board, which is driven from a parallel RGB interface passing
through a non-programmable video DAC to a VGA connector, without VESA
DDC I2C signals.

The overlay is also combined with the various Apalis Evaluation Board
device trees to provide ready-to-use DTBs.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 | 21 ++++++
 .../boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso    | 79 ++++++++++++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index c5caca92ea10..b5ad9172e1f4 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -59,6 +59,22 @@ dtb-$(CONFIG_SOC_IMX53) += \
 imx53-qsb-hdmi-dtbs := imx53-qsb.dtb imx53-qsb-hdmi.dtbo
 imx53-qsrb-hdmi-dtbs := imx53-qsrb.dtb imx53-qsb-hdmi.dtbo
 
+imx6q-apalis-eval-v1.2-vga-dtbs := \
+	imx6q-apalis-eval-v1.2.dtb \
+	imx6q-apalis-eval-vga.dtbo
+
+imx6q-apalis-eval-vga-dtbs := \
+	imx6q-apalis-eval.dtb \
+	imx6q-apalis-eval-vga.dtbo
+
+imx6q-apalis-v1.2-eval-v1.2-vga-dtbs := \
+	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx6q-apalis-eval-vga.dtbo
+
+imx6q-apalis-v1.2-eval-vga-dtbs := \
+	imx6q-apalis-v1.2-eval.dtb \
+	imx6q-apalis-eval-vga.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -184,11 +200,16 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-yapp4-ursa.dtb \
 	imx6q-apalis-eval.dtb \
 	imx6q-apalis-eval-v1.2.dtb \
+	imx6q-apalis-eval-v1.2-vga.dtb \
+	imx6q-apalis-eval-vga.dtb \
+	imx6q-apalis-eval-vga.dtbo \
 	imx6q-apalis-ixora.dtb \
 	imx6q-apalis-ixora-v1.1.dtb \
 	imx6q-apalis-ixora-v1.2.dtb \
 	imx6q-apalis-v1.2-eval.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx6q-apalis-v1.2-eval-v1.2-vga.dtb \
+	imx6q-apalis-v1.2-eval-vga.dtb \
 	imx6q-apalis-v1.2-ixora.dtb \
 	imx6q-apalis-v1.2-ixora-v1.1.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso
new file mode 100644
index 000000000000..a449ef9fbfaf
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * VGA output connected to a parallel RGB LCD interface through a
+ * non-programmable video DAC with a VGA connector.
+ *
+ * The VGA output is available on the Apalis Evaluation Board without VESA DDC
+ * I2C signals.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	disp1 {
+		compatible = "fsl,imx-parallel-display";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ipu2_vdac>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interface-pix-fmt = "rgb565";
+
+		port@0 {
+			reg = <0>;
+
+			vga_display_in: endpoint {
+				remote-endpoint = <&ipu2_di0_disp0>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			vga_display_out: endpoint {
+				remote-endpoint = <&vga_enc_in>;
+			};
+		};
+	};
+
+	vga-encoder {
+		compatible = "toradex,apalis-imx6-vga-dac";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				vga_enc_in: endpoint {
+					remote-endpoint = <&vga_display_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				vga_enc_out: endpoint {
+					remote-endpoint = <&vga_connector_in>;
+				};
+			};
+		};
+	};
+
+	vga-connector {
+		compatible = "vga-connector";
+
+		port {
+			vga_connector_in: endpoint {
+				remote-endpoint = <&vga_enc_out>;
+			};
+		};
+	};
+};
+
+&ipu2_di0_disp0 {
+	remote-endpoint = <&vga_display_in>;
+};

-- 
2.43.0

