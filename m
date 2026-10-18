Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869134279FE
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792303048; cv=none; b=sH+6RMNrqPm7JAS51ctQ0aPfwa2ce99Wi5pbHE7kKu5RpGevvu+AnYy4rGiqNnONmZakELlk0c3RGK4nhY3GkQ4ADl9z/QYR8nPa5xJW9tyGyCm+KgOeTbu0UVbdFekEE11vCtKcXxpKMliBEixe3W6rmpP7JEmny57zxQKv7kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792303048; c=relaxed/simple;
	bh=09ofTA95DIZw5HAVPCEl6zxGgOksuCY56JI8pBRMBoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l/FyNEV0QYQumPUkeHtvDneLuyORYoIhYPqIXjrVJZHhkSRIr5aWLp3VOFq873bpvkRX+I1JbG0efxPp2lruodWFaolv0C3p+dqayafR8lpngdNVApk1Tf2ybPTCTPtTCnmBdXSbHwiPykjZe58SupuGSTlHq9OmDtyzFN4JKjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vk0GZ8Jy; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vk0GZ8Jy"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2df8c28a0b1so3624395ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 22:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303046; x=1792907846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1yvxglmtuhBhXfKLjLZIKSiQ9S8bwOXsC8jCd3xNlG4=;
        b=Vk0GZ8JyUOLNmoMSSRloxh86PYA/QA7uohchKQ7IoC7u7BtgI8CoXOH6OHANHgxutB
         x+GQooOdODyMzDQ2o6nnl/AdxYlMg9PC2YeJZQ1wpt+yXgzktFC1GyvIeCUmXN+t+JPh
         EUqtjI0GOw3uPJljU8DaVh6C78Z209TyMGyFouWUTR6nH6ofP49fzEVJ7zfZ0iemqNo9
         zMfvbTT5oZpa/gIQdw+COFhpSpW68VAQRYUJFRaA26RuFPNcTV+1VCH2iezjvObyJoFZ
         GUyQ30jTnRqRvN27STyK6XzRyQ13l+zPf3sAilvqXboPFlPe7okQsIionhMtld7Fs3j6
         lh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303046; x=1792907846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1yvxglmtuhBhXfKLjLZIKSiQ9S8bwOXsC8jCd3xNlG4=;
        b=uLzo3wQrSmkO6N3Yn/SIuIZtGNFxgFBB3yfuKpx/brsck4j2vxk+iSAq836DN2mdVB
         J8DnyO8J6M90pDHOzKio02eRgSl1WbOcP8AJvTq9ECWzOfJmp/M+zwHP9yM+CDIOL66p
         NQHzLOlOYQVUfwGYb6rujsbnrKyUUklLCSbo6kinUZtZTyaf2ZSqqwzPWMxaKnktkJ1I
         ZPsLMJgYha55uquG6MavlnmswAyM9Jpgq2IRngCkOsFTg4rVH18syuCy2SYTZYuA2BhV
         kYw/Mq5nzDnF8w5/tvZDCFFgXgbJGMpcDFxJVI3I4NTmp61gwq12FeiJroPcAr4z1Q31
         Tfcg==
X-Forwarded-Encrypted: i=1; AKwUvBw/ErN+93KUSobgJUIlwM1jBPv8cr0tGmHF93qPx6ohDTmgtH3FPxoiZvd7m/vxTTFSJyCbI/jDjwtOAXM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfBX+y1HJT51EzkNQS1A7ADCQDH7xrw9HWstV2uRd2n/1+1Vem
	k33b8baszuI89nQz0jExy9dVTM2heDPfWbl/2gXNvesSxCnjTUUKjyRD
X-Gm-Gg: AYBFou3Q36LzNW6EO/ZLztr/HTpfZ7D0KsBnsBCvWD2/wYgHknTWASyzdtRdjPZZljo
	i5cNZVqxjHNpWhDIMqsbE3zbkz+GSKSNsipVqblbh4RQe0fTUmXccEXfalKxCky5ILVmMw96apn
	0AK+R8U1AidXi/EoLUIlr6EWs4VVr4kqukYajUqESF/grGvytww7iPDR1tQFy2DpV9D0p6Q/Yh0
	VUAWZZ6aXV91ky5S6eUFDGFGZhGy2UX4LD9fBgLsamMYpgljwdZ81HYfCWQC9KyTD4DHtT6dwcr
	XwUX5hIMZsqJPgQR2xt8iQs7ak3cFjQmSldgpvbKdtqxGtAl5WZsKILy3N+mafQ9Sgs/Pj7s+Qn
	Aa85kOP5UVJR/XvTtF6G/rQH0RzOTf7evZZBbSZoSSJ19EnlbOJW4mfF8L3mtxhN6f42aTyhfyw
	q+/N1RigGOfNV7RgWUVdC1UjwanAwXH2dlgdIiFM7vqEYUErIA+Iswe+J8rrAkGBzuqHmWpbHay
	UKLJcNxkfq2dz2G5XHQ4K/+C6DOfwO8daCpmHeWhlYLgSv3iQD2vuIgBJEgPJ/8TCgp1Y0Su7lh
	k+8fWIyDY8CT+Oh8FfRPSGM/kwz7QWNPugyfW1vJuGTrDQ==
X-Received: by 2002:a17:90b:4fc2:b0:3ac:a203:e092 with SMTP id 98e67ed59e1d1-3acee27717fmr4020804a91.1.1792303045878;
        Sat, 17 Oct 2026 22:57:25 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:57:25 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:12 +1000
Subject: [PATCH v3 18/21] arm64: dts: apple: t600x-j31x: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-18-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6066;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=09ofTA95DIZw5HAVPCEl6zxGgOksuCY56JI8pBRMBoY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4vmcKpVmuG+q2P5l1lJvt9vrLucdzXn0IuWERNtLx
 5ZbsX0CHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKnOd2BkWJZX71lcvm8Rn320Wz9bXLY2vyTbP8tvF1L2LZQpSGRawsjQ9babOeL
 1wle7ntk2V+3T7/mrf01ta/SyrD1v3OeZPujnBAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 Pro/Max MacBooks integrate Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6000-j314s.dts |   5 +
 .../arm64/boot/dts/apple/t6000-j316s.dts |   5 +
 .../arm64/boot/dts/apple/t6001-j314c.dts |   5 +
 .../arm64/boot/dts/apple/t6001-j316c.dts |   5 +
 .../boot/dts/apple/t600x-j314-j316.dtsi  | 135 +++++++++++++++++++++++++
 5 files changed, 155 insertions(+)

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
index caded1636f3d..1f23ae3e4e1a 100644
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
@@ -366,6 +454,53 @@ &atcphy3 {
 	status = "disabled";
 };
 
+/ {
+	sound: sound {
+		/* Compatible is set for each machine */
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
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
+
+		dai-link@1 {
+			reg = <1>;
+
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
+	};
+};
+
 #include "spi1-nvram.dtsi"
 #include "hwmon-laptop.dtsi"
 #include "hwmon-fan-dual.dtsi"

-- 
2.56.0

