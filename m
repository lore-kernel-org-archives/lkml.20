Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792761354;
	b=tafuCjgrpODtN4QhXb9fDDmfIojQYXbOIozrssPDl6cylZmj8DkraelVMR9Lz57idTj5
	 vgft+ezy4XuN3hNht27q6990RVbyY9Qpf3u93mPvZCw89BpYfaR7HWLuo6CHNv31cUpwu
	 R3gUF62LKmAU/NrCeS+0guj8o1pWppZFHE8fzFjdXCfaieiQ438m67/0TL+9FGBWYhSTh
	 Q5PcxA3hUpAG0qkaiCOu8TT0ohSTkD1Et5s2Ym8QjVELDADP2qqbPvE31YzKPGk1Z/SO8
	 I+Vgchxwk/7exHfYCY8zMydSp6yYvKjOmuKJsdetYLowOcsAk9vX7IxhjVD8qPtxWKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792761354;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:X-CMS-MailID:X-Msg-Generator:Content-Type:CMS-TYPE:
	 cpgsPolicy:X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=JjXWggIO1QwF9H9WIE/c77W+Og3mvbbUeijLVnTmFvY=;
	b=ODe1tt3BM6UfJvBuREhRVYvodgBF3HYVKaHJXGaZREgjaGT/iGgdvgx0o+L5dIzSEG+s
	 PXZ91eO5I4uJC7e0SGiL6W1ZWzu1QroxhBWOHR4nCowVf8yr4br3k/OhAz+22kGNFZa1O
	 cHQX9qIyFY+FNDcgvZvsvX+yuh9k2PkEEyXwRiU8fe5ngIcioovvyG5c9srXTilsd+Y1z
	 5BPP5J8/I17CwVJ7nKhDmTCGNqD2X+Pf6B6GMHOiywForWs1Eok+Lc5E/XXz1JWLHP9G8
	 5YUvbbRz7uC1YbUAxHkAltY1QYurqvwsUeaN/B0Lco5s2UoM6kRMQms1l7TtN2JP31w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=oYdvHJoT;
	arc=none smtp.remote-ip=203.254.224.25
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1156606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1156606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=oYdvHJoT
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261023131551epoutp027e3671e2db6113f799e2ccf72a30893e~hKvN-WEOy3004930049epoutp02S
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:15:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261023131551epoutp027e3671e2db6113f799e2ccf72a30893e~hKvN-WEOy3004930049epoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792761352;
	bh=JjXWggIO1QwF9H9WIE/c77W+Og3mvbbUeijLVnTmFvY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oYdvHJoTVTSSRO9g+GqANxMVwuo/SGJAMCh+O8z4SPs3n9/Ffc7wHunJ0fazzxmFo
	 QapC7MKDyU7bKZVdWzeTSGNJ6GihhyHWF0NK9HX+jFFJoGvT5mpi+Od0QLYSDaC0xz
	 9Etdzlj/y/IcgHmZNsdAi892/OhyqZKoGEedaSGc=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20261023131550epcas5p4f7f59ff68804b78d3f646465b8db3444~hKvMiDFdI0834608346epcas5p45;
	Fri, 23 Oct 2026 13:15:50 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.87]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4jB3Rn3BFyz2SSKY; Fri, 23 Oct
	2026 13:15:49 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20261023131548epcas5p2aeea6d1ff5351907df204e7b3fbe6030~hKvLNyrKo0460604606epcas5p2Y;
	Fri, 23 Oct 2026 13:15:48 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261023131546epsmtip2f2c90cea5070ff3d67e5e2304c0bf759~hKvIfsFH90535905359epsmtip2I;
	Fri, 23 Oct 2026 13:15:45 +0000 (GMT)
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	Thinh.Nguyen@synopsys.com, selvarasu.g@samsung.com,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com,
	akash.m5@samsung.com, hongpooh.kim@samsung.com, eomji.oh@samsung.com,
	shijie.cai@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: [PATCH v3 2/2] usb: dwc3: Add Exynos8855 to the generic platform
 driver
Date: Fri, 23 Oct 2026 18:45:01 +0530
Message-Id: <20261023131501.3157463-3-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261023131501.3157463-1-selvarasu.g@samsung.com>
X-CMS-MailID: 20261023131548epcas5p2aeea6d1ff5351907df204e7b3fbe6030
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261023131548epcas5p2aeea6d1ff5351907df204e7b3fbe6030
References: <20261023131501.3157463-1-selvarasu.g@samsung.com>
	<CGME20261023131548epcas5p2aeea6d1ff5351907df204e7b3fbe6030@epcas5p2.samsung.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Add the "samsung,exynos8855-dwc3" compatible string to dwc3-generic-plat
so the Exynos8855 DWC3 controller can probe through the generic DWC3
platform glue. While at it, alphabetically reorder the existing entries.

Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb07c..d57496716204 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -232,10 +232,11 @@ static const struct dwc3_generic_config eic7700_dwc3 =  {
 };
 
 static const struct of_device_id dwc3_generic_of_match[] = {
+	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
+	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
+	{ .compatible = "samsung,exynos8855-dwc3", },
 	{ .compatible = "spacemit,k1-dwc3", &spacemit_k1_dwc3},
 	{ .compatible = "spacemit,k3-dwc3", },
-	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
-	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
 	{ .compatible = "starfive,jhb100-dwc3", },
 	{ /* sentinel */ }
 };
-- 
2.17.1

