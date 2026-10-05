Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A69126AC3
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 18:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791226132; cv=none; b=M6akbOyP6MfENYbhtiVkWMyy2iHnJ6XlDe1c9Qw3qojapvWwLt1rm1FnkEW4PGqghkwCC9QbmMkNsl1wo2fTokSoQKKfsynLC3wncjC2QSCVGvV4NNSwCDDa86wT5H0XlhfqW/6UPmhiodBp2txSGgJMoyz297NrRYWAOcZzo6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791226132; c=relaxed/simple;
	bh=SiHM1PRYsvygtLybyGR+m5aXZqnmKZZpS31AOqR5oqA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ttvFw51Q88gz0ImGx+4qHBd1766zRYKrxUjYC2Dg/fSE9EjZbxVsH4EudJRY2cQUrPWPqnm/2ZXJORMJH/bXHKAN91V2FwOU+iULOlM0pUkIoaQEQzK7jKcMjy9LSE3HbzOa/8eL7zUUPLgQVmsXsg30L4jJwqItgSIn7K5LLt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dC9FfOWc; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dC9FfOWc"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-35122ae71e9so918637eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 11:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791226131; x=1791830931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mOgbWILBmA1EDd62aOZ6WfyN7vNlPpZv9jEP/DVTRhA=;
        b=dC9FfOWcRlH01HnayDHIxqx4fAKNJ2sHClul2Wv7yiJV9RauObKew5LEknarxcixo8
         xTK5PTcTsYNNFmk0tee336Cu2Z+TY7BT99j4m572IBXFYuVAaiCQ8Izu7Wav5ZUNVygv
         pDAXyyAGaoaxjVXI6NeczKCf7TLYQhmbNVcxaNO5bYJcTD73nv5kFF6MCAKBoYvuHIdG
         +FsXMpjcBMwaCIfLLb+J2M2A3xL04TKfT3YWaF6kQcpJGublOccWw3F5CzbfQcutf69p
         H2u8/tt3KP9Tn4ng5tsM0379Hz23DJEEZY1e3c4U82iFJVXfJQ5sycvPLTiHdzsGl7xo
         JALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791226131; x=1791830931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOgbWILBmA1EDd62aOZ6WfyN7vNlPpZv9jEP/DVTRhA=;
        b=FahXlCF/WzU8CZTX6qIPj+12Esjw5FUUBm60Pbh/JUVX5VAYcz5fmEwv+bYQ9WsL70
         qPgOFrohhFGvAh3DFlTRpS+ePq72ikJVJAw6Xy9pAB8gth8LBCPKYmi3h3ozDUqE1Bc0
         2IwVYr2zyTkzaPxFj1yAbXNk9RQZy0WOajjZ24NR8L98L64cKZ79q0mvvFVBGCQI+RdL
         yiaUc9UYeTNP/qjxAGMlAO8v00Qt5Fcg5F6zGODdctp541JeWP9w5wCJ4jx/wTKT/9kE
         R7/Bbgrlk6MNQ1bRcga5fZnd6AXM7y0kiyLgSDg6ZDRwVkQ/TZAdSmGuLqF/tG7kp4gA
         Tbpw==
X-Forwarded-Encrypted: i=1; AKwUvByvJk8tUkuxTu4DXbf+vY1MqZwb5u9P8UibCFR6lg6So8ipchTHS1O/UVEhlFYaDQMeePZcaCSQD/zf6F0=@vger.kernel.org
X-Gm-Message-State: AFuF++l8B44qJ29mjCFYNh87HiZQHvUvekToo++LX3s4jTrZtZqss+NK
	eKASNwWISJ8fwKazfEmQmrwbF4R3EF7ZwASD17rqokcg+igDpMCc97pm
X-Gm-Gg: AYBFou3xThvBDVmq9hEPfwBlZyBiJlf8lB7MvEKRu2CdbFJCe92vDvQ2QlHAFh1tPQM
	gQNR16xM98HNfB8g3IHRwSQ0k+SM00BLH27XqBITqS5WKyhfhdpyn9ksc9SyKbHj8fgKKwNiKgw
	J/oJPK2VK+NORqltudQcMBK4fyHGkQVPduikT5NzubJTadZuwJMHZOwxDrDpPqBxvU/UcvbnQLF
	QGPES1QYbt6kvn/WjFu6Qs6qLUSpRsO+KKoGgcanj5tRurtwy3XxadUiexb/uceLKgLAcOiv3qH
	m+YUcXqqINsEUjehs7+1LZP/nLsUFicHJvbtPGSyYh+EiTUdM+FcKZSi/+SIDYBhUYsUk2ftzy9
	nwvM/OkcaP6+1WPvhLfcV6kX5F1tVt5l1eR5CEVAODkqpzPfAG4h15llVziPuiYpzBlckUaRJDy
	a0pzAuEPGa0a54YI6gAfEMylXlgXzzcWvJxwBmTZcPkkdkLfRmklC7hifbgOXtA08NmCVtsbi2e
	Phbb44YRgK0VmVA368tjvTi8aAOY0o=
X-Received: by 2002:a05:7301:6184:10b0:33c:e72:5b3b with SMTP id 5a478bee46e88-34f2185899bmr14499131eec.25.1791226130364;
        Mon, 05 Oct 2026 11:48:50 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([2406:b400:53:bc23:13ce:62d6:5ad0:c521])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146a297b0sm216369eec.11.2026.10.05.11.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 11:48:49 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v4 2/2] ARM: dts: kirkwood: Rename netxbig LED child nodes to led-*
Date: Tue,  6 Oct 2026 00:17:46 +0530
Message-Id: <20261005184746.252723-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the LED child nodes in kirkwood-netxbig.dtsi and
kirkwood-net5big.dts from descriptive names (e.g. blue-power, red-sata0)
to generic led-* names to match the new YAML binding schema.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
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

