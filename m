Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691741;
	b=gA1mZerW2JaLraS92o/mXASmF9Tm4X4MjbFINKW54blHfT3IjRGh+PDf4z8dPcyxweKt
	 DfTIJTsNI5LZv4Ld0Ht6myHbYtkzuDPtF0bntYDsJ/ZhSQXYniaAxnoV1fri2wAovYQt7
	 oLgG13zIc8jhAZUzKbZsmfC1nSBn8LGionzXG9Q+IQX5ZI8GGgPxrec49WQubKObECkF2
	 BqOyRg5TDHG+x2AtCzVyIj23+lkJU3ziH4+WGnlLklXmgJxVBJgeZxkFGY/MxhH7+vKAz
	 m6BeKluK7Yra3K8lr0TIFWpt+ZXCk9bhuVcRXzzS0hT49eeE006x9ekP84OfjGNCCYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=vHOHvCSXEoTo46NVws8vPtdQYLdsjWLGfWtQNeT/eIs=;
	b=Ohpc/3vnC5ewC33o9rgxpVuAP8HokL89yvR+D17fw1YqwESSLVamrkWY3tDhHSNzxL/6
	 8aXTWgZCRzud7NnDO2xhUADSog/hNTjUTa7IYKwIG4SQHNLr0AtD04pQuBTgWpAG5SquT
	 540l6lnJlujY6FKOh8Gc3YjTy8G0Zu+EBCxJedZTaZ1bPdvXn13ZyKdYJ1cWwbW0hD/pA
	 2BWFs8N244czZ47l86ma9ojQ6iojFnpIXqMfRHKcXkiW4Hcuvxo94JhvOu0JAItPHjEuc
	 nfCzxN/gx1gze+roqsG30I8oX49GOIvHcZMyAErk9hC0KfEedO1rRcImQVMggCSUPRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yThAhWW0;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C52606A335
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81C52606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yThAhWW0
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdab6ae1ee9so1575990a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691741; x=1794296541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHOHvCSXEoTo46NVws8vPtdQYLdsjWLGfWtQNeT/eIs=;
        b=yThAhWW0dRG8CWkEVUNCoiDTPtmkgzZstfnG+kQOYR4G5uwPhW5fsUw+rKUiQcbqaE
         rUkdNIJ2vrFDrIKp7o/OQtdcBifdiCnOIJkbSRHLKMGFi29uPp1jyVQqDHVUWbNK1XTZ
         uWrzQTZqRUrWBeNEL4s8ThToNqCwx3WE/w3ynamG2d6Mtli98IwwLtKPUXFlTT0KCy++
         4Lr9SYM2kVxGHm6LSQq/IdXy3kwnSShMlerd5xEo49BA4rgbsDB2zvdQYJx+hpipwYyX
         7wJveVDTWHZlTharPfK6lzHgyfBVWeL9bq8q7b2YDGx212amOK35Hp3uLbwB+Gj1eBN6
         mwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691741; x=1794296541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHOHvCSXEoTo46NVws8vPtdQYLdsjWLGfWtQNeT/eIs=;
        b=bzzen78Qeh07/ogsHktUJ8Pqbe+0C+odT+c+hriAAPbV4gr/zv6oQ8W5OAhYXApf3x
         H7ubnCxsVvd+MHHcuzI5qkJ010XQtb9cxWfJ6OiESolrLVP6Eo4lxoaKDVGSmZQUAGbK
         olfMEfkJUNL/RaeivYseq9hcDbIvTzL/BiWQoLLQPKIIKY5ygnV4DYrrh4wNWh9hOlFY
         w4TulDPb4UZRtMvXJCiR68z93agvPR3w3I+tHc5U3mLWftNjiRfrLZ3qU2Qmo7FWDi3U
         VfqnSJwatxQiuNjWsK8YW/Jun3WPpC4y6vgj54qpt1Z0BolWmNHQMZA6AQCzKLi3Hjv8
         usmg==
X-Forwarded-Encrypted: i=1; AKwUvBzpZ6cN3aO03hjpn8UotsjQQTaDZpYqBZPeFOG8TldKmVoGtNXsWiGkreW1E2usnq/UV4qKj/Kx2Hkj2Bg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fhSkLXFJ6TzeUI6oIVeMCvfHbP3/A2SLemKQbSbuCldr2NDWG
	qdYzZckitVJxl0y9R285DjKjbKNOACMGF4Bjik3MhIPDniY7HAa/NwkT
X-Gm-Gg: AYBFou1LcTxATe38J0v9/iFV+8TEk/5hy3Xo+B4MaoRA0hIvYBQ2/r39cPo9LixLwLy
	VGTyvRj23BQ/6DYerItjkMcaTI7Jf/NVFCQKUHpjOhCL7zLATB9qHphTI0HSqqJGA9GCPqketZs
	+f9ZthPxDi90Vp2gAnk5H1JzR2FPKG8NA8HzB+P1YQeI+nsWJbNDwmsa8aNpnpfuNmeXCFNrIhv
	K85K3+G6Zcd3bTYWJMBtm3fYMfhpaYNZ1imv4kI6MDiikq2JYVAFT17ZyhdqNOXeuQjMO6kfmec
	Qa2kZZLNjMks2OYCmJSzx5A04Mc3ldTy8bniZ8O4bHo1HrakJSuH7WE36N8B0zeJAzu4/JOqJZh
	yLVDPcZxnwottI1ncNSKflEZytulqrnma6wIuISn5228mjdrac+R2fDfGP+8lbKrVNQrTc+qM67
	ku5ijAxCfIwSAMNRRhv389vkxp6issrmZbFnflIl66d906EnTvyCY1ZepSSTk5MjpI2wn7bOJkj
	0TYDu5n1PZTyAJUH1u9Gul+yFVOD/hrDAirh/1IZ6lQmSxY3MTzaG6IXfvA+puIexGBzvkunoei
	OcMVAB6O+nYmXMVV9h7uXvJ9E/N/rPvqQpMG8H4+GR7g2ZdnkBdHDrNYX0s2jiywy0piWQAZhV4
	VSgJrBNlmXWkuL9bOdyHR/1o4pYI2rB2dc6WIE0HbzLaCvg0gpsnDwfQzR+1I1cQXor9xdCVQS0
	2XZwI=
X-Received: by 2002:a17:90b:3d4b:b0:3a8:1a1a:7895 with SMTP id 98e67ed59e1d1-3ae8977640fmr7907935a91.18.1793691740953;
        Mon, 02 Nov 2026 23:42:20 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:20 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:03 +1000
Subject: [PATCH v4 15/22] arm64: dts: apple: t8112-j413: Add
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
Message-Id: <20261103-macaudio-v4-15-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3189;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5tHHgqd9nLG6wvk38A1iPKU89o+NzJ9eWA6n+JZ0CHs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/Pa69X5b1ifPf+kakJCX7iN8Vffb5ssE2q83HJ0
 4tNhRcfdkxkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKZa7hUjw/urKYw7es/HfhY599g8qmftTo4Td0T+bLPsjPq249yxI52MDCeFOBU
 D4tbsWsB3Wb7g7/biiTveJS1QmXeMk/2J6nxWLlYA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 MacBook Air integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j413.dts | 104 +++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 7ccfceb08093..62aba7a4d3c6 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -92,4 +92,108 @@ &fpwm1 {
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
+	};
+};
+
 #include "hwmon-laptop.dtsi"

-- 
2.56.0

