Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678182;
	b=PiNcV6jvWzsATWQzKDgKH5CPX27tuASFRDqULKLIfR0SXT9jTglwnWOsk9EiGyC12kN6
	 319zy+IgJR9vl9X97biTYU+V0uju5HVGntDV6f+HML4KJ8iSaUyH8bVXJ0tuLppwMoG/P
	 4CXkYMwdP5mUqkqAzc+/mcY520RqZnxiMcJyfzlxEsd0EIdNBeYWRMG0a7fsuixJyxE0F
	 WGjWNGz3dsld43mjV54TsSYPXJK80WWrGWbXdm/Vqh10pOXb5sYHgeAt+rysjbTpQ0sYS
	 bfMWDLLIOdmZGDtiQyyqmgbnamN61nmb5x+g2bnx8ww5bfg9343JqrRc1ztt40DaAGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=UxR1vV0a0gQBYDHK6NtA7PO5bZkmmtV5vXJv9zlPOvU=;
	b=QD72TAmfn0tzl/GkPuSl80/Mv/QBsO+7QM47RVS941Yb3n/jLos61FTanDlMTAGxad83
	 +vHlGCTXdniJ9NEi8lsHjvWA+awTvzeBrMND/hB6/Xt2nCtuQPaxrVH6QkQSad1V4tiTE
	 z6fMth/Bwl1lcxek2jXr4AfXCzEowMAQZUEnnE90WVa0bG69ZY3GkRcumFOXojuXqNKsz
	 BpFJegZQ7JnA9YmuJbOSj8dsAWMu5IUVIGExMW3NDjR0vAWfrdYj2xgWRbMeZfUso2Irl
	 Sx6vB402SkXJ5LwuBF8oT0XFTShN8zzQ1og5jsI5lJ0jx7f3VXJ6lgeX7SiZBFl60rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CIsMOfPh;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF84606A339
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAF84606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CIsMOfPh
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1433889f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678180; x=1793282980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UxR1vV0a0gQBYDHK6NtA7PO5bZkmmtV5vXJv9zlPOvU=;
        b=CIsMOfPhDCLPWTQWzUAPvJQb+twWZIQ9eqIFofDc7OfXzdZ45hhIv34kAIReYNnzGK
         NzYokkYokmtMW7ka+m15K3ucPtuWqRJXGQKc+f8pe3A6WIT77i3n27DT/sWQJFu3QFyd
         lmdl2Su6QGbT8eH4kYcOPbOAtcIHyJT7rzRWNcr3BcqT70jx1bSrDDEWukV+cdDZNGKX
         hG2Dc+86FGmWMJU0JMUMf5ZhbUEV2Qp67OB4vVPmmImBtbe/7i42jc43Zj0ONCJWemaV
         4TmWDeQXg7SKAzUivQGovGAg88fbjKG6n7GE8tWSZH89h5K71z8AzKd1KQGfl3sRYNYS
         GtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678180; x=1793282980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UxR1vV0a0gQBYDHK6NtA7PO5bZkmmtV5vXJv9zlPOvU=;
        b=RvYQ7aOtRvytcft+nfwhPANvj3C1Zn6A/2BBJLBB7q41HgCQCUgIRK57jS18lnvdPy
         +0FkiX9q0+dSl+fHciij+nKbKO+4hrNkZNvVxJJ8GUROqE+nm3wpjjO1RSs/ENzcQpo0
         pRv3BmmIAZG3li90S+B0XS0dBZhxvrxnPC1Zc9D4Fdnce8aO8x55CxxI8A8fiwkpIfrS
         EwLcwNsfcR48zor9+bPico8mme/FIx0M1cRY5Ldz/5cBByaZwE0aAX9FfdgLOAgRMNQb
         8NvZZ/mM3IEpA648kfc+zMQashANDWgMjqNq/+55Jed4LAmoNeF/8BylJKPovo0MMTMs
         gEhg==
X-Forwarded-Encrypted: i=1; AKwUvByZMOXjcxUuv9B8VT7RpxEXNuPxpNczsEzWIIbuaGPJl93A0Vn6A4mDnLzUm7LfP+ej0aGcQ4Yw258Y9rc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeuWkVQwj1vcNp/QfE3bX62g3yY/OlmV8VmczLBEEQP7CpC5CI
	VGAdrd35qEOONe61CKz46yEdly5XpnZqSqL/46lvYJX2CTgGbFGXTkq1
X-Gm-Gg: AYBFou0C8OXrXnss52KAoqYhZ18e/QuA4Rnp6MukFF95rbGQuVRV5QWUK1UB/ADonFf
	hrdcHlTmSM4RUSvsjNKiwJX25G7W2kE9e7Ho96khF2jYl3uQMBFcL157aq+AAiXwp29+TfQV3VP
	DgCkESaJqwgxeRqGoOMu3oqePIIu40vt3mzfuN0/aN3QWldVrGvBLp6CH1EZmNNV5nA+fpr1G9/
	IXbQhHp9PeDgYfpcGnG3/fJbUbzJavexaMVsWRDGyhvuTl0N64gjVivWiLejx28nGgHsEfA1tHi
	YeHsr5kEmWB8zp4zuW4YU7GJprXmWy3U4WqAPDEQGvdYJVQVM6BU6ZTr6smyqToZwtjGrsrP3IR
	My3Ba/idBHD16SOV9Kmzi2218kALWBNu4GF6pidZ6Pz3xi8wR248CKDNyHBiLR44nor2npPVEIm
	MlCvhaJ3EjRnOG9FIuoJCug7CskhJlldYuIB3cE5Z0/b2e1884nu/3mCcv+FwzdamIoCYMaSlRm
	nvTBiSNAty8JnDOORi5f+C5kXZnp3l6mtNWpfsUYsp4ycwUui3b4qtjJFDX+ZN/uf5dY3r/vO3X
	6L2VPcMg00Ayi92mOCtIMNFaUcZd8DXQqnOOSezV74gZRlh2zL5nCv0=
X-Received: by 2002:a05:6000:26c9:b0:48e:1299:663f with SMTP id ffacd0b85a97d-48e264f1802mr11901050f8f.56.1792678180098;
        Thu, 22 Oct 2026 07:09:40 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584e760sm12368150f8f.59.2026.10.22.07.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:09:39 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:09:33 +0200
Subject: [PATCH v2 1/5] arm64: dts: freescale: imx8mm-verdin: Share the
 UART_4 MCU overlay
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
Message-Id: <20261022-v1-imx95-overlays-v2-1-c769d6eb54fd@toradex.com>
References: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
In-Reply-To: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
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

Verdin UART_4 is the UART the module assigns to the Cortex-M4F core.
Other Toradex modules also assign one UART to their Cortex-M core, such
as Verdin and Aquila UART_4 and SMARC SER0 on i.MX95, but on a different
UART instance, so an overlay naming the instance cannot be shared.

Label the UART uart_mcu in the module device tree and turn the Verdin
iMX8M Mini overlay into imx-tdx-uart-mcu.dtso, which reserves the
labelled UART. The combined Verdin iMX8M Mini DTB keeps its name.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                     |  5 +++--
 arch/arm64/boot/dts/freescale/imx-tdx-uart-mcu.dtso        | 14 ++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso | 14 --------------
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi           |  2 +-
 4 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb5..a40bcbe4876d 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -107,6 +107,8 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-tqmlx2160a-mblx2160a-14-11-x.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-tqmlx2160a-mblx2160a-14-8-x.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-tqmlx2160a-mblx2160a-14-7-x.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx-tdx-uart-mcu.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-aster.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-eval-v3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-iris-v2.dtb
@@ -268,7 +270,6 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
@@ -298,7 +299,7 @@ imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-
 imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
 imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
-imx8mm-verdin-wifi-dev-uart4-mcu-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-uart4-mcu.dtbo
+imx8mm-verdin-wifi-dev-uart4-mcu-dtbs := imx8mm-verdin-wifi-dev.dtb imx-tdx-uart-mcu.dtbo
 imx8mm-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 
 imx8mm-tqma8mqml-mba8mx-lvds-g133han01-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx-tdx-uart-mcu.dtso b/arch/arm64/boot/dts/freescale/imx-tdx-uart-mcu.dtso
new file mode 100644
index 000000000000..001bc3286e8e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx-tdx-uart-mcu.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Reserve the UART that the module assigns to its Cortex-M core, labelled
+ * uart_mcu in the module device tree, so that Linux does not claim it.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&uart_mcu {
+	status = "reserved";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso
deleted file mode 100644
index 8dbecffe9e7b..000000000000
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso
+++ /dev/null
@@ -1,14 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
-/*
- * Copyright (c) Toradex
- *
- * Verdin iMX8M Mini UART_4 for Cortex-M4F
- */
-
-/dts-v1/;
-/plugin/;
-
-/* Verdin UART_4 */
-&uart4 {
-	status = "reserved";
-};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 4f64c5da8d15..1ac9d000d415 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -776,7 +776,7 @@ &uart3 {
  * Verdin UART_4
  * Resource allocated to M4 by default, must not be accessed from Cortex-A35 or you get an OOPS
  */
-&uart4 {
+uart_mcu: &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart4>;
 };

-- 
2.43.0

