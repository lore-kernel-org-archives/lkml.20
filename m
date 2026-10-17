Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134463D1ABD
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 18:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792260113; cv=none; b=SKQfvLb8QTCCmEUPwY6st+gCJPbdbs9zlFYN7pqF3A1It+c1f8W5OE2Mgbxw0PmG+/2hbWY7LjTkVR+cwgh7Bp2ITmCFlHYAPtM4whKb02EJN+tNrpLGqNJlE3kPjk8WGqGbQAoMvJU+yQ3RSoLBdnfn/a2daeRp0QQwQGltkKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792260113; c=relaxed/simple;
	bh=pKYYbTKgnWyBpIOuKZaJmJCGy/gO8qvkO8MA7kmhyu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sL+aRyavZj06au5LYNHLaYu0FtZluT+FMDpE+Wxgac8zPV/feuPF7FJVS14Uqc9wuOENTSbUsL9KZJzrLbL+nyAyi1gHgtzU6YFNLKrpmdmQ4DyI9QJ/h+tjAdPS5HXBTALRRGdB3Po18imCWbRbnqUUov9UFUBHGhIS3i0+lk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pu0wqwMk; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pu0wqwMk"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e608cd460eso4134325ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 11:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792260111; x=1792864911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i10C1318BcrIJPXpXStoFrX+oUsWnUZudq49qSCTuyQ=;
        b=pu0wqwMkKSskoEgBxKGDTmYC/9yFy+ZLF45I2/N7qzD+zkz5iI6vnjsMbxGscWMTUD
         fw0z1bkkI/SG1I7+72F+li08gO9usjBMDUULga1+zz/Tjq5bKMAiT+iOGU7xqBpGrdF7
         a2DSVIeReivVlCZniyLE72FJFuuBLf4n5K9SV5gOUm9ve+Oq6gyoPXVbPhXgzvSezbKp
         OVO4p/biNwU+4jNJZQtSpv5GOHmtUaZSgjlblqiNwmoGVGPWtUot6ehwVneGNQ9tM021
         BYKykGeSKUDRNefSVu1nKR7hdpyPo4Jr10tDu7+I+LM3jcDDY6+KGmneLTx8f3Eg9iwD
         zCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792260111; x=1792864911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i10C1318BcrIJPXpXStoFrX+oUsWnUZudq49qSCTuyQ=;
        b=H5ZfdgWrQ0md3VD3W36XQ3AjrSnA+D4EkmgJRLYEiv41qYeM3+DGJZyvv8r6kzeasd
         PbTXUM0MzxSSzo3gt1IPF7pOe+6Q57DmgkqX3mZyD1YYlWPs+tu8r+Tkb8ZJC13H+fs9
         QNx/ccDQ9zhrWjQ9Ircfs991KW3If5i4imDRkV5ffZoVQx0VhK+t2C+ku8G3/ayxgoVy
         Zs+EG1wUxEhlEPB+zzi3AeWPSGBQ0trS0KDJgp9j7MASK550oNRcnAgDWocJAUkK+t88
         htr9cbBTEDPSfQ/xSb4w5a9uTtLJAHocQlPKrpVBzD0du/Dl/qvtinXPcRp6kNAE1ZxU
         LtYA==
X-Forwarded-Encrypted: i=1; AKwUvBwLHQ95rdPsyp1td3ubF7ri3dCxICVOGYt1fpmDZeWFHkB+RGJpTklPc4LzHTKU+g+YLU5m/EkrpzRUGG4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKR6U4GL0jabZ+rAmWYEvwVQsMLStI9yRs9HWNm+sPLBhGSkDLL
	DKbFX8Y0zEyIzmF5wppoMymUki7XMSi9spm+68+Z4CVKB9d+baEkyfF7
X-Gm-Gg: AYBFou2ugpCkjuklzlG3mWo6NpjFXki91ImvQu2206dIDzEnKFjr8eKExa8+vcma/PA
	PPG0ZUqC6usUj2tENvOnniv+j7WPn6QuH3eUhVpcq+ghdL+q06Py1W2LPFzcTtYwB0GXq3IANRx
	F7ntAMJeakl0DyzR1v9hvxxGyeBWeqzsmWBml6JhRn9Bh9rr7kr7S9uI0NoExX4F1zSp+bgSlyT
	FfwD7OdThUfimgtiiz85unhShPKuAXOPfAVsDppWCA5TcbaZl48Hd+LusJSHW5X4IxJXjpRyDex
	YNgdxNln5eD8mIVrNqm03or4WyxRz3y5098CkQw/3LbF1dK2GXJ+L47o6p6Wk9I92Wjs4d9cluF
	AbEn1yb3hq2IbXdNiQWBLJN0ZX3ALTSG6AxwMuEVH6biaRB40Fkw1J94IfCUp41DXaod4xWznDY
	1QhJCpYNjBBZp6UwpjwoHxy/lQwhTJfsaZpmU2U8dQ6gD+b9BPDV71qjihuoIEb/a9kBT+pdlHg
	YvlYsQcUfuabyc56UM1s4ESmbMkI5waziNp8bhy5Y7BWldTLTqmheAUl8H/JH5bBsH9xUw7EKQv
	ho7ezctOy3rU7SR7g4vA1AeUWXfNy3AqIAEHHHKDkdH6oJcv3bHwaw==
X-Received: by 2002:a17:902:eccd:b0:2e9:401f:f0f4 with SMTP id d9443c01a7336-2e9a6c1b983mr25597675ad.16.1792260111161;
        Sat, 17 Oct 2026 11:01:51 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e5d98d9sm23030035ad.2.2026.10.17.11.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 11:01:50 -0700 (PDT)
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
Subject: [PATCH v2 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
Date: Sun, 18 Oct 2026 02:01:40 +0800
Message-ID: <20261017180141.3477743-2-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017180141.3477743-1-alan.tseng.cs@gmail.com>
References: <20261017180141.3477743-1-alan.tseng.cs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A bootloader SPL that follows the K1 BootROM runs from SRAM before DRAM
is up. It needs the root clocks, the clock and reset controllers, the
console UART, the I2C bus of the PMIC (i2c8, which every K1 board
uses), and the boot media controllers: SD (sdhci0), eMMC and QSPI NOR.
Mark these nodes bootph-pre-ram so an SPL can use the upstream device
tree as is, instead of carrying the tags in per-board overlays.

These are the SoC nodes that the mainline U-Boot SPL for K1 currently
tags in its board -u-boot.dtsi files.

Assisted-by: claude-opus-5-5 dtbs_check
Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 3fabfd341..5d9550272 100644
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
@@ -586,6 +590,7 @@ i2c5: i2c@d4013800 {
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
+			bootph-pre-ram;
 			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
 				 <&vctcxo_24m>;
 			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
@@ -726,6 +731,7 @@ i2c7: i2c@d401d000 {
 		i2c8: i2c@d401d800 {
 			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd401d800 0x0 0x38>;
+			bootph-pre-ram;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&syscon_apbc CLK_TWSI8>,
@@ -857,6 +863,7 @@ pwm19: pwm@d4022c00 {
 		syscon_mpmu: system-controller@d4050000 {
 			compatible = "spacemit,k1-syscon-mpmu";
 			reg = <0x0 0xd4050000 0x0 0x209c>;
+			bootph-pre-ram;
 			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
 				 <&vctcxo_24m>;
 			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
@@ -869,6 +876,7 @@ syscon_mpmu: system-controller@d4050000 {
 		pll: clock-controller@d4090000 {
 			compatible = "spacemit,k1-pll";
 			reg = <0x0 0xd4090000 0x0 0x1000>;
+			bootph-pre-ram;
 			clocks = <&vctcxo_24m>;
 			spacemit,mpmu = <&syscon_mpmu>;
 			#clock-cells = <1>;
@@ -877,6 +885,7 @@ pll: clock-controller@d4090000 {
 		syscon_apmu: system-controller@d4282800 {
 			compatible = "spacemit,k1-syscon-apmu";
 			reg = <0x0 0xd4282800 0x0 0x400>;
+			bootph-pre-ram;
 			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
 				 <&vctcxo_24m>;
 			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
@@ -956,6 +965,7 @@ uart0: serial@d4017000 {
 				compatible = "spacemit,k1-uart",
 					     "intel,xscale-uart";
 				reg = <0x0 0xd4017000 0x0 0x100>;
+				bootph-pre-ram;
 				clocks = <&syscon_apbc CLK_UART0>,
 					 <&syscon_apbc CLK_UART0_BUS>;
 				clock-names = "core", "bus";
@@ -1085,6 +1095,7 @@ qspi: spi@d420c000 {
 				reg = <0x0 0xd420c000 0x0 0x1000>,
 				      <0x0 0xb8000000 0x0 0xc00000>;
 				reg-names = "QuadSPI", "QuadSPI-memory";
+				bootph-pre-ram;
 				clocks = <&syscon_apmu CLK_QSPI_BUS>,
 					 <&syscon_apmu CLK_QSPI>;
 				clock-names = "qspi_en", "qspi";
@@ -1328,6 +1339,7 @@ usb_dwc3: usb@c0a00000 {
 			sdhci0: mmc@d4280000 {
 				compatible = "spacemit,k1-sdhci";
 				reg = <0x0 0xd4280000 0x0 0x200>;
+				bootph-pre-ram;
 				clocks = <&syscon_apmu CLK_SDH_AXI>,
 					 <&syscon_apmu CLK_SDH0>;
 				clock-names = "core", "io";
@@ -1341,6 +1353,7 @@ sdhci0: mmc@d4280000 {
 			emmc: mmc@d4281000 {
 				compatible = "spacemit,k1-sdhci";
 				reg = <0x0 0xd4281000 0x0 0x200>;
+				bootph-pre-ram;
 				clocks = <&syscon_apmu CLK_SDH_AXI>,
 					 <&syscon_apmu CLK_SDH2>;
 				clock-names = "core", "io";
-- 
2.43.0

