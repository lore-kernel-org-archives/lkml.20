Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA6D4F93CF;
	Mon, 28 Sep 2026 20:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790628657; cv=none; b=Fjmk0EgDOse71f3FD+7Ca0xqMAI3G70ltn8DrHAx4l7Y55bjfIgLx0AWZG6HnCHaOExvBRXIEKn9pmus8GwODGVmnvPSRu1vUN3p0sUwhIpfxAMGHWyD1At4ls0XPWEYfzF30jOZ2kUIff3/GKygxqmbpXFicBqpt8cMbkN8mHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790628657; c=relaxed/simple;
	bh=8irU6BqCPgmFNkEHkU6Q1kHRPHevtysVa7lFeKEGzco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DayJQKnnIjCypmOtEtwoaBj+CwkbhncDqQmCPBp7RLo0ku4fyuMU1H2LB+h3nHpSj1YtNuG9eBalV2wEjkAoSZBVd/Dc8JHjjOy425K1uPaB7zFC0c5ZoaTRtyhdhAgUOoB6oEx2mfvBCte086E+9JY+1obtH/1jdX5olTFuddo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=RQ7aPAN/; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="RQ7aPAN/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=aRMadcUPFUBPhEkJErQMVtX02I55WFciqcB4WS1T+xw=; b=RQ7aPAN/qb5YyMKHuzvVxBL7GD
	8FIYoPqJNszRs+TDBAkwkiPy5611pCLUkn4f6zNhsPF4tg7Cxq6wI+emGlXeKOrK6YF2RaYT6ALub
	1nT99CwKxgad0Q5OreNixz7Y8WZ5aIYmPsSzqjNRqCR9oMaJzwCOojagF897LCwofuUsbi1kdBsRE
	5/bEr51niviC+l8SO/fKbcEwNlRxhBIXwMam0dUQBzRsQC7ofdJEDSUblJg5aF6z5gj29DkUeXD0s
	oPrgOZ13UUlF+UaLxVzFu+7y2wLfbcwN5fJ6Jpf0zU/yUO9zKYnyWFfK1sMEe2YVVH1jbij5wvDah
	gjqwYvFA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xBIJG-0000000F7qY-2Ffb;
	Mon, 28 Sep 2026 22:50:50 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v5 1/5] riscv: dts: spacemit: k3: move USB3 phy to board level
Date: Mon, 28 Sep 2026 22:49:06 +0200
Message-ID: <20260928205012.3689405-2-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260928205012.3689405-1-aurelien@aurel32.net>
References: <20260928205012.3689405-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the SpacemiT K3 SoC, the combo phy provides 8 lines that can
either be used for PCIe or USB3, depending on its configuration
(spacemit,apmu). This configuration is defined at the board level, and
assigning a phy line to a USB3 controller while it is configured as PCIe
results in an "Invalid PHY mode" error.

Move the USB phy definitions at the board level, as it is done for the
submitted PCIe controller [1]. As a consequence, boards that do not
enable a USB3 controller node will not match the DT schema due to
missing PHY entries. This is not an issue as dtbs_check only validates
enabled nodes.

[1] https://lore.kernel.org/spacemit/20260923015016.64069-1-inochiama@gmail.com

Fixes: 46380e4b1534 ("riscv: dts: spacemit: k3: add USB controller and USB phy support")
Cc: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 ++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b084a35aa00e3..0a6f669d509a9 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -328,5 +328,7 @@ &usb3d_u2phy {
 };
 
 &usb3d {
+	phys = <&usb3d_u2phy>, <&combophy 4 PHY_TYPE_USB3>;
+	phy-names = "usb2-phy", "usb3-phy";
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index b9977e78e096a..1af47b7f1c8af 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -452,9 +452,6 @@ usb3d: usb@81a00000 {
 				 <&syscon_apmu RESET_APMU_USB3_D_VCC>,
 				 <&syscon_apmu RESET_APMU_USB3_D_PHY>;
 			reset-names = "ahb", "vcc", "phy";
-			phys = <&usb3d_u2phy>,
-			       <&combophy 4 PHY_TYPE_USB3>;
-			phy-names = "usb2-phy", "usb3-phy";
 			phy_type = "utmi";
 			snps,dis_enblslpm_quirk;
 			snps,dis_u2_susphy_quirk;
-- 
2.53.0

