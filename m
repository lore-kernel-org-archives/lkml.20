Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5925A3BB661;
	Tue,  6 Oct 2026 10:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791280813; cv=none; b=bU4zlCCbO8t7fbsVnP1aJYBIbsvPCDH2BU0CjNU2QbMcTzygMrrQmkqSgPW3irrLNwJYwIgIUT5FbC39y5y1imvtseBik9s62T+aKceDkBBzlYNIqP9rNZgdSAOOvNSc3ZKvLqq885PJ1YbikmUTIGUeqW4UX3eBDPsmdblFHis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791280813; c=relaxed/simple;
	bh=EvMamSDRxzu7OuMvdizxprj6S5S2WL34AU5Oxj3sGE4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J8EPt9nYSyUPt0ojASbo7XfOsBmCbZp7RHu08LiLOAHPIQg9wU2eZtiOA0xSkyHm0y4ZorBCqpgx+ZhK/gztWQDo9STDt3rk/9ElSk2XqeUNIzRD/vOm2PpO5nCbBlNejzt7P4LabMktSmyIpaf7DZbdoUnzERzBTMVR0NBvXJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 50126dbdd;
	Tue, 6 Oct 2026 18:00:05 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v2 1/1] riscv: dts: spacemit: set ETH MAC from eeprom for OrangePi
Date: Tue,  6 Oct 2026 18:00:00 +0800
Message-Id: <20261006100000.548264-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa110a7f59703a2kunm67906f2632db24
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCT0pNVkkdTh8eGk8dQ08dSlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVSktISk
	5MTlVKS0tVSkJLS1kG

The EEPROM on the OrangePi R2S and RV2 stores the MAC address.
Assign it to Ethernet, with ethernet1 having a MAC offset of 1.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
Changes in v2:
  Remove Ethernet alias changes.
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts | 6 +++++-
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
index 7125f2882ce8..78cdef0c7287 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -66,6 +66,8 @@ &emmc {
 };
 
 &eth0 {
+	nvmem-cells = <&mac_address 0>;
+	nvmem-cell-names = "mac-address";
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
 	pinctrl-names = "default";
@@ -90,6 +92,8 @@ rgmii0: phy@1 {
 };
 
 &eth1 {
+	nvmem-cells = <&mac_address 1>;
+	nvmem-cell-names = "mac-address";
 	phy-handle = <&rgmii1>;
 	phy-mode = "rgmii-id";
 	pinctrl-names = "default";
@@ -129,7 +133,7 @@ eeprom@50 {
 		nvmem-layout {
 			compatible = "onie,tlv-layout";
 
-			mac-address {
+			mac_address: mac-address {
 				#nvmem-cell-cells = <1>;
 			};
 
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 837616255464..44b81268c802 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -93,6 +93,8 @@ &emmc {
 };
 
 &eth0 {
+	nvmem-cells = <&mac_address 0>;
+	nvmem-cell-names = "mac-address";
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
 	pinctrl-names = "default";
@@ -117,6 +119,8 @@ rgmii0: phy@1 {
 };
 
 &eth1 {
+	nvmem-cells = <&mac_address 1>;
+	nvmem-cell-names = "mac-address";
 	phy-handle = <&rgmii1>;
 	phy-mode = "rgmii-id";
 	pinctrl-names = "default";
@@ -156,7 +160,7 @@ eeprom@50 {
 		nvmem-layout {
 			compatible = "onie,tlv-layout";
 
-			mac-address {
+			mac_address: mac-address {
 				#nvmem-cell-cells = <1>;
 			};
 
-- 
2.34.1

