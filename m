Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA543CB8F5
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792305373; cv=none; b=MnT8lKD4m9BzF8jcGEedjjCvgt7e3rd2Fda9YgMUmXuyjET+PIwtBjTP7s185AB4Tv3dTuOopXeCSDqKOB2RosZ/kavYYXIVLRg/WT+2MWji+RK3+6NOeacZp4yILLAUNN/IOt2R8j2hnMf+I4Q9MIqAqlKnVWH07o/7UxY+yCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792305373; c=relaxed/simple;
	bh=xWVM3P3KqZdLRnDMAUERa3xUt2/DEOiPobjU/soF9q8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l8nKLxHAl36D3XoAiJqe6uMaTcRmQsaW5aQRSCcDeaalPzLn6q5rPZZPCN3nJI0Cq13yGOK9z3/siGYJ5yMhM0Blz7R4a1XbDlCki0aEtY0iByMH79qL6dRuPQP4POUKywRyasD/x9COPM9++XASe2bZvTvQ24LYzgHnQiEFspU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=diXGC07j; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="diXGC07j"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd61a2dfd7aso308929a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792305370; x=1792910170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HAzlFpqY4S6yZH2P6UFaqiaYlK+IGKYJ1tKXbKgsXps=;
        b=diXGC07j3rrIY75zYfHahH+415H47I3P/s8RozRCC1p7u8BgKZF3XufstUwdHDu7KH
         r6liBFdBXHyy2EI53/y3FAA1/+B2bkoSgR5xgCAa19th/BeV8grR8dyxpXcomLgxP8Rf
         CGDD9RTsVEajCUvFGMVL56kf5tkQWjxgBgTTxTGaVh15S7Fmf+8cxSZSd+L4C2DKAL8w
         55D4SHfM39RhbO955Amny3JuNY3PNhxJ3Ni4auZozI50sgMod7Wz7UhDmzEAVmldbcKY
         A5QVRqnPEbYMKZGBl4F6ARtsYE89dywlXdIsLq8jBLNVZPoi4DV8wyoaOh5hojQFcsjv
         353w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792305370; x=1792910170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HAzlFpqY4S6yZH2P6UFaqiaYlK+IGKYJ1tKXbKgsXps=;
        b=sd6ZclDdOUzdglNQdOxvolZmx/bCIxkUVIATh4hAngKCfOkHH8gYoQgv2WROa6atie
         uLXirYB7hb4+PDBWUEZ09z7xAAOG6U27A1FOYZ7l0Ex2IrtTFr83oM2roG+Q7TPyZWh1
         dS1wY6oJ63IHMlnJMSIFobAIDUTAqBNpiXxwyr216xJ+LJpect16oN49g/Gwfj/Av2Cg
         fMrSYGTR2hYO+fZuFN48Vi3Zcefn1kjvRXSsDhXnOTHUdGfHn0MLZne06Xy1lubDHCHu
         oLJiM10ruMf7y4g3rOAPKVgThVBkt8ZBClSE3cUD48IFoOjrQ8WvRWieeaxAQJMAiJCW
         wNZw==
X-Forwarded-Encrypted: i=1; AKwUvBxSG/iPD3z0HebXw2Ryiybp9UtEdrkhwsnTZ8dl2FXA3v9a644Wj3NqhaCNR1nqdBZSNRiYFQydfp4977k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDVg9he4+ACdqtEqCxNsiy1BxHgdBJRtx9tHon5BEJXPaNuI1c
	w0DYVc3ZTE/yKxgTTfThzJFNkNObPwuvtQayUhQsFO24M8I7jsqFUsay
X-Gm-Gg: AYBFou3N2skljQ4iC9kNUp6xlqXu47jklkKLAXfkinmX45jJt0+QnXGtVFzsSXdw/rp
	WeV1PWe2nSuWPv81VRSYMJK3CNYvW7SpcNSEeki2MwFUe7gmoiY490eLpcFOtwAGpzRZSnC2/9Q
	9bcYWMEVSkXKNK0lJRYZrSrvHO1EvS1rjGG/8zUAi376xi3HMu0Eubwf+4gluLVvIUoJBoHaHuu
	X9wExeVYlhUIyLyU1qBr8N5opH+AUFkeKc1vAPI9L5gUslcC8FYh7hTkt1MTr1tqC0yWqt1nYtc
	Q5ATe5uQUBxmXcHqpFe16WVee33L4MsHsFtKTP6KiZclX9W2T2/mEgfdmrzewE8d66i1HyCX/bI
	NSNDT1F6skJxgFuiQcqfDdepn72OosXmeR++pDlQp0H9vAx0FKMa6TfFmB7PuvqBASfkfaNcEQG
	uea6faILmxOqfahpU8sJWG45D77AEU9e8qsaTQMik3bmpSMPmshokHCtfle9dFA+IM3rMH5inSR
	lroaJXYVXC0WPiUzg==
X-Received: by 2002:a05:6a00:2e1c:b0:899:55e9:880b with SMTP id d2e1a72fcca58-8a04be570ffmr3463065b3a.14.1792305370295;
        Sat, 17 Oct 2026 23:36:10 -0700 (PDT)
Received: from [127.0.1.1] (2403-580b-35b2-8--43b.ip6.aussiebb.net. [2403:580b:35b2:8::43b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57653ea9sm2718874b3a.32.2026.10.17.23.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:36:09 -0700 (PDT)
From: Kel Modderman <kelvmod@gmail.com>
Date: Sun, 18 Oct 2026 16:35:31 +1000
Subject: [PATCH 2/2] arm64: dts: rockchip: Add headphone amplifier to
 Orange Pi 5 Pro
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-opi5pro-amp-v1-2-05c84e91bf6d@gmail.com>
References: <20261018-opi5pro-amp-v1-0-05c84e91bf6d@gmail.com>
In-Reply-To: <20261018-opi5pro-amp-v1-0-05c84e91bf6d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Dennis Gilmore <dennis@ausil.us>, Alexey Charkov <alchark@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Kel Modderman <kelvmod@gmail.com>
X-Mailer: b4 0.16.0

The Orange Pi 5 Pro routes the ES8388 LOUT1/ROUT1 to the headphone jack
through an amplifier enabled by GPIO4_B5. Without it the jack is silent
apart from faint leakage on signal peaks.

Describe the amplifier as a simple-audio-amplifier aux device and route
the headphone path through it.

Fixes: f47af8ebbe53 ("arm64: dts: rockchip: Add Orange Pi 5 Pro board support")
Signed-off-by: Kel Modderman <kelvmod@gmail.com>
---
 .../boot/dts/rockchip/rk3588s-orangepi-5-pro.dts    | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
index 783675337a..f5e43dfe1e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
@@ -18,13 +18,16 @@ analog-sound {
 		compatible = "simple-audio-card";
 		pinctrl-names = "default";
 		pinctrl-0 = <&hp_detect>;
+		simple-audio-card,aux-devs = <&headphone_amp>;
 		simple-audio-card,format = "i2s";
 		simple-audio-card,hp-det-gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
 		simple-audio-card,mclk-fs = <256>;
 		simple-audio-card,name = "rockchip,es8388";
 		simple-audio-card,routing =
-			"Headphones", "LOUT1",
-			"Headphones", "ROUT1",
+			"Headphones", "Headphones Amp OUTL",
+			"Headphones", "Headphones Amp OUTR",
+			"Headphones Amp INL", "LOUT1",
+			"Headphones Amp INR", "ROUT1",
 			"LINPUT1", "Microphone Jack",
 			"RINPUT1", "Microphone Jack",
 			"LINPUT2", "Onboard Microphone",
@@ -44,6 +47,14 @@ simple-audio-card,codec {
 		};
 	};
 
+	headphone_amp: headphone-amp {
+		compatible = "simple-audio-amplifier";
+		enable-gpios = <&gpio4 RK_PB5 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&headphone_amp_en>;
+		sound-name-prefix = "Headphones Amp";
+	};
+
 	pwm-leds {
 		compatible = "pwm-leds";
 
@@ -233,6 +244,12 @@ pcie2_2_rst: pcie2-2-rst {
 		};
 	};
 
+	sound {
+		headphone_amp_en: headphone-amp-en {
+			rockchip,pins = <4 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	usb {
 		vcc5v0_otg_en: vcc5v0-otg-en {
 			rockchip,pins = <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_down>;

-- 
2.55.0

