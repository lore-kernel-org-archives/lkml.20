Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691725;
	b=e7y5AMhWyiVC1J3S2iePPKsbJQGa9DLuvv+8rLq7Db85phdqAlXl8Da3cr6qLSjwNOwj
	 jQj8N7kAHw49QAY2IrWDr0SzZLVrCIlUvDUNUAvEYrIoiBMd4oZBL4/X0xjbqAg0PDIVG
	 ++LsdS1+oZofp7JlYUTlT9p+oryMao4V6hM4/htQY6mbBgj7moF/mGMhKGH90RYhaJ4q5
	 renXBEuGicpVUGmaoC3gT4bDhl3eRv2s2rCE99a8r7Eck2FmgztpT3/CJUoU3OFGWO9zW
	 ktmFJXq3VxZWSxWl57P5IZcdSqcB1WY3C85lSn4g79KLl0vrtbOtgW6u2yF7k1I5/mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=pwoh0z95/GhzPxuFda/2Z71hW29wiXz/USZbZfeMSh4=;
	b=Esi7hYlV5LPDCMv0wJO4lv3KtWu8mfKDPXZ6xXktL7jXnhq9CNOC3gHteUOJww1WWchI
	 eCfb8rs48Qe/rSTUnfRnqmnmQeSw+V5iuk417frKhe4ftprAaDRudj1/6YgefwLaL4NEj
	 lKR0KeTM4eLjh1hp36k5zieEDGd5T5NA6z3UUAqPbYePCJ0n2k6xB78f9FagEUfKP4R49
	 TEpPuJaXzPDMpRBBHb8/69ls4mH0I34798JeAOx8eo0nYtIl+t3HN4TpWYp2IMDTtmlZx
	 SFEo+eZIdjUBsF9jK1pI2QDPp+tW+gqqJjy9cvQ/aCBsOEKvYPFG6t7p1j0k+EG7BlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KbYrDQ/P";
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8319D606D80F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8319D606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KbYrDQ/P
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdb2893531bso1074638a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691724; x=1794296524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pwoh0z95/GhzPxuFda/2Z71hW29wiXz/USZbZfeMSh4=;
        b=KbYrDQ/PBMHXLAVISOahHHRIDwX+5yVoQZvr8C08QEK20RVp+AdnC3YrJXlWX2WHJU
         ZT0pp+SOEpqFrwCM/2V0V1X9VQG6ZQYd+gLJubsX9eYTzDPqCPFMpzJ69QtIJrAVC421
         uyGvdO4HryWOrdCpDIbZRqdtPtolI8RcyXzfbDY1A9QpJQFj7GEI8IaKGATh8b5dviui
         qxkR1mS98ixd+ShtXBITXtTeK5Y3eY/+FlipaKgCPTYYl7CtCsyLohagAM98sooSi+hQ
         btjUOwLlBkjnJDpnL4kAZCq+cfMNI96akqK1TKhXipwCdojAvH71VnoF55uBZj6BbaY5
         p+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691724; x=1794296524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwoh0z95/GhzPxuFda/2Z71hW29wiXz/USZbZfeMSh4=;
        b=pg0vFCPKQsdBb3Ckywdfp5i8QojSEgungevgwj6NCjELft708+WNigdcPkBFS+b6+8
         XL8X7KNdjn2KKMlimfWIWKiVpZc662ptlA03SWwqODUaOm+oy5Qip6yFxWjLRnIGsHX7
         lXf4+DEdRyLt4gdiXNSnaVJP7kN302FRwCR26X4W5CSWxUaTgKgKRIYWDAOJ6GEHxQJf
         ZIIFigHQVuqZpPp5hKVHsGcjRbF2ggxceREhpZ1+f+L0kgih8iEa5XFV1ZsK7RY1cVf1
         Fhm2X0g5yGMIweHiHhfcGABUCEw4DJbHG6FZkV38oeYrdHii9wCuwgmrp1jUW3NY5t07
         nAHA==
X-Forwarded-Encrypted: i=1; AKwUvBzaJzyO4HjG+aCJHN1kCrOVujuK+adWKqWeMJBEK2PVLr1+M0uR5lysvHefzOgHPfRP37r2tHIXwcphaPU=@vger.kernel.org
X-Gm-Message-State: APuU4Z92i2c0GuhA0pvM5sGE7v2eCmD9wyzqeLyEd3WBUf+7A+YMALOL
	kJU+drU+qIaXt8s3s6m7jz/wZeoyCM7Nnw2RlQX/tb0RLkzDN4PhH3Zo
X-Gm-Gg: AYBFou1E4pbEysyG0ptX3QC+JBNepJO6YKjDbkZWKZFF7IzYibpgleso5mHHFfVs+yh
	uRxQI+O4fE7CqxT2lx+Xv5JBz25u/E2AUDJAgYETeuqCQN0OeZtPbKv/NdPFqdeknwQ2UMzG9Fn
	5PCrIAlUSovl++H0wQB3ZdEzWt8GYzWEjjNbjehGQwwI+ESuIzaPQ7O9Wqe4e5Lu7RfobvNOO8i
	kvy8a5d5DtuCVFlvEsO5wwxg9+0yePP+IRatIYFAFpBZrRDf/E1Q6egG4CtZ1fWBd3Qi98CBWkn
	Ck4XUG5GrxinF3UO0MdddSF39Ozdk1uB2WFvXNY3TlPE13nR2Z5fi3JZfuqJ8D+QPoAn9GFXxt1
	jdP7K1ZV11WMTEKVzbawWKvY5OHmR4c3ufylh2kNJqMIe+CMe2IW9B390tpz42rZFSVBM2xawyb
	8lwFWnFxfO7vHfRqj4+mNYaGNJg4PTcR8nqlSmZLm0HQIcprADBIKdf0ahinfoGzyY3d0EvGMqC
	WHjDVAjAKxpjREhzDSifchTIJjugEZ36QaU3sWPIxUStIJcPTaZhwSX0kEzEqtx8Bf/Qry/+3i5
	xVf/jAFNKG5fPTI7C5z5cFU4ra1Hb+Vp5SShcOeIDXH19CeeLoRkTrEHrphwT+8vFc7c5D5kmlt
	8kYvhAftAj3Kttdlvis2YIe+3K4Z5Jm3BNuOz/2T74sti1dAj5Iuq4BeL9Gq9hW1G2acKwWmuqR
	4zd38=
X-Received: by 2002:a17:90b:1188:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3ae897eb75bmr7420951a91.17.1793691723756;
        Mon, 02 Nov 2026 23:42:03 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:03 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:01 +1000
Subject: [PATCH v4 13/22] arm64: dts: apple: t8103-j293: Add
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
Message-Id: <20261103-macaudio-v4-13-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3383;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=AKNOO7q0vuQyr2QN1X38WMsoOdMQ1mDEzPGmlv8YRhk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/7xJ/SVIuv/ng2cm7unSdmjQsFFy4sW1xg0fKwz
 tpI4L1px0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKr7ehn+u3b5/9eXOif15smaL7cXx6RvyDn2UaP4otCkj+8tfm06xcDIcOMpj9C
 VLdt9JdY+WBvIsCKR+XTLh6Pmmq7PQvty9yoeZgIA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 MacBook Pro integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j293.dts | 114 +++++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 1d074b9e6018..6980247b94e5 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -133,5 +133,119 @@ &displaydfr_dart {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_rear: codec@31 {
+		compatible = "ti,tas5770l";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Rear";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+
+	speaker_left_front: codec@32 {
+		compatible = "ti,tas5770l";
+		reg = <0x32>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Front";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	jack_codec: codec@48 {
+		compatible = "cirrus,cs42l83";
+		reg = <0x48>;
+		VA-supply = <&jack_va_reg>;
+		VCP-supply = <&jack_vcp_reg>;
+		VD_FILT-supply = <&jack_vd_reg>;
+		VL-supply = <&jack_vl_reg>;
+		VP-supply = <&jack_vp_reg>;
+
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_rear: codec@34 {
+		compatible = "ti,tas5770l";
+		reg = <0x34>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Rear";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_front: codec@35 {
+		compatible = "ti,tas5770l";
+		reg = <0x35>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Front";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j293-macaudio";
+		model = "MacBook Pro J293";
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
+			dai-tdm-idle-mode-0 = "pulldown";
+			dai-tdm-idle-mode-2 = "pulldown";
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
+	};
+};
+
 #include "hwmon-laptop.dtsi"
 #include "hwmon-fan.dtsi"

-- 
2.56.0

