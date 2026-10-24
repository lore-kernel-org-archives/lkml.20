Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792833968;
	b=ugE6SbDW6Bh4sVeCydEH4cFRLilkEI2Bo4BHtIKDnwsBNBU4dAk18EnrNcBkYcJIju3e
	 FbH27Uj+Q+ZpRx117TRukzR74H3IkrllTWUZ7EzDnVTk/X0zf3M4T0qbO/c5nFf6fnc6/
	 ELBcNys6xJ7/237XnhmxGZJ8w6ny0xF4ZtARJG8wgi2wTVdwms4j0jDKqr6Pmo9bXqTVb
	 qmkP1I1WFUqyfJv+i8DeR3S6tSUpSEESrxeVFbchcPG3osNIjA6HScdUPFJ0nwzlVJI/j
	 Qnhx1C6kJx5HTRHrnUWdsmdkqjpXyhOpi0LjazfPVuCQWgoOJsUbrMreqDTnQG+G5BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792833968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X5ZJMOxvmROQRxk8HIdSLxRbfib4kWxlGWVgMaC6xl4=;
	b=hSZ3k4gy5ucLWVOo0Az9vGmBcTN1p0j1h3TmCgBYrLAXL/3urKiDwZJxvYRRPtvTQR4a
	 pTOt8xqmHeUaPGIzXVtjgR75V8pil7Y73nedc8L2ikRLn0bZDWBUC0+QArFXkuP+fN+vb
	 IJKsuu6o3jE2iDErNbQSX89d4JIHipI4mghGNJA6cMM5GhdAw6Dcv0pnMNAWkYVmqbDxv
	 chOlLoZdakHaIvUH9ve5Bv8M4yHVeqokBGm7ehAmA4IhkPR4dcatdw7fKkeabOXlp+6SU
	 4DosBKebclFmlbIfesCr5M8Guzq+eEt82/nuEnaVEzO2sch3QTFoEEXAq3lFBDmiq3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="W51/Lg0e";
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FCE606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20FCE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W51/Lg0e
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so1335653a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792833967; x=1793438767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X5ZJMOxvmROQRxk8HIdSLxRbfib4kWxlGWVgMaC6xl4=;
        b=W51/Lg0ea8WRSyIB0CJF2KEH9Qk7M2dEWp9lsvfMd7bQJY7HcFidcEvC+em4DZ0lt2
         IT7CCEPqMjCpfL37yynWiaiGae/9+zv8bx+WcYtfLd6ZfERu6i850uKXTX2agM+0VNb2
         uZB/fNOt4nZLPzwv/pS1NYkn+vddbGFvS+Rdpe8jR7Z/2TBpeomGQEPZZNWjsL3fAwP+
         ybF+oK0wrHdaaqan3af4IxAev31MekMNQAqRgpY5Ip5hw6XM7SDV9xGzHXVL8T2xioAz
         6zX7dnNBzMWpWnQLOB8e/JlCwrh8OTS4S3gQ0vmjSr8aXSYNEQrHk5WvJxC4t3aWfwE3
         VuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792833967; x=1793438767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X5ZJMOxvmROQRxk8HIdSLxRbfib4kWxlGWVgMaC6xl4=;
        b=ZL8B3lmpgmo5nDtQWdRhLfGyTAO/i/XQaczRLloyPiYLwRNZLcYeWRHhsDYICSgHqo
         y66Jg5gRwMyi/4av4ACQDErUhqAy7fY6h0LMrZWBb0SuKMgy0gUDBzFA2k1Skl3KQjez
         jRlvfdGQYbcNblTfb4X80pekFIVK4SEo78gwLremRUErb57mRIgIavZ9MTn1FXFoPi30
         G7qCL0nBoauvLZy5jbEy6uvi4w4bVEFScZBXr8flg2mxo0ATfybQ5X1BcouDB/KRguiX
         WUVbd3TT7/N6UGeoaCMMuBIDPx2Ya9mGweHFQsXuF5ZJAU1qzeOmAbunsUxmL67KtU6m
         0WfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxm+7LP8749qNTVHS33DPXywkMb8T7x5+Rp38ZquOJ6bCW7J3v5p428s35vf0x1tkYjk9itbO4p9WoaWoI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKD4scYvX6KcKTT1pQFEc/bQh8L/C8Yw+rbKDotqAdVPx1h8yKb
	rm59x6nAqPvd+6lD5UptFv6IwirGzR8JoZU3N4NtXznUZ0au7KMEsgA7
X-Gm-Gg: AYBFou1p+nZEvwDvZ0IomatDkj/FTxvb33To0ZzYuX2EkYRZ4iKuvGNlTG9iK8BgsmG
	3hhrMAxyXfB9qjYwYx/LCDpKBzGGvwEhyW03yQwra7DtAkUNcZDRP9mPA7aLJQEzU8ArqV9uDMO
	Tt+DtniKtcilDP7m8aMzb+21svpe4MsTtFH/uJB+FNmjGZkj0gXen2ZmyL1SYQ57vt5e0Lg+LJw
	kyRl/A8hQy522Q368+aS9z6v0IraNhs9v4tfMSTN+94OQt5ypECO6GAdQqrHdu0I7cFmf7/BbVt
	rQoQk8PHwmGJ4UgpHSwYmakbdhEJ5YmHl6Iuie6ftjF2VsNT1LmzMUvs+xPokeRwjli4aaUuuKs
	OV/wnZTwEd6Rt0qwds5HpmisRrGfDppQvHIw0mADxbyXmVqbZ//TXQXnhDmvi/tGHBaxEb+OoTJ
	zD66whxt4iqVgMsIB39zQ+978IDtjrpkhw8aKiAxb8X56Mei2HUXjmRVxcOND+d3QY0iofdV8Gp
	hGkF9kLD0HeKtGVjGw373k7WuMtLKavZ6gZwZ6NTqoawhdcVDsh/DQGYaWA9F6bs2b8CqjzZjtq
	MisxueE5mYFoqbL+6qKu4faTpE9Xja5VJcjeVy/6Cz4gYKygZkOOxx1ozygefDeS6juR9/8PU57
	byzohr5RHw4qjaAi/7JbVJoRvh4zQDx8NLq0=
X-Received: by 2002:a17:90b:1812:b0:3aa:fdad:7d6e with SMTP id 98e67ed59e1d1-3adeac04979mr1472063a91.10.1792833967618;
        Sat, 24 Oct 2026 02:26:07 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba38910sm1392312a91.1.2026.10.24.02.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:26:07 -0700 (PDT)
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
Subject: [PATCH v3 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
Date: Sat, 24 Oct 2026 17:25:57 +0800
Message-ID: <20261024092558.143621-2-alan.tseng.cs@gmail.com>
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

The K1 BootROM loads the next boot stage from SD, eMMC or SPI NOR into
SRAM, and that stage brings up DRAM. To do so it needs the fixed clocks,
the clock and reset controllers, the console UART, the boot media
controllers (sdhci0, eMMC and QSPI), and two I2C buses that every K1
board wires the same way: i2c2 to the EEPROM that holds the DRAM
configuration, and i2c8 to the PMIC that supplies the SoC.

Mark these nodes bootph-pre-ram, the phase that sets up SDRAM.

Reviewed-by: E Shattow <e@freeshell.de>
Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 3fabfd3411..8a954f56a9 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -322,6 +322,7 @@ cluster1_l2_cache: l2-cache1 {
 	clocks {
 		vctcxo_1m: clock-1m {
 			compatible = "fixed-clock";
+			bootph-pre-ram;
 			clock-frequency = <1000000>;
 			clock-output-names = "vctcxo_1m";
 			#clock-cells = <0>;
@@ -329,6 +330,7 @@ vctcxo_1m: clock-1m {
 
 		vctcxo_24m: clock-24m {
 			compatible = "fixed-clock";
+			bootph-pre-ram;
 			clock-frequency = <24000000>;
 			clock-output-names = "vctcxo_24m";
 			#clock-cells = <0>;
@@ -336,6 +338,7 @@ vctcxo_24m: clock-24m {
 
 		vctcxo_3m: clock-3m {
 			compatible = "fixed-clock";
+			bootph-pre-ram;
 			clock-frequency = <3000000>;
 			clock-output-names = "vctcxo_3m";
 			#clock-cells = <0>;
@@ -343,6 +346,7 @@ vctcxo_3m: clock-3m {
 
 		osc_32k: clock-32k {
 			compatible = "fixed-clock";
+			bootph-pre-ram;
 			clock-frequency = <32768>;
 			clock-output-names = "osc_32k";
 			#clock-cells = <0>;
@@ -544,6 +548,7 @@ i2c1: i2c@d4011000 {
 		i2c2: i2c@d4012000 {
 			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd4012000 0x0 0x38>;
+			bootph-pre-ram;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&syscon_apbc CLK_TWSI2>,
@@ -586,6 +591,7 @@ i2c5: i2c@d4013800 {
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
+			bootph-pre-ram;
 			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
 				 <&vctcxo_24m>;
 			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
@@ -726,6 +732,7 @@ i2c7: i2c@d401d000 {
 		i2c8: i2c@d401d800 {
 			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd401d800 0x0 0x38>;
+			bootph-pre-ram;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&syscon_apbc CLK_TWSI8>,
@@ -857,6 +864,7 @@ pwm19: pwm@d4022c00 {
 		syscon_mpmu: system-controller@d4050000 {
 			compatible = "spacemit,k1-syscon-mpmu";
 			reg = <0x0 0xd4050000 0x0 0x209c>;
+			bootph-pre-ram;
 			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
 				 <&vctcxo_24m>;
 			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
@@ -869,6 +877,7 @@ syscon_mpmu: system-controller@d4050000 {
 		pll: clock-controller@d4090000 {
 			compatible = "spacemit,k1-pll";
 			reg = <0x0 0xd4090000 0x0 0x1000>;
+			bootph-pre-ram;
 			clocks = <&vctcxo_24m>;
 			spacemit,mpmu = <&syscon_mpmu>;
 			#clock-cells = <1>;
@@ -877,6 +886,7 @@ pll: clock-controller@d4090000 {
 		syscon_apmu: system-controller@d4282800 {
 			compatible = "spacemit,k1-syscon-apmu";
 			reg = <0x0 0xd4282800 0x0 0x400>;
+			bootph-pre-ram;
 			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
 				 <&vctcxo_24m>;
 			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
@@ -956,6 +966,7 @@ uart0: serial@d4017000 {
 				compatible = "spacemit,k1-uart",
 					     "intel,xscale-uart";
 				reg = <0x0 0xd4017000 0x0 0x100>;
+				bootph-pre-ram;
 				clocks = <&syscon_apbc CLK_UART0>,
 					 <&syscon_apbc CLK_UART0_BUS>;
 				clock-names = "core", "bus";
@@ -1085,6 +1096,7 @@ qspi: spi@d420c000 {
 				reg = <0x0 0xd420c000 0x0 0x1000>,
 				      <0x0 0xb8000000 0x0 0xc00000>;
 				reg-names = "QuadSPI", "QuadSPI-memory";
+				bootph-pre-ram;
 				clocks = <&syscon_apmu CLK_QSPI_BUS>,
 					 <&syscon_apmu CLK_QSPI>;
 				clock-names = "qspi_en", "qspi";
@@ -1328,6 +1340,7 @@ usb_dwc3: usb@c0a00000 {
 			sdhci0: mmc@d4280000 {
 				compatible = "spacemit,k1-sdhci";
 				reg = <0x0 0xd4280000 0x0 0x200>;
+				bootph-pre-ram;
 				clocks = <&syscon_apmu CLK_SDH_AXI>,
 					 <&syscon_apmu CLK_SDH0>;
 				clock-names = "core", "io";
@@ -1341,6 +1354,7 @@ sdhci0: mmc@d4280000 {
 			emmc: mmc@d4281000 {
 				compatible = "spacemit,k1-sdhci";
 				reg = <0x0 0xd4281000 0x0 0x200>;
+				bootph-pre-ram;
 				clocks = <&syscon_apmu CLK_SDH_AXI>,
 					 <&syscon_apmu CLK_SDH2>;
 				clock-names = "core", "io";
-- 
2.43.0

