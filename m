Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB80E34D4F9
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 05:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790917877; cv=none; b=okgYJDrTv6svRGnRyRnOWwfl4KXjkxgedSy1fUQPdqcuCJNJfMNoikzZRQe53KrxFb6sR/qOS2kjfb3+uw6Tb0RtaWA4TvKWd77M/EA2EeAbc93/bMmIm6SlJP99iz3nLxScjalhQJRwP0/KujLMVelnYejH6nZHWSliA+6g8nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790917877; c=relaxed/simple;
	bh=R9uOh3aj39TzSM25DgmMMe4T/4tSG0J65/5dA+myGig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dqWExWiKfJZVWTUnJBgUGXsJo2pXOipHHP4kLQ31yOGsyiaD2sg7U9BMbRXSjFNhDmosL4pAjS+j/NpjXSYsByTNEth5jPZhZebxlsKOvEsRMIjhmFWrXbNRZMEFVyxsSXB9LsSB9IjHEpQob+811NcQxRv6As7K0VcgwAm7ppA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TiPKIS91; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TiPKIS91"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790917874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rslogmTZ8oBKCAlJVPMzfVZf7AJ0I+8AQLCt4b/DRsM=;
	b=TiPKIS91M4foaN5+cU3qJFKOPpOVVVWx7c2CIjMMDBoX/VLnM4RoNyad5yp1y3zJiiNvZR
	cv7rvsSGaVGfGjh2oeUC4125uvzyfuJFmBOKYxqyEq/gRYsuEanK3B8gJrsBqUXD4BkFlL
	gxGRRWS4kjwty7146J9tPMHri+etyic=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-370-PVHOFOk3N0i68oviNCrfLA-1; Fri,
 02 Oct 2026 01:11:11 -0400
X-MC-Unique: PVHOFOk3N0i68oviNCrfLA-1
X-Mimecast-MFC-AGG-ID: PVHOFOk3N0i68oviNCrfLA_1790917870
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1346E1955F70;
	Fri,  2 Oct 2026 05:11:10 +0000 (UTC)
Received: from hpa-thinkpadx1carbongen12.taipei.csb (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1B8D71956095;
	Fri,  2 Oct 2026 05:11:06 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH] media: i2c: imx471: Fix register size for IMX471_REG_DPGA_USE_GLOBAL_GAIN
Date: Fri,  2 Oct 2026 13:11:00 +0800
Message-ID: <20261002051100.261507-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The IMX471_REG_DPGA_USE_GLOBAL_GAIN register was incorrectly defined as a
16-bit register, preventing global gain from enabling correctly. As a
result, only the green channel gain was applied instead of the intended
global gain.

Change the register size to 8 bits to ensure global gain is properly
enabled.

Link: https://lore.kernel.org/linux-media/35240e45-c73b-4425-923a-c1026386ed3c@slotpi17m12/
Fixes: be1589e567ae ("media: i2c: imx471: Add Sony IMX471 image sensor driver")
Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/media/i2c/imx471.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
index 4053aed84340..b442b083286d 100644
--- a/drivers/media/i2c/imx471.c
+++ b/drivers/media/i2c/imx471.c
@@ -46,7 +46,7 @@
 #define IMX471_ANA_GAIN_DEFAULT			0
 
 /* Digital gain control */
-#define IMX471_REG_DPGA_USE_GLOBAL_GAIN		CCI_REG16(0x3ff9)
+#define IMX471_REG_DPGA_USE_GLOBAL_GAIN		CCI_REG8(0x3ff9)
 #define IMX471_REG_DIG_GAIN_GLOBAL		CCI_REG16(0x020e)
 #define IMX471_DGTL_GAIN_MIN			256
 #define IMX471_DGTL_GAIN_MAX			4095
-- 
2.55.0

