Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C339C4CCDCE
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844203; cv=none; b=bF3BB3rW5fMr7J/leYFBndFTIUUCAbEEdhqbEM46z2kNEprRtUamPCFFw25s1gK3wCaEcshvEjlRnUyDKEZa9mvd2Atz9zRACVBi/JozAdW6WloiPVBNcfAMaHftgkuxu3G5b4Gu1nVsD/pT4cEzf+09SqvvrQinuzfoSeMFPEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844203; c=relaxed/simple;
	bh=wnUhyrYWheq78/htTGSabO8i37WkHuTnJpbuds4kcNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nWT4sYtFLCr/N9Dh/XjldQvoaVY6UMQKdnJLRIRySkQKH16dWtONxf52mZ6/nnBboMr5HHdG/pHl2K/ePRDxAkYLKUuWr+dw6gO/j6gO4qDni3SP5Mgb7imyyPIoge4+b6zo29FQpGdyTflgb/2cAIqaG3YtlcSBhttiV9HPOvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIJ0yD51; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIJ0yD51"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af5ae31d8so2340179f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790844199; x=1791448999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5CmcYL0XK1JJEyDbPwadIyEyX0pGtm4tcAMQK4meqBo=;
        b=lIJ0yD51e2wXFKTvJ9pUp3xgI601PmuIlxfHXiQRZCwZTxhURNnupgNlqEuh0Xfm/R
         LA6dYw4Da5XI4T/zLleevCIc7H6IaPPpV6ptYUfqpa0bobWEHnMc9ifAZOsWxzfa5OXX
         bSZKK+z/cdYnMVJuaNN9BpaPR6DU0fINqvtvbO2bqrHdBwwYhG/+reM7ne7RO2Ebl2Ev
         LMtijL44x2YuSWgJSv5zQCrKaLcifzlp2LmU0aQfKFisRIw3gR9cWvb90tzDb7XiHAG6
         VOSBEEYJDpU9HeWyTpCB66e+xMEBogqiAmCz/WZOmap65GcA4/hynG9PKLokD/DyyTz8
         0AxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844199; x=1791448999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5CmcYL0XK1JJEyDbPwadIyEyX0pGtm4tcAMQK4meqBo=;
        b=yyDjWEgDXJ4pU4VcS2sOjss6z3Bm5tcxTJKP5AcxoMAFfn/UUqkI+XUvC5FZtrZ8+e
         QV7v7kCfibW5Wmlh1vmc+sXHHsPraabMu00Yj7+yENizizxTUYzjLGozhSRjdxbNiJXO
         FQTeNoE4RXCFZ3gk67w6L1WoNx0Io/aqDCuxFtD5FoeodIZxOG+SaphC+MOKRvAyA+0H
         EYohEi9i9yv83i/nuFuHWJ8XYIQuRAiGvz+umo/nb/ES7zJRS/B6pQ9BoZuOHiNLP4XE
         PrYjweovpUxPVUOnZJP1XBLn6+a5ykJb9oPqFIdnH9TICCXY5IfxBXfTKUQp9IFzvEXm
         spKA==
X-Forwarded-Encrypted: i=1; AKwUvBzpMM8oXE0+jCTo8q3+eoDKBmTMe82yz3iSu0wpkW8czQHKQHUHOTq7hOH9k54XsdG+F/z2FAur16c+Rbg=@vger.kernel.org
X-Gm-Message-State: AFuF++nOaBCzFR280KqKaXKlcavsRNmXDjgxAmnMzQESDdsYhaRKO2h7
	8DK0iLHNZ2UcACV+PicUvg5rjR09Wwi32t9fIr3YKZZXzOMrq7m+hx7J
X-Gm-Gg: AYBFou2SHgYT1zVtYM+1BBHVnSU4wZ5g2hH2dMvIJNf/VG7cZJ3cbdCdb5xh/C0aKiR
	ZGYjQIO7OYGssF01i9oEKqHmrCSTC400BCkKOAOxjWuiSYrV4npyh0WoDCl13dO+ppEYGleWZNn
	YYKAD2Bj3O9eHmMBLvlqiTSRlJm40gYGK613BUS+AnPFGKHuOnCWYZqPeikp+3lAmWWIB7FsqUV
	Ng8zGEbfmZhdw6tvKcoKhZ9N0MxxpkPeEwhcI/bl8m27CwAgJ4cY8HW2NmijEEMPMnUTyMCsHun
	KPVoPnj8rRqqQM6E5BA2yU6BLmIO8o6Nbctx7uGUyG241kjU/KDixXXmrHod7H4abxheVFa12hR
	6IDihRqF2HI4q6edPmg+H9nqps4sRA0r+s81LDaUHzeOLr6TacrM5uQ6ETrArZ84W7GWAT7KTaB
	/SueVbSQEpfcozTx+pYN+muV1FTEh8XYhfZM2ieNYZb5ftRUt+NmGEuOuOJR3pf/Z6B/VPmiViU
	u5/r8LgE8jAN9jj3/nOppBMtheKfmrvrXXHiZSk4PpsA06g9k1d5qCs+VIkBxSe4SlRgLqlJg==
X-Received: by 2002:a05:600c:3b1a:b0:49f:c451:b4ab with SMTP id 5b1f17b1804b1-4a01b12b310mr67078895e9.29.1790844198541;
        Thu, 01 Oct 2026 01:43:18 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f949709sm78177885e9.12.2026.10.01.01.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 01:43:18 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 01 Oct 2026 10:43:12 +0200
Subject: [PATCH 3/3] arm64: dts: freescale: imx8x-colibri: Add Cortex-M4
 UART overlay
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-v1-apalis-colibri-imx8-dtsos-v1-3-21881dc324c1@toradex.com>
References: <20261001-v1-apalis-colibri-imx8-dtsos-v1-0-21881dc324c1@toradex.com>
In-Reply-To: <20261001-v1-apalis-colibri-imx8-dtsos-v1-0-21881dc324c1@toradex.com>
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

Reserve the Cortex-M4 UART and its LPCG clock provider for firmware.
The UART is already disabled in the base tree, but its clock provider
can still probe and participate in Linux clock and power management.
Mark both devices "reserved" rather than "disabled", as they remain
operational but are owned by the Cortex-M4 firmware. Firmware must
configure the UART and its pads for the intended MCU application.

Add a combination with Colibri iMX8QXP on Evaluation Board V3 to
validate the ownership changes against a supported base.

The overlay supports both Colibri iMX8DX and iMX8QXP modules.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                 |  5 +++++
 .../boot/dts/freescale/imx8x-colibri-uart-m4.dtso      | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 2732b223eb3d..61dbab287a35 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -832,9 +832,14 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qp-apalis-v1.1-ixora-v1.2.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-ai_ml.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-aster.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-eval-v3-uart-m4.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-eval-v3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-iris.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-iris-v2.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8x-colibri-uart-m4.dtbo
+
+imx8qxp-colibri-eval-v3-uart-m4-dtbs := imx8qxp-colibri-eval-v3.dtb imx8x-colibri-uart-m4.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek.dtb
 
 imx8qxp-mek-pcie-ep-dtbs += imx8qxp-mek.dtb imx-pcie0-ep.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri-uart-m4.dtso b/arch/arm64/boot/dts/freescale/imx8x-colibri-uart-m4.dtso
new file mode 100644
index 000000000000..c43be136a46d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri-uart-m4.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Colibri iMX8X Cortex-M4 UART, reserved for firmware and not used by Linux
+ */
+
+/dts-v1/;
+/plugin/;
+
+/* Cortex-M4 UART */
+&cm40_lpuart {
+	status = "reserved";
+};
+
+&cm40_uart_lpcg {
+	status = "reserved";
+};

-- 
2.43.0

