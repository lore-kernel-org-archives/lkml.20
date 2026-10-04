Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A863F9F44
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 06:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093992; cv=none; b=rwak1X+ep7A0Uw4EAGBhnCb9K+zcO7KD/CMy9HXol/jih9pXVFzk1zoTX+gt1wqD5jHvdTzdUAxYnLku7w/lXFz8aer0ygo1LYgUCiYGuME7PCiVuP5yO7om8tpOW0/uYLCa8xGcrxD3aiMmFfFQ0pbTKgTQSnCS2WWZRubU/D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093992; c=relaxed/simple;
	bh=oL7nT/fUiExh/NupOZC1GRwq19xTT792pHy/X0M8idA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oRzBwalGjZacY27rk5KBLXoAt9Z47jqhOWp8i3CL4UxCqqReGrFnfhtw0ysGK1v6j+DiF2HhIv7PpMPHnE9hzGMseauqOKuTy2Fd4bhRvof27Y2OB/bCBn9J2iug8KPksALNcYhP9F5cI6q96rgoxip2HqcEF6BgrwahtMxxa8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eeOyXJuy; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eeOyXJuy"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-381b831d535so614172a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 23:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093990; x=1791698790; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQ3/e5mldTU9lRFwTRwCfrqJHaFkFUoZ7oi2cigEfeI=;
        b=eeOyXJuyTvqBxTEOlH5WfHxgqy9jgmjaWZ7mJzZ+NlfOKf2e3AKQW+Xs7+F1dUXNq8
         tnPcgbvqLu5Sqx8Pq4PkuoExtwTfkdYf1BNz4ULj1PHNpJX1cvmOaUFheSGvvoEeRPlO
         9is+isHxPPhuBGsxqO+0JJ0F3uyGCKxw2VxSMov3sDGGAezi4WwcdI+VHguNqcI+Kma2
         UAhRz2aBo3YijSCAJhN1VVFEvqFXM7JSxJPsVVV7U+YHy3slZNVCH/sqoTF6mbFdVCTC
         PAHcuYwbV629uYcezYWM4X81UrWqYE1vG9g0Q7VOnialvZc1FHp7FyAbZrc4SrJKQPq6
         mIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093990; x=1791698790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQ3/e5mldTU9lRFwTRwCfrqJHaFkFUoZ7oi2cigEfeI=;
        b=w7ZtWTYbdLSyxuDV7msLKiWGEuaUET5WOmZQk3cY7LQtPiXNcK+HnZdbJcObb079GA
         Evr7ervUp9Em32YAECgiLLrLOGc/e3Tmd8RK6kGkG92J3S0nEuH5A8DgCb0gv95g+iN+
         aEabI4Uwnd4lYTvw1Pa04d5wTO2RNQrv1Y2iqkt/dc0d2m+SCFmtOXRbiPekkFHmsHVJ
         6GhdTbJSt2yO9/gZnpQwaafGE/yD3cx0AcMDqb9F9dQTARPhcDnnnnd3Sxbb06SjQjhb
         samX+FyHqy/l38DalT1WtKDk9NxWBux8A/uGZj2JCpZbA4XOG7tA9uaRwIQevbNCz1eB
         GbiQ==
X-Forwarded-Encrypted: i=1; AKwUvByUxHVcbKqJmrnzpXyHUO25jJ78ZyEk/dWPpCuzTz4QdefWbGB9uC5ewjuk6o2TcoTLynXAkCG37vRJ73g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwCe/lIkwPnRZsGoGqvspNiHaaYWwdKw4LU+NpLUW+EEQLgXCZ
	wWu0fxA3tSsh9oQZ2nOhArRT1u9C1foeYm5RETlemsmyHI9z00e02gYJsGo10PF3
X-Gm-Gg: AYBFou0MFrkjCUim/8KPXmlAvM1FItH7G4LaIDvhfKC9N9iIupvzuwS5oVfymmf8JmM
	rVcztHqoXjb1AuPRZUKqMRcKzPnROZOXMicDpqeI+8pDB3l+/MPlJLW1UrXovIEgqUYqe+rVPJ1
	7OZbhwKx9nx9oj5L/9Lw23DwUEmFGFPKvDucaUiVfxq0knuqZSNf8NU0dfrBCvwpYgabNJV5+wl
	yT7lRbsvsJcQdYMgU2dSHCS9QtZutg4Rgt5Epg638/Ri2L1ZSAfN4xsEcVKyGsoXkj5lT2bR0M3
	M4aiGBz2sU6036Nnh/LjJgRZShhvrsQ7pv0IruoBaE2hVqcjzbbGInv8sPUuwf6lVaVjKGF73GI
	BU41y221Wwo6GpqSep9q+Wf9fDU2sI8cW8g1FjUA28IO0zh1kWH8ymSSFPjeDcFYSes4ZwPuDrB
	TbMynotwbd0kL9poI4Y8I0kpUT2AwJBPSWGsqj//rJ97sc52At0QtCzHH6QNGt/aGKN1Z2EZZbP
	XtrQBkQahJ2MlG20+tOwFZEkSw15Y9uwCbRuBjgy/+bMf3dtE6v9nvhVXp7ZJgIA5SR9fbAR5B1
	SGoyE7x7nV5NIcZZZZCmu+30mwks1CruGvWhjsfnE87F7WY=
X-Received: by 2002:a17:90b:540b:b0:3a0:7cbf:b8cd with SMTP id 98e67ed59e1d1-3a787182b90mr3251613a91.14.1791093990369;
        Sat, 03 Oct 2026 23:06:30 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:06:30 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:42 +1000
Subject: [PATCH v2 15/21] arm64: dts: apple: t8112-j415: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-15-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3962;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=oL7nT/fUiExh/NupOZC1GRwq19xTT792pHy/X0M8idA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+TdDphZfaTCsPPMG8d+n6DH+/2eftm3b+pyFhGrR
 uc/h7V/dUxkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKbabS/Dfzed0lhLW4U3onrLem1Vl8vvMOdK8whf1GJ2vmD1us7eSkaGG0Hp60L
 DX+/eOWd7wFWvS6yzZGvWfen+H13WpHAy1SqZCQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 MacBook Air integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j415.dts | 132 +++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j415.dts b/arch/arm64/boot/dts/apple/t8112-j415.dts
index fdc3409d2e07..4f3db2a93db0 100644
--- a/arch/arm64/boot/dts/apple/t8112-j415.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j415.dts
@@ -92,4 +92,136 @@ &fpwm1 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof1: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer 1";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+
+	speaker_left_tweet: codec@39 {
+		compatible = "ti,sn012776";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Tweeter";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+
+	speaker_left_woof2: codec@3a {
+		compatible = "ti,sn012776";
+		reg = <0x3a>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer 2";
+		ti,imon-slot-no = <16>;
+		ti,vmon-slot-no = <18>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_woof1: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer 1";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	speaker_right_tweet: codec@3c {
+		compatible = "ti,sn012776";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Tweet";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_woof2: codec@3d {
+		compatible = "ti,sn012776";
+		reg = <0x3d>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer 2";
+		ti,imon-slot-no = <20>;
+		ti,vmon-slot-no = <22>;
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
+		compatible = "apple,j415-macaudio";
+		model = "MacBook Air J415";
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
 #include "hwmon-laptop.dtsi"

-- 
2.55.0

