Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0389F3E1D11
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087650; cv=none; b=M4529CrsuCxU0iHBEXf0TFDumMMJTejukR/CGaQ40ZuL0Rr/f0xLTfo2sRsRspNJRwaF2q7CBThLSbkzHFxNUacoqwcVRTWtxbAGq6flStr438EWiD81ZhYVcD3UDLrn0fPPmC97+xoEsIx357PN9xxA20iYNKq3tOhxTOBk2rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087650; c=relaxed/simple;
	bh=VPVRIEx8azlGmyfEjloVEHGzIOKDIxuxh8I73jFmUJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZRzm8Wg7P61MgMqX86x4MJut96pf4IH0X3f6o3YqQH/WGKW9yvEK6wh90N/glLLLxO8K2vEX7Y3Xz2k9BQpcYb7e3ryCxl6q4SzkyDIeD56thGFOE+KkGL7m+3H7Gj+gm3AuComyLmWdZdfM2k6uUzytvJwSTX1Gu+ZfCvRhLEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nzCZ34HT; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nzCZ34HT"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a8b9acbc6so201944966b.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087646; x=1790692446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4JwKuwLxtS4XryhoWW3qx4Ui1MeQrSjIXNoBYuhH/9w=;
        b=nzCZ34HTUTqZR3Ujr4L3oOBfYy4glr/+4ctzoffR63iZmzGUqdeijVaR7k5h0r7Vhr
         N2l+oRbOTk85+hs0FSzSf33ClARYUC2yw4Ggx6YEz8vdAOuJM8EWowVVuVegaZ6hBFxz
         Zd3o7L7QHmeNY+j9JifBdNWvZFTU5DO3aPGigRvviaj/oESQdtYAtu8NnbFbfZlp/1GW
         eMIc9eyTQ8CScPtG89duhC8S02CQPd8KIvuo9sAWpUiIZm4AtDwKX/REmfBEYXxkwIwP
         m0KvbZfT5s750QZGbVy8BDPqF51DKzApKIuj9+9y7wRW0HyYSeeRzTrJllp9/hyrNrp0
         X8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087646; x=1790692446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4JwKuwLxtS4XryhoWW3qx4Ui1MeQrSjIXNoBYuhH/9w=;
        b=hxPM0+rX/0HXUOtGCPvqNBhfvSXrgHBPalJGvs1H7jYcpZG2jQdp0PnlsQctIXErje
         A6HnioCge71X+/i+u1RcUuYZjoWT9cx42QGzNSim1wgRvrukwzoRs9X+mt/DDodv1zuK
         O9YJ+HsaoN2OcGbkU5ZyYh22mv0FNBxj4nmb27XhOi4TQ6ugRAPgy+e/hhkT8+ojjd6E
         G+0d35LINJHNdqzLnohR1bJpOxVTSFRJr6W7xjDqLa+I0kPbcCagcKZ6RhDZSsUTCjlX
         1Ra1Y5N9JSwyd3DRGZUBGiDY+KOn62uNOKQYyVz6gI7Nlk80cv6oY3hai27ufs0KGzL+
         h8hQ==
X-Forwarded-Encrypted: i=1; AKwUvBzinLHQiRSe2NxP8657XUCrJ01/72KRd5c3d3qnx1Bsw4dod0anfG5SnU1Wu40bqC64idOZLpvgB4neNeg=@vger.kernel.org
X-Gm-Message-State: AFuF++kHlFmLPxt34gBKjKRHOALMKtNvUhwI2OepSbMOXyudYBB3BNkY
	BtKrLph24+dBnOc3HgcXn8A7EQ0jGSbA0Aui6xWYWuOZmAN6FDVAG/9DRVpK4MXR
X-Gm-Gg: AYBFou361ShCHhSUoQsTL6OW9tQChXL7n5+GL6sXUmSqFroI1Mv+Y7wnNIEaMJlDaWT
	2DDb8gbVZBE3AgraXAZi4uF6ytLfqa6moS8q92wNxW8oy5GFnUxar2jNj7FJlk+X6Oub06mLHmF
	jyVGkoE+sItyCp2ssWPC7hl+s6qF5OXCTnAO9qLVaNH6QJV16cCJr7Yn2gtOwUvFBJg3t+0rLPV
	YAxOQd/BJ5vuDzcC1rlSpCkyyx+PPOwDRVxdrgqgS87r1OBB6Oxm42x+D7+/b32AJZZ3/9Jy3x4
	O3VzQG9nG2p4/Kl+jchojdV6dywFsRcV+SmhWDNo1lIaBVZl0ogDPgdOf1tGSW+jEax0YB+Wiw1
	f+DsKbfTm1LY0RSFFSOegJE4vSOm79FAPz6bqR3NfsA++HW69sxQWGYrsEccfvPyykWkyWyotJd
	pF3N+D3q5CHgex3WdmQiEXtAeu3iTf43Ee9eePfpQk5+kXKwY1JSAfUy37EcegFbkBTPo6K07MS
	R+Ly+2tTvTOplToXQ9EtRmfh2UnSDWcqILftA8wt/N6c85Q6SptbsepKkh1+ERrBv6CbUc1fF8=
X-Received: by 2002:a17:906:2090:b0:c25:c67d:53cc with SMTP id a640c23a62f3a-c2a8e3b0af5mr219778566b.8.1790087646027;
        Tue, 22 Sep 2026 07:34:06 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5814e2sm103469966b.27.2026.09.22.07.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:34:05 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 22 Sep 2026 16:33:47 +0200
Subject: [PATCH 2/4] arm64: dts: freescale: imx95-verdin: Add Cortex-M7
 UART_4 overlay
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-v1-imx95-overlays-v1-2-694100afb4bc@toradex.com>
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

Verdin UART_4 can be assigned to Cortex-M7 firmware. Add an overlay
that reserves LPUART2 so Linux does not claim the port. Firmware must
configure the UART and its pads for the intended MCU application.

The overlay is also combined with the Verdin iMX95 Development Board
device tree to provide a ready-to-use DTB for the WiFi SoM variant.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                    |  3 +++
 arch/arm64/boot/dts/freescale/imx95-verdin-uart4-mcu.dtso | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a7ae74a706a8..c283c582d974 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -966,8 +966,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev-nau8822-btl.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
@@ -975,6 +977,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
 imx95-verdin-wifi-dev-nau8822-btl-dtbs := imx95-verdin-wifi-dev.dtb imx95-verdin-dev-nau8822-btl.dtbo
+imx95-verdin-wifi-dev-uart4-mcu-dtbs := imx95-verdin-wifi-dev.dtb imx95-verdin-uart4-mcu.dtbo
 
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-uart4-mcu.dtso b/arch/arm64/boot/dts/freescale/imx95-verdin-uart4-mcu.dtso
new file mode 100644
index 000000000000..efe3849f262d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-uart4-mcu.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Verdin iMX95 UART_4 for Cortex-M7
+ */
+
+/dts-v1/;
+/plugin/;
+
+/* Verdin UART_4 */
+&lpuart2 {
+	status = "reserved";
+};

-- 
2.43.0

