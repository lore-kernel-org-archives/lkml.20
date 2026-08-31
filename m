Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9261F282F0C;
	Mon, 31 Aug 2026 04:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788151556; cv=none; b=N+QJKyZQ5F3O/JJEbVowTptNQHTZDjUh2XXTwE1HOhzmeIbz4RceVq5r6QYn+2qOWjn6DEk9MQeG6tjBNiI2vBlmOQwMsfy/eOQ7fE9Ic0QcTkOoxMwhVMsgNlSzssV0lPCffEpHFpYGBfvj9hQD3y8BypkVBbGJqkHEg8Xqdis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788151556; c=relaxed/simple;
	bh=PGmyxVwnuFq6tiJ24U7SUFyBwEb+68dKZacfRy79PJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eedq0Y5oeDvMoFY+laeaQsORkDv2EtpfYvavya5WK0f7zYKhZB7+nYdOkEvaherN2Kvvzf0YPD/mpL9ZGNNQ/2vZaR7+L1tdFJxZ7QnemDM7cp5tx2XlkJxBOLZY+1zdzDdbt8UVhRMM5BiUqbLliA8pa9+1PjU/1fPpCAvKDbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=VjOGjKEj; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="VjOGjKEj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=FH55rKIqHtOn1EkYVy++NU/qfFm2EXAkDRDl+Cfo4uo=; b=VjOGjKEjCrQzQLGwVHw7bBVh1z
	d0pf0TtnbZl2k4+IHlvYSgH/ccgwqQ4rDHGjAwfrAXQmC9sGokW0pGen/rGd2M1FaYal075Glnx8F
	cbu7mPo5HnEi0+e5rCMKlJg8leAbF19ErwwHH8SvbS28EUX12qCxRyOU7FIDUaXGEsOiX21XJrkL8
	wcZOrdwzaPrwndvPJwRKIOUyGbPtjcOeiM2aA2aAD8eJmXUQMYbqC4K/TR6mgpUqfg9aWviYc08az
	0Is+Uby3fAV1aTLjkcyTEmOX4dof6cLpP6FkdEac//XL3fe4EM1Vrd6lHK46jmooH1MMzPpn/Pg6t
	ryjSMumw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x0tu2-0000000Ape0-2Pci;
	Mon, 31 Aug 2026 06:45:50 +0200
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
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v3 1/5] riscv: dts: spacemit: k3: move USB3 phy to board level
Date: Mon, 31 Aug 2026 06:44:21 +0200
Message-ID: <20260831044540.3304350-2-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831044540.3304350-1-aurelien@aurel32.net>
References: <20260831044540.3304350-1-aurelien@aurel32.net>
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
submitted PCIe controller [1].

[1] https://lore.kernel.org/20260727094726.890179-3-inochiama@gmail.com/

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
index c3f2dce0969c0..6f8d55eae6f6b 100644
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

