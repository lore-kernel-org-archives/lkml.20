Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793121710;
	b=brzVXt6wktJn95dhd6qZePKKPrLkmynYxELSWrd2352yAa6gVhQPgkl2OkUeaLRdhH85
	 YU91N0ZVRbqIMbe9IzXetoJHxoyIjxIQXJ3huYNRYNi1TpvJX+B8kgfBaQhDco76F+Cvj
	 LFGUc3MIL76znCOXT2pPNMszjEYtuhjUs9fiIwNilZo+HY6sE+1PDt975FQOaWvlVS6O7
	 3ZL/OQpfE4pG7XX86kIHTyIWVKSys8/snSauZHnlY33Aogoeb4SQSNvvulXU4YjLG0IE+
	 B0VjY0t79WTEeuzmG/WXppu0mZzJm66HCC724Hw1MMYeS7NT+VcK44HXTA7jATcEVMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793121710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4NjwcCRUit4k9bfPnEwrZTpteoTnUrUFgb+iE1jnD40=;
	b=xmh4FUuHZXqhTqbMzD0DGfUsd55+DNOdYHAUWGgTroffXWrbpeb1KjSU7kUzRBxUqj8O
	 Ky8iccMFvGUWzjea9KLHo1Jx2SoQBGdKa1oCv/ybYa06LqbBMRO9dGbs9Sm2dYQiAcJN8
	 JYNT04JACAygO9hsEZYbCkxd1DiHRmmGL32rgLFesmXdwClBmMiz3ETpulDW0gg5wNDdr
	 yiWveXEvTiwBaP/ErNijF9ObzItxNgXlSQH28Q/dm5nWp9wGutgiCZMn57VvoMJb5t0v8
	 x7EKbFgwrw/E13AoI5JFnQP/TT8Ufl6KGGd4V2Y/jv9Mkt/eHmgE49NH8B0LLcP/c9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GVv2Hcjq;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF30606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DF30606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GVv2Hcjq
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36a1947498bso222088eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793121709; x=1793726509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4NjwcCRUit4k9bfPnEwrZTpteoTnUrUFgb+iE1jnD40=;
        b=GVv2HcjqVBxs6XsdK+tGsX6dQUvPiAlRmb8qceFfQD0is/IFu00DFUwLT9RgIbxM13
         2BDQcke+E/Iumo7jQ0YGoagH7oWG85o8Pj9E93dx/qJFNU6Y6uS7Cz7+CtvTMDmjWaXG
         oOlGYp4BRu/zHAKhxHMKrQjrFlQeUJXHTwayCgJXhq5GRCDFB6QAomPn4c0P3Pbf708L
         CL4phI6IW+vDqVTrIWAtfOVhaPWVRM9+JKTqeiXHArqdJ8Xpe3qlDrCtan9YUwxOpJhV
         mkaEvI66t7CyR+gsQOMfjqLBlvNECXPo0ncPO5vF+93NBPyj3g1mv62GYR9+mKUSWIuh
         mUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793121709; x=1793726509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4NjwcCRUit4k9bfPnEwrZTpteoTnUrUFgb+iE1jnD40=;
        b=vFShfxDS5jQHUYweYYkmlyReCiD8ICRdQ3J5mPm4o6AuZukOf9gDjf3Lzq2W5tptQg
         PxWwUdlTbfV9IqxJ7nKp2if7KchrfuGJsuVQz1gJwyfYvF9+HKiuAaGW2NLlDM0Cwogv
         NQEbAGgYNQF/HFifN2z9zOfRIi8Ue63XWWkLiVNHgEsrk2BnkLl+aQCuAkJMpmvi3Eul
         ORwC7XPV3/mBvyx8eTRFqtlsgoASw38mqRHKDDkpL9Nhy0WNaudPhrrvmFqDvqvDNoAm
         pmJK5gsg23x3z0J1aOboHsEgmTjhBTMT1UT4SRGAavsJObx95Ohhn+ygnBBrya1BaPB9
         sJrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKc+H6VV4LJTXFD2sdq1JKofTsN0spOdgs3dS5sXRDlf/97bAOOvyhsZ1qcEgueFJTZlSzL47m8G3wdxo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNnl1KMIad/nbAwvT3xLVgXjz6WLEebZJRRpZvlUpMABnbpbkZ
	kE1ScFw9ReIxoXxi0g1FHcMTYJ/KSId4Yi0RzOmP7YgGS7avh2iq2xb/
X-Gm-Gg: AYBFou1Lshb3R8F86/wCoTtLQFygveFLT4Btjm1LHWI3DtS8cA9gO06aCisIjPW1dIw
	Me6D1dNJ04cfgnL2jznBx6fqshrxsIJGsZCnYBnIgL/glFfkpHvbGObhhGKoek2P0VHLPjnr3/V
	cu7xBuEGQY/Q6ySleFW6GUUKG/yEsvRyQB2dkbRU3iQmlWygVHPYpHGD1JgtptUIdxLx0opRX7d
	IsnWBEggOsIQp7Fsj1MO7R+PNShBWc5yQM+111VrqJqFL10FUcWrSPSqryDWVS74g+VQpTv4Zx7
	ggMz9Tsro9eKAyB62tD7Wk4DCGmi6Yh22qmvz5Scb++K/VuEadh5xaPO3wzH6rgSHdxpcCQA3sc
	DqMEJmDSXc5dCXQjMNDOnFsVh3NU2SrqBPGH2BAW3fEciOABkj2OCvjVbJKJLLg8QPthTFnkWrB
	qBHqd18v+uUyLR5wwhXAO4UGwt5K8z3H/NJNwxjsbHD7n/JdyKKI1o+5jxLp2+VNPWKlAPaN/78
	Y3REkPIU5rMNYQX+pBklQNMqE6TfLYBxzcoyzY05xQs19lHNqYedreYS7KBxbaBu+RxFNirpUTu
	T6WP3m89PKIB9gvKTLA=
X-Received: by 2002:a05:7300:f587:b0:366:c497:610c with SMTP id 5a478bee46e88-36a204276a6mr78399eec.33.1793121709042;
        Tue, 27 Oct 2026 10:21:49 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([49.204.164.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm59948763eec.25.2026.10.27.10.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 10:21:48 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v4 2/2] ARM: dts: kirkwood: Rename netxbig LED child nodes to led-*
Date: Tue, 27 Oct 2026 22:50:52 +0530
Message-Id: <20261027172052.129283-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Rename the LED child nodes in kirkwood-netxbig.dtsi and
kirkwood-net5big.dts from descriptive names (e.g. blue-power, red-sata0)
to generic led-* names to match the new YAML binding schema.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Fixes: 59cf91cf87ab ("dt-bindings: leds: lacie,netxbig-leds: Convert to DT schema")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610270710.aWUm0pbv-lkp@intel.com/
Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
 arch/arm/boot/dts/marvell/kirkwood-net5big.dts  | 14 +++++++-------
 arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi | 14 +++++++-------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/kirkwood-net5big.dts b/arch/arm/boot/dts/marvell/kirkwood-net5big.dts
index 2497ad26b5b6..49deeb40f4e2 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-net5big.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-net5big.dts
@@ -85,8 +85,8 @@ g762_clk: g762-oscillator {
 		};
 	};
 
-	netxbig-leds {
-		blue-sata2 {
+	leds {
+		led-0 {
 			label = "netxbig:blue:sata2";
 			mode-addr = <5>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -96,7 +96,7 @@ NETXBIG_LED_SATA 1
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		red-sata2 {
+		led-1 {
 			label = "netxbig:red:sata2";
 			mode-addr = <5>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -105,7 +105,7 @@ NETXBIG_LED_ON 2
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		blue-sata3 {
+		led-2 {
 			label = "netxbig:blue:sata3";
 			mode-addr = <6>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -115,7 +115,7 @@ NETXBIG_LED_SATA 1
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		red-sata3 {
+		led-3 {
 			label = "netxbig:red:sata3";
 			mode-addr = <6>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -124,7 +124,7 @@ NETXBIG_LED_ON 2
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		blue-sata4 {
+		led-4 {
 			label = "netxbig:blue:sata4";
 			mode-addr = <7>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -134,7 +134,7 @@ NETXBIG_LED_SATA 1
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		red-sata4 {
+		led-5 {
 			label = "netxbig:red:sata4";
 			mode-addr = <7>;
 			mode-val = <NETXBIG_LED_OFF 0
diff --git a/arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi b/arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi
index d4edf2727388..23e8e8b4597d 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi
@@ -115,7 +115,7 @@ &gpio1 13 GPIO_ACTIVE_HIGH
 		enable-gpio = <&gpio0 29 GPIO_ACTIVE_HIGH>;
 	};
 
-	netxbig-leds {
+	leds {
 		compatible = "lacie,netxbig-leds";
 
 		gpio-ext = <&netxbig_gpio_ext>;
@@ -123,7 +123,7 @@ netxbig-leds {
 		timers = <NETXBIG_LED_TIMER1 500 500
 			  NETXBIG_LED_TIMER2 500 1000>;
 
-		blue-power {
+		led-0 {
 			label = "netxbig:blue:power";
 			mode-addr = <0>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -133,7 +133,7 @@ NETXBIG_LED_TIMER1 3
 			bright-addr = <1>;
 			max-brightness = <7>;
 		};
-		red-power {
+		led-1 {
 			label = "netxbig:red:power";
 			mode-addr = <0>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -142,7 +142,7 @@ NETXBIG_LED_ON 2
 			bright-addr = <1>;
 			max-brightness = <7>;
 		};
-		blue-sata0 {
+		led-2 {
 			label = "netxbig:blue:sata0";
 			mode-addr = <3>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -152,7 +152,7 @@ NETXBIG_LED_SATA 1
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		red-sata0 {
+		led-3 {
 			label = "netxbig:red:sata0";
 			mode-addr = <3>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -161,7 +161,7 @@ NETXBIG_LED_ON 2
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		blue-sata1 {
+		led-4 {
 			label = "netxbig:blue:sata1";
 			mode-addr = <4>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -171,7 +171,7 @@ NETXBIG_LED_SATA 1
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		red-sata1 {
+		led-5 {
 			label = "netxbig:red:sata1";
 			mode-addr = <4>;
 			mode-val = <NETXBIG_LED_OFF 0
-- 
2.34.1

