Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5ABD40A94A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419610; cv=none; b=fOPhhjT7WFTZU5kDkhaSRAq/OQ+NiKba63Kzxsnw+D7dP+GKFJaC6x/S9leVRqz6FFfeZPJdMdA+sYavlk9gaLxi9ani5CGzXEiFMizGdSE3SNZj6gaZ8fq/FkdDwqAuKNLsFs6u3MMdpxkCkTv7sMWsSlfW2pTx2PNNhKmcU5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419610; c=relaxed/simple;
	bh=QtFkvg9zrwP+DSGKTUAJc/yVDfoSvt3nPJzcNqWytB4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:Content-Type:
	 References; b=Om5bjpxQQ6hEdcgpTTitNINGkJQdeMYvKPv3lY5rCNL0m7tr6jVDRRyGh3C6YOpSfsNYXEr7d34G1xNSyg3wNk45oWktX2tCVFS6R85RXKLurYFfGNcZODEeURn3ImE9w/tw9Ac+TmkzLZxsIdCds8MbvUKOs+Bw8lVDaeGWV2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=iKp/zBNA; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="iKp/zBNA"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260903071324epoutp0109f6fb23d3ee6c165ddcb73c5cad4e23~RvieweN5i1820318203epoutp01a
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:13:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260903071324epoutp0109f6fb23d3ee6c165ddcb73c5cad4e23~RvieweN5i1820318203epoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788419604;
	bh=JCdLJlrIN03j/CIVgPnvOgdBX8wfdcDBNztR/gGl+Rc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iKp/zBNAPEtFpQzwtekQioLghsMa0ShivUjfhAqOFHMwohrmxGxpUp4W4boZF2Cbw
	 AZ4F6v2NQF0lcZAbiLfvuk7ZZF2c9hPQcQN/oUJdQltnVJZoHoe1a91xiWctmgsT9h
	 6jhtnJolwN2iBjdl6wK29FB5p/4SGXqBrVafbc2A=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260903071324epcas5p1bb7f15cc70b6ddd46137c030baa76192~RvieN8LMu2007920079epcas5p1V;
	Thu,  3 Sep 2026 07:13:24 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.89]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4hb9mg0PWGz6B9mC; Thu,  3 Sep
	2026 07:13:23 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260903071322epcas5p2a40e3299b0954dd880c9b3651555760c~RvicuXxpj0076700767epcas5p2S;
	Thu,  3 Sep 2026 07:13:22 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260903071318epsmtip182ee7ec0ffa77001464110471004fe89~RviZYp3Gd2579025790epsmtip1W;
	Thu,  3 Sep 2026 07:13:18 +0000 (GMT)
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
	Thinh.Nguyen@synopsys.com, selvarasu.g@samsung.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com,
	hongpooh.kim@samsung.com, eomji.oh@samsung.com, shijie.cai@samsung.com,
	muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: [PATCH 3/3] usb: dwc3: Add Exynos8855 to the generic platform
 driver
Date: Thu,  3 Sep 2026 12:42:50 +0530
Message-Id: <20260903071250.3421499-4-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260903071250.3421499-1-selvarasu.g@samsung.com>
X-CMS-MailID: 20260903071322epcas5p2a40e3299b0954dd880c9b3651555760c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260903071322epcas5p2a40e3299b0954dd880c9b3651555760c
References: <20260903071250.3421499-1-selvarasu.g@samsung.com>
	<CGME20260903071322epcas5p2a40e3299b0954dd880c9b3651555760c@epcas5p2.samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Add the "samsung,snps-dwc3" compatible string to dwc3-generic-plat so
the Exynos8855 USB3 DWC3 controller can probe through the generic DWC3
platform glue.

The "samsung,snps-dwc3" string is used as a generic fallback to support
any Exynos SoC that utilizes a flattened model instantiation. This
fallback allows multiple Exynos SoCs to be supported by the generic
platform driver simply by adding the fallback compatible to their
respective device tree nodes.

Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb07c..33a76c37d15d 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -237,6 +237,7 @@ static const struct of_device_id dwc3_generic_of_match[] = {
 	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
 	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
 	{ .compatible = "starfive,jhb100-dwc3", },
+	{ .compatible = "samsung,snps-dwc3", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);
-- 
2.17.1

