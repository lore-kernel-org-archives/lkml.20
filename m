Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274E440B113
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 06:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791094015; cv=none; b=E2Z4sSLKXGd9SQI5nD0mnDMquG7YZONMKGgSzbGyR42n5QUJoC6xJ8Dh9s2JFTzpB6b2g+DbNDlTvGCk+pfbIQ4JPTUCYqHdZM8H3B9SIL+a9nKAAylgCoxC4XFNCyJ9zu3HPGSoRHCCQAHUkV8rpes8N68iP2P0CM2jRiBuK+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791094015; c=relaxed/simple;
	bh=pTtpr+H362PWKUKN/qsOBwZheCrutrJX6ecEfmW8RLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YQXlFOdelc5Bb1nWNV+l/m8aTf2crjswceqoUu6mAJFwlpw2NHVkai2NmmofOTMYb3wuAxT2ASL2ezbaogDq5iOT2/dw6XcWtgeblyOuf2CdtZ/FIaY45JlFZz7/hNpT52yFvk6dA2GaMNIZVRt4D+DbdE3c4GKL8Um+twl5WW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ShTaKEeH; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShTaKEeH"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so459246a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 23:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791094013; x=1791698813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2gTHNaAHk08EuHF8BtnUIPdq9r0iTuWcCYHd3kETfdw=;
        b=ShTaKEeHmzcgYOxEU0jjG1jFUXsASVH+yln0hYFpjZb9HOwezDcggSn0DRj1WoUe+I
         rSwsXsUjCkl+1ac8L7O0pstIPFmzQLpes6uJnkhd1ZedZE0KK/hMG93ZAehDrNRxVAEm
         SgjXrAJxe2O14nVBlMMjlSEcyLmr3HL3IcxoUpQcQcVu3XSc1FEEbyoL9/yxCIQnxL9S
         GdRl/Rj4cJ6fzm0gxgdqmlRDaxH6f2cJ5DkJZkvqJV6/bKWC3DCfNor4d7Jn3wZR/HA4
         ZOgnB4VwD/bX9ko3t/FLGZXJamzNJOXjeuq+HomL1VqTOStZES76/93+nrVFfD2dUOcn
         DXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791094013; x=1791698813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2gTHNaAHk08EuHF8BtnUIPdq9r0iTuWcCYHd3kETfdw=;
        b=0qFQyH335HNyTfQsNf6BJRxSYH9JB9OxoqYfRFRcZ/CeyNe5smMwLhhTQKhYd2K4Pa
         alZBG2tjvs0YhyklxcgacqjcsJ5I9lCbs9SYZNk6kQnQ7XNZq98q/FRnFdqt5Jo4Tv+x
         xxpa6fCkYQmf6D+0bjI5CKvjSk76bLz3achMjgM+3hotQy6bXeKTWxgKUENSlhc+R/Pw
         3pqLGJjaai2hQAOEjbSNabRQjuBm9ObCP9+yQkAYXO271o5Fu/FyJn5czqlLm4sUmhYE
         cM8ocHMHNGoUwAkiQvWkaY1xv1v7KIr6Ln+S59hKcb+QfE+fDdytd20FlQI5JlQDJAvz
         JjbA==
X-Forwarded-Encrypted: i=1; AKwUvBzYuqNqYzOt8aW42UuI16aTvtBK8euqzR4RPB4xSol7+WHsaYO8he415g+QROeB7BgBFrGJnVxdcgsNXj0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtf7f5Yb6nqd7CqG4T7GfFuJxEmshXNdfHrz1M+lQlmQDvTbV4
	zXNp8AHZUWSTDHiyGs2o4mU45JEnkiyOPXKDnuF1yfHexGpA2EbwzAwmIZr2cVj1
X-Gm-Gg: AYBFou2+qgYHsN+RdN1sWBzH4LxgXafSvSoSXHC7ma8JYW77L7dmdFyq2cT/NRM5zDh
	1FDI5nSEjoybG98a3AIg47/h5mHx8lI2Y23hmdnN99Gk3Rq4ZOZDa1OqTNEWEgThgVJ4dDYVn6Z
	VDEko92ii4cZShDbJoI4zJ9B7XMUeCFcMdhOYR4Fre4WxMjg2GpvM40/+kQ58+H0q5s6nh726Jp
	EPNMF1de0yZ9C4f3e/rh48H539nkrlaBU2ZNZimivu8mGM9r/EzCKiqMmSavCRBn8AGsa458xIV
	BZ5eRpWylJ8NZeEz/010bRaZDY29WeL7yN2frN43X4JrL5vftjKiHRXLnMEuoslim/1+btmictL
	QP8P2tD94JFGwEqWeoVhMHU3eo7ZkLtAes6bEHk7SJQEvx0TDULehiKoJRve9G8rAACYzY0Z+To
	7XTfpgAwV/AzuWtAVafShxVOQPT+aFHIATXPL/ZBM/vPMq0Dmx17a7OqVmq88Tg0LAC46ZvwHiv
	BRYx/L3kgojQEUfr5VTjcN8O3htIMeRb15dFBHXtorgRDM0noWiVfwM0rNuATCZdDtJ+THzhba/
	GTPiTsT7G56gKKZN0DybSdqpCEiMBk7R8nm/dkEeK8y2MLg=
X-Received: by 2002:a17:90b:57e5:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-3a6ce3a9724mr6330404a91.2.1791094013365;
        Sat, 03 Oct 2026 23:06:53 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:06:52 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:45 +1000
Subject: [PATCH v2 18/21] arm64: dts: apple: t600x-j31x: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-18-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6066;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=pTtpr+H362PWKUKN/qsOBwZheCrutrJX6ecEfmW8RLY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+Qty3lx1KO+4+G/s3/3PbbQy+M9drZ3fs2qTfNd7
 UIarsSs7pjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEz1+X5Ghp2lhaKzNpb87WZc0Oo1MVCg41iTTPmM9gtO1bNUIi6zvmX4w1v57+e
 SvA8LDha7OSlMYlq5osTdeufLA99n/53YWt76mhcA
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
2.55.0

