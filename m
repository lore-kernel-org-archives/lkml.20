Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5FF409266
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 06:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791094007; cv=none; b=GFHID2HPFj0C4L1RHMDSKytuXxrqWpbvWdu2QZ9ilcjOFsvfY1/7mn2fdza1roUgMmlxhzUbcWcz6nDOIZoV7ezvQ1ocTWjyN1FbCXkQQ6qBkAutecGo7gd0lnGlXyfYoriXx0yyUE99od8/X94uDDEpXDhfZslF0LSfxyFMxdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791094007; c=relaxed/simple;
	bh=+HjgVzM6hrxGzffR6UpBVCEFiz9mMaK4Qwhq2WWzE18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=POu2/Xt0KUpvBwwXixGq0xZBkTeARSIFEbKXAaVpYBOPPXGXR2syMH4T3sS5ryyC31n8SBfWgsARm7p8pr+iRIBvz74pxfllkOrw9EOH5MqgX69ZDBrmElXTJFGi6Ys1ZboVCH5XKquEKyh56Ka3/XkQRcPHWqelUJEo7e4Y1TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkBowv4e; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkBowv4e"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a6f8525bfbso384937a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 23:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791094005; x=1791698805; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guIyHpQK/Dufmx/5H00TbHEiaCpKr7cmjeRRgaNH2Tg=;
        b=EkBowv4eSx65ERaj4ah+n22Lbj36gFgmHNJaSxg13OBYJAlPVgDdq1GC3ICFydG1b5
         S2EQ6yq0aoG8YN9PvsiYVoKxQs4d6d6AueL1WeAhsLuGulkPM+DJrHgnEIQB0JU9FkZt
         vg+Y12hIEKRLN2TjiuuOv+jFNYtx5KASuXofLDBQzOmQH8Sm+PvfrdUASxq+8cPrD5ok
         UAiIwn7JXbm4/tr3z4L2klih9Akra2pkRxJ9md3yHO5c44sOoXWqZlLX2tdxrMV5/0Xp
         usLBBT+UplMIdX7a8CSWlPIv+AAik+FdAWvLZSaLLq7VQbXWSxbOuJhQwQXx0SqlHKBu
         FzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791094005; x=1791698805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guIyHpQK/Dufmx/5H00TbHEiaCpKr7cmjeRRgaNH2Tg=;
        b=nU+0D2dJA4LyT2eI0Ria46NQKSCZrQW0VhILK/k+l3jvItLARmixLK6iL8FT96NHEn
         Fxum7A6mJ37SKJsMxSR/2vPttTKe8KgKAXbMvSD02+BFeJ9mwaExOMWwUUIvvuOymZZf
         zspIUmUm2BhZ4bQYkgFOFddo33GneLclsfXPfTNNsux45/qBMA5vM1J7vE0cRU1R4z7o
         88zoRlI7hJmg4skD5gJ7wUO3shX7lSVuvbsIVOZ5tTdDG+ZZd+O9X5scsC28iEt5Bx3C
         SgesBF1/HiNBQOeVLsc7evuvIhBpo8BZYyVWcdj+eUtE3IJG5GscHswOAmb+Dl+4xEkl
         YYlw==
X-Forwarded-Encrypted: i=1; AKwUvBxcRl2sT19BKrY4sfV04V72wDvVXBn0ckIa0lMX+L9/pdX05XpLDjCYbzM8j0wsefl5ZWj9sVQliluNmkw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoXRaF5VZIA5ZHw8UP5sd5viUzbHZXIjaoezzilnistGyB/Nl5
	nNollWwYOiedRSMfECwtna0z95vupiWryIK88PrDLbCmao8OuQ53pqTVuNzH5wZZ
X-Gm-Gg: AYBFou1KWhwOGa3C65iK/xti/K3d5G1SX6w8QemAbdulJo/SQZrDFIg5jmwwAmH7B0w
	5s5d05to0WCg1NhGUPHuT3ZXpupfkuFZlbg6eF/7kWXjOL2I1eA6lS5nU1dcYKCxyI+bhorQxww
	Bw1ACKdCfiCly5wFm9hpHvdpo38XTPZrZKtSEx05yp8eS2LtAy3h58YJ9eUAfgFyhztLN3b/I9W
	X+laPy1RzXXEscuxzPK/xwXgXQxpqcCT/yAeDOZy5CqmKxjmkkW8fNErV8MkIvvqHGY7ubQFG8M
	aZUouMRSidmxizKw1gVpXriKum784/rehiYh70TdaYJa2726+Ab3ZY460tPQgTKymopgeafMhCR
	CEgabSD2rz+YIDP8Q7kP/UToyI/sWt3KeuOioFUv1rgOdJuvSdfKYOdH84i3VvSocAr9HokAQBt
	M6eCNdxzRb8LIzA7JB4wg1ndE+eIP8rEQMO3PCveGUNGD1cPrfmj/2bihrSCAZDvPAaNli+Gjbn
	YBneBeS6+EI2VA7egG18Jle+UcEAXyImL+YQU4ny9iMCe9QHEewYOtbfEBzspU0xxNHvNONFII8
	7KidronsKvrF33+9N3nqME8hOeO8iCYpykMraGnNuyqkxzA=
X-Received: by 2002:a17:90b:4a51:b0:3a7:cdf9:902f with SMTP id 98e67ed59e1d1-3a7ce18735emr442657a91.1.1791094005403;
        Sat, 03 Oct 2026 23:06:45 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:06:45 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:44 +1000
Subject: [PATCH v2 17/21] arm64: dts: apple: t8112-j493: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-17-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3253;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=+HjgVzM6hrxGzffR6UpBVCEFiz9mMaK4Qwhq2WWzE18=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+QxC34/UMd1dwtXfvSXfTwzpr185aO26s+XrVPWm
 cgpMvU0dkxkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKZ60ntGhm8TvCI1f0Xfna2j67bCJVz39TzObS7lcwp2X/l+bndn2hNGho+S6RV
 5T+59vpkwscoqvlzc+5X27klWLgu/LQmd//ryRgYA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 MacBook Pro integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j493.dts | 108 +++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index 7cea5c594810..8993775da9ab 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -147,5 +147,113 @@ touchbar0: touchbar@0 {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_rear: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Rear";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+
+	speaker_left_front: codec@39 {
+		compatible = "ti,sn012776";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Front";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_rear: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Rear";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_front: codec@3c {
+		compatible = "ti,sn012776";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Front";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 149 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 12 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j493-macaudio", "apple,j293-macaudio";
+		model = "MacBook Pro J493";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-2 = "zero";
+			dai-tdm-slot-tx-idle-mask-0 = <0xf0f0>;
+			dai-tdm-slot-tx-idle-mask-2 = <0x0f0f>;
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left_front>,
+					    <&speaker_left_rear>,
+					    <&speaker_right_front>,
+					    <&speaker_right_rear>;
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
 #include "hwmon-laptop.dtsi"
 #include "hwmon-fan.dtsi"

-- 
2.55.0

