Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673498;
	b=0boFB4Mr/Vpnpn9ZlY5y3eroY79l14FRe2/vKMeu3iaYMXnuoCXICcuslYLpNKL45vfQ
	 q0sDGV4pDSnhaslb8IAvG2O6b4ExNmxLf7ljhMx7UIO1ZsGlFo/c6Uutn/PRJ4Kj+ZmDW
	 UXtgScdNKTnynFwnTUmHj3c+WGXt2ptJFmNLtKABSR9BPBE7P8VFeFYvAWiX3bIrCDn3L
	 50XKcQ4kAqxU7k9yXAG1rNQDSrtF5m8s6wX/z2RIpdcvv3daYswbNYffoxXmK+FMai1AW
	 x+4PtOj+6/phP73JrRku7YN38rXJ5NFc184YwsXXX/FS/zvYbvktDOHqUZwzTAga0NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=hNm/9g8tvXvdrBfPLA0jc0/PXVgX5xc+si2+Vq6b1jY=;
	b=5eXI7hsP0s1RG5bSfvEHFytqTqlcVFN28V9L5H4sDtUTcVR9O5NvUKQvzGOHZwwKMPbC
	 w7NTimx454KM3IQffMUhdsebtbC7dKyaRoNPX4Q1EHgWTrfRJlWOPOHesTd4MlYliz3jU
	 f4LolQFph3vMZ0yzFfeytKO3ZCygceNYBiJypTpX8AoEmP/fdVN9pT57tQ1Cuj4IHyq76
	 OJjwmtwouFBJBUpdzfVFa+jcuwKLZSg9PYmP1yzB4lGDvBlgr0R4gb4IVhWPxKuKMdVLX
	 nJFYqZldp+Mex4SIHTvqCdqGq1AC4H6rUXmI3reM+eSxpZJJt2+OGsM8jakljjVdAuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E1w25YHn;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560CC606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 560CC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E1w25YHn
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4956869750eso12314775e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673492; x=1793278292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hNm/9g8tvXvdrBfPLA0jc0/PXVgX5xc+si2+Vq6b1jY=;
        b=E1w25YHny1AJRGVNYW78qTt8QgfUcTbK1RntrWXZukPC77/wsdZDvJi9GZdjZWf3jE
         OBz+gO8vt6Bh4LEyLm0FrSG504PUUpaOzxSSmsh46jSmy8XnSO3InWEMfkO1S5z0ppno
         7uMiDLVGpHo1QAnuyrw7330CPAycwzBfw49FlzAxESOtRvthkG8mHhofsRHPjGVGUm3G
         UfbNIVjgvaq2kF49mzHU7gVufhIqIS4Jg68Rd5n5yclLKINTiX+rpKWMksglpu/u98FP
         AA1Eq/I/dBlJN0y2sqvLmwEUchoQtVRrEkVg/nRDNerg1mAkKA2v5VQJjw/CgJyTyUQC
         Ge3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673492; x=1793278292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hNm/9g8tvXvdrBfPLA0jc0/PXVgX5xc+si2+Vq6b1jY=;
        b=Dz7LYmWPU/J+zpCDSetvx7c+r+/hQAGK5ot7KAMttNvdous3Dg5byGvH21r3BlP85B
         iNDOV3lZ/foq+XWeVB9akzLm/bIZ+bJw122H0nTXh2U8q5mOANjh5aeib/gFPa1widDx
         e/17/Xq9ZvAkVeyoXKRCHbeytBly53FZ9Pri7jT1LsvPPBTSwoRwUHFXKFTxTiKaRchk
         xq+yB9ysuywCeRv9trv1tJ/dTeF4iPuhG0ZSoGNxM9k8CzCUVKB71i1JiCRodWZ4TwYk
         w6YMbW2XIoJusiii9Fis07j7e6UWfXMfkLnHZaVS0mhmesLKAyQ2a0vXLKCQYrvxOiyR
         veyg==
X-Forwarded-Encrypted: i=1; AKwUvBx5Z5/cLjQBw5IwGrmzO/t0OmHQYqJRqepQ+SVDOLTa4+qcjb7P/+WI0tNNJyE3eOUYFSkLfCPk1pTgyBM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQrQ1Fc7JLU7SH7WgG/uwEchCRylvFpi/MnIh1QKC5xeUbE1BT
	Qvul8tp5LAU0FliHIZvCmBinKXdFACWvPMFzifvUBc3JPSVtnMrlgLJt1720UYMC
X-Gm-Gg: AYBFou0BiDs52YZ68/if97X8seF00eMXmuKRVMEbTxs19i3fkcygnp13OaVlG77cP0k
	fSd/m46z/X5qHKXuBnxjI5cHvd7xiNj2bo9Q+gaxTMsLbxCMClRAIukKeDSLkhOCUDCbzEhSzx/
	cgmHPq/GSdZoZHzo8sdcg2KaU1PmpEXJ+HmEgvJWvxf7K3SUrJLRRBDLmUBsqZoUfdyMtvlW7nm
	+kyrO/ZAkPZa5GHhENU3wWZYfobQUH3cAvfZbsGJVV2ZetEsjGbiuKYlGe11ihygrL6Rjp5WTVt
	uptlm750L92WEtGD2yG390PweXlY9kTSOI8XFDhgXuIFWZjvgH3j7EMkWA4Re+kqgSxkmNYoUp1
	zCXRTTAYVe9wm8cag6I9jkEjT+bRWqAYGMTk6OgNZO3PGYB4rcbzRf/8gR/DSUDyEN2Ob8B+JIN
	J/s9eV10d/mhF7E74gdW/D8NiVUsEYV+XOALv+WREpnHMDZ6BqWVi/S5+RelKm7HwHDvvneTFnw
	uqw9cARXOxdrpXTt4naqt2ZLnuPO2W51v+0+aGk9/Yog+1lrAyLtBPxRpA25IMLkprhvRuKTL+m
	IYHkdXudrLNiNSE/ckr/cpZKdN54IjiiGBFHqe+y0PYXRvz1NJjMGzs=
X-Received: by 2002:a05:600c:1c2a:b0:4a1:e57b:667c with SMTP id 5b1f17b1804b1-4a1fdd4fe80mr121580035e9.26.1792673491651;
        Thu, 22 Oct 2026 05:51:31 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a0f243sm64112995e9.5.2026.10.22.05.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:51:31 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 14:51:07 +0200
Subject: [PATCH v2 3/5] arm64: dts: freescale: imx8-apalis: Add NAU8822
 Bridge Tied Load
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
Message-Id: <20261022-imx-nau8822-btl-v2-3-b4221ed43650@toradex.com>
References: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
In-Reply-To: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
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

The NAU8822 on the Apalis Evaluation Board V1.2 is labelled nau8822_1a,
like on the Verdin Development Board, and can use the same Bridge Tied
Load (BTL) overlay.

Combine the overlay with the Apalis iMX8QM V1.1 on Evaluation Board
V1.2 device tree to provide a ready-to-use DTB, and mention the board in
the overlay description. The overlay supports both Apalis iMX8QM and
iMX8QP modules.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                 | 3 +++
 arch/arm64/boot/dts/freescale/imx-tdx-nau8822-btl.dtso | 5 +++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 3821e3f16210..0b8f497c5c6e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -810,12 +810,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-eval-v1.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-ixora-v1.1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-mek.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-tqma8qm-mba8x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-var-som-symphony.dtb
 
+imx8qm-apalis-v1.1-eval-v1.2-nau8822-btl-dtbs := imx8qm-apalis-v1.1-eval-v1.2.dtb imx-tdx-nau8822-btl.dtbo
+
 imx8qm-mek-ov5640-csi0-dtbs := imx8qm-mek.dtb imx8qm-mek-ov5640-csi0.dtbo
 dtb-${CONFIG_ARCH_MXC} += imx8qm-mek-ov5640-csi0.dtb
 imx8qm-mek-ov5640-csi1-dtbs := imx8qm-mek.dtb imx8qm-mek-ov5640-csi1.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx-tdx-nau8822-btl.dtso b/arch/arm64/boot/dts/freescale/imx-tdx-nau8822-btl.dtso
index e4b662519a6b..cdbe7bb1ba90 100644
--- a/arch/arm64/boot/dts/freescale/imx-tdx-nau8822-btl.dtso
+++ b/arch/arm64/boot/dts/freescale/imx-tdx-nau8822-btl.dtso
@@ -2,8 +2,9 @@
 /*
  * Copyright (c) Toradex
  *
- * Enable Bridge Tied Load (BTL) speaker mode on the Verdin Development Board,
- * combining the two loudspeaker outputs for higher output power.
+ * Enable Bridge Tied Load (BTL) speaker mode on the Verdin Development Board
+ * and the Apalis Evaluation Board V1.2, combining the two loudspeaker outputs
+ * for higher output power.
  */
 
 /dts-v1/;

-- 
2.43.0

