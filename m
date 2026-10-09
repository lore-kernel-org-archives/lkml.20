Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FA24E50B4
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791546260; cv=none; b=tHx4sA0QN46+Lb55lpIfemQxEGcUjFilVEsdnwnuZ8cBnBG4qT941CgWz50aQmkvrDly4Rk+NijIikT1ZPfXKZY6W5gFkia2KnPOBQWxVOdf+aPBGAo69z5Fqi+UEv2pzQFHBCjsY2o0n1jmd/txzL3W2ykhCelKf5IfokFKo8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791546260; c=relaxed/simple;
	bh=xVi5RA+Rov7RAycQMnQm11vo6KBBXVWrcTZKlPlQt10=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=E53HV8m0xuQ8SBGXOndE5+Z5a0CnkRMb6LTVDfGTXnM47bpiAZ87BR8GCX8/KbIKT8YgWgMw1zrILOT7rBSZmSZv819alXBRPzB3fDAGCEFxYd3xKAW9vLoinBqClb6P5/yxhUp1R3iEEHbEqew2PcQEYhIu5+h+jObbE6nZSVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=JejaQsog; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="JejaQsog"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20261009114406epoutp042bb7af6b7362bb21e1029682376a6099~c2dGbRyin3063230632epoutp04J
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:44:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20261009114406epoutp042bb7af6b7362bb21e1029682376a6099~c2dGbRyin3063230632epoutp04J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791546246;
	bh=CttS6bLkCRkmCK7/rWH8vIsMnUvlXcALwNj2LzjHU/g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JejaQsog3P1XDIL1wwbFySJXuhahdlzhz4CaAyuwf+ExkdQL94M381LHjj3g40NMt
	 SyJfLhTLePvEnCnjROiGvDZBMNuTO6WGcYZ/mH99oKQyXUKQzcRDChrRImz+Vz9p4N
	 yO+54Q4sTe5GKtPh8AegL0OFMxb/XGAZmySpE6R4=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261009114404epcas5p12fe1e7a5ec738807b90b49447a218357~c2dFWxUCt2444624446epcas5p13;
	Fri,  9 Oct 2026 11:44:04 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.86]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4j1Q4M32H5z6B9m6; Fri,  9 Oct
	2026 11:44:03 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20261009114402epcas5p22abf62d79b588db3e9f66641ed22fbd9~c2dCyhcAt0267702677epcas5p2f;
	Fri,  9 Oct 2026 11:44:02 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261009114359epsmtip2ecb22b45ccd1c024f3e21e26d08382fa~c2dAYPHFr3087430874epsmtip2Y;
	Fri,  9 Oct 2026 11:43:59 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v2 11/14] arm64: dts: exynos8855: add cmu_top & cmu_peric
 clock DT nodes
Date: Fri,  9 Oct 2026 17:31:34 +0530
Message-Id: <20261009120137.2801911-12-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009120137.2801911-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261009114402epcas5p22abf62d79b588db3e9f66641ed22fbd9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261009114402epcas5p22abf62d79b588db3e9f66641ed22fbd9
References: <20261009120137.2801911-1-raghav.s@samsung.com>
	<CGME20261009114402epcas5p22abf62d79b588db3e9f66641ed22fbd9@epcas5p2.samsung.com>

Add required dt node for cmu_top & cmu_peric block.
This also add sysreg_peric node. sysreg_peric contains
DRCG and MEMCLK SFRs bits which are used in clock driver.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos8855.dtsi | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
index 0333b80eba84..2e5dc79d66bc 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
@@ -10,6 +10,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/samsung,exynos8855.h>
 
 / {
 	compatible = "samsung,exynos8855";
@@ -170,12 +171,43 @@ pinctrl_cmgp: pinctrl@12030000 {
 			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_top: clock-controller@13900000 {
+			compatible = "samsung,exynos8855-cmu-top";
+			reg = <0x13900000 0x10000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>;
+			clock-names = "oscclk";
+		};
+
 		pinctrl_usi: pinctrl@15030000 {
 			compatible = "samsung,exynos8855-pinctrl";
 			reg = <0x15030000 0x1000>;
 			interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_peric: clock-controller@15400000 {
+			compatible = "samsung,exynos8855-cmu-peric";
+			reg = <0x15400000 0x10000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLKCMU_DOUT_PERIC_NOC>,
+				 <&cmu_top CLKCMU_DOUT_PERIC_MMC_CARD>,
+				 <&cmu_top CLKCMU_DOUT_PERIC_IP>;
+			clock-names = "oscclk",
+				      "bus",
+				      "mmc_card",
+				      "ip";
+			samsung,sysreg = <&sysreg_peric>;
+		};
+
+		sysreg_peric: syscon@15420000 {
+			compatible = "samsung,exynos8855-peric-sysreg",
+				      "syscon";
+			reg = <0x15420000 0x10000>;
+			clocks = <&cmu_peric CLK_GOUT_SYSREG_PERIC>;
+		};
+
 		pinctrl_peric: pinctrl@15440000 {
 			compatible = "samsung,exynos8855-pinctrl";
 			reg = <0x15440000 0x1000>;
-- 
2.34.1

