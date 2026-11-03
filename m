Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691707;
	b=hRHtJL2FqL8y0q0v6lmF6Q3J8U8hR0aEcdqYrJEJSXK1qL5QveoiEwiYWntLtrwGYZ1G
	 Pi/DYThFrMojCpxGy0S+AHv7wsT8N3zYMzz0WoAVTVbyxV2uRxTGiYwltprD85tI0GMIj
	 Ya1ISqnnO3OuM8auk0hCXV3804uRnCwvoW9pMw1ar3WjL6n6DQfmueXEJWWD/R4gtUIG1
	 JYZ311tMutXmXYKzAKbU09Vp3msXkYQuOP7L9LMLYKINaW/FARk6Sfmg+8mEJEGIUjk7i
	 iHNTon0dAWN3j5W+70OHaF4uao3COl0DL7yXFSEHdOwebUJ0bsi+zw5AufOBSDNr1ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8v+Tuf1uDUVKThHm+Y7dYa6ZBevGkiTnivFGdWh/uwA=;
	b=iELWMW/vhPuT7v6QAQQMIa0xFtuA+3AzAGs/lpkbHs+8qF5i9swD4WfV5qzVGzKEfum3
	 hBOMU0D83wufthEzoaAZZMPNh0nXTksOd49iiE2F8EzgpnDhUtHnbAjHMRaDhB/VTdTjH
	 aCAiA+v/WgVKfjTRqVY+7IQI0NPuFmhoC46EsgKA3EUxp8L5g6V3h5CNlVgJCVSjJ/hPY
	 YnZKrY8EPTCEkTK1hX5FGN+DnyfsRc5XkwEUFVysHwvrWyEvIo+gm5BqLJxg6dE+kNk3E
	 Dpdr9J8wsqBK2p09+trcIhGQZfkaXmH6W46NwkelDxhqYN4qNJQh1GJPeGYOKe/6bLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPBPtoN9;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39226606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39226606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPBPtoN9
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so2312432a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691706; x=1794296506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8v+Tuf1uDUVKThHm+Y7dYa6ZBevGkiTnivFGdWh/uwA=;
        b=FPBPtoN9j/4seq6gAf4RWywkPx3uJ//miA2/BnYi98KKl/HpeGvOt6Hr2aEnr4nMhQ
         flMLzJUbqm3wj22MTX5v+9Oz98MnOd3zEg4keTJE7wR+o9lvH2W/s7Okd/xxlylSkitG
         Om9pA5owP3kJ9I+8fFBjfrZ7Mh7K2DwNEWLfU3XjMp82U0zKvp2hU5rfxCpnHzP7SE9O
         yDI2+vbU95Cr2vRhLGxEWQp0gL1lIo/3I41Qxr3LeHakdUYLSA5UC2cRqEQeRbXvy3JM
         jvRywffmlvN7K2FGJzm8h8Hw28Qd/MI4f3u3vG0DyIbTrDWmJAfG25hsM7gDIxPKo5nX
         YElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691706; x=1794296506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8v+Tuf1uDUVKThHm+Y7dYa6ZBevGkiTnivFGdWh/uwA=;
        b=QBDO2gn7bdIIDTuHdmjtOvrnIfSNxGmjx9yw+J2TqftqdKglEtt51bsLfKSdPA8PWV
         g66StsL5aIfrnbvvB4K6p2m5vnJmI+skVQBmHs9cF61KsI9wNTN0+f6HKIN/s1lcnCDU
         w3VmNi/iIOk4yVwwHmgjg7aiUirzjB31hPn8V8lmEytiM266VmbuJq+jnN1+/IWoHMNz
         H+idS/ekDkzraZrvIyU0MZKHK0Tdq01UXpxnq4eE9QkOY9KArhBSh7MOP9tBSHeA1+Ui
         ABD/BrEyjUsU6UNmC0h0P3YJppbe4+7dpFqAOEs4wZyvoPTjQxEszflfEO2JiELoF2i5
         ivGQ==
X-Forwarded-Encrypted: i=1; AKwUvByasJ3uXXfv9Ah9qeZ0rnCJwnXvVG6lZW85K730whUguW94tG4s7QA5x3mQhsQnRFLKDf6O+vH6C4pAjF4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MSPgXWsX0I2jlTajev4FTaBIvAuP/IWH6Zua0ZZQ3TwKc1Pj7
	Gh4vXuHMS6vSrUyBcqvhM5vseverYzVc8b/E0EgRAQr6G0nIoxz+6M2m
X-Gm-Gg: AYBFou2T5cAwE/tpwN5W4kKRFvZJojr9o3ypPCZJ6veEBRLoeErO6/QU0kCX09BtUft
	09f10GKTL7VyWAR0Ejo+JwIMX0JUpWCJuLxuJG2DpWgNdoIjYtKFzxrW3waAgkN3aqYqWX6Z6z9
	WRtUKX5w5qqVzk6cJURQaSiK9hqYx8NDSCQ3lQYlL6Iyb02vlOMDenAY0squpom7NR7KRdRBVAg
	AwSRjiPsAQoWL+aT1Vk2cmAMrPwRRsk3JF/PK3i0zHKd/GiEV2cCNKUhwY1KFh3YS8dMqIAGsq2
	c5ElRX2wyjK1X3BWLK8SU2iRIcEG5gSEE2yWsrGeaKHQBfQiRMtuokqyycKB3IVn6hbcZzKYzxQ
	FoXPrrqx9tOt4Ut1a7W/qABeen5JkaUc39yazmsMSentJjoCf+6a1twnc+0lFDMr3vjwpxjCWLt
	GB+p31bEVJfbWVOy6GlTB65yBNQX10f30lDa5w2qbI/Ue10vsCSjuj/BuHsMphPYaf2YxJ1YVB3
	p+NXAuFDfyTmQYmHUhRnrLJuI/V/sbopW1Qy+ooLEmwzaPsPmCwiv8N/ybW47CHTcWiiGy6xuFh
	ugqHdqFqSx8PhE/CP+n2ql1Q3b7Pv+PhWW9eWDl6ZFRmMQBBSpNrE31OQobLuvculZ5JMxBDe3a
	GM5IDrb9QzYfLaSSP8lC2DhZxag5h/mi833/y2KqQsSyxyJzRtIXEfin8NniTalDg+J6B0iEm4O
	XuP2aM
X-Received: by 2002:a17:90b:2691:b0:3ab:189b:6980 with SMTP id 98e67ed59e1d1-3ae89776111mr9578811a91.39.1793691706582;
        Mon, 02 Nov 2026 23:41:46 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:46 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:59 +1000
Subject: [PATCH v4 11/22] arm64: dts: apple: t8103-j274: Add
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
Message-Id: <20261103-macaudio-v4-11-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2035;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=TytIUXjJL8r3NaXmKyOX8nX4Lbzdfp/ScRYJ0q4A7Bw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+89x2fO48DAsFK6dtH2TTMEeh6r2Vx+/xxg9e6bdW
 to/6/yFjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFSfVWf4n6Do+UD+o9H/Iwu3tjuwHzrNUMB7P39p6hynibxu+343RDD8Ztl/91t
 skAdfhWSrz8+MTBaRnIfZG56t4tilkCugsPQfDwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 Mac mini integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j274.dts | 70 ++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1212852251e0..2fcadd77b1c9 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -75,4 +75,74 @@ &i2c2 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@31 {
+		compatible = "ti,tas5770l";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
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
+/ {
+	sound: sound {
+		compatible = "apple,j274-macaudio";
+		model = "Mac mini J274";
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
+			link-name = "Speaker";
+
+			codec {
+				sound-dai = <&speaker>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>;
+			};
+		};
+	};
+};
+
 #include "hwmon-mini.dtsi"

-- 
2.56.0

