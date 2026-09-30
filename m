Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13E83F5BE4;
	Wed, 30 Sep 2026 08:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758698; cv=none; b=nkbom4Yn9MLiCRqkh1t3oZstaseTiceLglqwixrTHURqV3vlEpObAl42A4LOb0Q3hZkmp6tZLi9iYXu6Hz4X7Q6YGM11eLxv/CdCY/laF8sTDhXFzC3TOxeQfy+8B3lCjxwGG0FT6Kz47Zp/YaMIKYGrUdEwRns35+IQWSBjAyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758698; c=relaxed/simple;
	bh=+RTQv8Io/NvQaQx5zXyiGR0aZJHnu9/eQlVoWE/Z9Pg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r11fhSgc2v2Q4fXtg/l6e7biteqj5NQ3FUm8NC/d0eO4ButhWTFG9RHT34rcZFC+kaFv8ndNMRTldU2pChaTXezkcH3UY24PPtsQZa5SCnV13UbX3329UtSoo1glMHJ9gZzpekx7nmgAzh8SVi81r37qv+2hWrx4lAGX2ruNpMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 03fdf52ebcad11f19a56ed5b684f684d-20260930
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:27b706e8-0716-4a9c-8778-f31f6d7ddcc6,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:7bae3513a2468c1f4f4bc08ab2526897,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|123|136|850|865|898,TC:nil,Content:0|15|
	50|99,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 03fdf52ebcad11f19a56ed5b684f684d-20260930
X-User: fengchenguang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <fengchenguang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 798653724; Wed, 30 Sep 2026 16:57:50 +0800
From: fengchenguang@kylinos.cn
To: linux-media@vger.kernel.org
Cc: hverkuil@kernel.org,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	Chenguang Feng <fengchenguang@kylinos.cn>
Subject: [PATCH 06/10] media: gspca: spca505: Fix block comment style
Date: Wed, 30 Sep 2026 16:57:34 +0800
Message-Id: <20260930085738.239952-6-fengchenguang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260930085738.239952-1-fengchenguang@kylinos.cn>
References: <20260930085738.239952-1-fengchenguang@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chenguang Feng <fengchenguang@kylinos.cn>

Fix coding style issues reported by checkpatch.pl:
- move closing */ of block comments to a separate line
- align * on subsequent lines of block comments

No functional changes.

Signed-off-by: Chenguang Feng <fengchenguang@kylinos.cn>
---
 drivers/media/usb/gspca/spca505.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/gspca/spca505.c b/drivers/media/usb/gspca/spca505.c
index 0e8cccbb6d80..0042d74a0861 100644
--- a/drivers/media/usb/gspca/spca505.c
+++ b/drivers/media/usb/gspca/spca505.c
@@ -117,8 +117,10 @@ static const u8 spca505_open_data_ccd[][3] = {
 	/* This could be a reset */
 	{0x03, 0x00, 0x01},
 
-	/* Setup compression and image registers. 0x6 and 0x7 seem to be
-	   related to H&V hold, and are resolution mode specific */
+	/*
+	 * Setup compression and image registers. 0x6 and 0x7 seem to be
+	 * related to H&V hold, and are resolution mode specific
+	 */
 		{0x04, 0x10, 0x01},
 		/* DIFF(0x50), was (0x10) */
 	{0x04, 0x00, 0x04},
@@ -654,7 +656,8 @@ static int sd_start(struct gspca_dev *gspca_dev)
 	reg_write(gspca_dev, 0x05, 0xc2, 0x12);
 
 	/* necessary because without it we can see stream
-	 * only once after loading module */
+	 * only once after loading module
+	 */
 	/* stopping usb registers Tomasz change */
 	reg_write(gspca_dev, 0x02, 0x00, 0x00);
 
-- 
2.25.1

