Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7878B3E3DB4
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408728; cv=none; b=Gt4ss4y0y6+sJ6N9ceUgi5IlzukB1b4J9NyCNRPzXW9QpuiDD2e0j1JpPA1xq8v4eXFrOGP56dd/7/0cvq7ZY87RRz9i82KZLNthjAxjpY9Bj4NI9rJuro2lWEnH8+z9bSizvPghqgHdzGEgaK5YVsPhPRWyhwZWAZmeFw9Zam0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408728; c=relaxed/simple;
	bh=zFQNhdUL4WPcv9nvazigfdpHJRQ5vHZMaw6uqlFCKZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nZPw/NmnLtMgxTTTbJEItJF8CZyQOx51vA4dk4VDwjsMAHBA0w4PZRbR1A698pDXnzgtfL7a1fRZNcj6pJkrdXt5PQ6ZlZBhvb2E8OIWBiEokmjPqcnBkM2M/2nVCGwAYGht90P/VDrjS/GlkkerlSpb6UFa7RqWJuMusMOMZGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAsH3J8r; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAsH3J8r"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1e2957d7eso10422065e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792408724; x=1793013524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJYLGc5QU3lpfwnSQm38v3uKx0dsa52E0YaGaSh3dSo=;
        b=FAsH3J8rFtT4WzxzGTRowPRoVg510d0JILoGdo2AYu0ww4rke9Phd3FhW2dUqYBRwJ
         O2aLMXbkJORlKE+PfelCti68/QbwtrQeVDPwdTAgvT16ppfHCvsOil/jMD88D2sRCQQF
         H6TeI8PsgbmpCaJPd02vAuTb3BvWcN1W8/LWZ+wkymFB21BWHbCCu6luubpF2A9D3WAy
         kpjR8kfUrHRKjid3rL4ypKdOkd0jM8UeGObLijjKvRM8PZ062DT0NKEvEKNReKzgKJXE
         cGgADHP3vwn9se7ux6/RxO3tJDOF5cyEI0Eg64tacX0yJi2/Rkr0+cw1jabYUKaMauGx
         Ac/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408724; x=1793013524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJYLGc5QU3lpfwnSQm38v3uKx0dsa52E0YaGaSh3dSo=;
        b=bCiwb/7bJEp4Ps5Yl2cxBjwqA2IwjZkqjhkMwtFQFrYGeDD4RLsXMtGGkXATWJJgc7
         lejsUBP58QKbNISGbpgfRa2YZMBLiZjZOo6u4kECvBr6WxDOQYNVn8zZ5ulucwoWGI2m
         GV53ASery1P7Ay6ltOgc9uxBsxoepYq5GEmNrVttAGLUDVisUkAHgkJ1U7PLr7scUUky
         amFGky+TxgigU3kvsZENxs49+cZOdSSE4vStw+taMJv4e9NIX5MM8x/lG1P38M9d4juT
         c3ytiAUwJMgboVO92xgOVgYB4vzPSoGvuILjbBykCcE35Iyjc0H1NESX4UjW/ZMntsR/
         0E+g==
X-Forwarded-Encrypted: i=1; AKwUvBzdtlIwdpdO1i1u0hfnuIXuZlFfT3ek1Z5VF5NQc4Ds3n+uHxqB0yHCf8kI+wAN3pSxXLJvfl+5yLPbR98=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYyypeprAThNvLuQ5glYdnmTcettEjzA/2nKb7/A4+iASq6/2r
	olXwaTXK23nz12IOsAqKXNRDASDoC53uKgYQU0EkbVFXgVu5Ht7kor/J
X-Gm-Gg: AYBFou0Xfpsvp290zDNGOG6DPWpEgw/mYFwavoKmvEQzUyFdduNo3Kw0fKDUGC/dFrT
	FRa5ObjGjysSF5RrhQsBx0P9Efs0tWtQBh9F38Sbi5HpNhsN8bgTLOG4Hf8zH47Tj1TpWTSO4H7
	rssSJa3SK2W+XUI1BmlPKhu6MvGQWRELLu/lb89WnEsIS+Lk1KL3X6drH0j1GakqUojAufIzLHp
	zjM+dKMPzj7QO1upLNz7FN713aRBS/YEK8GDCr4NdE/xjLErFdujnlSRrRYA90o0NA7Q2pZoZe1
	RLfKxzB4HQRDtRBDAfEcuF04bbqpfgCSNvzthH4NZefNTlng9rPzu73Fz4ofZC/csHh7ugHqtax
	isY9Jzqv1IG7r+LfdD/i9h3v06IbtndXyRHBelTIMSuk/fpZiv9wuZWTmnJizQnAya9T4Wm4Euu
	9Hml9r24HBiaaiXWV5jpXaESi8R/Lb1dS8g+Dkaf8aR9El2UYNBM/a2jq1oLLr93sF+X+8QPrk/
	6YjKeA0OsHDgYvcFMjI8JWQ62KQTU4zjnunkhpkS2iiU1ZO/8N8xjQBH3GyH/oGvWnz8Npmr8kB
	1VEHA1ZtyFg9IfWls3WDtg==
X-Received: by 2002:a05:600c:3b92:b0:4a1:acaa:9d4c with SMTP id 5b1f17b1804b1-4a1d76315fcmr190697755e9.25.1792408723519;
        Mon, 19 Oct 2026 04:18:43 -0700 (PDT)
Received: from [10.0.0.136] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e3ebb3aasm193183505e9.0.2026.10.19.04.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:18:43 -0700 (PDT)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Mon, 19 Oct 2026 13:18:31 +0200
Subject: [PATCH 2/5] ARM: dts: imx6dl-colibri: Add Toradex Capacitive Touch
 Display 7" Parallel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-colibri-imx6-overlays-v1-2-e4d028727382@toradex.com>
References: <20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com>
In-Reply-To: <20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4162;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=myClqR21JNubd0OB2mhh3+DPt2M98s4uE3+qZ2frpw8=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsi6+qc/6F/bmfCcZQVfJk5IePZU4r54OsPGNIPuf6d2p
 T7S/cq9rqOUhUGMi0FWTJEl44mqIJ9CiKwHR3MyzBxWJpAhDFycAjCReyIM/5TuX7M8cKc1nSOx
 n+dkZcXVIw+2aM3OzrHSnZw5X+QKKxPDf4++DRPMb6pVXhCy0F7fcpbjYpKTn0nRxwTRpSI3WHx
 P8QAA
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899

From: Antoine Gouby <antoine.gouby@toradex.com>

Add a device tree overlay for the Capacitive Touch Display 7" Parallel
on the Colibri iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHC 7" WVGA TFT Transmissive LCD
and the touch input is provided by an Atmel MaxTouch capacitive touch
controller.

The touch controller is connected to the Toradex 10-way Capacitive Touch
Interface connector available on Iris v2 and Aster carrier boards.

The touch interrupt and reset signals on SODIMM 107 and SODIMM 106 share
their pads with the WEIM nEXT_CS1 and nEXT_CS2 chip selects, disable
WEIM to avoid the pin conflict.

The overlay is also combined with the Colibri iMX6 V1.2 Iris v2 and
Aster carrier board device trees to provide ready-to-use DTBs.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 | 11 +++++++
 ...6dl-colibri-panel-cap-touch-7inch-parallel.dtso | 38 ++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 76e2ce85a4d3..7897d9dbdfac 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -80,6 +80,10 @@ imx6dl-colibri-v1.2-aster-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-hdmi.dtbo
 
+imx6dl-colibri-v1.2-aster-panel-cap-touch-7inch-parallel-dtbs := \
+	imx6dl-colibri-v1.2-aster.dtb \
+	imx6dl-colibri-panel-cap-touch-7inch-parallel.dtbo
+
 imx6dl-colibri-v1.2-eval-v3-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-hdmi.dtbo
@@ -92,6 +96,10 @@ imx6dl-colibri-v1.2-iris-v2-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-colibri-hdmi.dtbo
 
+imx6dl-colibri-v1.2-iris-v2-panel-cap-touch-7inch-parallel-dtbs := \
+	imx6dl-colibri-v1.2-iris-v2.dtb \
+	imx6dl-colibri-panel-cap-touch-7inch-parallel.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -132,14 +140,17 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-colibri-iris-hdmi.dtb \
 	imx6dl-colibri-iris-v2.dtb \
 	imx6dl-colibri-iris-v2-hdmi.dtb \
+	imx6dl-colibri-panel-cap-touch-7inch-parallel.dtbo \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-v1.2-aster-hdmi.dtb \
+	imx6dl-colibri-v1.2-aster-panel-cap-touch-7inch-parallel.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-v1.2-iris-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-colibri-v1.2-iris-v2-hdmi.dtb \
+	imx6dl-colibri-v1.2-iris-v2-panel-cap-touch-7inch-parallel.dtb \
 	imx6dl-cubox-i.dtb \
 	imx6dl-cubox-i-emmc-som-v15.dtb \
 	imx6dl-cubox-i-som-v15.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-cap-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-cap-touch-7inch-parallel.dtso
new file mode 100644
index 000000000000..13b4888e07db
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-cap-touch-7inch-parallel.dtso
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display and 10-way Capacitive Touch Interface connectors
+ * (as featured on Iris v2 and Aster v1.1 carrier boards).
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
+ * https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
+ * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-parallel
+ */
+
+/dts-v1/;
+/plugin/;
+
+&atmel_mxt_ts {
+	status = "okay";
+};
+
+&backlight {
+	status = "okay";
+};
+
+&lcd_display {
+	status = "okay";
+};
+
+&panel_dpi {
+	compatible = "logictechno,lt161010-2nhc";
+	power-supply = <&reg_module_3v3>;
+
+	status = "okay";
+};
+
+&weim {
+	status = "disabled";
+};

-- 
2.55.0

