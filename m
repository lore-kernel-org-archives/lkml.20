Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567486;
	b=U2Ond/2YyAbeA9wwi+co7UO9Be2I2kQ/edemt8Opxz1zwKcPmerW2QTzWZD93CDGZxEA
	 HTQZFGYX870O5cJmuNECBbnNzgUy2oK0WFO48jw3qj8BZfqivptECLDaoxbEkZ9fmbTEz
	 yGUr6gSTaCdBW4dIriF+3k3ld2lzect8ST8YnihwrA7f9u0h6I1WYqIrnxUV7uzCTuzr3
	 Wqa0B5FBAseRR9HZQjtmeZfzrP8kkC8Lucf+8mtXXeIPIR7/YdkFeKS+/9BpPLttbW034
	 v8l01K/k439eWmHuWJEwHYVbYTOl+2OdEcAu18FDgKam8xVxprb3u+5LceINn4NCu9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567486;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:
	 X-Hop-Count:X-CMS-RootMailID:References;
	bh=erFYt3v+QSuQ7rGTo+dYGddg5732pLpZexzaOVFDdxw=;
	b=ANYa8ZgoM9xkmFpgd/bQkVFuIS4qSsw0XTxkO8I+KMinYjp6ZKnbrwVWJrzenW+BXm0w
	 2Zm6TvGyCD01aENvMTeYMVT7SjdhLmR+9wJl32gdY4Q8Av75TczG4CATtVXXhJ8fpBgTR
	 ygNYnSsQYwfxK5YXqX+TfR0tfNRHOiAyahRzaQCSqomWZTw8RRQS7UEVzvQlmVi+Ax2aD
	 kWcHw1C6EI6nwTXA0H1QESMOebXXlyI0Ym73S2JPSFj1zKbjtb2XbdG40tnSJQwsFVtJ8
	 8wC5pRyX8X609bnbW5+lwxltr1V5i8DTbM8qLdAjflfyDsBlKNoel17IBbB4JlnSsXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=opy3G873;
	arc=none smtp.remote-ip=203.254.224.34
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8F5606B24F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B8F5606B24F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=opy3G873
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20261113105803epoutp043aa3bfac0878768794c91a9c1f176053~nlZ5U44vD1611416114epoutp04C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:58:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20261113105803epoutp043aa3bfac0878768794c91a9c1f176053~nlZ5U44vD1611416114epoutp04C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794567483;
	bh=erFYt3v+QSuQ7rGTo+dYGddg5732pLpZexzaOVFDdxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=opy3G873sZF9JiotAYpXM6jLtSFOaFYb4Gp3ydBgN9lxBi834bJkG+INdp8+3j4W9
	 EMrB+NoLBoLjIOqmgLsIBk+U4LtzKIP5DvDGhacbc1GP7mn07a5IH118ftzaPaJzsS
	 lxFoupAI7UBMlX1unMrl9SVQeFpJJm80fESg83xk=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20261113105803epcas5p23ed9f3d31f3f821508cb942a7b3aa00a~nlZ4zTk3l1894418944epcas5p2x;
	Fri, 13 Nov 2026 10:58:03 +0000 (GMT)
Received: from epcpadp2new (unknown [182.195.40.142]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4jQvP71MqKz2SSKX; Fri, 13 Nov
	2026 10:58:03 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20261113104841epcas5p2823126ce22f44cc98fcbdf94403c32e3~nlRtsfACF0610106101epcas5p2t;
	Fri, 13 Nov 2026 10:48:41 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261113104838epsmtip25ae1a5c48af7750b30108a09ab7d028b~nlRqwervP2503625036epsmtip2H;
	Fri, 13 Nov 2026 10:48:38 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 04/14 RESEND] dt-bindings: clock: exynos8855: add hsi
 clock definitions
Date: Fri, 13 Nov 2026 16:36:02 +0530
Message-Id: <1771243284.81794567483188.JavaMail.epsvc@epcpadp2new>
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
X-CMS-MailID: 20261113104841epcas5p2823126ce22f44cc98fcbdf94403c32e3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20261113104841epcas5p2823126ce22f44cc98fcbdf94403c32e3
References: <20261113110612.3265841-1-raghav.s@samsung.com>
	<CGME20261113104841epcas5p2823126ce22f44cc98fcbdf94403c32e3@epcas5p2.samsung.com>

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


