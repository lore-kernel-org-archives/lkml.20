Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FCC3A3E91
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790141793; cv=none; b=KDThSx7WygW9qx+nor3VDSUW4tqFoGFj+Q3tsMiawZ5uNqLOBueAizoCZHeHVnDcAshwkVUEUFk/lZQAXZ+NHyNd5kb49zFJQPZWlodoZQDfftoPyPvIbkNR8zqrm/IVXdELzRkzZmIpTAJR4NabH1RQrT+qF2bEo+zDPClsPW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790141793; c=relaxed/simple;
	bh=cxjDKZ0MA9VUms6JcpknLJlKdT7ZoJ5aaylgo7tCtYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W6v2w24mT+2lWy5gDMq4CWCRurCfbX5ykMz/frWLIV1KuhDkgB5S7EIfyxzLBJermgth1MAftjNeNVdSqUlA9SWam96I3y5PdT5F9BQ3eP57bhohxJxzNroOi7DxSkzW8iuOZyIl268/QF8G5xV1FgRMAwr4qHq/mk8LklZiJyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eEjd7w19; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eEjd7w19"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c4923c9429so317465b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790141788; x=1790746588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHj476tA2byKc8arhZaw8Ci81fHtdMiGqz0hVZIDFng=;
        b=eEjd7w19w8vtUCtcvfPFqKj+v4qyTlmYkyRQ4urFWKUusuoEZChikhf01YcT8IXvG0
         sdBfixDz4jR6z6ndfCO82+hQzPgYrVPgffnlY5KXy4EIGlZpsRGNY5YNVpottIh777zN
         2cRMP59ybEikhrngtEuGOGtiRXgIekFlH9qOZ8scHPUtJz2I4i3btswhF5D1Q3RLPYQL
         +gMv9f0qilvdnixX3CThrE8ogJAtSmIbzcvuSmWlqF838gx8bkBYb7KN6n2JwsIW1rWC
         m8BSj5i48MguQtJJU4LfHPbiQAiA91W8DK2j4jp2S2nylKnsmeTY+mFT60JPhTyTrKrx
         d3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790141788; x=1790746588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FHj476tA2byKc8arhZaw8Ci81fHtdMiGqz0hVZIDFng=;
        b=weI7qAXKRIcMT7LLl7+hLzD6wZUGy5FhNxItdcybEr5LpHjJQ5P0iPQLGfQDPEfqae
         Xmsq1cRQFM75HwpR1B8VBNYdFw4D3rLwQ0SVWb34dI6CAZv/WRQbqImkEP1smCSM2hVq
         Pycy1mfWgMtgTHwJ24hbWLfRSvy0WK2gRA5Wcn/tEfNfIelt5xMplHHjrxbboVsaL0Ye
         NAX/EfGMIKV02dnrGT21Ttxuc5ntqZ9SyvDd5QQ26GWrP9D8RZ7q9gA9Hfy0H+W869Zs
         QsytfH5JzVdWsmSjm0RlMsirmQcxkwpLWR9tDFkubmOfAVdCVt68mZPrllDFdPw/+fyb
         6izQ==
X-Forwarded-Encrypted: i=1; AKwUvByi1d9ZCoNdIHzn6P1IBwFGyVPRiNPWofEuAHY9iNQMB9tnnOChL/aUTKkwnnxdhzmQf6BOV66T3WFf02I=@vger.kernel.org
X-Gm-Message-State: AFuF++nQDRhAbKsAso1EUsXlqEHNQ97wAuY5mvIrpQA9tbFwgAuORzHq
	VlD0az3gkRU5/CSz0WY46JFOZbtuY7G13Ks7a7EyeMKKghwgJ21JiptW
X-Gm-Gg: AYBFou0hLBs9rDnXBuMmtYSr2Zt1DIHTMjBKnsURLpgYEo83UarjP3uy/P4t9Kfz/bv
	0aVYJNEGbqZo+qbVzK0OLBP9gmdaRmldntfHeQn8Bqaqexn3BW7vCI70ThTHfFLkDQs/BeZcw2R
	FLRuyJzlgoo7cEqoxpMKlk0vvnQIhaQZXZtJ8vHA5G6MaSEr1wa6nfR8TViDMGHtB40l33qbQWm
	4gsIPzaOGssZkLGRxPSlGbmoSb1K1lOWdtKjepyCgG+IovnHKwwsFExuLwJ7SZu1Oac+/fESYhs
	odDwmmK/m7oQPBXCIakerViZelPIkXo5IbgBnYi2mrpylUGZWpkw6sP051wzFVc00FnuUp9/Jd7
	gT4H6dt+4N3ft7XO7152CbphP4HOWFhXoC40w62COfd2/YcmnvbaI/Q2D0WzYAZ5l5QeBKQil4l
	ZVKa18ENKxNqk1ZP1VIPQL152nujAc96thytGDOZ4U0PfM9PNJlf9aOZFlIu0RmyzNC4vGfa9kn
	nuv6apqr+HpMcp6Q6OYrtMLIkqpykadum9F2OMhue2op0OJ4GwNIft29QBkW9YIC0kybM0YqwRi
	w2M0sa6nxSq9NQ+Nwnl9JN7AaPzXRmLdCKi7S0bsdzlGFRuxAtaOv6epfG+iSv3cDd8a2/vE4ej
	hG0i7RwZQf/E1dOIdR4sc
X-Received: by 2002:a05:6808:1783:b0:4c6:eddf:ca6f with SMTP id 5614622812f47-4d5b6bda069mr1922304b6e.12.1790141788407;
        Tue, 22 Sep 2026 22:36:28 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d5c4aed99bsm1436896b6e.12.2026.09.22.22.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 22:36:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 22 Sep 2026 23:36:17 -0600
Subject: [PATCH v10 4/5] arm64: dts: allwinner: h616: add PWM controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-h616-pwm-v8-v10-4-dccebbe1aabf@gmail.com>
References: <20260922-h616-pwm-v8-v10-0-dccebbe1aabf@gmail.com>
In-Reply-To: <20260922-h616-pwm-v8-v10-0-dccebbe1aabf@gmail.com>
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
index 1598e86259ab..90fe56a1d3cd 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -281,6 +281,17 @@ watchdog: watchdog@30090a0 {
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
@@ -385,6 +396,42 @@ nand_rb1_pin: nand-rb1-pin {
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

