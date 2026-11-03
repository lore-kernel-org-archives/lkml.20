Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691785;
	b=3qcHCgLFGGUm7RYb9J1R8P9lkPs+EqIbzKs5HTlloscIqrV3Oz7dIwkiVeTKSrVMcOdp
	 N+YVGLwh0bpsJPHpym0KmeXQy731/bGzU+UyWAeb0dpYaFp8vvTTCHeaOVFqfCNfqga6v
	 eXjPI7KM66sCmnxKcrkFLvMZun+OT22BkTKalcWke0qUuwu3iyPkqDCFXid7ddiwFhlac
	 l1WxHNuSNDibgQpYbj5pmEObGHnYtqZ/Ub1xtjsEsxzErSfnbTfqx0+YHWhdHpEOJ7Hnw
	 UGBgHMZVTnAH70Cex2fexcPaH3iQ+hYH8gqGCsaJBKGdfzalGZurpsCvRKOnxRR0OjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/b7kR7Y+deuVHS67D5SOGfvslKe+NoSSMlOu6eM54zQ=;
	b=ApYy59EQ8nLIzhfI7f+OchXgpIDedNM0E9csyU993qLsa3WvFdzQGs6D/2wBbXySR3mR
	 CS5BNCaRLA7XfTIRf7Wzr+/DtkVo3pZ5+c/Jt3D2Egwm5ovow+PwlPxMkiObKgJAY7X0m
	 VMa5GM1giEglaUq6jWbRxUfxM7nx2VW+lgI4iYdNCYxEnYarZ8LziLjFcYT5LYvOXuGsD
	 AwBmecQAP3EB7MsPzKacXMOpBvCg3QcjF/hh//uGcJip2dLrYDSt3ogqKHkVIx71uaQoh
	 comFmTPQjL4I5xZQq+uf7mt7rZLVkhQCGZx459xgNwYpaZKCHwRLJrPSU8MJ4ENwMAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HdwKjEeF;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC22D606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC22D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HdwKjEeF
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso1533202a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691784; x=1794296584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/b7kR7Y+deuVHS67D5SOGfvslKe+NoSSMlOu6eM54zQ=;
        b=HdwKjEeFEH942ZxOGogEM8bpcjna5XKdLHEWZUvR+Qht6XTnOavyuLda+ynqDEE5L+
         D83KhSeN+eV1IPaNK5klaT5e7glto2MLFf29VLNLMAmZInveWV2cWHuw/b1Kl+FYJdU0
         nV2zsVlU+TAx8Jmd7jUEf5eh40kF1Wc8yRyUIHQjYjjjUz/gEWNoTxY1fxAq63lUzzOb
         FVlU3XQTL+pwnSakSr2AE6Z6lvcB5MO9AR5maOlwjWZy2IcVlGKDOL6F8tSWDROyFQYC
         h0mP9NqD4HdxTJUTg6AuVTY6aohgTfHkf8CTs46ctnEK9p+T/zR3CATJYu0gtS8oipew
         Tb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691784; x=1794296584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/b7kR7Y+deuVHS67D5SOGfvslKe+NoSSMlOu6eM54zQ=;
        b=TBpPE0X5dLwUfT+s34p7467NqvE06x5NvlETJSVzVv84NgUi58vq4Nvvosfu4mnP0P
         J50KWbbOTHcHBAsU/GI/yrO3SF/PreN/HvAB2udVUT9OCzLF+yzQW2Z++ciaVP3Ysvi/
         7MUyxif6BOrlH29KNm3YRkHIXsVk+Fk0ZvZFS8Nyly5nrW3A3R+LlGINd63q6k+TsaZH
         VbdIySuK2ZjpvlJ1LRdy6CkSjgt/Um2BOsUQBZxZ/L5r9+feDLExrDhPMZcBlSX1xWxd
         pMu4xylpxVIBQfwBMRqxg5x6jJfsFSA/I3S32+YGjBDKAGxpP5BYL3nB/6mg8eUJlAOf
         eKqg==
X-Forwarded-Encrypted: i=1; AKwUvByX2wG00sG4VlJBqFvrNIRYPDXlPGaBHIZ7Yci2DCqz98Q+l0n0OY2TP7V9Ek5y9X2pWgyATes0sdDR5Yg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PrCW/Lo/zoXuKEThH6VCo4NryxRrsE4LQ5vlUDcuphVonkK1X
	rCoLDBW1HXVO8g5uEnFXG2GdpMrNUwktNCD8a6Ksu8wglkzPVHnlrl+a
X-Gm-Gg: AYBFou0w7FFzl691bPbFWv6a0pFiN+jPh5YfutMNxhs/FGtAIEg47RTsZchj6VW8WhY
	aymn34b37vgnFfTk7n9ubb2M39Dsm80gnAVGd5Z+5uPqYt9+bOrEDzvVpWndxd9OwU+FFO+nmus
	sGQMfPTDtylcEt1UQEg/JbXr7Y7YQSjRBbWI3nhXtGdY7RpQOoPAH7OujfcQq6zlwzfE1FCbPWO
	P6cCLOVd/xjKlRmMZbH1AExyKz16InTQLKX0Rk6RKGnO1CS/khh3Qxuerz3dMKjq5HiSDcHWYmS
	YWhcIKUkPo400wCFBQ/brAkZrWKHf4IZxxQHCzIhp1ORoe1rRR6CVWCYFFlkWfaOlJY9zxX1hMp
	ykYY7lB8GJqFlQe7a7fJUqiyh7/2VSUTVNezV9tHmmZxQpfvlgMK0eeQUWki6JDIvQlt8hffnbD
	BSWNDh7JPnVsbimwFFx08zUM7rA0wLsjzxUlDNLQZSkEpOB5eLxGG1w6zXQGSmCfc40OVwTsiQz
	6L8lj0qNyj9l+cXQKOjulIQgBV7Q0NhWV8DBI5oLy1mi1oqRz7vf9G1hguJoXa60TOgShzs91Tt
	Y5mHfIadqaUVhwHrVYLjQF/BRIV+w+qhfi1LIlYOE/2ajmLbC3VsOByNmb5IsFIkb7oeF4IwtI3
	leMTLsoP3G0tJ5hPvwb298uz8OiwjHi25MATH9Dliv/gKgFi0LglkdYIvUCTSRaAujiKKaW5mzp
	fRLgM=
X-Received: by 2002:a17:90a:f6d4:b0:3ac:b197:1a37 with SMTP id 98e67ed59e1d1-3ae895362cfmr7683697a91.3.1793691783996;
        Mon, 02 Nov 2026 23:43:03 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:43:03 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:08 +1000
Subject: [PATCH v4 20/22] arm64: dts: apple: t600x-j375: Add
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
Message-Id: <20261103-macaudio-v4-20-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2964;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=nKyDcyWpWxK4UlDAQg1VAwHp+X0mdPayNaMxBUVyu6A=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+y8Y//97r25PvzvjpWdJ34WepC2NXJrklmvY5H9/j
 uWRz73zOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFPtnMnwV0hRfdnZHy+6mZX+8r16pv968468OqV3m646B2XuVvj+5TIjw5Nw/3f
 xm7LLL2+KOrTr6pPtNR2vJr/zvvMpc/tWg+cP5bgB
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 Max/Ultra Mac Studio integrates Apple-specific variants of
the TI TAS2764 and Cirrus CS42L42. Add these nodes and advertise
them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6001-j375c.dts |  5 +++
 arch/arm64/boot/dts/apple/t6002-j375d.dts |  5 +++
 arch/arm64/boot/dts/apple/t600x-j375.dtsi | 61 +++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001-j375c.dts b/arch/arm64/boot/dts/apple/t6001-j375c.dts
index 08276114c1d8..2e544f43b085 100644
--- a/arch/arm64/boot/dts/apple/t6001-j375c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j375c.dts
@@ -25,4 +25,9 @@ &bluetooth0 {
 	brcm,board-type = "apple,okinawa";
 };
 
+&sound {
+	compatible = "apple,j375-macaudio";
+	model = "Mac Studio J375";
+};
+
 #include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index e6eb6b6c386d..dfdf90fb1825 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -184,6 +184,11 @@ atcphy5_usb3: endpoint {
 	};
 };
 
+&sound {
+	compatible = "apple,j375-macaudio";
+	model = "Mac Studio J375";
+};
+
 #include "hwmon-fan-dual.dtsi"
 
 /* delete unused USB nodes on die 1 */
diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index 8a1494949e4c..fc45dd9b1a94 100644
--- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
@@ -179,6 +179,34 @@ typec3_connector_ss: endpoint {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
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
 /* USB controllers */
 &dwc3_0 {
 	ports {
@@ -410,4 +438,37 @@ &pcie0_dart_3 {
 	status = "okay";
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
 #include "spi1-nvram.dtsi"

-- 
2.56.0

