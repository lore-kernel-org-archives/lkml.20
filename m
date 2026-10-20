Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478829;
	b=mmbmxC/rStai1R8CRXBaFI1+AVRZ4zblBnnF4ALluUKnDxYflYWt/5tQPWIF5eWUpBtb
	 boaNIEsIhHbdog2eKqo5A9O08cEOoY7m7Xj46ihBs3GY23TfX/xGG81aY2FBC91PUq/dd
	 M3+GbPiEUQNwiyQtwlXqMHa0cLQUEaJNxub2MuatY9+K7a/k1z3+8/uB1QXKR4LF0SW/1
	 uq+4HdatmlAikbEyME1IxBitb+iN5yeITjmP/fQgUyDp224GUcuwQBMfa5l+nPEFNkhzh
	 ywAq+X3MFPo5uuphO51MtQhGoBr1oEh+frmRZa/UH90UuTR1nRE3iSdwzbjWu9Ch/Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478829;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=CttS6bLkCRkmCK7/rWH8vIsMnUvlXcALwNj2LzjHU/g=;
	b=EFUiyjsM0lbiEKmI/X9Fzjaz3TqVboZnte5vj5BcerEEReTSNaaArYbcve8X1QSDR6bg
	 ah4qBEo85A+u/MbC+TDgiBV6VsmIVtNMW8dKfTL5TtI3tabgtxPJedhk89KL1i/f6ZW49
	 Vua/RKCi/btWV2wskr0emcHW+f6ld1sADFYAvqGMBfZRaq095REFYpMy8Fj2IeYSNYevU
	 BHypL0lDElF+b577iqTOkLk16mgxH3ST5L1+XFw08DtJW7JWJX4hophFaElLmsywo1S9k
	 6R0XeeaZ6EOqszrdNntIZ/beX5pltnnb4nRHRNBctYAPoQdR+HFDn7F05gT4pywpAcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=EPB+nD3E;
	arc=none smtp.remote-ip=203.254.224.24
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC88606A323
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBC88606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=EPB+nD3E
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261020064707epoutp019dedaca50c540391d301f573a799f89e~gKf8OhAQl2252922529epoutp01C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:47:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261020064707epoutp019dedaca50c540391d301f573a799f89e~gKf8OhAQl2252922529epoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792478827;
	bh=CttS6bLkCRkmCK7/rWH8vIsMnUvlXcALwNj2LzjHU/g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EPB+nD3EGu/FcyoOwFTrty/SmNyp3qccgrtTJ22lfAwBBvXmIf+wv/2aKK6MyyayB
	 Gil/wsKViA4/Gky/nWDpYo4n/LAGxcu+UaWWThZQX1yKjdTsTJhNpGumpyv+g+qtuU
	 rHb7faSCvM2qJCW0pIouNspIY1sl9UVIZENlNFps=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20261020064706epcas5p4bd760fb2eb20a9c208831c2345c44756~gKf7WC4GN1149911499epcas5p4J;
	Tue, 20 Oct 2026 06:47:06 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.88]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4j82yd1W7Hz2SSKd; Tue, 20 Oct
	2026 06:47:05 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20261020063830epcas5p399de5889b53cc8d033aad76f13691bb1~gKYatkDcg1675316753epcas5p35;
	Tue, 20 Oct 2026 06:38:30 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261020063827epsmtip1d254156560785875aa46e9282f78f8da~gKYYP-GOp3272632726epsmtip1P;
	Tue, 20 Oct 2026 06:38:27 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v3 11/14] arm64: dts: exynos8855: add cmu_top & cmu_peric
 clock DT nodes
Date: Tue, 20 Oct 2026 12:25:55 +0530
Message-Id: <20261020065558.1829402-12-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020065558.1829402-1-raghav.s@samsung.com>
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
X-CMS-MailID: 20261020063830epcas5p399de5889b53cc8d033aad76f13691bb1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261020063830epcas5p399de5889b53cc8d033aad76f13691bb1
References: <20261020065558.1829402-1-raghav.s@samsung.com>
	<CGME20261020063830epcas5p399de5889b53cc8d033aad76f13691bb1@epcas5p3.samsung.com>

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

