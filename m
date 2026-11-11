Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413803;
	b=uEhm3XqzbzEy2MWsXyEH0xSbarSATxV80P9WJtyj9HIwsfDwxCirItOGw/W0+jg6p4PQ
	 5jRy0jFdsLwkAYsrR+B8hvh6yiPZx36CkXViFiSSi6o3YneAbCqYLzNZn9m8JXmrWY8jr
	 Xssm18ojFWC74KqIcID+apymqu8iermWB28K/5Ohpq7ep0aXbsTtPpLxBfe5bB+rgdj+g
	 pRUkwIDPG0X+06YbRwnz4fKwuMqSN//Fq5jmNUF8YVgWPNhWNUKNSs0iMRyZ1/lGQP2XN
	 Ld/b4Gxsu+fZgghxFuhmRxVnf7jwrMRQgRN6gP21tqUyzYjeiVUzmwgQQ2jRfgDEnbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+dRaeVfgsyPtrbZOsuqy4B0zrN0QNLB0gPpKiOiCtw0=;
	b=Uv1NA6lcdoOM4nIoVQe17yD55er/erkjRS3xc8CApgenTndbIU4HPPH42WHltK0DZ3zq
	 tSY2a1JInIUBFSKYNLu4/x1s/mtZMP0EzpN/09cc3v2rIykCyDqauSxAUV/PM2jdHDTCs
	 94TAljeIIEtnlGkMYrG32bdJ/4S8hmHGU3F2RqZ5RB7j74BF6WHW5w9vjsO5bF4aZzmWV
	 SGDgXgreYpjLs7ndVc5vTzEld2LugOAMJbd5IkGDMJZddCGgVxg+hhyETQElDmJmiP2bX
	 NLdrJ8ogUuY3YsVY44kMPlWO+Acol8/B5W7dIDYxgyaYobfCbdmr9CWccEWRBBEa1EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b="CVimmv9/";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC1C606A8AA
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DC1C606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=CVimmv9/
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso25855935e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794413801; x=1795018601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dRaeVfgsyPtrbZOsuqy4B0zrN0QNLB0gPpKiOiCtw0=;
        b=CVimmv9/YyZU6AJwXGaip7fVyORgOVY9vHCD0+v9Wsq2yB1Mgho/tn/ThCTYFKNijG
         oV0p33U2a1daomR19trtTfpeUBCWvFTNi4+juWIcEu4kjy3hQ9AurAVAfbuEBQh0qie/
         3g0dDnORCF42d1HF4U+O4bx10ZDDeqbDtc/+bNWE68IhE2Dw1dB90XPgmcbClpwLelqw
         se75rKSVFNADxNyHo4nwo2YKPPUlO+TizaKYzva+wrIt2vlopEERzC2WC/Aw3fVFU8v2
         f5ctqoTruT+DUYX7023GtjqCUtLnlcE4np1oDxg3RJpbzwn9cw5iwvdZ6MdDjer2XkYF
         afYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413801; x=1795018601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dRaeVfgsyPtrbZOsuqy4B0zrN0QNLB0gPpKiOiCtw0=;
        b=F566JuuR6PYVyrk8bzxoKw86DOLC2g2mclHTnBzyxRO8P/eT6eAZnTOSF9AaokDwDJ
         4arvpP+Dwo4jrncVqT/gS9rOBPLVXWWmf8xB4+E9K7U809NBMSEU6CjC1alXheR+V5JR
         TY7V797s3KGVPtQZ9OUHSbwlVoEOm0PHr2yUjJ+2WZbwYmfU6qw9THnJJXk9MhU5k3UO
         aMYmmnQemkAEESUdS5+Vf4lq3cPzLdEONilJ1Nv0VD/9+Ctza64LE6IROawg5gnBDfVv
         TufLTqk4GVuxkRTIu1WmSxmnCbU/lfMaYi9E8qiCFQo4wLfSoNbODHmCfVcme/NNej3m
         jxjQ==
X-Forwarded-Encrypted: i=1; AL+hErEIQwjg9gmYyz5YFc16RxHC49airpFUilMX0F95ELT9zqbcUMQno39cCeBxyGC6+lYJe32SeyOiEgXRewQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1KUGKq5j7HD/CLtzQHPGZLKMHGnaW/3SPvi/ZrHmsQtnUMd2M
	fLIxxhniFjFx5EpSUDG9I68KLwgSNMEl4JqDAd6uJOMKE33Q87nHfv0O/2EeU3EKM60=
X-Gm-Gg: AYBFou3XKjpEf/7pRq6UVZBzFzsG5PYRYyq/o2CLecG/9HqHsu3brP3fiLunYM0QcOQ
	8UmmlbR5EnG+lnqs9KVQMfi23bp/snQcfJ0eZ+E1IYatCskDwpOBuOryQwyHW9yiYO1G57UVLg9
	5Dj1ZcGrEKgAqeAR5bVc1xpAQmltW3jD8/96alQM61NWsjhkhJb4ZSnc/3Mm6ThpTLGD8zKaBSU
	EVfMI+HcVVNDMevRbiDJ2017Wm1QELl0qTYccSd+IarEaFTFh/SSSDHvmUtRUhYJGX757nMDWBJ
	/So+AN3EgWzMJCKWjyDua4EBKu+NVA7uIKln2GpsBN8i3imxP+HD3qB6ypmlMwRctXljn2yBbZ/
	TTRVN8Nsu8b+qX2O/0pmVpalwjH+K5b3tLm19yFGIC+xpFXCI7/WCZQGTBh/ImOjIXzYroPoFKh
	OCTHsNbWKnX+f9ObaGK21pDu4fnix6h04NMbhMDJXGW4/wEvDfl1hmPpuvRsNiRSjRc0kkC1hsc
	zjh3GxYD0zjmmt5LnqdqmgrGBdMaW9CiQQj1U9qu6iCjEetkKolsv+LHjYwVAcQFnX5eqk5yjDn
	MLTK8U/QdMZX8f5OkEHrsoH8jZHXHd78MVMe62dVWzmDUoUHn1aqptv8m3hxlGbTeVeIvDmlycx
	EHvnMhqT8Zlk3t3BcOTkMvFMkKut/kveWTyvnzw2pTuvKQ2OOA/cPS4Pxnl1RA0Pf27Eq7ULQJG
	AEbz7j3FXkL+USbwN3Hlhz3CToTTtUyrztBDlWbk8arRGr
X-Received: by 2002:a05:600c:1986:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4ba09379b69mr50759305e9.8.1794413801590;
        Wed, 11 Nov 2026 08:16:41 -0800 (PST)
Received: from threadripper-fedora-workstation (d-zg1-240.globalnet.hr. [213.149.36.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c52fd01sm8374925e9.4.2026.11.11.08.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:16:39 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 4/4] arm64: dts: microchip: lan969x: add fan controller
Date: Wed, 11 Nov 2026 17:12:48 +0100
Message-ID: <20261111161619.232141-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111161619.232141-1-robert.marko@sartura.hr>
References: <20261111161619.232141-1-robert.marko@sartura.hr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x provides a PWM fan output and tachometer input in a register
block separate from the temperature sensor. Describe it as its own
fan-controller node and keep the temperature sensor compatible.

Connect the EV23X71A fan to the controller and route its pins. Use a
25 kHz normal-polarity PWM for the board low-side FET. Set cooling
levels so the fan starts at full speed.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
- No DTS changes; renumber from 6/6 to 4/4.

Changes in v2:
- Split the fan controller from the temperature node.
- Add the EV23X71A fan child with board-specific PWM and cooling levels.

 arch/arm64/boot/dts/microchip/lan9691.dtsi         | 7 +++++++
 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/boot/dts/microchip/lan9691.dtsi
index 52c22dd1a15d5..039c2014aa341 100644
--- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
+++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
@@ -522,6 +522,13 @@ sgpio_out: gpio@1 {
 			};
 		};
 
+		fanctrl: fan-controller@e2010348 {
+			compatible = "microchip,lan9691-fan";
+			reg = <0xe2010348 0xc>;
+			clocks = <&fx100_clk>;
+			#pwm-cells = <2>;
+		};
+
 		tmon: hwmon@e2020100 {
 			compatible = "microchip,lan9691-temp", "microchip,sparx5-temp";
 			reg = <0xe2020100 0xc>;
diff --git a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
index abb21a8bace9e..3cbe5beebce1d 100644
--- a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
+++ b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
@@ -775,9 +775,15 @@ port29: port@29 {
 	};
 };
 
-&tmon {
+&fanctrl {
 	pinctrl-0 = <&fan_pins>;
 	pinctrl-names = "default";
+
+	fan {
+		pwms = <&fanctrl 40000 0>;
+		cooling-levels = <0 128 192 255>;
+		#cooling-cells = <2>;
+	};
 };
 
 &usart0 {
-- 
2.56.0

