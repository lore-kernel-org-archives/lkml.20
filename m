Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567287;
	b=nnCrzRl8r1924vd4+5BsCa2PahpjBLubAmU9RNthbRG2YII/4oa3zhbABzcDNtLz5bD2
	 hqF0nK+ISO7KY/6L3Srst5DPaX/HMEobpEehWNKxckQvG1lc8kRvPDYcRmYCINsiYBrcE
	 XmwTjiXhyngNfte2lP+KXAg8wh6/5ZKrwsqI84ec/+uadYdumPcHd8bh0Zv/r1YdVZHao
	 zAjcDc0XlR4wCj3I/q02d2e/n0cBKMeFTriE0u8MANBqcCYgF+5zqARdRVV+DgChb0W1i
	 XiJpfHr1xIHzNHQQiwVF7NTHJ1Wqqj0rdAMC14s12KbfzazBDl/Cbw3iOruKacH6Jdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567287;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:
	 cpgsPolicy:X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=tWkaG3M1ybkYTdaWSTR7V1saFfsOuJsMAGwFO7f5RRE=;
	b=PO3hHH9PQG9rOCs3KJqgX/91lzZ8//zUt66bkuz+EYFKLXF7SqZ+uDm6lASL1C2kR5GU
	 BBi9ghfnBb1nQ6Ozn3cmLh5AkAP/Fx8LNG13S3h6gmQIFCJDxnshGVuC1/V82FH5tfpuD
	 PGn9vPWxt/pGZDdPWFjjbNPCF63Ung4nBMkIHVxpdDayMZQVIHJQwsGQ3uRztNC7aWGRx
	 pk3+pZe7Jt2aL411AVZEYin+f+Hm2H7+QrqjW4bt2yFDv71881ZB71y0+X2XfrtKU+tv/
	 rIUxtF3i2Na1L69bl9c8krCnRaWb1P6ux0cCXfhSowIB5UnZQQ36M/1Q3mVL6L4rx9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=awwdVwRF;
	arc=none smtp.remote-ip=203.254.224.33
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4449606C908
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4449606C908
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=awwdVwRF
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261113105445epoutp0363ca4a0bbb0f9ef3ef59f1ed3dd2bd9c~nlXAXSGd20447304473epoutp03O
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:54:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261113105445epoutp0363ca4a0bbb0f9ef3ef59f1ed3dd2bd9c~nlXAXSGd20447304473epoutp03O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794567285;
	bh=tWkaG3M1ybkYTdaWSTR7V1saFfsOuJsMAGwFO7f5RRE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=awwdVwRFpUGcG+017doGuMKYUin0L7Fnhn76LMYWqimOoQ3Q43p+vIssZ81EjyL15
	 OZKik/iCdwn0EbmBxSMLRvmG0fVWSaPtu7kN7ElT+KkWUQdDuCESo7f/gHeJzLulvl
	 Hu9i20YGu2sclJMKaalmues93nwI+uCtWUpcry5s=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20261113105444epcas5p2fd0267b6b1b719c644604d22dbeff78a~nlW-6EePC0813108131epcas5p2u;
	Fri, 13 Nov 2026 10:54:44 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.86]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4jQvKH5Kt7z6B9m6; Fri, 13 Nov
	2026 10:54:43 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261113104906epcas5p462308ef9eec80f8b7a5f81b64e72b24d~nlSFVzXpf1018810188epcas5p44;
	Fri, 13 Nov 2026 10:49:06 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261113104904epsmtip280a451842546530ee581b9001dcb7583~nlSC5UgOU2501325013epsmtip2z;
	Fri, 13 Nov 2026 10:49:04 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v3 13/14 RESEND] arm64: dts: exynos8855: add cmu_hsi clock
 DT nodes
Date: Fri, 13 Nov 2026 16:36:11 +0530
Message-Id: <20261113110612.3265841-14-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113110612.3265841-1-raghav.s@samsung.com>
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
X-CMS-MailID: 20261113104906epcas5p462308ef9eec80f8b7a5f81b64e72b24d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261113104906epcas5p462308ef9eec80f8b7a5f81b64e72b24d
References: <20261113110612.3265841-1-raghav.s@samsung.com>
	<CGME20261113104906epcas5p462308ef9eec80f8b7a5f81b64e72b24d@epcas5p4.samsung.com>

Add required dt node for cmu_hsi block, while at it add
sysreg_hsi node which contians bits for DRCG and MEMCLK
which are used by clock driver

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos8855.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
index b461de6a7548..3dd7a4c4c609 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
@@ -241,6 +241,27 @@ pinctrl_pericmmc: pinctrl@154f0000 {
 			interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_hsi: clock-controller@17000000 {
+			compatible = "samsung,exynos8855-cmu-hsi";
+			reg = <0x17000000 0x10000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLKCMU_DOUT_HSI_NOC>,
+				 <&cmu_top CLKCMU_DOUT_HSI_UFS_EMBD>;
+			clock-names = "oscclk",
+				      "bus",
+				      "ufs_embd";
+			samsung,sysreg = <&sysreg_hsi>;
+		};
+
+		sysreg_hsi: syscon@17020000 {
+			compatible = "samsung,exynos8855-hsi-sysreg",
+				      "syscon";
+			reg = <0x17020000 0x10000>;
+			clocks = <&cmu_hsi CLK_GOUT_SYSREG_HSI>;
+		};
+
 		pinctrl_hsi_ufs: pinctrl@17040000 {
 			compatible = "samsung,exynos8855-pinctrl";
 			reg = <0x17040000 0x1000>;
-- 
2.34.1

