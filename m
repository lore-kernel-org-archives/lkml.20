Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308361;
	b=pSLTOV2JMhsz2TtbsRE24iHgIzlU8/pqL6OMyFEhveR0iACizUGguCPNE9VJJpWa1b4a
	 7rXB3tY7kxVkDxzAWKCheeloHKQc+REzVBOIkA1ycALS+53yF0lbm738xnDxAO7Xq8rtt
	 OqwzD6JeFDrYjqX1wc3pbt+La4ViVukzhivWoT6If0Yn110ma56HQ54oPuOUPM/0HJQyH
	 1DYip10lYG/XttzLMsXTLG2TxYNJNYYyquC5MxNbAJLsjC+17SQQvfXFxzhMpl5mw+XFg
	 ohFVH8qGsALTVFOngS12vN2jlGCJd1s3bEyfAkWF/DJ7hdXY3ximbMfw8Go4gOeHTlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=DcCGiCjdU5FhG+TlgbR/2iRKge2AOKDzUhGWjXjUD5k=;
	b=z7YurCkJiK+W6NJPK2SEdMWC+MgHBrMCNjeDeyEcQiiEB/gFCU9G1K/rW1fGIFJRpCEx
	 P2SQyY8hu/OGRGyRs5wpPCM1l79lB0y22UwgDIPQQLGl7xoO6ZqlUeOHghL+48hBLXmJB
	 rTNhd8XybWsWNTXQLjHCbgWKEgi3nsXSLpLC8hiRM9z5s5XD1fgMFN9GFrwdEUptmpugS
	 S9s/0f4RZnNgLwceNZBs6Tkapwisj3eJgGn1ORFlw2Hv4+MFQR1xSgfx12+ntBJEvNAvN
	 CPWtHpqyoLQGSQMZaxUrzLjP0+vaqwB0BBMFiRWz9s9n6xSxkAjodGm8KMh8NRviq1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sYPFUQL8;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED1D60A260F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ED1D60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sYPFUQL8
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-49318428d98so968459f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308360; x=1794913160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcCGiCjdU5FhG+TlgbR/2iRKge2AOKDzUhGWjXjUD5k=;
        b=sYPFUQL8KhHWwwBwpSiKrGpg/EFlf7rGKp16C+S8jxeAbugj8PvaRksDGmAfCvo4aR
         cHv/14lzspXAO/W+x/F+cEdtbTqiAUyo2zxC0nIhKn+ScHmCa4/3aM9jBnf2I+nyhNVf
         aTIiAeyp2iNzAd5xLOnuldBU3GjTvUl/FGe+xRVkwmQkFgP/dR2Z6juPCD2p0/GCUvHj
         NhPdyL/jSe6NUoLXUFRC17x7HNUlqTdWtvoiFlVWWf+7CztRmxfGtvBirL7iVGX/RbLE
         SMWcibvUiEng4bkWUAdu1mhWP4qt5KC3YZQYCRLBKRNEI4hPOEb6IlKn0xHOPKfPRsU8
         N/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308360; x=1794913160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DcCGiCjdU5FhG+TlgbR/2iRKge2AOKDzUhGWjXjUD5k=;
        b=B2NGYB5qPZWGSuhXWqHTS0m310SvxGQnzqbf2w3IpBzwMK/z/qVXdLgM8r++hNSu7S
         xZyOcqsbIVKj0uxnJKKElMt0ICEz5i2hwjlfQdgAjVF/XCZx+2D9Kv9Rsp3BJm5I+5ki
         pqJ5bqNRwfxttbRfhsdRmpmJcPfv9UeZtIHOjpREp+O82x9vQxGm3XkDPIjnBFBvSYR6
         uzzP3mb1v01OtjfFLLOYpWDZuu2xNqFKceeKjEE8R03GNrp/IoBYEhVmeO9nxlJg0bQ6
         d77JK1tS9lpiZGjiG4Jso/iUfsjSRx2P1fXG3pL0Yn9dCvt4H+xxqNGsUHDPArDDcYQw
         UlWg==
X-Forwarded-Encrypted: i=1; AL+hErEHy3EaqcjdxZurGGzdT1iSdgn65DHjx7JIsnUR1TsErjCPioILV5HC2K5HUq5vTVWZKO9vLh9BXXoruYI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+l69TZcp/TROp5Pfj6HBlpRAhWQGdZuOz4ElMBnGMuNeY7Xs1T
	bBnQnK5oOgNxZLC/eFN8DlVlA/CyXR5C7YDZgwa5rcpzSQuBpDDTFTkc
X-Gm-Gg: AYBFou3UJtWGFDjcwUPnfXu7d6cCtE2nDKNFXpTdPoI3eNqeFm2jqTrv8QTBLxrCgoy
	6DXvO4DS2Bho2oIJaiGlQ58TfB7przWPjA1SwBFUTZCqE2F4tLpU37WvPDaFqRI47emgFhqOg3l
	8hve4LirN4TQBZAP9pturhp2vFlv9SHxkkdkhbbQZCFbyfCkmeFzzro3gPykUWx35x8HvaGlrFU
	JckGDLq5I4d4e1qmbRr2+N1jr8cdx8TCFWcNZTZWNOpDfEEEir183Z/NDAfy+xLaQOf9oJrc0Ae
	r9rfVutwPMZaycpLvhwk/7XGnDAiGJl5tSKhDF8OYoX0ed2T1x9yg24+etOYVN/TcSkSlKKG3QW
	xl6vc9JqiDjD5R3FYfARUG+O5XjYm2WZhzkbCho0h3nQqKjs0n19JGWtboQCHqqgvo03rnTW/H3
	Ohtj/tpeSWqopjhr0gnJFGHzzqcsUAykT4lBCD6qZhFNUThyiObnh0Vo1P+3vLhzYP0fxNxa9HI
	kAKV/V8XWBZpjzUs4RF/VAi7Jt/lVnzmqIN5eV853teF+u06DtpzjWqHsg6y+qzyKX7Q3K5XZpd
	19XEqPdqPURCdNiQNdfysMLA1uxLWSLQX9BK7uh8wLLk7nwPSHuQBV4jyv9Iuq/hwSY+BA0GP+L
	pFFFPUiMA2PYUYCEFvcqm/EXp6P6gbEqnEbrcbLVpDLrycGkMbiU=
X-Received: by 2002:a05:6000:460a:b0:48e:4300:c6d8 with SMTP id ffacd0b85a97d-498302fbab6mr3856100f8f.35.1794308359531;
        Tue, 10 Nov 2026 02:59:19 -0800 (PST)
Received: from [10.0.1.33] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm2933551f8f.20.2026.11.10.02.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:59:19 -0800 (PST)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Tue, 10 Nov 2026 11:59:15 +0100
Subject: [PATCH v2 3/6] ARM: dts: imx6dl-colibri: Add Toradex Capacitive
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
Message-Id: <20261110-colibri-imx6-overlays-v2-3-9776c186d953@toradex.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4169;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=9wYjQMWgGZ2miySG/qhMsDxpWS6y2NDDR/Qv0+L/cjs=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsj69JPZ7v7UNSkCzt9e1x90ORjV9ayX2TmIIUc6YEG72
 W6z17qWHaUsDGJcDLJiiiwZT1QF+RRCZD04mpNh5rAygQxh4OIUgIn0zWX4H9Bddcuo3tVz27J1
 Mo2OB/Oak602q93+8sXxdsvO9OT1Pxn+F78VfSQR+dDLLLNr6WPD/S5VLrdk789W27ppytwHFlJ
 r+QA=
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899

From: Antoine Gouby <antoine.gouby@toradex.com>

Add a device tree overlay for the Capacitive Touch Display 7" Parallel
on the Colibri iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHC 7" WVGA TFT Transmissive LCD
and the touch input is provided by an Atmel MaxTouch capacitive touch
controller.

The touch controller is connected to the Toradex 10-way Capacitive Touch
Interface connector available on Iris v2 and Aster carrier boards.

The touch interrupt and reset signals on SODIMM 107 and SODIMM 106 share
their pads with the WEIM nEXT_CS1 and nEXT_CS2 chip selects, disable
WEIM to avoid the pin conflict.

The overlay is also combined with the Colibri iMX6 V1.2 Iris v2 and
Aster carrier board device trees to provide ready-to-use DTBs.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 | 11 +++++++
 ...colibri-tdx-panel-cap-touch-7inch-parallel.dtso | 38 ++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index c72920658609..7f527e2b9090 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -80,6 +80,10 @@ imx6dl-colibri-v1.2-aster-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx-hdmi.dtbo
 
+imx6dl-colibri-v1.2-aster-tdx-panel-cap-touch-7inch-parallel-dtbs := \
+	imx6dl-colibri-v1.2-aster.dtb \
+	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtbo
+
 imx6dl-colibri-v1.2-eval-v3-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx-hdmi.dtbo
@@ -92,6 +96,10 @@ imx6dl-colibri-v1.2-iris-v2-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx-hdmi.dtbo
 
+imx6dl-colibri-v1.2-iris-v2-tdx-panel-cap-touch-7inch-parallel-dtbs := \
+	imx6dl-colibri-v1.2-iris-v2.dtb \
+	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -132,14 +140,17 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-colibri-iris-hdmi.dtb \
 	imx6dl-colibri-iris-v2.dtb \
 	imx6dl-colibri-iris-v2-hdmi.dtb \
+	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtbo \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-v1.2-aster-hdmi.dtb \
+	imx6dl-colibri-v1.2-aster-tdx-panel-cap-touch-7inch-parallel.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-v1.2-iris-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-colibri-v1.2-iris-v2-hdmi.dtb \
+	imx6dl-colibri-v1.2-iris-v2-tdx-panel-cap-touch-7inch-parallel.dtb \
 	imx6dl-cubox-i.dtb \
 	imx6dl-cubox-i-emmc-som-v15.dtb \
 	imx6dl-cubox-i-som-v15.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtso
new file mode 100644
index 000000000000..13b4888e07db
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtso
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display and 10-way Capacitive Touch Interface connectors
+ * (as featured on Iris v2 and Aster v1.1 carrier boards).
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
+ * https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
+ * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-parallel
+ */
+
+/dts-v1/;
+/plugin/;
+
+&atmel_mxt_ts {
+	status = "okay";
+};
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
+	compatible = "logictechno,lt161010-2nhc";
+	power-supply = <&reg_module_3v3>;
+
+	status = "okay";
+};
+
+&weim {
+	status = "disabled";
+};

-- 
2.55.0

