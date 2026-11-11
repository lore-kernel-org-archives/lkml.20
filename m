Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423884;
	b=kYiydGy6n7/M8Wn/1w9onplTEejwBFQE/Ew18fduZsBHmSs0WAbGxDabg/fROhTXDMoL
	 qtWfggi11hq+rwf2EPtOPIUI/564kYw+zLFo3vjktjSmSIv262L51DG65tWjrBsj9TClC
	 c4DgUf8M4FahrT6Vid3EVFva1ChrnwZ4uTBiv/1KXML44fWI6yEqcBJYInbqyNONWqFsj
	 0Vf/u1h1bNSKd9aNR/AcL7o/ATKzyOru+u/7Cv0E3xbqQuA/jCHCJyC28PvkxFZK5SSoB
	 vXSDZ+VNZBYkg1vrbpFUUq13k0LfK6dO5od7ZNLJTzB7AmMdy1oQPEQwVsyCkZAg3bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=KDtNFM/ZDCjrMncXpMX0NZxcAvy/V+uo/92tpKVrQoo=;
	b=vo4t6Gg34oGvrykTPJ+0mMfD0wRekrKhrGjzR1ck4UrBr+2rOgIrCWCkADKhOvugMq4a
	 ES+mo7vB9JnKn65BpwjWqsYvlYBpf/E+0kWdPsUfaY7u43Cvys7MNk4NeGvFqfTczLjyS
	 V5UT/dTfWmPTncbAtwXhQ0XIhlZB/dbJ8s3PxZGUhN41yLKNL2fLRLlPydlJsFJ+I+AYR
	 NHiuLzAZEnnvP6YjiyCied7cHF72xm0mseaeqYh5F6wgyvjqQm9saCscT4+eqhJ2i1PLM
	 cVbNiORsPlayKlAuE8lsA7ry0OLSG88+n4fUp+e67OKhCCPx4607JdOlnn/JmZrAbMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=snBq0GT4;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8B6606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D8B6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=snBq0GT4
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso2603927a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423883; x=1795028683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KDtNFM/ZDCjrMncXpMX0NZxcAvy/V+uo/92tpKVrQoo=;
        b=snBq0GT4dtgQU9WrqAJdvaSUAC7nV68631xfBn+G00w96vY0n6+31rz0h1ZHpRYohu
         ZDBtHbvUNXLX5RMqQVQJfRwld7Rg4x05DIzXpnYrG3+oby8yfVVDbzZqasFJmDXOJkaA
         NV8sW5Dg1sgm4Br5UJCybE/CgajfCVPLn+bBgJS6tjmwbW0kUT4YcKhEZoyQdaz2fX9v
         Ogfg8h952FzuTl9/EThJ5luBoVsURr0Wvkewlys1bdJ6BONeop6PfE2E+eSnZwUvaiAz
         UGSjWqKcrg0f92y2tRt2lxlLCGp7ScVrK/c0W6sOvuFyjmSLu1f8SupQ0S26XcESGNL3
         nTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423883; x=1795028683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KDtNFM/ZDCjrMncXpMX0NZxcAvy/V+uo/92tpKVrQoo=;
        b=FMlO5xrMJqln9Scfa+AKCB1PSEu3GAu4mQTRhY4d52lhgU9uugbzu8+fMVih95L8yN
         8Jc86IguUqJ9UF1MoE5UcoSZgFPNpbKSDYLdZQ5q7Q5n4Vs476N70Agql44JxKUiFjPw
         wDBpq6CszASbRqC2EQfIkurV7LGO73N3h8hkncJ7y1Xd+xaMdAyzhyLTL5vjahK8e79Q
         5yS1IiLNoREj6lQv0s5NnMpNb92gbcXk2JAIPVQdyVU9UafJyDysn1hZYeh9eYCmMDyC
         T5FFA+iKPhyO04QNY5SPPhCRVK2NAxAVrXq1DBtigCM6tmLC1vAeAUkvGwBEzSkuI4Vc
         2eTA==
X-Forwarded-Encrypted: i=1; AL+hErHW5Ln11mE4EmMu1qiIKGdT9dThHQ0vb/WCI3+29tktwycuwR6/0jFrXzDPBIatJmKU4dPPOysHR4lgDJQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vCpDkK/PHj8POsETnB9lOZ+rDFUtH+vVIx+pfxT9t+Zt3pZ6t
	7w8C99Or6HOTOzWvSNpCuupbiA0lRxv8UHjd90WbTTrx8VpOLC4uSPVA
X-Gm-Gg: AYBFou3/LTOW63d/73rrkRf+7Oms1+mCkFA8LK8bdnx2FYeaCFKylEgpmJ90xHo5Tek
	e7Vg5KXOfo/H3ItfKF33XzCsrZ1In0FTBpnaNJqqup1DjoW50AeaYbQ9FUHoy7xHHsi0OlsYqHy
	YmY11YNuMVJf3toiOHmIljhxp6bgMiMXf7ZN0Mkhnwz53J1lL4BstAyoO8wBv8VSrnmRGAa3rIK
	0mr8ig1u+0Kj3A4s36KO5T9fokkNlYVwppkRCEouZCjZMK9FdB2l0+Kv3FWOXaYkMe0ECWmtRdY
	6O/R4QpCyalIvgMnNVq/0Qq13OwU4JM5qNIDPcwIDPVUW/WYW4/CsTg2akwro6Vwd6srPCGTyAS
	Lf4J5hwGS06szQNJ9Cty+97t2Ap5Ua+jUM1Q0wRW4Jf+N+N7jtRu1giNL3XBaITHVbFjmM57i5P
	AmLxoeFh8CxWtAs2TVDOTEaayb4w1XW5ua2N9rYMrPNAumfUOOOOIrABeBAG5Ku/VXPRFN21H7D
	/oItAowe40sPssnZqDFi+EtI3fcCHOfi5mhGyaUmg5tV8BJeTEyGfZiECuverZ1VnlHEO2I1KjE
	aBjGrgsNtAKi4i2r/IBOVmSvHzqL+bO1FqKw5+Vzv62xAZpPpoZ3VKU=
X-Received: by 2002:a17:90b:3b48:b0:3b0:9e42:b67c with SMTP id 98e67ed59e1d1-3b182f63031mr3037004a91.61.1794423882994;
        Wed, 11 Nov 2026 11:04:42 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm2727366a91.1.2026.11.11.11.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:04:42 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Wed, 11 Nov 2026 16:04:00 -0300
Subject: [PATCH v2 4/7] ARM: dts: imx6q-apalis: Add Toradex Capacitive
 Touch Display 7" Parallel
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-b4-v2-apalis-imx6-overlays-v2-4-8129b21634c7@toradex.com>
References: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
In-Reply-To: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-bsp@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794423849; l=3576;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=ZRG6uTVDCNpvd0EHx/INXE11uzseEG+H6P3n5N9dPRk=;
 b=gMm6Huj51U6J6pMlyymBdzIF5kciVOacCr9+30TMDp5J4q5dzRWiQvxRTBPUIsqOtODnGwOtg
 S4o3V/Mx2M4B0pBSn2y4caf+1wAwhzWVtRS/9A9nn3U12oI3nk3WFJH
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Capacitive Touch Display 7" Parallel
on the Apalis iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHC 7" WVGA TFT Transmissive LCD
and the touch input is provided by an Atmel MaxTouch capacitive touch
controller.

The touch controller is connected to the Toradex 10-way Capacitive Touch
Interface connector available on Ixora carrier board and Apalis
Evaluation Board.

The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
Board V1.2 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 |  6 ++++
 ...-apalis-tdx-panel-cap-touch-7inch-parallel.dtso | 34 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 3b69669b27129..d7f9b2b5bb493 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -168,6 +168,10 @@ imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 
+imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-7inch-parallel-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-tdx-panel-cap-touch-7inch-parallel.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -325,6 +329,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-ixora-v1.2.dtb \
 	imx6q-apalis-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtbo \
+	imx6q-apalis-tdx-panel-cap-touch-7inch-parallel.dtbo \
 	imx6q-apalis-v1.2-eval.dtb \
 	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
@@ -336,6 +341,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-10inch-lvds-v1.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-7inch-parallel.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-cap-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-cap-touch-7inch-parallel.dtso
new file mode 100644
index 0000000000000..f04516e3c5cfa
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-cap-touch-7inch-parallel.dtso
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display and 10-way Capacitive Touch Interface connectors
+ * (as featured on Ixora carrier board and Apalis Evaluation Board).
+ *
+ * https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
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
+	power-supply = <&reg_3v3_sw>;
+
+	status = "okay";
+};

-- 
2.43.0

