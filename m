Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678187;
	b=O9t0LRX6HHXWBYgBwh5EYsDfqU2O1pV7hhf2zJhX+Sw/FLcqObyyrh6shuIMNztZkyQz
	 asUQTLX/ww/8ddhok3O0okXGhrPHekxg8EKEcZHJHwaIxSwt931orXYeSJzr9dEBJxEjq
	 XpMETAlVZjrvwX1P3R1JofTSZ74Mv46r/nDzoFXR67Urr/3JBiOOvpXvZZUrMadg8+ZH9
	 HsjzDlgfIfTz1+JpUiyhfDSb32C9aYnMheC31LMhiHWNi5xNnCzGTZKYe6mT5GoxfiQ6J
	 /O+T3c2yvim7uMS6g55DoXzs8EkJqhgJdX+NC8wxoPNpIKuEIoL5vi0eAO1sp25bEkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=r+j0RfWA0Q1IHyR7Tx9qo6ls3aMcfhBj57nHBiaWQZc=;
	b=ACPldl5ZrmZhyz+kyCkeuVxqdcVIZY+6ifzJpSyG0atnh3AJZzVCd0As5p7ruAyXmBdE
	 r3q7jn3/jg/zzVvLRGVV7m1Xdvda0ekG8LGEPCxmXpnQWs8ddR0aGc1SNh+Y5Q/3gWevg
	 5SliZYan6rrAoJ8P7p9vB4krTY6nszQlbh5SRIozxOfoJe8OfvH4FOthPf+jVVvAuxiEd
	 6tE+ovUrG8RQOMcrlZv+LdPi2GruTMlyhR1w0v2mNwmRccMoCoYp9D8bGWmjGD34wMbnV
	 lE8uoXIfb1eMI/rBoyQeKiqOQ6MctkzMVp+uou1ieFI0LiiH6ZIfNQNbMzXlL3DVUdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EDS4aJcD;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D93F60A263D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D93F60A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EDS4aJcD
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1304367f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678186; x=1793282986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+j0RfWA0Q1IHyR7Tx9qo6ls3aMcfhBj57nHBiaWQZc=;
        b=EDS4aJcD3WiN66YWFmgPoy9hK0vnQVgM4+r2VpsRsALkG8ac3lWgRuehUinE+BzZLo
         61EOC4tCe0kA49OFMH4WBg+k2eDfZ8yPkdwNq//Hi2HQCx3BAvXEeDdD/upzzlG45/zD
         ihh/VW6L2oZqX5/WKMVfytcmdGNanogXDhENXZo6CzquFxeg0D1WTaySQK+Vn5ddj1vQ
         i+hZh9I6XzeRIMoFVsLFE2o9eKVwRoHq49LMphlnnr/Q42JH1ObODKPCVI147Qnc4ER7
         Ehlx9az3k81dpKnA2GRRrNtgsoOR0NJ/99Dca6Ml8PbudZTNSI16RA9nvfUOQnOCTjwY
         zb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678186; x=1793282986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+j0RfWA0Q1IHyR7Tx9qo6ls3aMcfhBj57nHBiaWQZc=;
        b=0x7bEJ4dWyU1puyQjTrI1BDdOzzaDMHg3Tbyo4eK1/Gc3zSyuw2pBqbGnbwRCcgePE
         l23PSbllnXv+ukoYBnP6mrdG/+CZ1ldQLZR1kni6yI1c+7XrzdEu+Kam/h+74Phxwr10
         57iEGWM6NyN7Slw+pv4HA7Pznw7Ifhx6EyMC1v9N2ANmGSbduI/MvhRs2xzVQLF2PyFr
         uh621SA3uNQgZHevQXTix60029iG2s7hxnymOHkOsdl7XLKWAsz8LzN9LkLX2NkIXGxh
         /882D+TEeCtQeX6VZ3VJntiyUmn+tfdYB42E1cox6niNGC7gtbkU4CJlwSWNfhSjvzWI
         Y47w==
X-Forwarded-Encrypted: i=1; AKwUvByh78n0PtXYDRMGSNRThohK7t4Ugvn8nKvWlfysffXXk5YFBSy8BaNCiY83G+iyBuk/X4uNzW9+BGjJa+A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiAbYtqQ9xXzcR+odv2UCmYPLa2Vm81y2yVgVMMkfz5oZyyGYv
	4RR5dbq5XwyKeKU2nnNBisgeNM2eYcLzryMHlOR2Ca4BO15wtGJnnAHp
X-Gm-Gg: AYBFou23tZnN4DVRe876f/Zp4sNVPC/OCOWQoDbryzzEBnShc0aZeb6achXFYUqyUlx
	PEP2qRD+EM5iJqSt9yfZd4dHWx01d1Ya2q4bvtrfI0zpExZsWyYWZ3dhJSCRjDbLZYVsmzzAETQ
	7x7+SAZXHxIhE0rn8wvaTvXXDkyl6cBTlOVR2EZIdueoBi1t45ehuErXf3MOWPwfkrFy+4o3c73
	ZsMWuXaxSrAjwJ18SBX1BMa4RZV+Owgurdi31ruabmLg2rHvHt7oMQcTSjVVyrR+icNiWq/MB/s
	OTQUS/x84UhIb86sUhpd/1FXG/Zlqrf/OSdcIhqHNzVd/umZy3TmexWYDZesdS33IfbiXASH6eZ
	aLWPcslE7z0Iynf6qoR4EuhY5I4MA2gFdrFvygQnmoF0KRfjF7PnRldeC+CGIvxpYC3LCRtwZ6Q
	z2aiXkawRtiDmQo7PATXXjks/01sGTtElsY8ZO2DZV2fa4RB+ji5Ct1gtoOm3SQnin3J7y9X1Yy
	+UU0MFI1ajyhe5JxFe70ZcL3K9grdsUkP6HAwJvCb8kB0aINE0sIDncgrQ3FqdnqtDX1MkXIuyY
	6ZWwkkDBKdyM4M2H/wvFP0zJcgccsrtVOIdhcgQPzbCDLfuhR9v+BI5c+zGPbQPFL3QuOb4nhUI
	d
X-Received: by 2002:a5d:5e88:0:b0:48e:f14:61bd with SMTP id ffacd0b85a97d-48e2649d869mr10539606f8f.14.1792678185088;
        Thu, 22 Oct 2026 07:09:45 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584e760sm12368150f8f.59.2026.10.22.07.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:09:44 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:09:37 +0200
Subject: [PATCH v2 5/5] arm64: dts: freescale: imx95-toradex-smarc: Add
 Cortex-M7 SER0 overlay
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
Message-Id: <20261022-v1-imx95-overlays-v2-5-c769d6eb54fd@toradex.com>
References: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
In-Reply-To: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
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

SMARC SER0 can be assigned to Cortex-M7 firmware. Label it uart_mcu so
the shared imx-tdx-uart-mcu overlay can reserve it, and combine the
overlay with the Toradex SMARC iMX95 Development Board device tree to
provide a ready-to-use DTB. On the Development Board this removes the
Linux RS485 port on SER0, while the console on SER1 (LPUART1) remains
available. Firmware must configure the UART and its pads for the
intended MCU application.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                 | 2 ++
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 12786932858a..68db39369e45 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -972,6 +972,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-navq.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-osm-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev-ser0-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596la-mba95xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
@@ -991,6 +992,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
 imx95-aquila-dev-uart4-mcu-dtbs := imx95-aquila-dev.dtb imx-tdx-uart-mcu.dtbo
+imx95-toradex-smarc-dev-ser0-mcu-dtbs := imx95-toradex-smarc-dev.dtb imx-tdx-uart-mcu.dtbo
 imx95-verdin-wifi-dev-uart4-mcu-dtbs := imx95-verdin-wifi-dev.dtb imx-tdx-uart-mcu.dtbo
 
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 641573c9943e..f3504b40ebb2 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -619,7 +619,7 @@ &lpuart1 {
 };
 
 /* SMARC SER0 */
-&lpuart2 {
+uart_mcu: &lpuart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
 	uart-has-rtscts;

-- 
2.43.0

