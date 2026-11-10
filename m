Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308364;
	b=a3rIy76/HTu1MYSsw/pMlxDlaQMzMo8nqc/0L3fVzTzDu5K8ymoLbTqRgbhRgXeBQjvI
	 jicQTe5ScOlV+qCQWS11Oj7Ru7S3+QAZ6hwsxVvcp/Yp4bxFJptcXfiM3/BKe7o5yLnCG
	 QUD+ZFt3d75vaSLRW3zkBaLd/6QtTnUohwrAX3/hzgVK25ZJZpp0fEGCeeq6wAgodR/E1
	 VNzYK9IyF2zeQ/+TEFS6KS1ipjuCoo5uJt6pVc3HRJI1sdfq1cFZ1rhVtmRqGCXudjJ/W
	 kFBbVM72ZvobnOybdioxG4SPGFm1DQkLWniUmCrsgK5d62mBzGdw5R//Z8cYNaM8wLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=38DpxKNBFRv9O6F0NQQ3cpvR3/Umf/+Ahhp81L3VJd8=;
	b=AUR1MYoIYWZ0rtSDknBNRNd6ynzpfzj9zzqNw04wVvH4yvQgtnhhX0DUUenh0OUPIZFr
	 eDEQYfciqB138Eo9tvRahZhZ5Vir8FwXjXpyXHWRsjPJ0yoZjNwKz2uHNmZ5Y6/RFo0ei
	 fwQLUkm5j0X4Clr+XEJvbXCHOXv+3awifsNvZbYSIKWZRt/m0WagOAOVbk16D/cDrt5Ir
	 UsR6st9ow4pazDxX448VtbCHwzq5TB3tqrUf0rPqopTiIYRUsSJndloeBH2G5qyePp//3
	 Z9poUXY08hdLVfwJJDkQ7ryo7bsagNPm3WrHoPhlCATBDl7zPRQzhquHHlBuoTvUu7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AdCa5cEb;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC6E60A2616
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:59:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FC6E60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AdCa5cEb
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso18999515e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308361; x=1794913161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=38DpxKNBFRv9O6F0NQQ3cpvR3/Umf/+Ahhp81L3VJd8=;
        b=AdCa5cEbsoozxxGzWLhcAd+U90TFNfDab9q9iri6t8NURGqN/2Ivz/dOroygzRPXUM
         mefwG7O1UaH358f5IvgNL/dqN3U/PW7HhT71qH4OFPeOuuGbbgrGNBzrLw5CRpW12Wha
         zpDrEH6h6WI8C2FwbyrTWJvTAbgM6u/qrzhIOhcui7R+muK7JFJjtr+F/TGMwtJhn58n
         2K2OiPYJyVw91xn1fOD7TjKC4PgYMPZD6NVBaM90Ww7t2eDsZUu01+MyYgvLrOk8Ez0R
         3jvw+Y/kP7WzY7O2qJKuNUTqZ4fWr79VI/qW4zG76LLM24wrtmeg9af9tSP6PqAJqrYm
         ZWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308361; x=1794913161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=38DpxKNBFRv9O6F0NQQ3cpvR3/Umf/+Ahhp81L3VJd8=;
        b=xVwMPz5esFp4MxG58uH/AtH5Bj/yy7NuNgR10dG+nfK8b3ps346jiu8e1dNC76Ge8E
         5jgez5s7GBTk4jZffkTIUIxjJeNLO93asx3FFi/b8zvbHSYm49YJT1CkXn8ACbP+dHG/
         N/P67r+nDWNErCdsGSeky2Mzo1mlleOzEWp15xAwXeOfuqE6qo4hUUNY6haMH8b/4Vb5
         i0g/J+K1UwRtwcb1dwMOF7SqCrk/q8NgMntDyYX4XrBbKoocA7dddhKteCRHhdDjgBAp
         t3AnHkT/HCMAgBkYxwUS9xZBwBrnfLhEkpwwGOSdT1J+5ivUxKs09yl+FTutPeVXUcUe
         4EDQ==
X-Forwarded-Encrypted: i=1; AL+hErGappowQ4KhJxg5im/n7/Lq2j1BW/XK5wPvcT+DdAqeFw40ApJJrAsHaKnwgY0Kd8IrHa78a9VuetGWaRw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5ZbxR3S/vcblUhf2t+W/ycG211mNFBi/XD9SGN3tR/QVfm5DH
	J1VsiDFSRnjqQVMRk63dSbMgvKDfGeF14ENkHEx8YyYLC784+bpW4y6I
X-Gm-Gg: AYBFou0v45jfX9PS/Ha4z9TkuLawTJQPmpqsWs2Ek2v1GMJkWVd7X9OIN70leqfxt/X
	/gcftYr5b0NXNIihia1+uBuj7lcrqKOM9SPywRsLiTyFHjgkOLqncNDKYV/tGeX5U1gu3MF1Jso
	nPum4L+iGYU+Pkr7/4UAOl5w7uUL4D0W+g3EruRejiNLftmK47oZT9UQBAC+POWM2Jvji3uJwvK
	XKReeaIAAoroydttDf3n728L0315FcDceie2boFc1tllwaj5HIE/BCuNSzgg9wJgbRQ9eUxUotX
	sZSi5mwegubHSuwbK3Y+LeD/gefjBQeaiU9tiPxla531oCupU1hFMA9xrnKj0aOtXojnve2J3uF
	h2uG/2I6OXrBQojWZ0ciPetSwAlbf/cT7SazqXNPIy79Cd+F21GQbzFeX7bXjHhzZCMMxSBOb8l
	c8ieNhlmkHa3thGngL1KPVNlg6ble+n+xJBcv/2fQlt5O9TyKcRkVHJxfK/7iXDTt9dwPRoaBsZ
	ZmbCSMyNq+TdyGCzWvEREy+n8V/kX6zsX9w7YR1Ily+/oZMjeIYnTkCNhy3z8TyZTX5Kw60osu2
	8oXN/XUvqzC1afn4CCBWXEdHI/BX/9gd4/JNiex3AToIw2Ied1om3YBgrRp9E1Alasi+riO0K9/
	4ROEjIBr5eiVelYgj7TvEeA9EShNCKcTVJSSJLhsogKr8u9zpz5Q=
X-Received: by 2002:a05:600c:c0d6:b0:4ba:6d8:dfaa with SMTP id 5b1f17b1804b1-4ba06d8e3afmr12626575e9.12.1794308361498;
        Tue, 10 Nov 2026 02:59:21 -0800 (PST)
Received: from [10.0.1.33] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm2933551f8f.20.2026.11.10.02.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:59:20 -0800 (PST)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Tue, 10 Nov 2026 11:59:17 +0100
Subject: [PATCH v2 5/6] ARM: dts: imx6dl-colibri: Add Toradex Resistive
 Touch Display 7" Parallel
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
Message-Id: <20261110-colibri-imx6-overlays-v2-5-9776c186d953@toradex.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3298;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=TCfvQZMlT2FEQWtnKqizOTemtEj324CkM8hau8ASkwU=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsj69JO5eZ+T8KJ/kwVPP/owd6nwBm69uJ9cP/uzLjhI3
 vufdPFfeUcpC4MYF4OsmCJLxhNVQT6FEFkPjuZkmDmsTCBDGLg4BWAiHR4M/wxYTFMzp29os1Wa
 vTrj3+FD+++2xXVydaj/M2q9Lxo4mY+RYULf8gXJff2Z16d9TN1+Pdp6ytPbHgzfX22/uXzrBn3
 WlTwA
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899

From: Antoine Gouby <antoine.gouby@toradex.com>

Add a device tree overlay for the Resistive Touch Display 7" Parallel
on the Colibri iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHR 7" WVGA TFT Transmissive LCD
with a resistive touch, handled by the touch controller on the module.

The overlay is also combined with the Colibri iMX6 V1.2 Evaluation
Board v3 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 |  6 +++++
 ...colibri-tdx-panel-res-touch-7inch-parallel.dtso | 29 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 02d21d62b370..c15b09c058eb 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -92,6 +92,10 @@ imx6dl-colibri-v1.2-eval-v3-tdx-panel-cap-touch-7inch-parallel-touch-adapter-dtb
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtbo
 
+imx6dl-colibri-v1.2-eval-v3-tdx-panel-res-touch-7inch-parallel-dtbs := \
+	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx6dl-colibri-tdx-panel-res-touch-7inch-parallel.dtbo
+
 imx6dl-colibri-v1.2-iris-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx-hdmi.dtbo
@@ -146,12 +150,14 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-colibri-iris-v2-hdmi.dtb \
 	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtbo \
 	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtbo \
+	imx6dl-colibri-tdx-panel-res-touch-7inch-parallel.dtbo \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-v1.2-aster-hdmi.dtb \
 	imx6dl-colibri-v1.2-aster-tdx-panel-cap-touch-7inch-parallel.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
 	imx6dl-colibri-v1.2-eval-v3-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
+	imx6dl-colibri-v1.2-eval-v3-tdx-panel-res-touch-7inch-parallel.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-v1.2-iris-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-res-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-res-touch-7inch-parallel.dtso
new file mode 100644
index 000000000000..331c81332081
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-res-touch-7inch-parallel.dtso
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Resistive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display connector.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
+ * https://docs.toradex.com/104498-7-inch-parallel-resistive-touch-display-800x480.pdf
+ * https://www.toradex.com/accessories/resistive-touch-display
+ */
+
+/dts-v1/;
+/plugin/;
+
+&backlight {
+	status = "okay";
+};
+
+&lcd_display {
+	status = "okay";
+};
+
+&panel_dpi {
+	compatible = "logictechno,lt161010-2nhr";
+	power-supply = <&reg_module_3v3>;
+
+	status = "okay";
+};

-- 
2.55.0

