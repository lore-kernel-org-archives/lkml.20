Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA1652E07C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870078; cv=none; b=GUfBvc2cVxR0mdVjozT09r+2RuYQv/7HMF0eP9c8magKLZGsb/DZ2Z3k8k974khmEqZoQhueWtKCxshHHWT+qoiyvb1lEqGPn7jKkPFhU9wplnClLSn6ib+M9K3XuT8VfROD1BtvHXuENRmX7Nm1Fm+nu8TkBAo1aaYe/PcjOVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870078; c=relaxed/simple;
	bh=PhXO2h9hJyvfdLdh0Yyx/LnJaBorua355HD7gFfHQCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FhJSPtQKQjgppyIVZts+MiukFsvKDxcbdS789zWD8u9nB0AM42n/J+ca2y0KHSbujKS0itRrHuaQrw2ipeGzQs4rrMlJo3prKVfWmWseQXCAsSDJk1cKBShUZEi4LJ4QHDhKsSgiQqLkMJQ8/6Y7nOaQxUhJoQuT2L3LcL8LCV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQQI+uIn; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQQI+uIn"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b00a0ac65so1234004f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870074; x=1791474874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gYv6IEPxUFfI2Bv/5OKmlmckPiL2KI+pvDoljGGq1Wo=;
        b=hQQI+uInIU6Z1vnwbhBjQvdIc/nWCT5QbvhEcipgtt85S6A35UTmHdom7P5L5MLDDD
         Lphok4LZL0xMNuk0+ugPq35jS6grDq713bXoweBd/J27ewfhxVH9JQJ1okbfwfVxZqjm
         4ml/AzrQwOLSpJNau43mi1y2oW5spHSf7xQKf/Ugj5JEHUgEXvw36jLld+QkR3eDok8o
         2dhPXo2rm+69eBTReq/WJdv8lg+Apo+7KrN74XgwKfjVrJpKfEqn5YbSqgaN2UBv4VK4
         4Au1Ac8MEQNXSw+YBu3P/+ZRaA/gQ1f7DSVAuFaI1djgNuk5lrqZy0xr5ZjDAIxmfGtn
         Vaqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870074; x=1791474874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gYv6IEPxUFfI2Bv/5OKmlmckPiL2KI+pvDoljGGq1Wo=;
        b=PoE8gM79+6k4Aov3W2u1W2PKJlPACyn3r/n4qUq/nxN62FrP9ExmLTb1o54UiDqhMl
         gUb8KQmxQAfji4d0DA3h+XH8tri9ZT5ST/dwGeNnpYw8QEX56uVxN7Vo6Ay0RVgWEpK4
         ayGlv6Q6RhUenTFfB40TLxGZ9YnOs/EEUw50oZRLHOZ4lk6b61ZmZjwhyGLR4KLsblDP
         VMYcbNmwBrvSMglPx44pMf+2MX6R0WsWYiZXiCRUcuVr12s5GJWF+VF0ZSMVZXPiH+Xx
         vV5I+ckMduws5nifWD9OV8DkHUt+WPqAROT0tKGiuTVupCYqiTPAT/WlzK9gnKw1iiB8
         qnSg==
X-Forwarded-Encrypted: i=1; AKwUvBxINBmRwo7zv7ri0TYG38kLunlkrZevzTpURO5ERoWKB6sR8p71nklnXZB94jLfD0MawSb6Gvrt/yjb3NY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfU+l1vGN34XWVVurgJM3L1k5RbzKcFy+hC0qQbslybNEbBap/
	RK41qzvACSjVE4pyVM1qpMVLFJJ3egZX5QisNypYKSkwSa5kWXjDPzPu
X-Gm-Gg: AYBFou10BEnB/A5R45++V//g+Rs07CY3Sh30AlwyLbURIu8p6ZeAcZ2/K9G+jDAZdwV
	XDJNXNav8O133MYy5FuoXehL63TWnrsUB7r/Hs625ICGmBh5X5kII5ziUs22PCcWeAnk7OSHYT+
	F4QYHKzRHV+lIkg6yzj7Kyo0HsmdAlj7pUYRvGosH/UOi8OyHGWsM/dRKIh61kncFI78wzUtz8a
	FIWPuYwoJ+zbjgHl1je0YRCvF8qtZuCIOOawWk3BtSHSbQ7YJMSYnnOHgFBvbDIEwt4yqNrMDvu
	ArXWyeM3F4e4wCnF+h+QclX2x5nhyRMkQw25j1HhSXrmh+2Oqf4t0eDGuF2BUcpw06qcUI994RX
	TEE778O3SAjg6UTzW4Ip0DIVv0V4+NJBxncuXYelwt6bhyv3GUg+m4CNajHsQ1fv84z8hu3gPJ/
	U5X5MbsARnOpT/f3sta9oE+1AOsrkObiEhrPMzxAJn+GPgggSrIp662t7xOz3EjO6sacnzu47ZR
	czycIMzPRktodYajxigtkEhb+eEFZGjeQBRalxAg8p6L2vUl5OUQfe6V2c2TiAwaw==
X-Received: by 2002:a5d:6f10:0:b0:484:3310:710c with SMTP id ffacd0b85a97d-48b12741278mr19738f8f.24.1790870074388;
        Thu, 01 Oct 2026 08:54:34 -0700 (PDT)
Received: from leonardoc-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff6eesm6517294f8f.11.2026.10.01.08.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:54:34 -0700 (PDT)
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
Subject: [PATCH 6/7] ARM: dts: imx6q-apalis: Add NAU8822 Bridge Tied Load
Date: Thu,  1 Oct 2026 12:52:56 -0300
Message-ID: <20261001155412.3177428-7-leoreis.costa@gmail.com>
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

The NAU8822 on the Apalis Evaluation Board V1.2 can combine its two
loudspeaker outputs into a Bridge Tied Load output. Add an overlay to
select this mode when using the board with Apalis iMX6.

The overlay is also combined with the Apalis iMX6 V1.2 Evaluation Board
V1.2 device tree to provide a ready-to-use DTB. The codec and its routing
are already described by the carrier device tree.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                |  6 ++++++
 .../imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso   | 15 +++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index cd1b095ce06f4..cb2ad0756e7fe 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -87,6 +87,10 @@ imx6q-apalis-v1.2-eval-v1.2-hdmi-dtbs := \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
 	imx6q-apalis-hdmi.dtbo
 
+imx6q-apalis-v1.2-eval-v1.2-nau8822-btl-dtbs := \
+	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx6q-apalis-eval-v1.2-nau8822-btl.dtbo
+
 imx6q-apalis-v1.2-ixora-hdmi-dtbs := \
 	imx6q-apalis-v1.2-ixora.dtb \
 	imx6q-apalis-hdmi.dtbo
@@ -238,6 +242,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-eval-hdmi.dtb \
 	imx6q-apalis-eval-v1.2.dtb \
 	imx6q-apalis-eval-v1.2-hdmi.dtb \
+	imx6q-apalis-eval-v1.2-nau8822-btl.dtbo \
 	imx6q-apalis-hdmi.dtbo \
 	imx6q-apalis-ixora.dtb \
 	imx6q-apalis-ixora-hdmi.dtb \
@@ -252,6 +257,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
 	imx6q-apalis-v1.2-eval-v1.2-hdmi.dtb \
+	imx6q-apalis-v1.2-eval-v1.2-nau8822-btl.dtb \
 	imx6q-apalis-v1.2-ixora.dtb \
 	imx6q-apalis-v1.2-ixora-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.1.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso
new file mode 100644
index 0000000000000..b2f9c43d29cd2
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Enable Bridge Tied Load (BTL) speaker mode on the Apalis Evaluation
+ * Board V1.2, combining the two loudspeaker outputs for higher output
+ * power.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&nau8822_1a {
+	nuvoton,spk-btl;
+};
