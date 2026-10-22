Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678185;
	b=xdji/aL1Ndsk2+8Iq9G2a4ccJNACLS7SjODBlZsKw3tCuQWj2IEpNB5xSpfJ3vnQDvcj
	 lpCoLi9F/QOh3E1vnmxSw94dJxBalj7lisYCBBIRzI/YVBg6nVBHZsV5CznUGAze+BM3V
	 +B+2UVhCc+HRYypYTjI41baxg3/eyxLXSltDHn+8Hgscy+Z7ZaT+YHnR/yQ4JfUznusFw
	 LHAzY7iYUDaBzrW+7W/jNLx7nU4tqBaQiuh/cVxDGOFuXa2mxMiAygAF9vqgZ/zwt+qVG
	 /L1Fw2xv03sCOajN0zrROqFj4ahJXeGP9tIaa+rRjKXHgFpBri97NFpEW2B/82DFiVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=WZHUSThoPU0ne8Qirrakt2mvv8fxh4b57S/T0d1mLFU=;
	b=CWuppH+y30UrhUwkpq3o6veikQTzaPJlIg2nS5sqaJuwzjBmXrWCPbho1dqjbsKdI+5K
	 zdp36Tj2vNDbNt+z4neBF3Yb3rLZUVKZAH2IQWnIEBdZGCOzjFjNvjZJzLEy2sy5pywdY
	 +Hjpgjc16OkLHFcMu+NURvUj+Q1l9ZhD+BXt28r2Jynoel3RTp+BcX3vSF1kDLY8fbR8+
	 cJ4t6uPQml4PTEyvWO9vFnQdSjvMAQdW8DJDv06fJQlfptRpIhvf8fNNu4u98glBe6OJK
	 X3DTqGOhB1STFqroAdRUZpXmvT1AB3Q55uVkf1o6tdK0s6XYMrBmv6dAY7LvkEdKWsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NKjmwar3;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9829360A262C
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9829360A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NKjmwar3
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so1170102f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678184; x=1793282984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZHUSThoPU0ne8Qirrakt2mvv8fxh4b57S/T0d1mLFU=;
        b=NKjmwar3nMYqLNb+mXC0AIhL9GT8xwwwHPCI/XqMyS3iTobOmCLGq2Sx2OPgenhN9j
         twpAj0rcnEfmJ+RK61T//29znb/QlKZVqWO7GRhW4h76aWS7Dhjy0OaE3FjVdfQ1Z2P+
         mp3p06n9dvMNC2OoZEnY5Us3DZnc/P5gxfT3xhmOdJm6jRVdl/92bdCmby2Hi8DxhaJm
         idBHvRAeT/DdbGCdj8X5h8hmV86nfnd+66sd6146a41g91c+/y5jN2uxwolWEuIcMFyX
         3uJqwMjraBhLIwrDZ7znnfGpk1uswvr9VK1905EqDAzJQjy7nvcWTSJ/lOvmUDUuylWU
         2oBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678184; x=1793282984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZHUSThoPU0ne8Qirrakt2mvv8fxh4b57S/T0d1mLFU=;
        b=bzIHXMQC0O0ekER9NHARvQ9nWRBoDv++6V/+dgblb0YpnlIgSUh4tS1vY+zbMVjTFl
         zewUZFjt74nK4F3mDlG5AczbHxqozM9kjLgojdbv6x40AvbylHNGVqdlRd4bco2a5uHr
         HbGj0k6QZeFAeINDH644R/37fH02uQAelKK+D3xf4njIgttnXi/H3WX0omEIZmcz1heP
         WyT8uHDPMs2HjckyFi5JIm0SveQRjbl2joSJT04mlHwJNLLCUY3ULZLDoT21FwnlLSYi
         TsC8ajA85HBHBZTK88oNm4LLNhbPSCZskzz8ja/ncp9onP8TAN7CNeOgdOZYaSadpG81
         znFA==
X-Forwarded-Encrypted: i=1; AKwUvBxdmpdPsjHkcplWcFKqFXJ6p26k5yZCXQ2naJQ36NyusdYfVb/pIKehOPOafZvtxq9fFk0EEhOCZIg874E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWDwfcKdNYQhJjqEeowDQ48lhBXQmJ1Xvka1NCYYzk1fx28hBG
	faR3kH8VkByyI6Wa80DF61RrKcxvyoEECNCCFiLN11YB4DiMJbbvwbMw
X-Gm-Gg: AYBFou0DNfsqOGgHDmVd3EjM2lawzXDOLHZDLIRaJzy6nr96ORQkaXhYUsM+Zsd8h8O
	O+M5JD6TdJbLU5IjtpFJ9aqmvawiFYJ5Lo812Cc6cCZakXZNsJJOGQqO9qiuj0Uti8RfSUbf5t9
	4SBAXaoIpXmYBBqmO3ZH8mlG/vtAKqRE8FVu4lPM4lwUTZcS6s7LOFsBqFWhOqgKDogCQAISbSN
	AmqdlCAsAvRo4f2jBIMef42THAeW9jRp/edYWqZV/ImQBPEBM84kaOb5GKclCoRz8lElwLplmf5
	B72bkiWMr8zGQWTNG0r2OY5ogzde05iqs78JhQTfHhByx6QadOHlxwBwBbAjUHrGJ0LLG6tfxu8
	tGLg8Tj/XNp85VeqfDeRhNVhWFkXfnA1Fb0z+jycLC3Bb8xm3ONzoDRpJl6TMdOCDh0j86g2PFa
	ZEik/l5wZAaUGdK8pOAIHw3SpgWkjns2Z5RKpLKokAR16+fnxlMw3A3bs3MCshsZ9XoVJ92MyPc
	spR4OIdd0h8D0k74zD3kNRiOkzR+3eMU/de1WF0/IJEHNQwMU9VPKfguVdQcGSb7t6fsjfqqYih
	yKICCkldvAwGuwX7NciB+sPuhYyXur9lX+u+Mi76Obmj0b1AAVSxFuxGgi2JqzyTZ6ep5KAbLfA
	1
X-Received: by 2002:a05:6000:60e:b0:48e:2b82:e833 with SMTP id ffacd0b85a97d-48e2b82e8b5mr7621910f8f.21.1792678184030;
        Thu, 22 Oct 2026 07:09:44 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584e760sm12368150f8f.59.2026.10.22.07.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:09:43 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:09:36 +0200
Subject: [PATCH v2 4/5] arm64: dts: freescale: imx95-aquila: Add Cortex-M7
 UART_4 overlay
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
Message-Id: <20261022-v1-imx95-overlays-v2-4-c769d6eb54fd@toradex.com>
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

Aquila UART_4 can be assigned to Cortex-M7 firmware. Label it uart_mcu
so the shared imx-tdx-uart-mcu overlay can reserve it, and combine the
overlay with the Aquila iMX95 Development Board device tree to provide
a ready-to-use DTB. Firmware must configure the UART and its pads for
the intended MCU application.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile          | 2 ++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index f957797d90a6..12786932858a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -968,6 +968,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-clover.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-navq.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-osm-dev.dtb
@@ -989,6 +990,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
+imx95-aquila-dev-uart4-mcu-dtbs := imx95-aquila-dev.dtb imx-tdx-uart-mcu.dtbo
 imx95-verdin-wifi-dev-uart4-mcu-dtbs := imx95-verdin-wifi-dev.dtb imx-tdx-uart-mcu.dtbo
 
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
index c5f4cf0541f2..d4e8768f382c 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
@@ -553,7 +553,7 @@ &lpuart1 {
 };
 
 /* Aquila UART_4 */
-&lpuart2 {
+uart_mcu: &lpuart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
 };

-- 
2.43.0

