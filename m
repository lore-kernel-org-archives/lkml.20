Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423893;
	b=E94QjZ0IPTR+UXk1QhVtZTqc4v/WPR5KiPvtX85mgCYXTu+G+/tSH+FYQS6OcfZJmMrQ
	 a0n3Xf4aQJyf8aPXl5fef7LbkithXNO87R/UtXHul377yiCfbB99BWsPTJH3Dv1ShM6Yn
	 mDY2aVlb6jdvxAIhMUaZNYq3ghbPNatX4af6eFk5y20nJ4AsG5Um9aUOktPCd8zhHGVZs
	 WPO3+F2Wzccs0fmvwk29IL1rDZm9DffffTlsmAjpgrp+7LJjtf0hEhv6fKgnP5qL8wg0f
	 fMCwkiuviduPGGJziCLqfz8RZUSvNEc51uMCs3wcWL97a1+sFix8oLQN2STruHtmflQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=DQ5F3RSAqprTdoFiaIrgjuTwVvYLe9Mk5D+8vt5PGPI=;
	b=pEk29+1/KheyOIG5JPSuQERoGhdUyWBDU825iTDcIaB6zGJcCcNfFAoloXu1eDZGSad2
	 QvE+/Toe7BpWfVEHpbKjtJ4F5pwKama0mVmp+wC+t2d6WZZ5D+FvHSLfdH7zdfI0iBi6G
	 vN4EAv0thiWDn7Fc+G28hcOBNVRL6CksFqBBp6kp7Q63DLZvFeoTJDZxnVcN8CyGuf4q7
	 2otVQRW5FCe/bzfv7z8sZ3uxQT7B7pLm6kaPrBBu08/mKX5K4tSKK2Qi1FgJjWSVrx0Pu
	 4kTD7uguPuPYV2/e24nXW86hAJwkCGwgrhE12iZWEiMSA1Dy9RUgTcxOmdbxSwQiJbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zIWWxyrN;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFE9606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AFE9606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zIWWxyrN
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso2106598a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423892; x=1795028692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQ5F3RSAqprTdoFiaIrgjuTwVvYLe9Mk5D+8vt5PGPI=;
        b=zIWWxyrN7oHXkG1jICmt7YAaGA2MesgeCR7SxP0iQ7tXeoE/cHx83Ddbgulj89MYb/
         6M6T7cDfCDuK2dKEHtRf8IRXlAeGKqKLY2zfFMDAvuV/BhlXRwMJhUoOeJXkoudixvsT
         NK3gwZseg0ihOy7OF9wKfbGZuUvn/zKDuNx6lof8BUBwS/iXaieNLWjJibgfn2C2125I
         sQsp37USoJY/MSKN/jLkIDSvXWc2IUj1aMqZIUvOw+MQHLGFst9aEauQho9sWcL5pFk8
         AN0X7pzwi+3FS9cpn1En3eL3Sy4q1lz/w8pUenWfMq+d2YWLb+ub3lmhYVajrzHEDtwO
         hl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423892; x=1795028692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQ5F3RSAqprTdoFiaIrgjuTwVvYLe9Mk5D+8vt5PGPI=;
        b=Zad6FSviHrcFMy8wLI3PcUqoivxQUxm+QGNWzQpctK4ul0RHnRZRLp77wfqS2P6jgs
         TUQGSaOwxRMqyQab88OnYaSUaOMncKbLNtJZ2r8k0udVvFGsFo9Q2CJptN48UhjBLDg1
         Qss0y1ufIpbNqo86dE2vOFUoqPdNyuwLqwHWHn/SjB2sRrFvKO/fye71ZTL2RJMjybtW
         HoQfRQVigN9k9+WcHuxxff3fqibtblZkEHmuia6FhwhTbTAJx9GOjCvQybw8W3mL7lrw
         gcXz1hVntJYd3egDR1tLaA55TLZzE+3A7AKTKSm4p9RIlZ/v+e2Ra0VErQup2MKQYC8r
         I4+w==
X-Forwarded-Encrypted: i=1; AL+hErFSmKgSGL+/KeJSh+Fjc0SZ+ybF1PJu9fdzq4L7gphZVK3DKF7TPXAUxf7Vn0wWCYTkWyiUmOGwJ5VYUsI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RKbmFBiCyW4EEi49WfHEfYoLn3ByHKluvQuSHKcIblyI/J+6a
	AwgYqsl2VcP3HvEpc8zrrdoPE9YvsjVXGeqnYJUAczuHTu5ybwUl9YMS
X-Gm-Gg: AYBFou1jB3cc424PRbge+l9moIvS8GgJL4Y+4kgcGakQbv4dgx9u+faK9S0dI5NfMR/
	qkMikR+tuUHwq2xvd5cAZ7KBU/YTH0tNSVvz7TRZhhBy76M6BUviveN8/ko+uzu0hDlcaXjFCuy
	N6POkdmYy3zkiVeTS16Rua/QO5+Vs6Lrw/zH7nK6flcDgCnIkZg2qeK1+8iMQwp8WJWDRxl2GU5
	Bp3gA0DdIZPxlp+gmB4HD9BGb3aj+ILWyjgdauvuWD42hIUeJ19WJapppX/U6F49NbU3dbEZ+do
	xjOat/axWt3RhdVkBFx+ByfadflpIClXCF3q4qZM7t9em43CLWZ2P29Z0ddjAWgtiFMg6hIFYmL
	tF2ECvqVbgApH6uxcBMv7S18+TQaEedHi7fZDJAUyC4mXgxV6twh3x9z8aSQJvy60Phnzpp+KdK
	NVW+FYtHBhVCiMkiYr2G5cTCkx+w7rMVhDLNzZsDQr/qt2O+GFYFVLHMbq8w6IeckSP7X6e1p3E
	a4EKySYq0sKpqWGkgtc9hGgsSXpwGRj45vNBlUUX53ATuSDqgPpLmHAbQVnydZAnd1feZmDFbQ+
	aJPbmxXG646umqdqPebYHCH2FkbzpF0UoQ==
X-Received: by 2002:a17:90b:4a43:b0:3b0:a3eb:759e with SMTP id 98e67ed59e1d1-3b182e6f662mr3176907a91.17.1794423892375;
        Wed, 11 Nov 2026 11:04:52 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm2727366a91.1.2026.11.11.11.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:04:51 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Wed, 11 Nov 2026 16:04:02 -0300
Subject: [PATCH v2 6/7] ARM: dts: imx6q-apalis: Add NAU8822 Bridge Tied
 Load
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
Message-Id: <20261111-b4-v2-apalis-imx6-overlays-v2-6-8129b21634c7@toradex.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794423849; l=2480;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=SdMTfWEdhEcbVe3jVg4HQtrokGsmQDzPQ6HKrJzZjGE=;
 b=GUA2MhZVPFVVx+fP4wtJTG/ZVarRMQCoFUO+AAwZGNJULsfUqPHcm55hq2RjOIUamkxu2JjEU
 s7y2NTEMgqhBHj95eIB/wJVpRyhVGVv/R6f5pa0rylqerr4dAklrjSi
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

The NAU8822 on the Apalis Evaluation Board V1.2 can combine its two
loudspeaker outputs into a Bridge Tied Load output. Add an overlay to
select this mode when using the board with Apalis iMX6.

The overlay is also combined with the Apalis iMX6 V1.2 Evaluation Board
V1.2 device tree to provide a ready-to-use DTB. The codec and its routing
are already described by the carrier device tree.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                        |  6 ++++++
 .../dts/nxp/imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso   | 15 +++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index fc9a68cbdd313..fffcc54545b09 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -152,6 +152,10 @@ imx6q-apalis-v1.2-eval-v1.2-hdmi-dtbs := \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
 	imx-hdmi.dtbo
 
+imx6q-apalis-v1.2-eval-v1.2-nau8822-btl-dtbs := \
+	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx6q-apalis-eval-v1.2-nau8822-btl.dtbo
+
 imx6q-apalis-v1.2-ixora-hdmi-dtbs := \
 	imx6q-apalis-v1.2-ixora.dtb \
 	imx-hdmi.dtbo
@@ -326,6 +330,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-eval-hdmi.dtb \
 	imx6q-apalis-eval-v1.2.dtb \
 	imx6q-apalis-eval-v1.2-hdmi.dtb \
+	imx6q-apalis-eval-v1.2-nau8822-btl.dtbo \
 	imx6q-apalis-ixora.dtb \
 	imx6q-apalis-ixora-hdmi.dtb \
 	imx6q-apalis-ixora-v1.1.dtb \
@@ -339,6 +344,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
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

-- 
2.43.0

