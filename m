Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691844;
	b=NB+3jXNvagnRE94f32HFDameKD59C33RGWZgK+yDJYA10wOgVO9FgqVh57QudkdA/lmI
	 qUoqCrVYBLWcL2q61nJcgI2u/AWg9ddk51sLeD7df7nyGNzy22GEld22Ke1e+IqVuFTlC
	 WO1LYUgN8V6lwqqJmgiOyENkpapJB3puMlVHxAn2h1dy8CF9jLo3EKseEuGfLE8Iaj7ia
	 rWaPRQnXoDaGTgkyX6vd4D3jXJD+JeUSGwHfLhlAyou1jWPEBSgeVtalxgAIdW67Hu9QQ
	 C/2SquwUjhe7MdKO2P8BBaEIW35FCwqol+/uXbJs5jxyUisvNrWYLhWPO0VuP0+l2GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691844;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mvxB2B95QT50yiHZjKOLS1JU9QeIGuttjwwnpF+xS3U=;
	b=0LLuRMPF0Xt2BisyF6o9BHiCro4mn6iNrpY0thp2wZSraYitQVxb7sCdMI0busfpzAps
	 p2uQIgNLPD85DFz2SewJ+iRRLyXyzso4/HNd7IvW0s8HwZfTnuDYMwo0TxM9pVic+7pQc
	 inThCciB0zMRPAf/GaShQ/tUxyw4kTGB8SB3A6YOYOMAyaaKimlx8w5qzdNEkA5/Nc2I0
	 xm4cn6uKMfK7FyPxTIAwR6X2PAdczLqipous9mmDm/zfjzyiX06aLqSFgvECG2jta+1CB
	 f7RfPsmrmvaC0k/Bl+e1aBiEDmrs2q6mhVhXx/wZOO7wufGoXI5X0yq6UHBZR2SBwjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=dqpxUGAm;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80671606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80671606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=dqpxUGAm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=dqpxUGAmWqEgIPlDuqE/YTeCeuUxcLzYtSx28QcO6lcLKGDFcPsiyyDPsGtOlGVOXSum6se4P9ld/
	 ZfogmHumbDapfADqwHZiHPdZdNh4gQKtJPy0GQgXw1y2lVLKvbar4QC8VRkIj15ozios8U8QEaZxat
	 j3NantPnKJC6lwG8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86ae990bea7c-31707;
	Tue, 03 Nov 2026 15:44:01 +0800 (CST)
X-RM-TRANSID:2ee86ae990bea7c-31707
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from Z04181454368174 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76ae990bded4-f0cec;
	Tue, 03 Nov 2026 15:44:00 +0800 (CST)
X-RM-TRANSID:2ee76ae990bded4-f0cec
From: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: tglx@kernel.org,
	akpm@linux-foundation.org,
	ljs@kernel.org,
	vbabka@kernel.org,
	linux-kernel@vger.kernel.org,
	trivial@kernel.org,
	zhang jiao <zhangjiao2@cmss.chinamobile.com>
Subject: [PATCH] uio: uio_dmem_genirq: fix NULL pointer dereference on device tree probe
Date: Tue,  3 Nov 2026 15:43:53 +0800
Message-ID: <20261103074354.1416-1-zhangjiao2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

From: zhang jiao <zhangjiao2@cmss.chinamobile.com>

When the device is probed via device tree (pdev->dev.of_node is set),
dev_get_platdata() returns NULL since no platform data is associated
with device tree probed devices. The driver allocates a new uioinfo
in this path but still dereferences pdata unconditionally to obtain
the number and sizes of dynamic memory regions:

    priv->num_dmem_regions = pdata->num_dynamic_regions;
    for (i = 0; i < pdata->num_dynamic_regions; ++i) {
        ...
        uiomem->size = pdata->dynamic_region_sizes[i];

This causes a NULL pointer dereference crash as soon as device tree
support is enabled by adding compatible entries to the of_match_table.

Guard the pdata access with a NULL check. When pdata is NULL, set
num_dmem_regions to 0 so that the dynamic region setup loop is
skipped entirely. This allows the driver to probe successfully via
device tree with static memory regions and IRQ handling even when no
platform data for dynamic regions is provided.

Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
---
 drivers/uio/uio_dmem_genirq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/uio/uio_dmem_genirq.c b/drivers/uio/uio_dmem_genirq.c
index 41c18ec62a45..4b40e4a5cdb3 100644
--- a/drivers/uio/uio_dmem_genirq.c
+++ b/drivers/uio/uio_dmem_genirq.c
@@ -247,9 +247,9 @@ static int uio_dmem_genirq_probe(struct platform_device *pdev)
 	}
 
 	priv->dmem_region_start = uiomem - &uioinfo->mem[0];
-	priv->num_dmem_regions = pdata->num_dynamic_regions;
+	priv->num_dmem_regions = pdata ? pdata->num_dynamic_regions : 0;
 
-	for (i = 0; i < pdata->num_dynamic_regions; ++i) {
+	for (i = 0; i < priv->num_dmem_regions; ++i) {
 		if (uiomem >= &uioinfo->mem[MAX_UIO_MAPS]) {
 			dev_warn(&pdev->dev, "device has more than "
 					__stringify(MAX_UIO_MAPS)
-- 
2.33.0



