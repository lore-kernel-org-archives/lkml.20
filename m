Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08B24C224A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844202; cv=none; b=MBpUs69Z9xntcJp9024BuLicorXSAQ6kP6+HtCtfJe5jyPn5Bsfi/vsQfJFFGC3HQKUx8PrZPXVyqyQru4eUikwfH2o2W3HAG9y11JvSMgTVwxpQzPleDdqkKnfp0UH5CJhblk78gsSOHtPhpdhGiy/H199OsbkxUSUjszM5oTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844202; c=relaxed/simple;
	bh=nWTgMoW7Alfvw4HC5D4yHSnYtdfCYBNHKKsHkW8vWn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ix7qwCVwVpeQExVTAxamX1NPPrVfB5p/YKt3MhGt7nTwdMv6WBNtvkgMIh4Z/uWAlu33PVWVIXwZtSpxt4UpEdnw0p+N6/tNpsCmThCwoP7ncjShY9qyTV8vcqqlJ8TJI3VJ7AyzAHjRHhcwMnM0hTMkXDy97CTfpEA1Ojlt5F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qGOFa2I6; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qGOFa2I6"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af4663da5so2104180f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790844197; x=1791448997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gM4qEroTkI7GU8BzlqWFaTCiRRGSMw1n4u6I+iUHzPo=;
        b=qGOFa2I6j0UbTpZ+26SLtwWxpAki1cTfHjbqrmfm+//k3I+0XI+XrgZFXYtdgCQVWj
         mEOkG0NseFbDOkX4O9NJ2dYax8Uy2dL4GU/5dZUSMgvZFYpowoCELEXjz4mBS0BqthsO
         0oue2sx0L7ErG7BZ1fYDvzO9ZhdpFzVWrXQsSQtedcDOu+FOiKeVkTNxgOtEHwDOzvdO
         X/qn1HM168Xk3T0U9jD+UeRkgE73O4A5zIyPDL9U9yOpXg9/+76MpvJGlV4DoTK7gqRI
         ikmo5YjIJNyQ+V2TcEINyvWzI/yzar44UhR52e+Birl0/cwcpMXTAhc5ZyqOkeDyr1pu
         ai7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844197; x=1791448997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gM4qEroTkI7GU8BzlqWFaTCiRRGSMw1n4u6I+iUHzPo=;
        b=vsS8W3KzR6ZnzmlCCkQVHwotT3UtkXCk9ONSUL1CAU2VsJ6LODFFJdFCo+jpFHVBw9
         NHn0Gt/2YqnzZ7lBGIBpcRF9H78XvtxbOIMXMu3peBMSRQoptAWirpaloVg2mWLdD6Nx
         LEdTO7+HVHk2YyBXW6YOiDE3W0INCuGVAn6RkWb0q8+f0I7KpfAlvp/kctUuPqeuwA5X
         6arDTmd3b/vlgoEngM3iPD8iV58pahAB5r3c9gKOhta7FC0h3dufZsE7QkkOoiwKoEWW
         zS+GumSsDFZSvWHuORdeUXUUR0yC+UvP/ta24GW7MIY5TxvX+8rk2Mpn1pIuGAYmDveq
         59+g==
X-Forwarded-Encrypted: i=1; AKwUvByhyXwWP8/5TIWxk+qFr7PJEfyrrw2DYypImmMGuN8KriOuKRN9VoQRiEdYd/n1f4p/4Vt5/Obt0uaoS8A=@vger.kernel.org
X-Gm-Message-State: AFuF++lQ6rcoCxK2doxFK2v2jKjWx4NtydyC/Ybi2dnjHzkFXOl2zSUu
	o44rCTBaukoL+oRr0hvdcveM6QOfrv6jEPwDXvLMPNcqFNxjrYmKXNbb
X-Gm-Gg: AYBFou2GWgxNxiLIkuLpeTGOSpPrTu8XZqZSyudhXgTKP1yrcTXo5GuRjwDZFpfhps5
	60hZwkOF4lNrAUQWjP4GASfYFkk7cAx8TuROufLluJY+WWPweZow09fMDbvZIGzw5vITQ7DhjD7
	BmQbMDXqVRjWRPOoX1iZzvN2XGrie3WHAxbmxCQlv2BdWhTZZj3xRZTrzqUKq7+zv+rfxS9x5lF
	KYS/k3+D68EINdD76XBfo8IYLXpIcZeFqx4s+1dp/yeiuoik+f1TmQukrOkBSuY2G91KFzqsFjp
	T95LIFebF+gjzxOC8cORNOKlVPZfi7k5tZYwWGsfXNqiOBc9iKeP6ppbiU4aNDdxmpJT8KNwdoN
	Gy4qAiTZl8GBAciQM+dDA/YvEtgvC86ZxBgQ3pNoAdcZNUFrpeNO7Xf7ZnCPUDNHp1XOgNwYlnf
	yF1ByWmQTGyFer+i2sEojUIi5q2SXqiEHGEmKmbvSznrWdsRYoY2d6aAKGJVi/DEtyxm2vAExHC
	cjMiwTfYE/m+htwQVd4pPiRe3mvVZufPJS8PHUlj4MPjXb8Wh4yKYm1918GeTUHvzTw+27zcQ==
X-Received: by 2002:a05:600c:46c8:b0:4a0:f0a:976a with SMTP id 5b1f17b1804b1-4a01ade9bd2mr64054025e9.13.1790844196791;
        Thu, 01 Oct 2026 01:43:16 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f949709sm78177885e9.12.2026.10.01.01.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 01:43:16 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 01 Oct 2026 10:43:10 +0200
Subject: [PATCH 1/3] arm64: dts: freescale: imx8-apalis: Add NAU8822 Bridge
 Tied Load
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-v1-apalis-colibri-imx8-dtsos-v1-1-21881dc324c1@toradex.com>
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

The NAU8822 on the Apalis Evaluation Board V1.2 can combine its two
loudspeaker outputs into a Bridge Tied Load output. Add an overlay to
select this mode when using the board with the Apalis iMX8.

The overlay is also combined with the Apalis iMX8QM V1.1 on Evaluation
Board V1.2 device tree to provide a ready-to-use DTB. The codec and its
routing are already described by the carrier device tree.

The overlay supports both Apalis iMX8QP and iMX8QM modules.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                    |  6 ++++++
 .../dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso  | 15 +++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 9971b34f7301..2732b223eb3d 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -801,13 +801,19 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mq-zii-ultra-zest.dtb
 imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33-dtbs += imx8mq-tqma8mq-mba8mx.dtb imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx8-apalis-eval-v1.2-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-eval.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-eval-v1.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-ixora-v1.1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.2.dtb
+
+imx8qm-apalis-v1.1-eval-v1.2-nau8822-btl-dtbs := imx8qm-apalis-v1.1-eval-v1.2.dtb \
+	imx8-apalis-eval-v1.2-nau8822-btl.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-mek.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-tqma8qm-mba8x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-var-som-symphony.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso b/arch/arm64/boot/dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso
new file mode 100644
index 000000000000..b2f9c43d29cd
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso
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

