Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792833972;
	b=LZOf7eLCK1MOBDmIs25aJ0EI3hARa+OlgMDAsj6pCrFBUKMjay7dybG+YOMyflC9YdiY
	 07OL2mrPnifWLW/yLMU+zrAj6+6QUOj3oXQnE7lTZ+psTtRfeYZcsPor5pMcTUaBI1sSk
	 4287+EkRkiBtwU3IiuFYaxDqbFM+EOga+5jUqcZDZ5HerfSm5DnxTNN7wB04EDWjKgDvv
	 9br6kcV6kgWw4tKcmKkQOiBKTJ+UJXjQeqZ6sW0wANb6g1iR1b6y3zTLvKsJg9xX50CGG
	 6JUglIm0NSlU1nIbY6OYDxpKYYG54J5cde7LEzhC8cvjXmKybRynqkpYBlxFznz99FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792833972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=thIlTFdBb0qcp3PAkfPcVWyFY4ERXyIUZczud0xoE2o=;
	b=EKB65IWKBjC7F3N2EY258I9Q9MBpyUPYLoYXet7enIMO206rog3G1IVraI8Us8q0OKKB
	 2OIo8zJyfS6HDlsO65l1MwrneG6CuG7Kavn72AEeeRJQ3cMIdbCBxmSUWSFVYYzD3aeXE
	 6y27riZ1EEWeuz1l1OQFlhcLYNobsMZnzmx3bZegpkP6YVj8+Q3hUR+wkc89W/9HKFDCv
	 RmjX6rgxyOVuyuXsjnxLMr0McpGxrmz+MXrfiMLyX7SyzUz0pShcfzMaqrJVk8IzqLDNL
	 NET6ld50M1ZZb+ZqJJSZwAOeHbjJbWce8dG2hnE6tKFPgmbdusAiWiVKM4AGG1izWlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yom9RZ3l;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687E9606A321
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 687E9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yom9RZ3l
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so881322a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792833971; x=1793438771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thIlTFdBb0qcp3PAkfPcVWyFY4ERXyIUZczud0xoE2o=;
        b=Yom9RZ3lbEZ6Ax6ZUwhl8hPNc4gHe8FzT3pYzh7VUa9NX7nyj8Fxc4nAGg6OowU28I
         mAB7peGMdUBo3782ZWTuQxaVFLn6M1tYp45M3HLyIh7MLlndZwSAVkvxfi97H9VbvniO
         FOnT3i2BH+38FkBrUl3vmMq2Eiv7SAUrnA3Y9fCZQ+xqhEyb9htEcjaWjualhqBFv91a
         M95XjryA6L6UNN/Y1iG67QkFBt+I31yHp3CofNImku26o7pse+zLTTtUPL51hYi94QTX
         ZpNxTSbwICCncT5okcQcXX+EUk6fTGroreTrgj0Vl9aTR9AQbH/87AJ+PmnTWvwEJzZr
         +FVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792833971; x=1793438771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=thIlTFdBb0qcp3PAkfPcVWyFY4ERXyIUZczud0xoE2o=;
        b=KNHdRidEzincX+hx13iH+tbwDdtrPbA2C0pq/tZK+/5PtuU6Syz3khw/wIgu0wsycq
         oNkuQD4RjpBjurqTHLoMhfCAQmXAUH0op4o+wRe5WRmsJuuzaUrtP0oieiPltB1cYNri
         RudhlBw7MvJ38nJ1gTxhh0jUFk56IrzcqiQAeCK/DFrb6kQhYUsv1RU4EWMOepkzlnrN
         BdY4ECIBkkJ6G8axgoQM8daC8/w2ShL8jJER2lB5jTmYwA5V9KuNM/BIuZJFzKooRXMd
         bBE2hYCypAie3Onhwn55057FpFAluXEGZhjliLIygCmW88CYgEbXa1HIx8RD7jXt+bIq
         vjhA==
X-Forwarded-Encrypted: i=1; AKwUvBykiYR8wW/jGnLDQaRkc+af8miOcG5RmXbWA9SoXAi4vhtqMzJGddyAETi8ZSD1gYb7O7I3HadxE5KC5fE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIP52SggNuFCCtJchva00b2dzGJl2uZaK3TpGEE/bY36S2E3yLC
	PraQO7QV7lt+t7I0Q9oGcTPBp1A3xH7siCjoWgSDudLhwAfyb65xvzGu
X-Gm-Gg: AYBFou2uqykCwtIHTXhQSmz3C4rB7jAplrY4qccgv0I3BL8xrmABtIh2QjHW88btdBi
	3Y9/MXGUVZ5NWb8mpF0Tu+hH0j/W6wtFKuLqDK0Ovai0X/NGhOPjyrvTa+vM5ozeXEkJWKAnPSk
	fYDdwAQw172y9fPqX16XWg47UhZn3uKvdOaQ5Am0VJumXq2jEzcZJbrIDeAM5rIdYCpC4bow6WD
	May0EfDfGyoZ7sJL7TUPtvveWbM/lahCZpvwmxawKSwUQsYYu4ay9/5nhCWCQjnhdcQ6OHRuJMm
	FFfwKFtY8klYIJSCM8Bn+VLshItEo/d5HZH7frtJPYfsnjllWiiZa/0JfQj+cr7suUeYcesBz81
	V7KddH+q9gB0fvv+CFMPy3Te4iQAtI8wd7Wt+50Cax9MLllvSXBsMfaePS3RXJD2pOIupC+qaan
	1fad7nBbKqsCSoUuYFw5d1hzOsUNVzsItgWdzmP4ok6QAbCu64D/CPmAT32YsTKVew3iRMgANPK
	vRfh70VgQntsci8PV02z+MjY6IxL+huMwrWj7tshejlFuTYiO1s9VexPDGnL1Kd0HVSdH67FzxW
	u+HIxlbgGdWjdb083SMAL1zKZCyPLH6WH/07itTvTFEUa5UnEtYjUYNJZMVgjPmkdBAwlpy1Z20
	6J3P+mVQ/QtCw8YbEJ8tg0LsmMKQyTqkTlX4=
X-Received: by 2002:a17:90b:35c6:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3adeae64f23mr1257289a91.40.1792833970704;
        Sat, 24 Oct 2026 02:26:10 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba38910sm1392312a91.1.2026.10.24.02.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:26:10 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram
Date: Sat, 24 Oct 2026 17:25:58 +0800
Message-ID: <20261024092558.143621-3-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
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

The board EEPROM at 0x50 holds the DRAM configuration (number of chip
selects, data rate and type), which has to be read before DRAM can be
trained. The P1 PMIC at 0x41 supplies the CPU core (buck1), the 1.8 V
rail of the EEPROM (buck3) and the SD card I/O (aldo1), which have to
be set up before that. Boards that boot from SPI NOR also need the
flash.

Mark these board devices bootph-pre-ram on the boards that have them.

Reviewed-by: E Shattow <e@freeshell.de>
Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi | 5 +++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 5 +++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 6 ++++++
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    | 6 ++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  | 5 +++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  | 6 ++++++
 6 files changed, 33 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
index 81c40df2a3..5d1132f5a9 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
@@ -71,6 +71,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		vcc-supply = <&buck3_1v8>;
 		pagesize = <16>;
 		read-only;
@@ -100,6 +101,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -113,6 +115,7 @@ pmic@41 {
 
 		regulators {
 			buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -127,6 +130,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -155,6 +159,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 58035d886b..90c4585d94 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -194,6 +194,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC1V8 */
 		pagesize = <16>;
 		read-only;
@@ -223,6 +224,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -236,6 +238,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -250,6 +253,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -278,6 +282,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 635e95aad1..93f486ba60 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -208,6 +208,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c04";
 		reg = <0x50>;
+		bootph-pre-ram;
 		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC18 */
 		pagesize = <16>;
 		read-only;
@@ -230,6 +231,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -243,6 +245,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -257,6 +260,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -285,6 +289,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -386,6 +391,7 @@ &qspi {
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		bootph-pre-ram;
 		spi-max-frequency = <26500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 23f32a8a3d..ce7342ed82 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -167,6 +167,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC1V8 */
 		pagesize = <8>;
 		read-only;
@@ -199,6 +200,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -212,6 +214,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -226,6 +229,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -254,6 +258,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -353,6 +358,7 @@ &qspi {
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		bootph-pre-ram;
 		spi-max-frequency = <26500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
index eb77aae9d6..83ad1cc06d 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -158,6 +158,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		pagesize = <16>;
 		size = <256>;
 		read-only;
@@ -187,6 +188,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&vcc4v0>;
 		vin2-supply = <&vcc4v0>;
@@ -200,6 +202,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -214,6 +217,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -242,6 +246,7 @@ buck6 {
 			};
 
 			aldo1_3v3: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 790234f355..dba5f8a021 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -185,6 +185,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		pagesize = <16>;
 		size = <256>;
 		read-only;
@@ -214,6 +215,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&vcc4v0>;
 		vin2-supply = <&vcc4v0>;
@@ -227,6 +229,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -241,6 +244,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -269,6 +273,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -366,6 +371,7 @@ &qspi {
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		bootph-pre-ram;
 		spi-max-frequency = <26500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
-- 
2.43.0

