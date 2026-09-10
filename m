Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEEC4AB1A6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054690; cv=none; b=GlJl9LqyxBg/2HfFU/oYSJAwloDkGBMTxhdxMwR5e8xnHPNGfnTRcBnlbXW3FgZqIrbgte06+jO9kOHS9J0JoaO4xs7d7GiR5DeAvAfCoUvshXl+9zFWf+gopOFmdd1yynXXuW4JLRTKdNo8otkz3lc+Jt4nzlUYXfd0BcSy7uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054690; c=relaxed/simple;
	bh=gzh2q+u58cFhgRp7gV46O/Wa8UfTHXxr/Xs3h1IWYJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LHi6Cez9I6VtNnRX+CyFbmhTO5zyMZEri61/oK1hkZQDJQRvtD5z1MB7nl6rtsRZHzde1Gj5X/HIaLKaHEsVuVwoohWsIYAmey2VKneqUdrLp0mZr0AUk8w4RQYKVE2BDem9Eqc/9+oieo/+rR+QOl0/4chV0B4bmN0IQhu4p68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GpaWFmLR; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GpaWFmLR"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-486955ae01eso1587971f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789054686; x=1789659486; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NaPp8HoKKF6sxkd9LUTX+PGTrCWY5tm9shIAUpEtxY0=;
        b=GpaWFmLRfml43eTWIA+4qwYRB6iI0H2D37ckVk485xPhCWHSyuegORMgn38reDkbNm
         Gcgo2UVcboyKR/LS1f18PhaU+rkT/hKW5lut+1HnDbH0vCOzyWO05w3440qSx4XMFQ9x
         ga8p0jYtTm4bgo6zh0anc1/KITsh1CNLQZ6t/GRDsAaZ0X9Nm67CuFTfUwdIV7tstfpv
         hAM8dTIYluJuyjxiJqZXOwrMiHN4QRl0Sj6FuObR0Bg/WekbSlI8OK1bXqoLaQoZrnj9
         Ii7g36dp3gn1EKkulKwn0KEcsjPnIB1SudvWQ3itG9eGBRPxnugrsbFOYHDH787o/LnV
         RcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054686; x=1789659486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NaPp8HoKKF6sxkd9LUTX+PGTrCWY5tm9shIAUpEtxY0=;
        b=mv97eytsIakR4weLLOxSNCegyXEmmVE7HC/cG7dUWwm/IsA/5nTdbRexh/tW9MBVhH
         zyk/1nIbHhyl3Ng1Irq0VWqUts6RowcJ7ikg4b1KJVAbZKbQfXvY5VfLzIrGUuJhNiGK
         WxwTnqNqXp1f5g5b49yvVguxgQ8OP2hExy5BovcYBIxParAmNof7SYGiTniolSDa69Z9
         SptNAHB58E14yJcB+R/tbJAcBe57wHP29QT1VArM06ZAH2/ki+RzR2dmKivRO2Smo4Zk
         w5MYCSUQ+yChLVCOn2BmmP9oSYMNG5sAz4SzryvMTJZmul/2Pha6XuKy+8OMLq93Zpwo
         07Wg==
X-Forwarded-Encrypted: i=1; AKwUvByERcX/6lXRuUfP6WD88k4AfPLgzvgEmcsXg7PDuxduELOGlzccmd3ZNNESCNV820c49+iPN1dU9qpF3BU=@vger.kernel.org
X-Gm-Message-State: AFuF++kyFkNQowPFFVIu5H8LN0Z+SBkl8a/AIhlYPewi4/zJoooePWeD
	dsxxJd0EXIZ4+a+br1gNqcv0/hinZmRO6MFSsXLm3IxnaMhhf7GPeh8E
X-Gm-Gg: AYBFou2c3aaRJYJZergETgeNtla6vexYeU477Nlb3wJYEQhMzamIVqrgnonH3HB6zSN
	uXe6bYVMzrREjne/McRjGXJhTBJITNzxUe5lAHFd9PLVWFflN/8wbTJAe4DJ5is8iXJ16xfcDq8
	xSAy4NfI0OK4F/me88nB6QbNNuE9mrkwwTwOs542P8qX7hK1tSQhSQT+zqztpFWMgJf9xXnCyZ0
	hRrS17BVdtFFlbJIPQiUwah3Zor5dfKiHzAhF0cW1X6DmB+5fTz+0aviLIWaH+NuNEGyqH8VCUO
	NtVeXYuatCJtv4vhvwKKI9Wavhr6CQk335tvetbVOxJkqINe4JYyipDfmDOExylGViCrrDw7OU9
	ZRyiVsxgGE9KMx5MYvJ0RsTiWrlF93ZS/bf76vYqTe9U+Y/xx32SPttKV/cOJnli43+KW8yExHy
	IwbKgqLQkMAOvbE9WxoKQv44HXH7IhsYygKcFqMPivhoji1xC0fJ+gwEMY8JUZy5d1m0iq06Z1r
	BKkKAaVpHLgKpW2I7NSemt6qAoZooDj215t5wwU4/f5OVMzBeSDGdt6y5niUIUx/B3IUX9x8tMM
	jhe0dFCB
X-Received: by 2002:a05:600c:a49:b0:49c:fc6c:be0c with SMTP id 5b1f17b1804b1-49cffdc3823mr348668065e9.18.1789054686376;
        Thu, 10 Sep 2026 08:38:06 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm3390545e9.14.2026.09.10.08.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:38:05 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 10 Sep 2026 17:37:58 +0200
Subject: [PATCH 2/6] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7
 UART_4 overlay
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-verdin-imx8mp-hmp-camera-ready-v1-2-3c9349ecdb9f@toradex.com>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
In-Reply-To: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Verdin UART_4 can be assigned to Cortex-M7 firmware. Add an overlay
that marks the UART as reserved so Linux does not claim the port.

The overlay is also combined with the Verdin iMX8M Plus Development
Board device tree to provide a ready-to-use DTB for the non-WiFi SoM
variant. UART_4 carries Bluetooth on WiFi SoMs.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                     |  3 +++
 arch/arm64/boot/dts/freescale/imx8mp-verdin-uart4-mcu.dtso | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index ca4fec7c1038..8b152903b4b1 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -734,6 +734,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
@@ -742,6 +743,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-7inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
@@ -759,6 +761,7 @@ imx8mp-verdin-nonwifi-dahlia-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-dahlia.dt
 imx8mp-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mp-verdin-nonwifi-dahlia.dtb \
 	imx8mp-verdin-panel-cap-touch-10inch-dsi.dtbo
 imx8mp-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
+imx8mp-verdin-nonwifi-dev-uart4-mcu-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx8mp-verdin-uart4-mcu.dtbo
 imx8mp-verdin-nonwifi-yavia-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-yavia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 imx8mp-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-dahlia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mp-verdin-wifi-dahlia.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-uart4-mcu.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-uart4-mcu.dtso
new file mode 100644
index 000000000000..74d90b39faec
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-uart4-mcu.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Verdin iMX8M Plus UART_4 for Cortex-M7
+ */
+
+/dts-v1/;
+/plugin/;
+
+/* Verdin UART_4 */
+&uart4 {
+	status = "reserved";
+};

-- 
2.43.0

