Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C2347126D;
	Tue,  1 Sep 2026 08:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249677; cv=none; b=YQk5RAwt8bPpb7K2X+kqVnldysXmWJF69YyzRXsdZJGLq8k80ea0Kxx54RwgmRe5vNB/NT3Z+Uny1OyGMe95ljV617p+rc2BpSRrJ+offXQyEVrMlL2Br9DAbzB6jsdMfd4cSND/kwe1O8yVQ3NzQxvJ3opomwZ2lJDVvfIfEXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249677; c=relaxed/simple;
	bh=SBQVFXu4Hkm86nKKIITXhGPCuIrIj0+/drAKI6pWu1U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IH4L1hmpcPenrzrxXfh3ACKYtmjb4XT8yPkhpj9adulml38Stnv35slzybLckLG0SnKbtyuOP3CSEl5C0tJzSAnHyGUm011f+tYHPkUSHNnIjWsA4Ys9ORLJ6pm+RPwR5olSByEaTFNhGki3a+Mfnwy0fimE9UwySRek8h5vlgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4c15431b1;
	Tue, 1 Sep 2026 16:01:05 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/1] riscv: dts: spacemit: enable onboard eeprom for OrangePi
Date: Tue,  1 Sep 2026 16:00:10 +0800
Message-Id: <20260901080010.95040-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa05bfc6eb003a2kunm57d234c21a3678
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGUpLVhlMGBpNShoZTR8dHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVSktISk
	5MTlVKS0tVSkJLS1kG

Enable the i2c2 bus and add the connected GT24C02B EEPROM.

[   6.766] TlvInfo Header:
[   6.766]    Id String:    TlvInfo
[   6.769]    Version:      1
[   6.772]    Total Length: 38
[   6.775] TLV Name             Code Len Value
[   6.779] -------------------- ---- --- -----
[   6.783] Base MAC Address     0x24   6 .....
[   6.788] MAC Addresses        0x2A   2 2
[   6.792] Product Name         0x21  15 x1_orangepi-r2s
[   6.797] Unknown              0x41   1  0x01
[   6.801] CRC-32               0xFE   4 0xE5A74B18
[   6.806] Checksum is valid.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
This patch depends on the following to avoid conflicts:
https://lore.kernel.org/lkml/20260802100101.327815-1-amadeus@jmu.edu.cn/
---
 .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 30 ++++++++++++++++++
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 31 +++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
index 2d1ba34cb00e..7125f2882ce8 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -13,6 +13,7 @@ / {
 	compatible = "xunlong,orangepi-r2s", "spacemit,k1";
 
 	aliases {
+		i2c2 = &i2c2;
 		i2c8 = &i2c8;
 		serial0 = &uart0;
 		ethernet0 = &eth0;
@@ -112,6 +113,35 @@ rgmii1: phy@1 {
 	};
 };
 
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_0_cfg>;
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+		pagesize = <16>;
+		size = <256>;
+		read-only;
+		vcc-supply = <&buck3_1v8>;
+
+		nvmem-layout {
+			compatible = "onie,tlv-layout";
+
+			mac-address {
+				#nvmem-cell-cells = <1>;
+			};
+
+			num-macs {
+			};
+
+			product-name {
+			};
+		};
+	};
+};
+
 &i2c8 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c8_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index f7547a4da71a..837616255464 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -17,6 +17,8 @@ aliases {
 		serial0 = &uart0;
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
+		i2c2 = &i2c2;
+		i2c8 = &i2c8;
 		mmc0 = &emmc;
 		mmc1 = &sdhci0;
 	};
@@ -138,6 +140,35 @@ rgmii1: phy@1 {
 	};
 };
 
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_0_cfg>;
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+		pagesize = <16>;
+		size = <256>;
+		read-only;
+		vcc-supply = <&buck3_1v8>;
+
+		nvmem-layout {
+			compatible = "onie,tlv-layout";
+
+			mac-address {
+				#nvmem-cell-cells = <1>;
+			};
+
+			num-macs {
+			};
+
+			product-name {
+			};
+		};
+	};
+};
+
 &i2c8 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c8_cfg>;
-- 
2.34.1

