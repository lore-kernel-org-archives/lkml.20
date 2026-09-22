Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2B83254A8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087653; cv=none; b=ZqkRT7stWzCUq2iPfDk9xfeGGNtnDPgEjliemPuv81XogI9wkriyYoTx9kd/WNObaAS9PItb06sICCui9RshLNtrsgTu5lPy/kxFGV+KeRq4+cyyQvVi8u+F5o5bWf5kI+5rXQPY2TzvludmnmIxvQWAXCxBBAVecr3T9JC94V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087653; c=relaxed/simple;
	bh=V8m5/G0gsUE3E0r8Gud6pXvk5HrB0GOT32fRWrpmLec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k8nzmv3O0e4FJfow+UmHtjtUJRbM17bkR+HQxMhb1IL2liKQcwxbpkNSXKw1ZDADY6jy6vjARg0Jr8QZzbYX3JNkNDje98m1bPJj3z0I4SVnv3Ci+XuJglN7bi/CTI+dQ2V98h8j4eljHS5bAWSqrK3Bs4X53KAOCXpzGGe2baU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ib88Ugkd; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ib88Ugkd"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c254f9f7db0so512741566b.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087648; x=1790692448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o4lRt2va1gWTtMW/M8nVRxRv+uN2TcEpeTG/w57BdiI=;
        b=ib88Ugkdr2ZbGk6Fsb/wcyb/2yBSXG/lXkI/2JdCSt+7XXpewqltoogK7kF1+tkUso
         svK8fqO6VKiPQ9Z7ivRPz+FracUn9QgZqRv/Fh9DUd5rRTdaiVLmrbVp7nGnTxLP6ahe
         uP1LMq1ub6VIWKjOU+BazwT7lygHbn3ohPYt+YoZR4cf6ivNJTUp4Hl+RY1Yr/11irPi
         5RPt7ujxLNPTg7pHvyc4hDc8MrdVaavqXlGNjZqnajQrJQvpDPTrxWdu2paPuHAoC/7t
         39eAsvYqHMyKo8sgImikGsjWyjlcO3iSdNJUv1g/4mDvI6quwfOAWCtS08kkrVIzV0BM
         ji7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087648; x=1790692448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o4lRt2va1gWTtMW/M8nVRxRv+uN2TcEpeTG/w57BdiI=;
        b=XkaWwJV02tRY4YsQ98LDA4d1gSLr8gc2YPoFi5x7J6b0egU7xGTv0NRo5uUY/WMYo/
         4UzdbBiOTNBfdUwS9EyqHgdkhsi4Qxq4jnQ0NgVWXFz28RFkWbi3N39INAQB/B9VPrtF
         b6PoEm7yugZcl3iHboWO3ljrHyhL1FXBakAgsaazpMoJgQ4hGZG0lJJxo9Dih7CSGFYw
         vSzLMz2EobDtIBCQqd/Eb4wlcb7Z5aHcmbfdrV+rQrS8+NK7ywJYBhvTjdQdp4ChT7HV
         1GMRzeWzVp+q8PAQt/Se7WCfYdsuBFBEn50123+35WQUtb0ZHAvrUsPCfxYQ2roUJlcR
         TCMg==
X-Forwarded-Encrypted: i=1; AKwUvBxcRQheHZD06HnjwonvusGiG/NDDNykyFLga61Y4uDsZIpdv/Wg4MVHgWYZNgYf+mQ7kki+X0Z0EzZkUbY=@vger.kernel.org
X-Gm-Message-State: AFuF++lw5Axh+zp99FPCOWjYnbISgpgtK8erqOgy66b1cA2ejzESKa9V
	+TSIGY+PQoOrYqJOuYOMENLwQvTQ4sftICQqing/VmIFBvwZPSSfOU/d
X-Gm-Gg: AYBFou0VbRLbLma9BHqcHPRLLLONLz2IADPVsN0Mc8B9J9N0zzaA/rx5kuUrQyA1tyD
	sWlqxl3nbq56IVSrJ9DLtehRBfC/V8q08lc6E5Bd/PH0OFo2q74K3wRfULbZb5DQW6h5K42+DQl
	POZ3o4ut9l+QEnL1BIwciEH1KXjYYg8d7yGfBJPVbwBofslDQF/diiPMqNzXvH21qm/hS/hWO30
	wW68mp20vq92EBA2UB0vAYyCY1vnET6RE+wM6CP+ycyTiZvhExAKaK9b3JFr3tPyTOkq68t5ljv
	477olWR83dlGxfaNspPbNPsYW71fqRpafruwQwLXyQZ+jyN6JWk84iBvXKlfuX1VRIv4cUy8ivn
	H3A6zpWGWZ/JtDrQxSCcsoOm5pn3DAZ4tpxQC/SeYDLKW88nYqYCCdtNB+pXG+MOM5a0PBebb9n
	ohLYtJ6bGKFSXhftEftxPi0FiYVxZ8fYLl3E+tEkoXTTBtLUABQJ4LwBWfCVIaZaYnjfaXCsqb6
	/Ap6Zft1hdrIr+MpheoJ9XFMf/Aw+Nv0KXAZ9UsDH8cZNpCQ552Lji/GpLLaGpbkMsyNMdH0Q==
X-Received: by 2002:a17:906:ef02:b0:c26:19de:9aec with SMTP id a640c23a62f3a-c2a15877713mr1237309166b.43.1790087648344;
        Tue, 22 Sep 2026 07:34:08 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5814e2sm103469966b.27.2026.09.22.07.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:34:07 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 22 Sep 2026 16:33:49 +0200
Subject: [PATCH 4/4] arm64: dts: freescale: imx95-toradex-smarc: Add
 Cortex-M7 SER0 overlay
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-v1-imx95-overlays-v1-4-694100afb4bc@toradex.com>
References: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
In-Reply-To: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

SMARC SER0 can be assigned to Cortex-M7 firmware. Add an overlay that
reserves LPUART2 so Linux does not claim the port. On the Development
Board this removes the Linux RS485 port on SER0, while the console on
SER1 (LPUART1) remains available. Firmware must configure the UART and
its pads for the intended MCU application.

The overlay is also combined with the Toradex SMARC iMX95 Development
Board device tree to provide a ready-to-use DTB.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                     |  4 ++++
 .../boot/dts/freescale/imx95-toradex-smarc-ser0-mcu.dtso   | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index b17fd5b067de..489da1fb0012 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -957,7 +957,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-clover.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-uart4-mcu.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev-ser0-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-ser0-mcu.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596la-mba95xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-var-dart-sonata.dtb
@@ -980,6 +982,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
 imx95-aquila-dev-uart4-mcu-dtbs := imx95-aquila-dev.dtb imx95-aquila-uart4-mcu.dtbo
 
+imx95-toradex-smarc-dev-ser0-mcu-dtbs := imx95-toradex-smarc-dev.dtb imx95-toradex-smarc-ser0-mcu.dtbo
+
 imx95-verdin-wifi-dev-nau8822-btl-dtbs := imx95-verdin-wifi-dev.dtb imx95-verdin-dev-nau8822-btl.dtbo
 imx95-verdin-wifi-dev-uart4-mcu-dtbs := imx95-verdin-wifi-dev.dtb imx95-verdin-uart4-mcu.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-ser0-mcu.dtso b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-ser0-mcu.dtso
new file mode 100644
index 000000000000..cbc58f1af41d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-ser0-mcu.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex SMARC iMX95 SER0 for Cortex-M7
+ */
+
+/dts-v1/;
+/plugin/;
+
+/* SMARC SER0 */
+&lpuart2 {
+	status = "reserved";
+};

-- 
2.43.0

