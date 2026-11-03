Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691717;
	b=eav/XkSWXzne8Zx57Zw3M3SCZbHJG7wVHZ5IcHEJoAgWvIP4cRhu5Eomhcqg6dIjP3wr
	 Hc0xhcbwR0W3012F6LhAzzHU9FDVyaf2XPVEyUq/wrwLaEqJhpiQEGk3h2c5msjUko91E
	 YAf8/DvbKfglU7wqIo417j5wWJ+DGgeNFd1lmIn3UgeFJUMKTRLsvdI48jruGM2G0c8v2
	 VjR1t7tvFTb0Curh+h+kYqgFeQyZnhzLwj4ysu0lPK8AOz1GcjuIPnpZDyR8NJlCEe1MI
	 MIg3C9xJ9hGNvakzR7DDi6XvarebgmuMwm7Zub2uGfKuHij7LGMYtwPHl7+d+fJo7gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=tfbhdXr+xU9IHzzXCCLrrQtJWTVcaGZ00j5M2dfE53A=;
	b=2crofFSgXAYfHot3zXYEwHqnOyNmRDCpBE24TMKAbxFPxsIaALX1mzzil6KYnwxc8y01
	 OqGDq9/o6l/IINKgclXx8muK9/5ND4qMPc4X+fcsZjK1WsMf2rnAcGCO5jF+NpSSsFiIJ
	 /+Yy/Xs73enzsQPT0mgVdMwH3SYjcAMnwCzOKMA/AglcBcZoPNJ1947RYrV/xt287NGni
	 KwU+/U1ZbeAxgNuj9E13IYhjszpzQuPYAWkQsT+rJdOu16uivlSiLkTON6WnVmdhdNTym
	 rX/EOcmoweDnw679ULfZ17k4C6l/2tTShZPtTCsopkiXedzl13/CR+f1Ey0bSVODOAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eQDdsUpg;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62E1606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:41:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D62E1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eQDdsUpg
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so4193482a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691716; x=1794296516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tfbhdXr+xU9IHzzXCCLrrQtJWTVcaGZ00j5M2dfE53A=;
        b=eQDdsUpgJOK1HVIexkTRJa/Q7nShHwzw7iUC+we/MY+PU4Tm+73KTQiiOBvf+qt4MZ
         jY4CA+Jm8pp1KTdxAJYvGZNnK7GajtffxeiY2RtaevnmgGImistjjW2btGL61fHWNcyb
         PfW90cWOt2/fLFb2VYWUtL/+ihliiFX6u0q5P4klOig8eUM+HHhRl2fvxmKmNReSvgX0
         7mZBGphU2BeI4nrPDBXuYto3JhZo3WrMQe9kq84XvHWAG5yauKNuX9cJLosNZ9j+DGmj
         FZhlya8yEtqQ8tsbxt7zMpVB0A3HGD6ZjMp/ZSgFtrxzx2Y9ss4t9MfvEp+VH4FLrZcV
         6ajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691716; x=1794296516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfbhdXr+xU9IHzzXCCLrrQtJWTVcaGZ00j5M2dfE53A=;
        b=zGLSBtZqbjNgRCaAQvxzEIB7NnI1M8RdVlMA/ZDEVMi5TqVw/yUamBLBZO4xpMkcu6
         R5yhbCpbJsMXgBxQy59LjgLZszVWd18o+Xrr95+onu2V/1ffGUYj+e7mr/Mras605UFj
         xfcOjlDVYcKknCM03aAo8uTh+MWL0MK0EqEh2wjIUhmZlwptBX3iMR7843ggVNEI7CQv
         lCzfbd8GR9+b+gh7+uMjw2DdSonk9LgzIk3G7MgrXcvy+TCy1o3iwpGM40dLpobo+8VZ
         pNjFMSyyul+l5pRLCOLfjN0YvihGWIm6oNq1OE375QkCTWr0H4mb5blnA74GOcyDxAdU
         s6Lg==
X-Forwarded-Encrypted: i=1; AKwUvByZcx6ARDT8AjQHObPANkXWFgUmgwxacXCXCcvxhrkRUrrHFc41nKy5n+NfsdZpxa8jFV1FZ3DNVr9+IHk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9muDIDJLFDAuwzQzjF0wUixxKj3nd5iBMJEXAuq54GUsF/SLxU
	u1+4PLMJRMEmUAZwGeHOfq7ps23jJ+6Pk9XEZ7aSLPGO82vY4SiQlXCo
X-Gm-Gg: AYBFou0hxp21s7Ej+cBFJ5dbvCRjC7VeUXUkqefZgDJ5I9Z3wW7o7Tqrl8wPajF9Ht+
	l2ywGDaBmZb4YOe8dghtoqhrqWvE5+TGf/4yznbS0ulKwZiPwpttkyBSw9oTOUUBrFrGAWv+UWw
	PI9mRfMY09b743/5+fQ1U7fs6VxAoGDlYl5iXFYiuIPvpG1Yni4lOw75eYLPAw3OrrAC2c4guEk
	oSuwAxjCoRXBjWDeJs47sNHqA8y0/pOZpJ0gPdVLeMIKCIcq/zmg6O5aNIvKIbEfbpJNX4xC3WX
	dWf0xID/6kmmDaEpmeYYijhooEahFB74qrUoW88v4XQhL6YfhnWl/I3uQdMrOOXgmVhWj/hmSjP
	RvsSS4C0hjR24zEMMbwK6jVCEaVozrvDRuuMGlHih6lDX2DYANc9VpywheeTai/fmZBJ1Qifbq2
	UGaT2WdA5C/u8V9tzn/UYhPX1Ofo0XWPxpaiYLVQoZhLNBxVPi3Ov56HASrFrQJpyYPPmDkhQqR
	xdjx5FOuDRu2ifY8LO4Vu8QpaupRxwsln3Zm78YE0mFRdDJbreZBokI3gDaM1FnXd5lMEzEpXao
	z1pANiDjqwKkBXQIBZGud+pr6sSXHZWBNplUcJwUXxCs5WeuVIy5k9H+EfHAuN8nunI9QZXk0a2
	GTduktAWGAUQWo/i87or+eopClMSvxGeqXgX4yb7BFL+R1Pqy0vsVTDSWLqWJqbjkVrkoGfjrCu
	zWea8=
X-Received: by 2002:a17:90b:570c:b0:3a8:2c7e:8986 with SMTP id 98e67ed59e1d1-3ae897c8820mr11559333a91.17.1793691715180;
        Mon, 02 Nov 2026 23:41:55 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:54 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:00 +1000
Subject: [PATCH v4 12/22] arm64: dts: apple: t8103-j313: Add
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
Message-Id: <20261103-macaudio-v4-12-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2524;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5HKyFCsuZAaYnH07XINXm4pOIg/VsCVnTKPu6wyChjU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8+v45h1uUCPY0rCtPuamc+e3xb9dDx4p/h/1bLYQ
 4rqZ3v/d0xkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKaa5zgjwzPGSSEL1Dcw92rcS622su/eaLvyVK7rFWHex0oz5Rc3T2FkmHHyR8Y
 RlQduJ2s6U7+IJa5tnFLfq8544XXu+R17O25f4QUA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 MacBook Air integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j313.dts | 85 ++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index f8b2b1637b9d..36c47734a1dc 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -55,4 +55,89 @@ &typec1 {
 	label = "USB-C Left-front";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left: codec@31 {
+		compatible = "ti,tas5770l";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right: codec@34 {
+		compatible = "ti,tas5770l";
+		reg = <0x34>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
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
+		compatible = "apple,j313-macaudio";
+		model = "MacBook Air J313";
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
+			dai-tdm-idle-mode-1 = "zero";
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left>, <&speaker_right>;
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

-- 
2.56.0

