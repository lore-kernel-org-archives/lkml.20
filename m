Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423867;
	b=HFCAcUyBVAwyM/MT4JDfuPw/5ZWRXJE1u+9JI4mPtfIVEi8a/l2h/ZyRHrqoMm9iJOWE
	 XZr5IHz7RCoI9BDKXJQLKSkCdKC10/Yk7eCf/KTyEyFqY+6RS+ZkFjbr96Gg7FeYZxgfr
	 SbHBdhc3LwBe6p3z2VFyLC7KMTqngeot4TyhZgagCmE1T7zrGswwlm0Y+VOB9W4m+2giC
	 iEU5pD9yyDp/ajrWZx/LFW/vQhshY4ZBdaQd14GNX4TcivoZDXUdTTRJx67cOQGNGXEqt
	 Remg6sc+zrUL0qyV+6c9HxiutIcngywEd0vA2BrkU7J9IOdtVE4waPi8F1Yb4Xm9ZSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=SEOLRJwAl9euldxv8C595NNHRCaNku+5qCdMnuutjK4=;
	b=3gKt5SXngD0896aAfz2TeAgKvzeHzzGLOtS+RTpxc0ZogynbQWNXvzLFIuaxwg1Nat/o
	 EEIeh7PUuCddzek8rWsb6r+4Ht8owJTHZ9zJd2eE/HIRr6OY81A9OMjphZRnp5YWCpFGm
	 GFYYrVJ69PtZlyGhqksxC97rzfM5WOidFgXin2VfuEruhm+bfDfV5tOBTuk/HSMqkPuk2
	 sufvTurRiVdtvDoI4kj8RIOCXk6EEdXDcWaopWlAgqGudJMXbuUZEbMu3o9+FHbJxDPxe
	 HMnQqQPiwxH23Q/oHStlq3JwIeeW3n2qg/x8VTOf9CZw4AMm4MSMU5u8VzcYrEgOwZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t7gb2SBr;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1B8606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA1B8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t7gb2SBr
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ea7987517aso19340765ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423866; x=1795028666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SEOLRJwAl9euldxv8C595NNHRCaNku+5qCdMnuutjK4=;
        b=t7gb2SBrbFzQwOaloQj/RTCPL2QORc70Ixm2Cb70KEQk7RBnBtAe3oV3D4oEs3wU1H
         4AJCO2lV7QONMcqqI0b7QwZPzpdlJe3+Cez27enMF5NnVYPi08nMBgbZ/KIqdQIIGaDm
         BYl7uq5DYec0Ac5gUtWTR6hUeE1ik800kONgKwU99pjHUXRFD5OsdYFZZGnpSd352dmg
         EH2b7yhmvMXjymicgemasij4aEi98ko3q79hng3zVKqzj1UcS2Ziy1bjqw52iEhXMhEZ
         gEp8fhXUeNk2+CbUIRWVOEDVHbgyUMvDrexnXO+PtPNae+lnLyx1lqgPBJNrdIayvaCi
         GUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423866; x=1795028666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SEOLRJwAl9euldxv8C595NNHRCaNku+5qCdMnuutjK4=;
        b=yx0eXwLOXmEfX3xmMf3n+WeWGaIJtCi0kEpvkjhep8zHuGcyyyOiOHnIMA86ejLJew
         KVIc+2stfsRDNsY598gLNF2JbrqX8kdpnYUK8zzb/caW8JBjJGjsHMYSFH4+LNfW2SKr
         drbJu+16QszLVOI/Ipb7ewyM0bcvOAUQysFeTHCgicUYZ6Gf+nlN6r5kZx8cxaGFWLr3
         339VeOe9NQr/XF9QXAnPAPHv88GWh5z1cXFnMDWr5lsRJkHewmOr4O8NDx/xYWfYzG0R
         SWGb18YsuV2CDsIEFJ+Th0sTj5NMGHQmAAqSIHHX+/Xik2E8i+Wh3Qb7wZ9RjI8Q4a4N
         tfYQ==
X-Forwarded-Encrypted: i=1; AL+hErFhjitVXT86oalIT60qhRA8cyxn3PsbG54xZFURIsYUQ4VwD9fdlP6QsT3EjfCxflEsCGJqyuE/DpQP1yg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IO6lmjdkTJjhAe+5PRdQl7eMBv4RpXOwdTHtsBbaXkWfLhdfd
	XPTwfVnVxPk1lcfMzpuUejxZJjfjcTvghy8J4eOL1AhIibUSjYWgFeOMIVlW0aSD
X-Gm-Gg: AYBFou0+fBnwWutxGbFMVtkE6aNSFLsn63xliF8P2JmWKZbkjJmdca5mQjxaQELXu6x
	nhWwiBnhja7xXyF3MWczqlY5Z9rrpDLcsdCihobZm9NrRn6E3jPnaockpm+Sr+1DpLnF4HrF+3S
	7kwcckVlqY+LzVKQCCwHw9Z7h/TFpyGd8pdAqFv2Y8qapvAZ+UAEnLiRwvtXnGrrIRg4UIjrFnE
	HVwDGT8AubJhok0M3/dDjyGm7MOBEgpXEt9BS+mMbVlLeIJ/gyJuxDyF/rbtQuDdhWUVivFe1XT
	7zuOiMcEJFrv0VcrBJCcpg8DWUnxckHXdTyxOB6gNvNZ4fjQz1IIMZx56ukgcmgzjeI6uNm6bYW
	MpgolNrB87ZKfzq6vJ0CN4ZG9U8ChFu5tZLYzRSWhi4WsjNl1kOrgGKuLb4qZiMerP4e+KLUZT2
	M/MquPH9zBRzkHcTNV6aJXpI15JT4Ab9LZ1Uvbl4Q4/q4rmzQyMY841g1XY9SBb8VN4nsPv69eH
	jDSyCa/gfLhR/RUxU/VJ/KLj+8u+7GXga1EKHckIkvhoyrf4NHx4+x6BvBDxRjISD5ExpRz1Cug
	RyKFLGmCyaXq+NTWWppt8NULPoIZIFeA81Q=
X-Received: by 2002:a17:90b:55c3:b0:3ab:1e1c:837f with SMTP id 98e67ed59e1d1-3b182f0ab74mr2979207a91.47.1794423865920;
        Wed, 11 Nov 2026 11:04:25 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm2727366a91.1.2026.11.11.11.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:04:24 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Wed, 11 Nov 2026 16:03:57 -0300
Subject: [PATCH v2 1/7] ARM: dts: imx6q-apalis: Add ready-to-use DTBs with
 HDMI enabled
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
Message-Id: <20261111-b4-v2-apalis-imx6-overlays-v2-1-8129b21634c7@toradex.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794423849; l=2682;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=IhvOHZocG3sOxkIY0mTZ8xkrqmTA96SIs4gUIqO21v0=;
 b=0RH9hyedCGLDxqRsacjj700/y3wjOOQwWdmkydZUbod6PkJsolk3iCEIm4MOXpWF1orItNp5+
 rfBds01kbYkB1eHbWn02cxpgaaF7avxlyA6n5rxwvIqVrSMcS/HJ2Vd
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Combine the imx-hdmi overlay with the various versions of the Ixora
Carrier Board and Evaluation Board device trees to provide ready-to-use
DTBs with HDMI enabled on the Apalis iMX6.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile | 50 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index cd4c8062e6783..cc0f5f100892f 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -124,6 +124,46 @@ imx6dl-colibri-v1.2-iris-v2-vga-dtbs := \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-colibri-vga.dtbo
 
+imx6q-apalis-eval-hdmi-dtbs := \
+	imx6q-apalis-eval.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-eval-v1.2-hdmi-dtbs := \
+	imx6q-apalis-eval-v1.2.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-ixora-hdmi-dtbs := \
+	imx6q-apalis-ixora.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-ixora-v1.1-hdmi-dtbs := \
+	imx6q-apalis-ixora-v1.1.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-ixora-v1.2-hdmi-dtbs := \
+	imx6q-apalis-ixora-v1.2.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-v1.2-eval-hdmi-dtbs := \
+	imx6q-apalis-v1.2-eval.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-v1.2-eval-v1.2-hdmi-dtbs := \
+	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-v1.2-ixora-hdmi-dtbs := \
+	imx6q-apalis-v1.2-ixora.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-v1.2-ixora-v1.1-hdmi-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.1.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-v1.2-ixora-v1.2-hdmi-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx-hdmi.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -271,15 +311,25 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-yapp4-phoenix.dtb \
 	imx6dl-yapp4-ursa.dtb \
 	imx6q-apalis-eval.dtb \
+	imx6q-apalis-eval-hdmi.dtb \
 	imx6q-apalis-eval-v1.2.dtb \
+	imx6q-apalis-eval-v1.2-hdmi.dtb \
 	imx6q-apalis-ixora.dtb \
+	imx6q-apalis-ixora-hdmi.dtb \
 	imx6q-apalis-ixora-v1.1.dtb \
+	imx6q-apalis-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-ixora-v1.2.dtb \
+	imx6q-apalis-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-v1.2-eval.dtb \
+	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx6q-apalis-v1.2-eval-v1.2-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora.dtb \
+	imx6q-apalis-v1.2-ixora-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.1.dtb \
+	imx6q-apalis-v1.2-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \

-- 
2.43.0

