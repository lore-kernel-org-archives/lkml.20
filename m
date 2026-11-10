Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308361;
	b=sktYip0TSx/QVOXtW4/VZBUOfbEtUWFTMcxNOqGFAOOZiDp1oWi5Ma/dj0arYtKqk3SW
	 zF5eshAhTHn2B+qRSdmoLOpVs2qIOd5xAbIWdE7kwDccaMTLz6Oxg+CdcBszrQi6W0BGA
	 4oDyUwPngr3VAWGivJ2715ClBIE9ycNy+BBx5qy6zJTliomP9FVyQ1T6rlCAz54LW/dzw
	 /AOeyEPzuArojYPByr+LidgEsqC+VEh5LBcaHuBNm6gFF1vjQLUx9I19VC6fq7eDdfFrj
	 oLlx4N/q5feF1x6ZaE22v2BG7obl2qBaLwUrOZo1WzKcCMIJPnGC8ZDZrG8oofV7pDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yGHrtx5n1eB8ok7Jt62o7lZ8pEvwW6QKVgKkvamRcyA=;
	b=ZXJvJ70cTkDTPHC9Qyfy4C2EMkPREczDh3orzHJIe1XpalFnHKIlEzy1QOHtTnNiZLAU
	 ppY5FyoObQqaCj12VJbFWcnMOoHmmA6t6iMKwCgDtkuCd2Ug22wbNRe+D64dm3yTMEvZE
	 mrRr4cyQis0fGmPz87OgcWNRvGg9bn3/bDWvrnKEBQk77LIFmNZ9fBZST3PAnKJ7ilqCn
	 dpOCsKH8VXc4uxOWuXpwfxsafKdejUUejIMuWSM+6tXE3zcUp9f7BiKKLippphyXWLt5W
	 byfG+ppYKXeKzFToMItNenprZHe8B7ITfoAzTUdxejXUCUMWLH1X/J1b0OBmE2dXHoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lTmga4Fy;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1C4606A33D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A1C4606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lTmga4Fy
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1620488f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308359; x=1794913159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yGHrtx5n1eB8ok7Jt62o7lZ8pEvwW6QKVgKkvamRcyA=;
        b=lTmga4Fy7eTigGMleEKBHkLCbqiuAvlDGyTiSr8S5CKWGu0k4ymrnuhMo1bTnE5F+/
         fBHyIKF1bH3IsGbRubPB0xgbkKaBVZIgxcpCzlobZzXmzw2chj30sQ0bbUzRKxlI+sUO
         h9jrYx7gsPIP8/VSEC6jDdL7leqsRttrhkITbtp1XpFuwYS2Ie54BJYuUdPGgiEkVN4w
         huMFWOLnFN4KsKNmJUjzXtp7aTZjJZ5CrSt14Xh2eOaChx4H0xqbWGkNXkVCmPvAmexJ
         EtM2MjYNWWKLenHUaaandzuGIUyJ4xo7VmowVLFvUOVUGyES+2RMW176ZPU+U6HNdNf4
         4qfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308359; x=1794913159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yGHrtx5n1eB8ok7Jt62o7lZ8pEvwW6QKVgKkvamRcyA=;
        b=1GvF6KZDAIjMa7ysAT0pSgVvJb7F7VGTv5e+NcOOKeYeh7eu3CtpsKrAIH7umJV7bW
         tvVlWR8nTFijR4aCSlDmS0iyYdufLt5uaXwgWkql8uBr2xP2SIJhQuzcA7zZVt1KvPdi
         eJ43ab2gGUhcTwntSNG1nbe0JF2fpdkzpIGAsLXyHPFTvitNr+06OncyOahTiEwH9mCp
         58ofZe/sLgOkcmNzqvn/s4AX11ANY4E7f5f/rDHTMKeRbHVnUYmBsoMl8BNGH5UhNAYg
         bgy5fn3gM69N/QOHh82G9W3iVByzcfLFVWkfgtMraLv41ttmonlpidMy/HevKXo9bCDf
         pyhg==
X-Forwarded-Encrypted: i=1; AL+hErGNJWUmBXF1le5lQ4a+O5wG8E5sWzio3YtGcqqQZkRClYUAV2jvNqq3T23Gcr8ceaOeqtuLZZfOyDuL9l0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YR4iO/9Kgh1JnDilfu11IZuJBZGPdfg94dmBM5tNWgd7+AjES
	lBfgl81CHiMY9cfnJJZcoEFS+SfFLy47rxIs40QWpWKs4uiuw2Qsm+Ba
X-Gm-Gg: AYBFou03XjKOdXRSC/kZJhQUrZpXvFKC4VRmA4gnCqPPV3yj/7uks5Js4i5T4/MKRm5
	C/05ABZRK0yuKWNFHqbd6W5ctuPdJr7wKnqUJy5j7IG2tBlcBdBO4/1pS7lljSolrYUsJrym7+L
	85YMKoaLnV0zceJ7noybiCTB8YPVuUArNkcn9DSme8ShTigT6aX6FQLjRoQuSP/3LwNsPqBbD/U
	exDbSpbCAIdJpI4stJh6KMiIma2H1oEIXKuozDybbKvm/qW16pZaQC8oGVgctgtiAt8lZEqpBoQ
	Pk/3d8ilKAfaE7CF1kRco5Q2mVbYZGKZtsqMvTEXU8+D5aQMBi5hxy+Ko53lMLAVmXB4CASB/GI
	0M+m5n0cOAiAra4vAdsWCvdwQLQEXpkSoL454ROI/td0nxp0CA+Qf/8IQTRr7SVEsqnMw2rR1xb
	XeQERRViymtq3VFIX/z8/GzPy9XBaAjc6bf4wGNXJuvdlUb4ietej5iDZSNh/OzVZdl5qKMH86S
	DNIuvIcFCqwzJkmMTaiojDiXFKFqrRMhfKgfqtFWedfK38w1TZlOBMHtvZoESRy1Mxhk+G3tadb
	OKQ6/5DXB9ljVNM2o3sKKy0hs+bAH8CawkgqbudNNWdc4a18ysOQ13lFMyQbDQxrfkuit6vA/M9
	54a/iMHB5PDYZ0Mqh9bZoF/6zC7bjcTsoL22ghSPUUlxluxNRyhk=
X-Received: by 2002:a05:6000:25f1:b0:491:9fc1:e6c2 with SMTP id ffacd0b85a97d-498318067demr3878592f8f.51.1794308358680;
        Tue, 10 Nov 2026 02:59:18 -0800 (PST)
Received: from [10.0.1.33] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm2933551f8f.20.2026.11.10.02.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:59:18 -0800 (PST)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Tue, 10 Nov 2026 11:59:14 +0100
Subject: [PATCH v2 2/6] ARM: dts: imx6dl-colibri: Add HDMI DTBs
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
Message-Id: <20261110-colibri-imx6-overlays-v2-2-9776c186d953@toradex.com>
References: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
In-Reply-To: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3399;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=GHGYqwad2/GX2e2ukD9rodYOQ4ugyd56E1reFr0Fgm8=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsj69JM57YwY/5OWw3N9bT5oSubGevhsdjy4tI1LkOPaQ
 wvJBUxiHaUsDGJcDLJiiiwZT1QF+RRCZD04mpNh5rAygQxh4OIUgIl8bGH4X+f75cqef15Gzrnf
 na48MY9zdskKWCCp+D3lskzszPRvvAx/Re6HWVxjT55rznBBo/CW/kR2pdtzg98nG09brFqn9aq
 ZBwA=
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899

From: Antoine Gouby <antoine.gouby@toradex.com>

Combine the generic i.MX HDMI overlay with the Colibri iMX6 carrier
board device trees to provide ready-to-use DTBs with the HDMI output
enabled.

The HDMI interface is not available on the Colibri SODIMM connector, it
is exposed through a dedicated 24-pin FFC connector on the module. The
FFC cable connects either directly to the Colibri Evaluation Board and
Iris carrier boards, which provide their own display output connectors,
or to the Colibri HDMI Adapter, which provides an HDMI connector and can
also be used with carrier boards without a dedicated display FFC
connector, such as Aster.

The DTBs are provided for the various versions of the Aster, Evaluation
Board v3, Iris and Iris v2 carrier boards, including the Colibri iMX6
V1.2 variants.

Link: https://developer.toradex.com/hardware/colibri-som-family/modules/colibri-imx6/
Link: https://developer.toradex.com/hardware/colibri-som-family/add-ons/colibri-hdmi-adapter/
Link: https://developer.toradex.com/hardware/colibri-som-family/carrier-boards/colibri-evaluation-board/
Link: https://developer.toradex.com/hardware/colibri-som-family/carrier-boards/iris-carrier-board/
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile | 40 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index d03a8d2845e9..c72920658609 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -60,6 +60,38 @@ dtb-$(CONFIG_SOC_IMX53) += \
 imx53-qsb-hdmi-dtbs := imx53-qsb.dtb imx53-qsb-hdmi.dtbo
 imx53-qsrb-hdmi-dtbs := imx53-qsrb.dtb imx53-qsb-hdmi.dtbo
 
+imx6dl-colibri-aster-hdmi-dtbs := \
+	imx6dl-colibri-aster.dtb \
+	imx-hdmi.dtbo
+
+imx6dl-colibri-eval-v3-hdmi-dtbs := \
+	imx6dl-colibri-eval-v3.dtb \
+	imx-hdmi.dtbo
+
+imx6dl-colibri-iris-hdmi-dtbs := \
+	imx6dl-colibri-iris.dtb \
+	imx-hdmi.dtbo
+
+imx6dl-colibri-iris-v2-hdmi-dtbs := \
+	imx6dl-colibri-iris-v2.dtb \
+	imx-hdmi.dtbo
+
+imx6dl-colibri-v1.2-aster-hdmi-dtbs := \
+	imx6dl-colibri-v1.2-aster.dtb \
+	imx-hdmi.dtbo
+
+imx6dl-colibri-v1.2-eval-v3-hdmi-dtbs := \
+	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx-hdmi.dtbo
+
+imx6dl-colibri-v1.2-iris-hdmi-dtbs := \
+	imx6dl-colibri-v1.2-iris.dtb \
+	imx-hdmi.dtbo
+
+imx6dl-colibri-v1.2-iris-v2-hdmi-dtbs := \
+	imx6dl-colibri-v1.2-iris-v2.dtb \
+	imx-hdmi.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -93,13 +125,21 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-aristainetos2_4.dtb \
 	imx6dl-aristainetos2_7.dtb \
 	imx6dl-colibri-aster.dtb \
+	imx6dl-colibri-aster-hdmi.dtb \
 	imx6dl-colibri-eval-v3.dtb \
+	imx6dl-colibri-eval-v3-hdmi.dtb \
 	imx6dl-colibri-iris.dtb \
+	imx6dl-colibri-iris-hdmi.dtb \
 	imx6dl-colibri-iris-v2.dtb \
+	imx6dl-colibri-iris-v2-hdmi.dtb \
 	imx6dl-colibri-v1.2-aster.dtb \
+	imx6dl-colibri-v1.2-aster-hdmi.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
+	imx6dl-colibri-v1.2-iris-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
+	imx6dl-colibri-v1.2-iris-v2-hdmi.dtb \
 	imx6dl-cubox-i.dtb \
 	imx6dl-cubox-i-emmc-som-v15.dtb \
 	imx6dl-cubox-i-som-v15.dtb \

-- 
2.55.0

