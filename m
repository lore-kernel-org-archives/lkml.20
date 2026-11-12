Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490396;
	b=iAlIz9wOZR1WaUW6RZXzt5BhHor/PaDRlabRDioQ+pe/4s8Q/cHxg+bIfISHbEJHF+VW
	 4tTXuj2xqD+8vxbhzYHPg/C2pMoyL70IbYUT2OzJsY5KU2bSe4fK2IZCUPODAJMTFfp8X
	 tukdToYTc5orH5ecMpDCAGEJ/NVlw2K6e2++vFaAK2KcmxZnuFMnQ1f+JV93hunRf+jht
	 O3yd/vWS73ZglHrFH4R2wf3D0M41Sjd7GQLZYxQ8nugZXab+yYJZh2LkjGHSWV8rw6tSg
	 L93Bm5xRM6iDWq8eAMe7/PorW0UrLw+qcJwKfXtTupNCZSjxlex++KBYXtIqzKPIzIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=uDOw7djSHttwLQtVBHUbQpMumb51EMJ+8QhRFDSN60w=;
	b=u8k/+NLZ6oLXiJv/aE4SqD41FLPyUIL/wbT1qb/K9cfPzvUWbYStrbn484QrGKwuGG5Y
	 oXVaYCG9HRVE6f5dmDKFUpgOl19YCptHvCPn/woGE2mxRGctZiEK5z6Y86sVAiPk3NHVq
	 pVWDmaUj/e8H9ldkO0xlu9qaRdaJArn96JV0B2uPs2ZrYXKpUGiSfPuJQnflFfSLV+a6w
	 kdmvr6UbsfEXxUIHIJfGajUvSQFvzLPRewvULH7Xy4TwEWtmdVHS+SchVGSWhWdkaKgmY
	 kysu6kQOv5FUdD9DaVAhzC+o9r5rbXZ+nEYYmnTsJ/aU9aI8Gb2v+y22mS2sxN8fzvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YdjlStoz;
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70FF606A882
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E70FF606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YdjlStoz
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ada7d53082so10242791fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794490394; x=1795095194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uDOw7djSHttwLQtVBHUbQpMumb51EMJ+8QhRFDSN60w=;
        b=YdjlStoz3t8Nu734482NDpKJwumteKZQJqBhrZDqw6KJFP+YOFDb9vHVtVDvM3bBsZ
         UjIBd1OpPIXlaEzAFZ30llWPZsE/9HA82WjKoU6rzRkluKAoADfgUDoKsqILN8FDyJr4
         sIuX0j75jyhUOTrRs4qgUJuu5wEhqBFgisDGa1orMzaISvS+SwcsJ5R33T+iX/pH65bg
         GCc2ew3/6mn0aDKND+Gvz00LdfM9xUbSmgIVTkbdhxs0f4M0t4hixGwWGVeB9kqZ6NG9
         n+9h2c8nql6SVBqP+2uHhSimLlXrio7pL8DdpeGP+seZZixgRUaINg7n8cIN83Bmtg+5
         KSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490394; x=1795095194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uDOw7djSHttwLQtVBHUbQpMumb51EMJ+8QhRFDSN60w=;
        b=sFx1sqds+tQxCVJarFLXqevXQJmTfzbo1ctndhAyqZIvNVGH17Bowvee6qHqgr4drA
         IEQlFAmwn9WUP6HQuVKSkXd8bvDnNkGGT4isbUgregoDZaW6QFQJAXZd1cWxsGbc2swo
         lSw32d4lbPYvktvGY/eFhogwpy5I2G3Fs3AEbd9Ojir9tN7+9xG3uiftZwtF3v3IrhBx
         24zOIrT0Sxw3q9QpuTIbmB77CysJls36AMzB3qkDrrbEacob0VhfD7ZAaV5FK+7kdmDA
         nF1+B11onrF/IpRpM80hWQqiGCwmsDMOA9enL1LLUece/qy7YWEk0Q+ufnijiJY6idkp
         tBPg==
X-Forwarded-Encrypted: i=1; AL+hErG1tSy4HmM0GJxzj/tPBikFG6Q4mtMbXWPahgmbJs/H+F5wWvUNnp4Khbj8/xu71ksKiF9d6WpJWo8rmnQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Pj6feMM6ZD3x8GdNMQJrD+DxmDs335JnucBL0CiRZLbtW4fUl
	Y/PUTfNLMrT7x5hMPG+7StFwswcD1qR3Yzen3oGnw3l8Pq2vlsgRoHJf6ksoajdD
X-Gm-Gg: AYBFou23PgiI2GtrKs1yqicqjBdUwjkmFCiXjFhoV83y6ayOOJ8sYDM8wc7ME8h+to4
	DIXUIXiLz409lPyQy4pmNi5FPZ9IWwZe03IHHXT5cijizCTy+B17uJ0ywHg5wzOO5USfMB7OvhO
	e+7fD2hmlWC84tU+oo9j/FAJHRSXurN3iC709WWdn1S3sVYYyi/73FZFh76mnebaGdwj54f6y5r
	BmXIKI77fqEqta5MAefydzXXGepg5Nl2hh6Z7TQr7PV1TOjz+AUIToqW6Mi/Nkz4hn5b/0IebYN
	d3P975yLypY4nOJZonQTuRr52CwA9jbw2d1bCQK8TOc1E0a9uZ/QKgZdk40iBdbA3RWZPWbg8HW
	W156XmEtvTTp4LEabwBTkgnAMX7Fr5b0Vd1cAXpca6QhGLvep55aO51FdhGMFHJ4C6TvHuUx0Ye
	ocOy7K7StyBzc5TfDVjS96FkmgXdcNbsmJ0VN6JYGQ9kyVWLLPf1bX+I1p3QhpcAJo/0GtG+Coq
	l9lvTAKj50L6qj2+TzqRwZHf+Nmttn6/1pUZ6+F9m7WnzRkzw6lCmoA2t6Wv51nZpZoPVMv5Zmv
	PPqH7QNZUZlbbzeB2BBkpDVT2JJdHC5qC6Opp+45
X-Received: by 2002:a05:651c:a38a:20b0:3ad:372b:1fc8 with SMTP id 38308e7fff4ca-3ae1bf44ee4mr3703341fa.9.1794490394147;
        Thu, 12 Nov 2026 05:33:14 -0800 (PST)
Received: from crispy-cucumber.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae0926c65fsm19217631fa.28.2026.11.12.05.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:33:13 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 12 Nov 2026 15:32:59 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: sm7125-samsung: add grip sensor
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
Message-Id: <20261112-sm7125-samsung-grip-sensor-v1-2-d45dd9c845e7@gmail.com>
References: <20261112-sm7125-samsung-grip-sensor-v1-0-d45dd9c845e7@gmail.com>
In-Reply-To: <20261112-sm7125-samsung-grip-sensor-v1-0-d45dd9c845e7@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Samsung Galaxy A52 and A72 use a Semtech SX9360 SAR sensor to detect if
the phone has been gripped. Add this sensor to the device tree
configuration.

No I2C bus is being muxed on GPIOs 51 and 52 on SM7125, so we bit-bang
instead.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 .../arm64/boot/dts/qcom/sm7125-samsung-common.dtsi | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi b/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
index 5685755a44f6..52fe06303294 100644
--- a/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
@@ -60,6 +60,39 @@ event-hall-sensor {
 		};
 	};
 
+	i2c-grip {
+		compatible = "i2c-gpio";
+		sda-gpios = <&tlmm 51 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&tlmm 52 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+
+		i2c-gpio,delay-us = <2>;
+
+		pinctrl-0 = <&grip_sensor_i2c_default>;
+		pinctrl-names = "default";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		grip-sensor@28 {
+			compatible = "semtech,sx9360";
+			reg = <0x28>;
+
+			interrupts-extended = <&pm6150l_gpios 5 IRQ_TYPE_EDGE_FALLING>;
+
+			vdd-supply = <&vreg_l5a_2p7>;
+			svdd-supply = <&vreg_l8c_1p8>;
+
+			pinctrl-0 = <&grip_sensor_int_default>;
+			pinctrl-names = "default";
+
+			semtech,resolution = <1024>;
+			semtech,proxraw-strength = <2>;
+			semtech,avg-pos-strength = <512>;
+
+			#io-channel-cells = <1>;
+		};
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -379,6 +412,14 @@ &dispcc {
 };
 
 &pm6150l_gpios {
+	grip_sensor_int_default: grip-sensor-int-default-state {
+		pins = "gpio5";
+		function = "normal";
+		power-source = <0>;
+		input-enable;
+		bias-disable;
+	};
+
 	key_vol_up_default: key-vol-up-default-state {
 		pins = "gpio8";
 		function = "normal";
@@ -434,6 +475,12 @@ &sdhc_2 {
 &tlmm {
 	gpio-reserved-ranges = <59 4>; /* Fingerprint sensor SPI */
 
+	grip_sensor_i2c_default: grip-sensor-i2c-default-state {
+		pins = "gpio51", "gpio52";
+		function = "gpio";
+		bias-disable;
+	};
+
 	sdc2_on: sdc2-on-state {
 		clk-pins {
 			pins = "sdc2_clk";

-- 
2.56.1

