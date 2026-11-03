Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691777;
	b=u00nJeOhPJtaFnyaqy1I22mcbUEzRXltqQ3SmFqbClGaaodF1H7S2qhbCdMEvlam9MVH
	 H8va68ODN9f8t1ZwBXWA+1m8thG0pwAPPQrYQC2NnQRTKXIcfnJ/CMDblkAE7PqddRKbN
	 e4WkGYeLrWVReoOEZBw/3e5hqJRvsrW/VXVGrQeBwD+sZtdKcoSA/NMGI0dpvQMQhZBK8
	 Ieu/OffRNp/yL79lM0+P8Sc40mxU8V/jtoIlUVpJ9VL+Pg0ciH5VvKi2tKA9jiy5DSlU/
	 eMcKOYX3GZuBxLcAsU3kvNTkL2RKykLrCzz7eMlNHBQqG/Ju36dNwLMmqP/VPpyjrew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=juI5uj4FaPK9VFQkpAL5wEy0U71+2PC4taBfk1eXfEE=;
	b=J5X9PY7mX/FwuP/nbnyQcBVvebDHpHvlSZxKTfX1i6QzZdn/DQcs7+IgIleprI5wblca
	 rp8da+/bT58xavLYUb1S4z9Lx8tvVDfpuy/OfVK5DCjgmp6jBhTRPuqmc1u0iV+om2ehA
	 VqzvIz9XeN2yIoBN/WY/crjsrbf3dPz+yEUvEdeH7b/QBYYsZGR3XNJaptP5fRxWCX85a
	 zIkX3un8SSuwTRAgJlf8nOzCsE+qCpI3MsAPr3qmoOH3m27U/5VUCrn/2xe88JI5PCFQy
	 QaZ3MEeytASGMzWADBpCBmPq3F12UYbvCrhjTMuH3xJSPMD1v0RwoCwdE+kMa7omdpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gw8PZgoq;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07492606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07492606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gw8PZgoq
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b07db03f41so298249a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691775; x=1794296575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=juI5uj4FaPK9VFQkpAL5wEy0U71+2PC4taBfk1eXfEE=;
        b=Gw8PZgoqJD4QiK0LqF8tOHuiysqhwOePkJ4fMkpXfCjBv90RuxABqVctUnujZz6BJd
         QRdvGVfjqrAtxFrVitfHOPFxHJ+YiF7pQWBBOZ3HulYkuTcd7V3V6/SGnltluwSba5DR
         cH4ojHGoFBB+qJhNS0ZgEwFrVEWLU0trl04SgxULgx6ChIlj+5jTZ8dWGnZuI5YIM3sQ
         litUqNWDUErgv2PBp0A+qqSwIju/yfdxY2Dh5nKv9DkoE/RkiQY1vUdtyU7YDoS3sq0r
         4lIhSoei09vevN1oNwx9QJvHTnNJozyN79TRMy1qSWITU1vGc6rlwMGdmfMBsGQ8e6j8
         Drag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691775; x=1794296575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=juI5uj4FaPK9VFQkpAL5wEy0U71+2PC4taBfk1eXfEE=;
        b=Ja5aTNJYlF/BSQ3uWyBAkYI5d83OwC2GU15HdVsssdMC2aeNYlcaIzejLq4idF8ugm
         2O4N5ZrQrTLGxTAZx/q9YnnFk/YrGPdHp/1Bxg1G14i8jCN3B5zjoaSareEiScxV22vb
         vlhNYIf4uRD08PZyFRvOXPzzLTLgqaltsBLAoC/uqFcB2ITkwPKjk/zgyUaCm0BX7gs2
         mVLyDLV7wf73EJSK4szEcy23Ba2mlrcbWGAtIX1trrvDhEMaLJN89bsKlxrayhxbv42L
         EMlRY5U5yZwa8jljNmIMdP5tj4FUxv+RnCFGLmFgMwuIuGu+9ab5/zIndUUK+3CsX3uD
         e7+A==
X-Forwarded-Encrypted: i=1; AKwUvBzn0UC5y0Yi08YnGune5nSQTuLPztLmG8HPLng0uygyHFFugUxlWU3wMIbEouMuJ1jThrOa5GbK79qOHv0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5Om+XdgwF7ttT9cLO3/HWIRcztNM1mDxZSNsNMCATCixztKW0
	hGDp+EiEg/QzNc4m+CiVT83HUJt/Rnr9mGl9UUZgbkBP5ZP2is3vU0pY
X-Gm-Gg: AYBFou2lS5cRSZbw6TPXm7N2eApH9H5ZHoB15cySwCuH5eflTHRd72DB7mx1Gg2Y437
	Lxg3+9tZYGZfD90W44IdEE8z2CQ4Ed1oxQ3MHBIZ1D89ZviEADw0dgXEmugTbnjeeUkcu4zsEGv
	hzObyogqwDE7vXouv9KB/ANVdwHcYjFFHHRaejEWM5MGST3B7snI92PWWAgNdbFoLx4nDmq09Qy
	5vYkDJ4mCrHXFFekbhserADSbmNtGnAXKRwql2hPmc4Mr5qBxlqKI0YopoxlsZ20PbWDBY1d9Gu
	IGfCSc/iyyZs7GSFvG7VSA+EqCozwT2BbFdxfMrDvuQQZJ784VFH2O96ImgLujqV9/YrkyJendv
	0sFPPz3V26hTMDKojwe5YJJbgtPMP/Mq21LetArTzvuHLu82DaGouk8ug5ukSjtDBTj2IE4f5tT
	reRVsA7mkGKtaw/Vu5ZMbcF7L3Wh5F2OyIa0ZgS6yxpjoFHDGYkTrYTgQDUUzXh2/DGKRvebjzV
	chR93vU498jodB/2L6N3jJ8QDLdIZ+xQDkyRLedw11IgZUGGpytVJnBhlHbciNZw9CuM79MpArF
	xPOH8K1FBKUoRwIPFlljH9LW5YaAm5XWGbZzoaXvDzrJ5l3la/zEriuQ6/0+KKbm5HKyQpItPdy
	MvL4cNeXfEOjA51SCPTeotnNJN7fLSJPJkwPwyi/9SDlILI2HNfY5KtId6bkpjw5NL2ELflKIlH
	3km14=
X-Received: by 2002:a17:90b:48c6:b0:3ac:9717:afd1 with SMTP id 98e67ed59e1d1-3ae897e07b5mr10233118a91.63.1793691775441;
        Mon, 02 Nov 2026 23:42:55 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:55 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:07 +1000
Subject: [PATCH v4 19/22] arm64: dts: apple: t600x-j31x: Add
 speaker/headset jack nodes
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
Message-Id: <20261103-macaudio-v4-19-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6072;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=tVHb04ag/03f/ScM4f2Yc2EXk5oXeWx+RtEiWeg1z4A=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+y+Uvl+YaXR70WTZzRaW6iUV04JTViSs3a/08tnvn
 A+7twW86JjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEy1nx4jw68f0oJpvl+nGCW1Leae+nJ7j/aOBx5r53e83PGJJVpS+RnDP5ujN2b
 37Hh4UPJNm1TuI4GLOdcmrdrYcGzClL131U62WPACAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 Pro/Max MacBooks integrate Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6000-j314s.dts      |   5 +
 arch/arm64/boot/dts/apple/t6000-j316s.dts      |   5 +
 arch/arm64/boot/dts/apple/t6001-j314c.dts      |   5 +
 arch/arm64/boot/dts/apple/t6001-j316c.dts      |   5 +
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 131 +++++++++++++++++++++++++
 5 files changed, 151 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6000-j314s.dts b/arch/arm64/boot/dts/apple/t6000-j314s.dts
index 1430b91ff1b1..63ae47ea46e6 100644
--- a/arch/arm64/boot/dts/apple/t6000-j314s.dts
+++ b/arch/arm64/boot/dts/apple/t6000-j314s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,maldives";
 };
+
+&sound {
+	compatible = "apple,j314-macaudio";
+	model = "MacBook Pro J314";
+};
diff --git a/arch/arm64/boot/dts/apple/t6000-j316s.dts b/arch/arm64/boot/dts/apple/t6000-j316s.dts
index da0cbe7d9673..c8428fbf9244 100644
--- a/arch/arm64/boot/dts/apple/t6000-j316s.dts
+++ b/arch/arm64/boot/dts/apple/t6000-j316s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,madagascar";
 };
+
+&sound {
+	compatible = "apple,j316-macaudio";
+	model = "MacBook Pro J316";
+};
diff --git a/arch/arm64/boot/dts/apple/t6001-j314c.dts b/arch/arm64/boot/dts/apple/t6001-j314c.dts
index c37097dcfdb3..05066cbde96b 100644
--- a/arch/arm64/boot/dts/apple/t6001-j314c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j314c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,maldives";
 };
+
+&sound {
+	compatible = "apple,j314-macaudio";
+	model = "MacBook Pro J314";
+};
diff --git a/arch/arm64/boot/dts/apple/t6001-j316c.dts b/arch/arm64/boot/dts/apple/t6001-j316c.dts
index 3bc6e0c3294c..ee0339b61713 100644
--- a/arch/arm64/boot/dts/apple/t6001-j316c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j316c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,madagascar";
 };
+
+&sound {
+	compatible = "apple,j316-macaudio";
+	model = "MacBook Pro J316";
+};
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index caded1636f3d..5237cb39491f 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -169,6 +169,94 @@ hpm5: usb-pd@3a {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof1: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer 1";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+
+	speaker_left_woof2: codec@39 {
+		compatible = "ti,sn012776";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer 2";
+		ti,imon-slot-no = <16>;
+		ti,vmon-slot-no = <18>;
+	};
+
+	speaker_left_tweet: codec@3a {
+		compatible = "ti,sn012776";
+		reg = <0x3a>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Tweeter";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 180 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 4 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_woof1: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer 1";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	speaker_right_woof2: codec@3c {
+		compatible = "ti,sn012776";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer 2";
+		ti,imon-slot-no = <20>;
+		ti,vmon-slot-no = <22>;
+	};
+
+	speaker_right_tweet: codec@3d {
+		compatible = "ti,sn012776";
+		reg = <0x3d>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Tweeter";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+};
+
 &nco_clkref {
 	clock-frequency = <1068000000>;
 };
@@ -366,6 +454,49 @@ &atcphy3 {
 	status = "disabled";
 };
 
+/ {
+	sound: sound {
+		/* Compatible is set for each machine */
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		headphone-dai-link {
+			link-name = "Headphone Jack";
+
+			codec {
+				sound-dai = <&jack_codec>;
+			};
+
+			cpu {
+				sound-dai = <&mca 2>;
+			};
+		};
+
+		speaker-dai-link {
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-3 = "zero";
+			dai-tdm-slot-tx-idle-mask-0 = <0xf0f0f0>;
+			dai-tdm-slot-tx-idle-mask-3 = <0x0f0f0f>;
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left_woof1>,
+					    <&speaker_left_tweet>,
+					    <&speaker_left_woof2>,
+					    <&speaker_right_woof1>,
+					    <&speaker_right_tweet>,
+					    <&speaker_right_woof2>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>, <&mca 1>;
+			};
+		};
+	};
+};
+
 #include "spi1-nvram.dtsi"
 #include "hwmon-laptop.dtsi"
 #include "hwmon-fan-dual.dtsi"

-- 
2.56.0

