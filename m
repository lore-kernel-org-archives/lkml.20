Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479788;
	b=3TdvAnYLbaODe/H2iVH/kjh7m+ZZtDtDcyNHERXogaYPCFPzEPLuklWiMFSwRdd/HvO4
	 DnxXT7ZwjwQlD/xJXC5Ti7Dp3FRkRaMAKYcNCELSdmJP1LOwLsno3tZWwA+i0Olmu/Qyw
	 YddEvUZg4f+jHjpGdhcOPq59CyR8htQOBV/2k2/Ptjqtgf0FXU5mMG6uxyi3gcKPLWfs5
	 37KBxZIPqBoOb74LcDWcmsLSkz5yEuy8lwL3Pq1KSc7lu6cTO+QR4LYCrDulXbeAybs+Y
	 vU6oGgB9C/Le6U5/Z8B9ntMpQqlDun/ZOk9aCmCv1MBWSdmLPRa5Lv0c+pbw6Ob6DIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479788;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:
	 X-Hop-Count:X-CMS-RootMailID:References;
	bh=erFYt3v+QSuQ7rGTo+dYGddg5732pLpZexzaOVFDdxw=;
	b=oxCIXfTbF67XwraFkPTxbewsf5RMEUSDqF8xw91iiyo58m6NIljeqbOPHBtP/6qORQW4
	 R17C9MO6Dd2xfB29bWPNOUdMm8vPLlYL+jRJF9opDjaREq6H2/rouE72/7WwJ2itldZHP
	 Dk8z825uVYfXBRwYWSHoW7htMwBxbvtQEwn3UTu8nXlRbHtaJJqZjNOzuNyMJfR7IF1QO
	 lS37hk6iClksCnJGT/k/FXFPMObGsn+vMQjfs4oskZAIdt4JV/pPkvkZQ/2clWkz+0z6Q
	 qAkS03jBE9KSHrtvynE5hqkHx7YrbgyUwfnXPcLqK6M5qBjOCXnNv2hPIKLI43MTZdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=X1pTw+eb;
	arc=none smtp.remote-ip=203.254.224.25
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF2F606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FF2F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=X1pTw+eb
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261020070305epoutp0277c925a0017db7615aabc7382abad7b5~gKt4fKYPj0401704017epoutp02D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:03:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261020070305epoutp0277c925a0017db7615aabc7382abad7b5~gKt4fKYPj0401704017epoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792479785;
	bh=erFYt3v+QSuQ7rGTo+dYGddg5732pLpZexzaOVFDdxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X1pTw+ebli3wfAMggxgQhkTbt7mMqM6u+hjsNqcDZbjXrRExdMdlY0+t4tCl9Ks91
	 5TrKpQ/9VlXJIqaX3i66Sx3TIx18OgG90q3BipypiSX+UIUVPC9yrZ/PbqUaiFdeEX
	 JimK48ai6X8E2K6/NV2wRU1s/JjFsQ2FUTdTogRk=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261020070304epcas5p18dab9bc6b0923e448f472bcfeeeabe97~gKt3mJnoI0096800968epcas5p1K;
	Tue, 20 Oct 2026 07:03:04 +0000 (GMT)
Received: from epcpadp2new (unknown [182.195.40.142]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4j83K41Lhzz6B9mP; Tue, 20 Oct
	2026 07:03:04 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20261020065553epcas5p35b4a16d8c277025a08378a5b915c2173~gKnl-k2Lr1777617776epcas5p3G;
	Tue, 20 Oct 2026 06:55:53 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261020065550epsmtip14bbe41349807f059ef71ef62b6db97ac~gKnjZgNmG1278912789epsmtip1x;
	Tue, 20 Oct 2026 06:55:50 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com, cpgs@samsung.com, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 04/14] dt-bindings: clock: exynos8855: add hsi clock
 definitions
Date: Tue, 20 Oct 2026 12:43:45 +0530
Message-Id: <937773018.41792479784183.JavaMail.epsvc@epcpadp2new>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020071346.1918640-1-raghav.s@samsung.com>
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
X-CMS-MailID: 20261020065553epcas5p35b4a16d8c277025a08378a5b915c2173
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20261020065553epcas5p35b4a16d8c277025a08378a5b915c2173
References: <20261020071346.1918640-1-raghav.s@samsung.com>
	<CGME20261020065553epcas5p35b4a16d8c277025a08378a5b915c2173@epcas5p3.samsung.com>

Add device tree clock binding definitions for CMU_HSI

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
 .../dt-bindings/clock/samsung,exynos8855.h    |  8 +++++++
 2 files changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
index 53fc8040e173..21928235d131 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
@@ -28,6 +28,7 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,exynos8855-cmu-hsi
       - samsung,exynos8855-cmu-peric
       - samsung,exynos8855-cmu-peris
       - samsung,exynos8855-cmu-top
@@ -52,6 +53,26 @@ properties:
       Phandle to system registers interface.
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8855-cmu-hsi
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_HSI NOC clock (from CMU_TOP)
+            - description: CMU_HSI UFS_EMBD clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+            - const: ufs_embd
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/samsung,exynos8855.h b/include/dt-bindings/clock/samsung,exynos8855.h
index 5d8b38a744b5..67cd97d8fab8 100644
--- a/include/dt-bindings/clock/samsung,exynos8855.h
+++ b/include/dt-bindings/clock/samsung,exynos8855.h
@@ -214,4 +214,12 @@
 #define CLK_GOUT_WDT0_PERIS                8
 #define CLK_GOUT_WDT1_PERIS                9
 
+/* CMU_HSI */
+#define CLK_MOUT_HSI_NOC_USER              1
+#define CLK_MOUT_HSI_UFS_EMBD_USER         2
+#define CLK_GOUT_CMU_HSI                   3
+#define CLK_GOUT_SYSREG_HSI                4
+#define CLK_GOUT_UFS_EMBD_ACLK_HSI         5
+#define CLK_GOUT_UFS_EMBD_UNIPRO_HSI       6
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
-- 
2.34.1


