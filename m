Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478743;
	b=3Niv5xB6Oofepj8wk1ZZ5IIXZqMY0dzjX5jLtBLEtAO8LDlIbpFrtPJXykbA9kQEz7qJ
	 XKOPrVaGsnYNTQw8LIWY9MEVUFlLTWjqkwegF9MuOVBe22uCJ9u3GlxZGUKjEIRl+wmfR
	 6jcgjL09i9flyJON+8IMswFEcrTEFT45/I2SeaqjKre+mCxV55WtSnGcDQ8SWujeSxkZB
	 yEoTX8ufVLbyME2b5ThIa8kBkRXUh/OQyDbgvLVFIfzHL9T0eYAU7AK0etrQAb8+xknys
	 6figjKmObYVTrVWm0OJNOIq/oUIbdvWMJSo6AyQK3hFkTwDFG1p3dsOUcdidoncKW0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478743;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=xZPonB6Lbb0k2OXAWHkAdkEguf5JX+UcZL6exprUdC8=;
	b=xWhFPrN43bLTJqp/T8AD/BJ0CeIZOxtQi12ZKuN2losbVa9KcbTJ5jmlrrhgA0k2/wpp
	 R4wRkOXmpXIsTrl/8BxrqxR3U2si025a1EX6VrX5mBhlcTrjfS/lx9H8KkM9bNj6Eqkvg
	 PXQ0JWaTSnlir4vwvzw2z/xEaUti71kF5jrCqAOL9F10RgjLEiTkKX1YNQY7MZknWbi1e
	 1v2X6Q54b7Q2C8GU3htYQpgdLOwsAD/lD2VTcJ2ZooHywaPLjbPJ8LroFQFgUGy+mJikQ
	 6BK9qGBCXR+/eziD9XYinZL+6V7P4QtrGtxINoR6VeHa32fuhvJgtQGjVMtxs/sX//w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=cjq0HcCT;
	arc=none smtp.remote-ip=203.254.224.24
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3B2606A327
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C3B2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=cjq0HcCT
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261020064539epoutp01f097b28595fafb086760fe5f1ee9c289~gKeq_C2WP1986119861epoutp013
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:45:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261020064539epoutp01f097b28595fafb086760fe5f1ee9c289~gKeq_C2WP1986119861epoutp013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792478739;
	bh=xZPonB6Lbb0k2OXAWHkAdkEguf5JX+UcZL6exprUdC8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cjq0HcCTa9Xi+H8jMoTGQm++P/N+gaSL1/3Cqfkp5c7fZPKmRTWumnar/iLzSXHx0
	 7uNubglU28tFEo2rpwDQw3VWBl+t1scm7X4ObCbUsLz8tn7UXTMvnHWrDut5w2mcxk
	 cw6F45LmdkSbxwyxjaGqI5T+OTbL3aEu0uHJ633M=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20261020064539epcas5p3c476d8c07199488467b05bea9777f99e~gKeqen15S1867518675epcas5p35;
	Tue, 20 Oct 2026 06:45:39 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.94]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4j82wy2K8yz6B9m9; Tue, 20 Oct
	2026 06:45:38 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20261020063801epcas5p25a6322caaff32c7e4d75c8c66e2909b8~gKYAHHciG1318613186epcas5p2R;
	Tue, 20 Oct 2026 06:38:01 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261020063759epsmtip101a08c475fa3316a9c293e2f933b720b~gKX9xGC3-0369603696epsmtip1E;
	Tue, 20 Oct 2026 06:37:58 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v3 01/14] dt-bindings: soc: samsung: Exynos8855 SYSREG
 compatibles
Date: Tue, 20 Oct 2026 12:25:45 +0530
Message-Id: <20261020065558.1829402-2-raghav.s@samsung.com>
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
X-CMS-MailID: 20261020063801epcas5p25a6322caaff32c7e4d75c8c66e2909b8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261020063801epcas5p25a6322caaff32c7e4d75c8c66e2909b8
References: <20261020065558.1829402-1-raghav.s@samsung.com>
	<CGME20261020063801epcas5p25a6322caaff32c7e4d75c8c66e2909b8@epcas5p2.samsung.com>

From: Alim Akhtar <alim.akhtar@samsung.com>

Add exynos8855 sysreg compatibles in bindings

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index fcdb9ffd2644..845e0caba15a 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -31,6 +31,10 @@ properties:
               - samsung,exynos5-sysreg
               - samsung,exynos7870-cam0-sysreg
               - samsung,exynos7870-disp-sysreg
+              - samsung,exynos8855-hsi-sysreg
+              - samsung,exynos8855-peric-sysreg
+              - samsung,exynos8855-peris-sysreg
+              - samsung,exynos8855-usb-sysreg
               - samsung,exynos8895-fsys0-sysreg
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
@@ -103,6 +107,10 @@ allOf:
               - samsung,exynos850-cmgp-sysreg
               - samsung,exynos850-peri-sysreg
               - samsung,exynos850-sysreg
+              - samsung,exynos8855-hsi-sysreg
+              - samsung,exynos8855-peric-sysreg
+              - samsung,exynos8855-peris-sysreg
+              - samsung,exynos8855-usb-sysreg
               - samsung,exynos8895-fsys0-sysreg
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
-- 
2.34.1

