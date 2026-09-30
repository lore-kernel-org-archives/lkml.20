Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7C945041A;
	Wed, 30 Sep 2026 08:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758678; cv=none; b=VuKKo7ehFOElbnYghWqU8R3l8vaTJ4EXBWg1bbGBi0YASqmhoBqES0qw0qqI8PtqU3galLjfog0B3kp9lTZ7uU0nkDt3gPvef9cuq0AFbxJIgMuy5P4ELBtFUqsKf2kmWtb2d9+BVBLFZlSwCNHEnF6AtEOQEe3/OK5ciwktlfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758678; c=relaxed/simple;
	bh=ez7U5C+ZARtFuSqeU7+mRCdn7po5ha5ZN3kpbAvXQlo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mbIYMFcK4tYdji2pyq+PcGi1BYrt/rr/ykzoOwCjzBOj0zWdzT/i4v0jA81nei6pYuHsyy+vag5Oz01kzQ21Xr7vKS3KaXkb9RFT8QdRd4+ye2PeAxvwD8fCHJhcKU3eXUJsVFAtedp7W+8Tn/Hfni7W+poLkj4VAB9CBb21UXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 029a9ac0bcad11f19a56ed5b684f684d-20260930
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:b64acb71-3042-471a-8a32-3271ff94b26a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:f6ae1ac66db01e82456a60d53ccbb465,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|123|136|850|865|898,TC:nil,Content:0|15|
	50|99,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 029a9ac0bcad11f19a56ed5b684f684d-20260930
X-User: fengchenguang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <fengchenguang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1090401039; Wed, 30 Sep 2026 16:57:48 +0800
From: fengchenguang@kylinos.cn
To: linux-media@vger.kernel.org
Cc: hverkuil@kernel.org,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	Chenguang Feng <fengchenguang@kylinos.cn>
Subject: [PATCH 03/10] media: gspca: mars: Fix coding style issues reported by checkpatch
Date: Wed, 30 Sep 2026 16:57:31 +0800
Message-Id: <20260930085738.239952-3-fengchenguang@kylinos.cn>
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
- add parentheses to sizeof argument

No functional changes.

Signed-off-by: Chenguang Feng <fengchenguang@kylinos.cn>
---
 drivers/media/usb/gspca/mars.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/gspca/mars.c b/drivers/media/usb/gspca/mars.c
index eb9342ee32af..cc00c45c36e0 100644
--- a/drivers/media/usb/gspca/mars.c
+++ b/drivers/media/usb/gspca/mars.c
@@ -253,7 +253,7 @@ static int sd_start(struct gspca_dev *gspca_dev)
 	reg_w(gspca_dev, 2);
 
 	/*
-	   Initialize the MR97113 chip register
+	 * Initialize the MR97113 chip register
 	 */
 	data[0] = 0x00;		/* address */
 	data[1] = 0x0c | 0x01;	/* reg 0 */
@@ -261,7 +261,8 @@ static int sd_start(struct gspca_dev *gspca_dev)
 	data[3] = gspca_dev->pixfmt.width / 8;	/* h_size , reg 2 */
 	data[4] = gspca_dev->pixfmt.height / 8;	/* v_size , reg 3 */
 	data[5] = 0x30;		/* reg 4, MI, PAS5101 :
-				 *	0x30 for 24mhz , 0x28 for 12mhz */
+				 *	0x30 for 24mhz , 0x28 for 12mhz
+				 */
 	data[6] = 0x02;		/* reg 5, H start - was 0x04 */
 	data[7] = v4l2_ctrl_g_ctrl(sd->gamma) * 0x40;	/* reg 0x06: gamma */
 	data[8] = 0x01;		/* reg 7, V start - was 0x03 */
@@ -282,10 +283,12 @@ static int sd_start(struct gspca_dev *gspca_dev)
 	data[0] = 0x3c;		/* address */
 /*	if (gspca_dev->width == 1280) */
 /*		data[1] = 200;	 * reg 60, pc-cam frame size
-				 *	(unit: 4KB) 800KB */
+				 *	(unit: 4KB) 800KB
+				 */
 /*	else */
 	data[1] = 50;		/* 50 reg 60, pc-cam frame size
-				 *	(unit: 4KB) 200KB */
+				 *	(unit: 4KB) 200KB
+				 */
 	reg_w(gspca_dev, 2);
 
 	/* auto dark-gain */
@@ -294,7 +297,8 @@ static int sd_start(struct gspca_dev *gspca_dev)
 /*jfm: from win trace*/
 				/* reg 0x5f/0x60 (LE) = saturation */
 				/* h (60): xxxx x100
-				 * l (5f): xxxx x000 */
+				 * l (5f): xxxx x000
+				 */
 	data[2] = v4l2_ctrl_g_ctrl(sd->saturation) << 3;
 	data[3] = ((v4l2_ctrl_g_ctrl(sd->saturation) >> 2) & 0xf8) | 0x04;
 	data[4] = v4l2_ctrl_g_ctrl(sd->brightness); /* reg 0x61 = brightness */
@@ -320,7 +324,7 @@ static int sd_start(struct gspca_dev *gspca_dev)
 /*jfm: win trace - many writes here to reg 0x64*/
 
 	/* initialize the MI sensor */
-	for (i = 0; i < sizeof mi_data; i++)
+	for (i = 0; i < sizeof(mi_data); i++)
 		mi_w(gspca_dev, i + 1, mi_data[i]);
 
 	data[0] = 0x00;
-- 
2.25.1

