Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E7C4E3254
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408732; cv=none; b=Y2zrhilPbV9VBl2xNvcNhaXH35/MXS5bfE0a6XWZOm9vhe3ubRjAOgY4A0+Yg2P69IPG8eyqPIgJXShtX85B//Qmbmf4qV7apMxyvcjWwjMD6UnKhYZXT4NfnrhRK6umxGW+hdg5AlsKsEWJuH+NVVOKI0jKQbukYuNDKP+STwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408732; c=relaxed/simple;
	bh=mhxLCTPjVQZv2OtRsJyKUu3/MGnO5VTuhQw6MyljM28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bihB+zGCgaacTfpJRlqny51xZ1mPw+i1jjQBAPuNF8Ux9sxcuMfte1lQBw9bGfPA6rQoeBANu/O3/AWGr8Ip/kdzGn97pxmeUXGRgnaxVERyRPJ1UE2/WfQVlxiDqsPbvpVz10LSGvvCQfl6ASQ2e6MX1UKtMOpB8t/NrWKkm1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3WldgqG; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3WldgqG"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48afbd2c386so945935f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792408725; x=1793013525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ADWQiUiXmhFxdxGNtaNp4L2f/HRKA6KEJjR+eWf0vVM=;
        b=a3WldgqGFfraGc5x3lmUaokHskplTVWL+Y8hD0E9CkOSJ/X54Hg0ZDQ+3cU6rj7zXN
         gQTAAY4RgwLMogBwHXonB1K+cnKuvTjqHegKkPfiENJ2hW1kmH9d2lfwn69wAeCoGVif
         4tuYKpVXyn7NZARU2tc6raRJXwKv0O4k6rjhGqC5oXJ7Zhe4a6jMnT91UB/1kcZyZFrc
         WpNuSmzN6ISpSlGErM/S9cRv8FgdJ7HLDdXzB9kL1CjA1a+bpJpp1IgBU+m0ftWHlY9O
         bLnBoi24c6sl2K7ddBlB9cKvhNBz6h41RxVO13NCKO9gXJ1VuayDmO1/GpTMW31/aASQ
         txeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408725; x=1793013525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ADWQiUiXmhFxdxGNtaNp4L2f/HRKA6KEJjR+eWf0vVM=;
        b=jXt2LXihy9nsFFJPTSpEZTr5eqGDBR6i9tk56/tQeUqJlyMSRB8QV8irnM6uRzg/sw
         c3BElxRqfKZUcAFF8PEEKBSRY6RhvzkVn9Y/KlEUZ9AUJv8sdnUr/HjTbSNpJawaUOef
         FCICHnJYk5q6JUJtmvCl5c5bri8Wxv9q+30EDxfpnf3qWEV0VqaORDJHcYEaOezhCMLU
         eTDOI0eQLFHy6779vS6D9UOkBsRoTiBl4+T8OreIFdlLrX/A957lcK2KXR062PwHpx6C
         qsZNstY4GdktXH1FdIJw3mPgmQL8ITVGNEuzjwTiyMF+apWWAXycF/rc/ZaHDVc37dvP
         NFqg==
X-Forwarded-Encrypted: i=1; AKwUvBzalJgbzHa+DyCNtLoyU+Qu4CPU+QKtN/yMPFkDwRKafrP+1G/bDWXFhyMXSrOJEvlZDEDcyLteaTUJ0SI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiQqFCPiRrPB/X0pXlGzqxazeLXI4AC4W9x9iURG0+N8HrWcIt
	BPx8vmnuSGQ7S66XKbqgOQHjZtpXhOkZhhcQiUq8uckObb2eJyp2F0y+
X-Gm-Gg: AYBFou1b+O/6gENUi1JzPcMzbxNXLJ/YV3Wru+30yskfo+e3l1qHL7dG9A9Twj2wP5Q
	XZekLzS2Q9VkdoOZd71vR80NuIM8UOrg88bMOg8tI71hBdkiG2qrXaAqdh0MXr7QCsz6eSDr1ZF
	qb1EqJ6Usz3L9rLRsvIcvvnplBduDcEB8UTtbRTChfiuWnTooJc2zAk1iH7FRavGz4LAlJj2GjJ
	0VMruXDGUZbvcrH3dBLYhgiV0TKRlR3DgBUGDtexAsoFIzeuSHktkXFRqdQY4yOQGKZU98XSGY6
	PEaWu/JyEFikvGKH9UszztRdeQq3JVSlXCENzkFTGxFJPmHApjahnoG7WI37YvJdvUpUn/ka8z2
	Xo3/a1Jr97HPAuS8VtglRkTSaBuSTGY8f29sSKQdCc5QcqgN6R3UvyJ3VYtcXiCPd2uBnZUM/Et
	kv3WhOXsmqvi/iqSrhYlYzdfnDfnShoJWNHmYI8n3eCNmjG9kbL34uQAbd+4fzCyw5/PfOWXpAT
	LXR924w1E8RE4U15ZdiKR9asOAxF0D4d2/3ulgz71VVzPmSYKE3pcc+/eUFZQU4cBXs6aKpah/j
	a06Agg0BU8q/RZzXvS7s/jyfuk1nr9wl
X-Received: by 2002:a05:600c:858c:b0:4a1:d957:733e with SMTP id 5b1f17b1804b1-4a1d95773ccmr99705095e9.26.1792408725266;
        Mon, 19 Oct 2026 04:18:45 -0700 (PDT)
Received: from [10.0.0.136] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e3ebb3aasm193183505e9.0.2026.10.19.04.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:18:44 -0700 (PDT)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Mon, 19 Oct 2026 13:18:33 +0200
Subject: [PATCH 4/5] ARM: dts: imx6dl-colibri: Add Toradex Resistive Touch
 Display 7" Parallel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-colibri-imx6-overlays-v1-4-e4d028727382@toradex.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3261;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=3yhzmAkS0sm6Z89eEvnHRy31Jkz9wloR2qd4ecuJsYo=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsi6+qe/r05eak5Xb/exYr29f+X5FfZ4G3D/2f5hgRefa
 sW8zA82HaUsDGJcDLJiiiwZT1QF+RRCZD04mpNh5rAygQxh4OIUgIkwRTP8M37288i/Pm6tg5eN
 VBZ6Mrlvmv3xrG/vRfbQ1jsRsTwZrYwMd/LMd85bqCL69jzn710vFGafP3zISMVverOM+IqdUcp
 /2AA=
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899

From: Antoine Gouby <antoine.gouby@toradex.com>

Add a device tree overlay for the Resistive Touch Display 7" Parallel
on the Colibri iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHR 7" WVGA TFT Transmissive LCD
with a resistive touch, handled by the touch controller on the module.

The overlay is also combined with the Colibri iMX6 V1.2 Evaluation
Board v3 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 |  6 +++++
 ...6dl-colibri-panel-res-touch-7inch-parallel.dtso | 29 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 4f59ef0855cb..1ea51b13ab7c 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -92,6 +92,10 @@ imx6dl-colibri-v1.2-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter-dtbs :=
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-panel-cap-touch-7inch-parallel-touch-adapter.dtbo
 
+imx6dl-colibri-v1.2-eval-v3-panel-res-touch-7inch-parallel-dtbs := \
+	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx6dl-colibri-panel-res-touch-7inch-parallel.dtbo
+
 imx6dl-colibri-v1.2-iris-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-hdmi.dtbo
@@ -146,12 +150,14 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-colibri-iris-v2-hdmi.dtb \
 	imx6dl-colibri-panel-cap-touch-7inch-parallel.dtbo \
 	imx6dl-colibri-panel-cap-touch-7inch-parallel-touch-adapter.dtbo \
+	imx6dl-colibri-panel-res-touch-7inch-parallel.dtbo \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-v1.2-aster-hdmi.dtb \
 	imx6dl-colibri-v1.2-aster-panel-cap-touch-7inch-parallel.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
 	imx6dl-colibri-v1.2-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
+	imx6dl-colibri-v1.2-eval-v3-panel-res-touch-7inch-parallel.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-v1.2-iris-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-res-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-res-touch-7inch-parallel.dtso
new file mode 100644
index 000000000000..331c81332081
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-res-touch-7inch-parallel.dtso
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Resistive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display connector.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
+ * https://docs.toradex.com/104498-7-inch-parallel-resistive-touch-display-800x480.pdf
+ * https://www.toradex.com/accessories/resistive-touch-display
+ */
+
+/dts-v1/;
+/plugin/;
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
+	compatible = "logictechno,lt161010-2nhr";
+	power-supply = <&reg_module_3v3>;
+
+	status = "okay";
+};

-- 
2.55.0

