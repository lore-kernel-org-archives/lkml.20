Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7083E37BE64
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792303009; cv=none; b=jKbVxX4dg/fAkhO4nyUUz1I4uib5kFAS57xtCKDoRTNYwbcd2LfEsk8RLoIvYYZOAtmMBOsyjmtWC4G7R3id1goGskq3n1RsQx8lbfmORDudJrMzZa7TDIPRFFVRnHH9XBXhruemV+fabN7Mk5pAnNZoz9A0tWGQP4gMU9/Lt/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792303009; c=relaxed/simple;
	bh=1ptb+x4vHmj1hE7QHbn/CXWEVOvv8oNUPPwKzMZr61A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ja4ZbrJTBzwYZf7v/u6CYIP0vqvNDaepM378g4447xFtBz81c2dkYzDi0FaAqfL4vGlMmssB2mfV4m6fxLXEMPD0Rm2W0X1dSkVl4sRNSRSsKk5J4eqQBCnD1FAuHTX7Tq4Bo12OyamiJb/AxuPTSH0QPALL6Ep3xgKEdPLwVf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EEicspo2; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEicspo2"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ab3260b2cdso573805a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 22:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303008; x=1792907808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eLLEnfYEqoeIl5SvmaRTxd/px2CSduXZZtXXzO63XA8=;
        b=EEicspo2rgR1NztvjJpioz9w57b+aW2EjfGySDcin0m3aQtmsU2Cv0TqOCurKOJ3/B
         IraSR8de4RbFSKRPbjzpcL7GO7NVj5M6uTci6WOhesJGpOx4V2vieYJbhaQ3YRxNwv4E
         5oN+JtYb4YdeBmgdtKpdCY6orLM64uJ8+KssA+TQd5m1V1cbrcvkftop+8nOH1feRTG2
         mZaQ1rkan8iI76fdKhEJoEBRrK7pupEwfrVe8xdo0R5QftVv3Hr25t7x+BDc8V3m1R2R
         eLcJJlASuo4ABvS9/PZFk40wG3X+osvY3PbYHRggunTH8JO9YhzqvUWteo4mI/QmGI2D
         IYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303008; x=1792907808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eLLEnfYEqoeIl5SvmaRTxd/px2CSduXZZtXXzO63XA8=;
        b=w3k3elUoF/kusPaFuO10ACZf5M41vEB4pbH6Rwlux0pEPwruwXAqi01DQWX3G8RzGO
         5Ozlzev57d29+Dql1XlkZrColtwbffwWKzx3cjyTkDbVpxtvDUDIoWt3DYeppDP7ND+0
         FddWQpTHrXh/XVjThOMj6RBwooMgnh/uDnVjTfEKpqhSxSxwiVZJ4tKEGrYOQ0XWcDW+
         lWcFeYcZ5BqcG+XI+RAI7Lh09X4a6ijPl4KJ3/5dhjgkL5ttxiQ85GLhYjwgA3/JQHue
         hjtxulAl+Ye0HzNDT/bVrUhPptQ86CWxt4+eRl55zRNRppt1nAU3ybJkVz5/+6uVlbOg
         ABNQ==
X-Forwarded-Encrypted: i=1; AKwUvByU5mGcaWJzyYvPa99dtBWQazYJQZTNKDvd2JzxHMLtkh7JFyaZn52q7XkpRNgPw6Ar6EIogc/i0YFEuwg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPYuvEjIaxHoYITQivrBZ6cTLimQpEKsTeEshB9GlzUIksOwyX
	2ex9VBxp5RWKIF+ya3RePH23mmZflWGO1UmeDedK6i/re9p0TVF2lVoE
X-Gm-Gg: AYBFou20JAWdKnusqkuNsmnirhd7CFtn/FfW8ypJNopV/TRICYpkdOaONXiO8PKgynb
	YCjYjZg8Vh4OiEJaiTsNu3IXbauWKUh6MvoAQBhZu9KsH8oNO2qGQau1eiMRmF9ZHG00jW0DBg5
	MKvoHgSVNT8US/ybbmMmaIs1lgTUavt7Zuj90vRUTrS7ARHgXiEu7QYgjHfM4uiAc/YySGpo+FF
	VDH/VJtWNwMVp9CEvUmrL1xSycKai9grw9Uslec+3IzKoZr25/kSENgoMvs/8pNVhfxg3xNqmd1
	oxzxZNj5RgqZ0wuzGeclT8RkjSoSIcDgaozCuHD+T9BqWFT2N0G+7cIsFrkTaWITJhH4vC8Bwp/
	BpMeZHZFmgDhNEBeSoVdHrEv149C5kkgUDvrJzkyAmflU35hIiNT1nchRISEvgx8XTeLVcIUsod
	8y0JthamdnY36gjo0quEGpl+R+DllqSDgRLCqxG0DoEYUXir/GrdZViD8ArnRzFGGfgazJ9I8/o
	MgCh1LEn0BIGXIyi5Sa5pu8ghPDJXJmzxLh10lRdNLRi5+c34qjlBYuVLh1e9VDHCps1iLL2kPC
	Ld3C6uc0cC6ddx54RaAljxM6VNc3wS/EmlByRO3HgJTiQIU3P+jxNW8d
X-Received: by 2002:a17:90b:4403:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3acee277aeamr3445331a91.6.1792303007868;
        Sat, 17 Oct 2026 22:56:47 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:47 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:08 +1000
Subject: [PATCH v3 14/21] arm64: dts: apple: t8112-j413: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-14-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3207;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=1ptb+x4vHmj1hE7QHbn/CXWEVOvv8oNUPPwKzMZr61A=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nnX+KUfj5e7JO+wvi9ik+yT2s6vbRGh+W23BDaIG
 +asTJDtmMjCIMbFYCmmyLKhSchjthHbzX6Ryr0wc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 kY6xjhEDF6cATPWiLoZ/ig92rPZILWu+eLD3r0WNtXlBwxeHvskr01arqft61ZxmZPgr37v++BT
 3oCslcj7OK65N4/1zwb1w89sT0VenrF4msHIlMwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 MacBook Air integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j413.dts | 108 +++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 7ccfceb08093..5f8768832e1e 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -92,4 +92,112 @@ &fpwm1 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer";
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
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_woof: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer";
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
+		sound-name-prefix = "Right Tweeter";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
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
+		compatible = "apple,j413-macaudio";
+		model = "MacBook Air J413";
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
+				sound-dai = <&speaker_left_woof>,
+					    <&speaker_left_tweet>,
+					    <&speaker_right_woof>,
+					    <&speaker_right_tweet>;
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
2.56.0

