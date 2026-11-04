Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820310;
	b=SKCdr8ncgC3iHcu/jTvQkkJm2xO4g3uMOSSuFceCzAEfzWcIENRAYvYFwSavzeIucJPe
	 clNIbAmACTttltyIbE06fry71U/1ENSb1kp217ZVoHisLzjNOtcNnruvl4AMK9RDaeTQW
	 3HiwQViFiT4lp5s4Asno+bAtsynDJ0+5+ZMth8sFafrqkiaAZpZG/5IuT6UKlrakxAX2t
	 eUWjGYUEBRVhXSK9AfHbsZnC2FtS44SwKZpqoigEIdqjOlJaBbEgQfc555VxO2SSVQuhn
	 x2N42Oh5jLrQSJ0hZVoWuRZ0fpPCPK6E7Ei7mjgJlsVCvGHH+IVxq/ZpMgbGNEwZ1KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=;
	b=srZ3I9uw3dKXnJk1YPzpnFAZhRCq9rXlKS//pAWB14JsTbAWipRvxARWsbRkG8hFhSZ7
	 1YdR5odgfEqPtzaQl3qvodSbnS2PIoqI7oelIlfD3E9b9TQKZSzfyEgrnSqsZXUzHVawh
	 PD9Y9KPwI0sa5lOFimlQ9nbFbuDQ8CZDPnqUQsqgcyIo9pCv+ukeVB+EBTSwMUDQZzqjW
	 rMWMgD+RVlxQSfcAFfabENo94Bt1qQFIfuyUh7/9jJNj4ogig+/2JZGRRrX7Ai7emy781
	 cVuB0+0i52sAk7zoRDDlKe34mdgTqcRdQWNGc2baBR7OLAGg7ehTwljfcYIAaDk3xXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xlkBuxiW;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46344607F2B4
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46344607F2B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xlkBuxiW
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-84a248254f4so621267a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793820309; x=1794425109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=;
        b=xlkBuxiWK9mHFZ6iN9g5y0fn16X1yn8UtEixLRdZoFQcpS9PdMwLdnlMrc4WbhdhAk
         4SF8uJyzjT/KxvKs9sPQi70xklj1OFYTi9nUPICSitilZ+yxHJ50ss9xnE+zczj3FAJi
         J68fk/5fDuCYRUhQGTYbx+rrKWWtyHiczRhwTTbuCPgH2qnG1rmrjDb04FqMblkYZ1mc
         vicUzM5h3sq06bE8GkOhNKzef9nYi1s+jJTe/76FuZLPTctqdFP+KswhdQJuyBiyYjip
         KaREhMZd0iFR64nR/VgRuNUYXFNoQ3HqY3iAcnB3p5yGnyge/AdHM7M/JCQBb8e8vQ01
         QTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793820309; x=1794425109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=;
        b=q11kCkg1YBizrHSCjSdhyWOG6lJ9ucPDCj6Ai84fVZ5p7Ip7Rx+eANvYzdX83Ji9yo
         NXMuZx9Fo0y4lmal10Rs/7ycgFVaJ6Wo4q3uTC4ambQZUk4W9MxsDyr7E3xuc78Wjrmt
         ZshK/8DfwXHgHkoL8BT1wZi2NcedQzR4xgMIrqG8l8IDhTm2YjsiYf8ebGCuFKIGGZZY
         uOvOt+7aRP1MwQshxkH1MYjFWwQJ26u/YH2ogpWGTyG7M2gE03pCis6sDUhmZba03V1O
         FspF2kv3l9on3lySnII6iZew3c+lakW6fIZWlKPZ/gDsZe2Ol2Yhx33CQuJY5FjsN04I
         FsjA==
X-Forwarded-Encrypted: i=1; AKwUvByDK75wyDggcWg5DP3ZIY1AhliAjblkDB2rngCJh/ls6kpSez7sfb1ZRB5l19eTmJs4o7XMC4hZtpF5Vg0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NZ2oCXQfFmx+Va+PpElgBAzJjaX/Mi4DO2qZXIk1vzLC+hE8N
	5B07bGn3xCNywzJ658AbOGvV9oCZwqExkP/xZ5rkOFM6ri2nLTrs+NRwakrj0R78
X-Gm-Gg: AYBFou15239vAKlcWqeV6GsgbPUcaJ2zXmpsOLi3aEhCoMaZhTy2RAP/Xik7eE26jMW
	a+yVo/ORGpaSzqqup0KTc8EnP9ySH0Sz7KGRDJRhP40zQs5LNXSJ0qJaOhvOKE8y5cPo4teks5D
	ZVVvFj7TQ5ONxF75d18be3MXapM5bFx/YNvFup9OoOqTwea5uzsapL2ww1KOJre0SqDJKLZ1mou
	yGINm5oZFKnqItxKNDMBPw0BXxCcCIw97sd18mA1UrDx1vf4keNuOFzZX9T1W/QJoKt5jU01A2L
	yNfZwracQAS2IbyhtAkcqnRHcVqwTIwJyX/GH6h7+Jgle8tn8Zd66L8GfAeXmRVzBTs1hNspmjg
	qJDWTtdj9PyFQvHITAZNB2SSIyWjuGFvu7trwKSXUdMJlDEQYwY/rArcTYbj7y1dsTP2qND7Q0o
	cXZNT4PmY/jullqedPH8TlbmlTY3AtTwjmLkhGuAPmPJm1Ecy2JADuwLQ/W8rNTlM8LsB/MFfyR
	mxlx/jmxSw83tLoZiAxujjYstcHKW9JqsCyQ1B+FwBjc0sD7DduTDKyDfwyWrPYflJtchOV8gEL
	wmj0oN0VPYaDzIhWaX7a8+h2qk3FwvvEbigK9N8qdcG+P3dbosJo8z/UFJINlkftueaayaJ9bvT
	sHOmX8mK8/K7lwiYMirR1zzKdhm4PEQ9zi74sRYmyLX4DltviWUwst3NkgUwmewtV3M8MUTTxyv
	krj4jO53TJayASX9u5/wcxLRODS2VcFf/X9Piv9zuI7u8ZXlU3HXPr
X-Received: by 2002:a05:6808:2218:b0:52b:7641:33a6 with SMTP id 5614622812f47-5640deea502mr12233182b6e.14.1793820309111;
        Wed, 04 Nov 2026 11:25:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9c7bbcesm2328723b6e.1.2026.11.04.11.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:25:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 04 Nov 2026 12:24:54 -0700
Subject: [PATCH v12 4/5] arm64: dts: allwinner: h616: add PWM controller
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
Message-Id: <20261104-h616-pwm-v8-v12-4-8ed39b0dba69@gmail.com>
References: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
In-Reply-To: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
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

