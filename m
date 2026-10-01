Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE7D4519A6
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870076; cv=none; b=aD/w4vsF2eaFHP9vD5oXYoO9+BVyh5M3JM1nTsMifoqzlkAFxCokMQjaNcGncbGHXdyTsjrOGcNWuyzHX0eP/NSsn4Kgv8OBmeYg1g6cDRMqBLoDX3oyVj4Vbse60TNRv3fnMLl+VntjY/nSI2mh+fXqqNK1Ikp5gukKfvU6YHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870076; c=relaxed/simple;
	bh=ezdc2eXx+yuZWZufbn3+r0w/2tqaSbs3K97a+T2XLdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l4KUa+RSXb/SxQ5/vx6gp3H8KBLkh27ny/1pDSWIQB1oe/enxrM89Go4f5lzBcoGb2t5AnvnSbEg4b8NI9YDgeBopTeH8tXMft/KxTx3yZeqdvtqC6PEXhJf0GT5jNjwklDeZ7HJ1HYVWQGKYXyTU1g3opZw+eNLLaEHiXgBl0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sg0kSm5Y; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sg0kSm5Y"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48870973bddso304139f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870071; x=1791474871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DWEN958qzdMHbLCQjYOa4dCZMqLVicSMtaPk1knnWCI=;
        b=Sg0kSm5YZZVrJha+bllEHem8cNcNFJBY9G1+xmWs0GK1OgC2Hsk5ZnlFiq20v4qABo
         Q1PJbWxqgKs36rpaptYbHHSwfpF7KDT04m7eD4hmQPqm9Aw+CLn3NYxrsNKOis5VsWJl
         CSne8trqX/DN+q9X1q1Y2meqWkIqgx2FV3zFhP7e5LrUG8aoETm1IRZxXAAkwPVGIoYM
         H+IAKR/A1SZVC+UWQVxP406TO/2bNUEaLRnluAk7Uuhoktp+FNaH7SiDQ3fRG1X1E2fM
         vvx7L6DblPrKm/Kjb+sXBoxyzrruxgMklQJSo2mroUAfOgrmaZyMbAONTWI34RWJcRrB
         qfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870071; x=1791474871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DWEN958qzdMHbLCQjYOa4dCZMqLVicSMtaPk1knnWCI=;
        b=Zsz3CPTzuIcHchTPRBhgGljrqTfOUQ3j7jeXzQDcILehX95emM/RvyKsU9c9gd0MAb
         K1cQ7pYcThpBV2FUu9h90UN8ilpQbSbmwgz9bgwdYQCwDu4n1aaCcCmdW3cD1hRpmUwe
         zIPrHN5Zfr7HZA1nl/MYjn6M3TNt1No69skvwN3/9x1SqXzI8TeyQQOPiYyqjd1y+cEH
         ghfWjQucRnTzDkD7VeBRrFRX76ZwYeO8K62efWDxd2N/tLcG/GkPrODJbJ38JpiShEV9
         LgxONP2q1593JfXPoUnCjEt3kZ4WiQ/WAgEk9Pw8BfJwRqYNPkNEVCgG7iTEPmig7WxO
         ZXcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCVHF9EdB1Y9wNFWhseH/DSy60JbBJDIdC28Wtg02AeOv9Fp9X9oAiyf0Z7Fo5OifCwpOL6p8AwmOYLrE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuCfNuexZX0tcUQM3xdp0/ike7GtGnqeCvRqmlySPyv4cz7ZT/
	lpapkvXM0rUAYpKgWVyqutDy4ino5QN36FWMkEiwPxqWbpGQpM2aXkfd
X-Gm-Gg: AYBFou03K98EKgJT1iJlBtxBuOupD2j4DLPNalR7XtX+vQSirhhsh+w7tSB0M+kmaYH
	zp58QeiGB4f+l0cBZKSlurQO2+WKBBMsA+SEur86vtDRKJjU4+uR5LzpT3rjUmG7v0O8PH5Rcfp
	na6uMhPekFXLG7bETImtP0Etp7GBovoDtkAQO+SgxD14vaVcUViTO2QSgDPa0jEklc3ZI7ZPpwC
	Nioz6hNVYhsUQqOpEXiI8lWnxhFr8d8dGkkNd7lQCz8RfBCsB4liskEfKOWN/pOQ8VkfURGBI0z
	MhgpwkOcqeT70Y0Fqxl6xf5v+/29ed6dricxurpLUr9AoA4Q/X0G9wDom7JHmP9TKI24fXgEMwr
	wdlI/kSGKnTQ4Zlv4CCoYxJEwxUgdWlnxrz3xniwXJc2asVfuHCJuT+5wmErM8oEs6lDZ8s6ici
	Oy3kPt9BdCX/PVAhipIlOWgp0S0W9fOs2r7Ul4WroB3p77+tv/yovuY+JU49GboLhdKq+iSf7WD
	KPBtHxM7lxq9bli/1ibracKRJvywy61n5wKQ2SYA8qFfN69sTPpIcI7APVzl7YS/A==
X-Received: by 2002:a5d:54cd:0:b0:487:1577:9e33 with SMTP id ffacd0b85a97d-48b068bf670mr5217869f8f.25.1790870070993;
        Thu, 01 Oct 2026 08:54:30 -0700 (PDT)
Received: from leonardoc-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff6eesm6517294f8f.11.2026.10.01.08.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:54:30 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	leonardo.costa@toradex.com,
	hvilleneuve@dimonoff.com,
	marex@nabladev.com,
	stefano.r@variscite.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch Display 7" Parallel
Date: Thu,  1 Oct 2026 12:52:54 -0300
Message-ID: <20261001155412.3177428-5-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001155412.3177428-1-leoreis.costa@gmail.com>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
 arch/arm/boot/dts/nxp/imx/Makefile            |  6 ++++
 ...apalis-panel-cap-touch-7inch-parallel.dtso | 34 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-7inch-parallel.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 23fcc80d7f309..5f35771cc3626 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -103,6 +103,10 @@ imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-10inch-lvds-dtbs := \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-panel-cap-touch-10inch-lvds.dtbo
 
+imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-7inch-parallel-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-panel-cap-touch-7inch-parallel.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -238,6 +242,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-ixora-v1.2.dtb \
 	imx6q-apalis-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-panel-cap-touch-10inch-lvds.dtbo \
+	imx6q-apalis-panel-cap-touch-7inch-parallel.dtbo \
 	imx6q-apalis-v1.2-eval.dtb \
 	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
@@ -249,6 +254,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-10inch-lvds.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-7inch-parallel.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-7inch-parallel.dtso
new file mode 100644
index 0000000000000..f04516e3c5cfa
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-7inch-parallel.dtso
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
