Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695241;
	b=zDWP8FlDeIsuJuBezcvKUP8L7cCYQ+iDUn7LW+NGCFKo6ZO4GELy7FMpA73GvHs8KH71
	 p/qVjDu3L15EVV5tjHuHc8uteAeL79bKWQbEoIxVnqbIAf+K42dHcaXnXjdR8sW0rnnWA
	 Iqgk383JSXK+kJrAdLtvO//OOF38jWdE+cWdDsV6Naj98oksfw6cbswOWVH+vBV7KGIKU
	 E2QMcl0IGr58tYlxIKfcRtGG0lnLuLnl+h8rShASWPbcAmkUze27a4TxePlAtFW0uo9cS
	 qFMCOAjRW78KS8k1MqglOcDxufHxBy9jzgdcyykt0udQ2R6W/LJp40bb+3LSJrK57Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=;
	b=BbPbmQK001f+3BfBvDM4xDDwkPjGF34S2X/gXi8R8x5ZkuL50BKOiHjNVDwHXKjMtW/v
	 lgsLKriZbgVEtBzWElKjfh0CokTu4tkL1JliaPg+w2Dao1xPrH3pOOh95bnvHQR7+Q9sN
	 +Hddvn4M5uIlVHhHK740vyGY3YlTtn/6+EOu0VUxYYXMV35zOnnsro24yoU6onsng7Bqm
	 NqLPyFoqNwpk8b8MjzcwF3XAyF9QAB3H+QYKDCKbkhRn6zEUp+iYc6Av8hwZ398XKfJrM
	 moZlo8JP4U8FTVpozIBPwWfO25yggqC7cRClxnLHDHUyOfbUIjcLjZmd+UXyZ0Xt5iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rVBCXhox;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CC7606D80E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91CC7606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rVBCXhox
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6de1ca1b05aso2877477eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695240; x=1794300040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=;
        b=rVBCXhoxhmxcS16Rq20RgtufsPsPsfPY/X4cIh38MFyg3Ep65ewQXsub1G2U5YcDmy
         ZCf2cwSJyWoRmQtmJZSwBlslK7OPJkX3Up1+7lZeQdfp9XFh7Nu/3Jc/0P7ZQlGA1Mum
         fhlONm9vM5YxgiP0e2aX6ob1VgnC8beVvVfjyibq/72fwBpEbxSzYIQF/Bp3476FaaNL
         ZPkd4y4pAaX7D/QPZCUxpFtsPpoEczYnzQkZYVUAemz2pwzhDH+NFRLovA27zeoMpVnd
         OWNy84whZBEoGPR7Fu99JC+wW0/tWJwTCKjBjxXrnvDqWXUgqiw/v03HbsGT55OV4Yld
         Zbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695240; x=1794300040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=;
        b=dNidtt+fTZ2rypZFKkBBI3HihsiFPbRL/8yddPp0b5UddFlRpnR3rxsZwZv+pbtTGA
         Z/1FIjaR0x7uUHy5qJXjrC4JHRI7HvMjqUvMGIBmMn8uDsxWrWMI0eRltm1ybia+tCTY
         /U6YsOyEPq6qk7MuuYM29j2rnq5CMuDM9+RP5PPciQCii8UusxHY3qONltAIzOEZ4Mhz
         WW6dOEf6qj+LrDGKXEvYxHY6ZLCV+0ibuBa5Smm2O+QT0ZrPy4k+kV2o++z4LtnZqSZS
         tPfN3VkKar3l1HY9de5iEVjBPaZZEAdcH4fN3ImYWv7gmC3lzxreHG5TDhrK7IzWo3q6
         iVDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcxxqzZ/daM2Eiff7qAxLBQltEywHeSCKGjgTI3waGTe6sQIQvqzQnTxIcxbASjwffhBSnIq+mEX+zbn4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Vl86awTJyNeuLJ/xFlg+xuSt2mXkp2uJU+Cln1kF3HOwbA4xn
	bSMflfh+3e2kY1kjTMKpynLnM6IGUIrxPWDZy+/O0gwBnGm6LYUnpgKq
X-Gm-Gg: AYBFou2gMRH3yq9ZrzzMyRLOQwKtlRNo5hbPxQBv5NeZeQ3si12jOLB7D82OEisltCZ
	/PWYI20olYRIz1ETQ1HprhP1iUpp7GS6kf5NIDNqvyoW9npg0M+nGj11lWuYSwaARprGqzsqDJc
	oimWKfteLVOyjP1yxuipB14JH85wbFuKYbO25Jkv8SuDA/xlSmRdTmX159EKiHIf7ddQXq8NroF
	firFDiwUwnX5StBgpp5vE8FX/rt6/IfCWU5jfj3WpQ2On9T/a4LJBfK6LyaTuNLjWBb0zq6Lvx5
	o4mS5WhDmcGAdq0TRL7k2j8pdr8LxxP3Kl7iucLJD+D3uipxqzka9e9Wh0+dYaD1vY3+NEPWtSf
	LiwYCrm8EJpCaJjXP+x+9xUhtLQjWkKIU5upG8317eAt2GsSODYabXfLYC88wEIdTU6RouAqMwo
	xIrqgNlbKjWCKcICyUBDfOBe6ql5DaboJ2XHhXGSoAYwpL2JiOJfS3sLXilGCn8vESCkZutRklZ
	DCg+z6xbgu3CaAwEMkgJGcqZI8EaNuD2AHNAjuRkMCrYHv1LcemOQyTn5f7p7wB+yj+Ky5Jm8b/
	XvhIlcm/d11gltPGpwlQ1rWSXhGXvqzUxWJr/IBBobIWUMsxHWvbG7GdWc82rlGLAs4t/ZTS3Jh
	KLTSlsD2mVQtmqIVZa6zAImX42icoN8r9Iud6Sxj+muOc9Km1e05dmQk8zhVi+Fj9edXv3rv0tJ
	2z2w1V04ODvX+Cvf1yMScmYDbnD6BTDwWaTQgcz3SLFxtb4+yrtyJjCrTot853WbKTzMwHVyX3
X-Received: by 2002:a05:6820:221a:b0:702:778c:ec5c with SMTP id 006d021491bc7-714f29d36c6mr6837555eaf.53.1793695240569;
        Tue, 03 Nov 2026 00:40:40 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f3081097sm10520397eaf.13.2026.11.03.00.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:40:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 01:40:29 -0700
Subject: [PATCH v11 4/5] arm64: dts: allwinner: h616: add PWM controller
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
Message-Id: <20261103-h616-pwm-v8-v11-4-07abb59575c3@gmail.com>
References: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
In-Reply-To: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

From: Richard Genoud <richard.genoud@bootlin.com>

The H616 has a PWM controller that can provide PWM signals, but also
plain clocks.

Add the PWM controller node and pins in the device tree.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 47 ++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index c6b3a3f8359a..b6580f0c6e0f 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -293,6 +293,17 @@ watchdog: watchdog@30090a0 {
 			clocks = <&osc24M>;
 		};
 
+		pwm: pwm@300a000 {
+			compatible = "allwinner,sun50i-h616-pwm";
+			reg = <0x0300a000 0x400>;
+			clocks = <&osc24M>, <&ccu CLK_BUS_PWM>;
+			clock-names = "mod", "bus";
+			resets = <&ccu RST_BUS_PWM>;
+			#pwm-cells = <3>;
+			#clock-cells = <1>;
+			status = "disabled";
+		};
+
 		pio: pinctrl@300b000 {
 			compatible = "allwinner,sun50i-h616-pinctrl";
 			reg = <0x0300b000 0x400>;
@@ -397,6 +408,42 @@ nand_rb1_pin: nand-rb1-pin {
 				bias-pull-up;
 			};
 
+			/omit-if-no-ref/
+			pwm0_pin: pwm0-pin {
+				pins = "PD28";
+				function = "pwm0";
+			};
+
+			/omit-if-no-ref/
+			pwm1_pin: pwm1-pin {
+				pins = "PG19";
+				function = "pwm1";
+			};
+
+			/omit-if-no-ref/
+			pwm2_pin: pwm2-pin {
+				pins = "PH2";
+				function = "pwm2";
+			};
+
+			/omit-if-no-ref/
+			pwm3_pin: pwm3-pin {
+				pins = "PH0";
+				function = "pwm3";
+			};
+
+			/omit-if-no-ref/
+			pwm4_pin: pwm4-pin {
+				pins = "PI14";
+				function = "pwm4";
+			};
+
+			/omit-if-no-ref/
+			pwm5_pin: pwm5-pin {
+				pins = "PA12";
+				function = "pwm5";
+			};
+
 			/omit-if-no-ref/
 			spi0_pins: spi0-pins {
 				pins = "PC0", "PC2", "PC4";

-- 
2.53.0

