Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DAB472087;
	Wed, 30 Sep 2026 08:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758681; cv=none; b=tIPsLpZ1a0zI/F3SX7de+PGSSWR3gOZ4hTuYm9/vMFULG2hOYy0wpBzCSCerKL9hTvvPnwWD5oOEsIetF7kN3Nm1B4DtRh/OOkmqjLwNvgYjZs9zDwrsozAeMm6xf+jBiMr2PhdzExSSKHwocii1YLy1JTQg/peKME2g4+y1dCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758681; c=relaxed/simple;
	bh=S0BptURfSVtyQMM/rL19zwg5DpRChCs3lPY8qRJFWAc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PADtY7ckhIHmY+rkprLl9oumzwbrUA8+PFDKHPKpWmhCnsdTXPFBtOSpBcEcTASpnjPPWBO1SBqvdkQFP2dAREsU/lzD81jr0wgar+UAtXPsKeuZsJwD3wDGtLzzBwEx8xRLpL5gBwZbg1TBg9+7/GuqGo33Cm0/r9f8ADNN5lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 05370c6ebcad11f19a56ed5b684f684d-20260930
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:5a455192-c312-4de4-831f-93c2996ecc57,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:1297c8fc50d5377e0e19e51627139119,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|123|136|850|865|898,TC:nil,Content:0|15|
	50|99,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 05370c6ebcad11f19a56ed5b684f684d-20260930
X-User: fengchenguang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <fengchenguang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1995207807; Wed, 30 Sep 2026 16:57:52 +0800
From: fengchenguang@kylinos.cn
To: linux-media@vger.kernel.org
Cc: hverkuil@kernel.org,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	Chenguang Feng <fengchenguang@kylinos.cn>
Subject: [PATCH 08/10] media: gspca: konica: Fix block comment style
Date: Wed, 30 Sep 2026 16:57:36 +0800
Message-Id: <20260930085738.239952-8-fengchenguang@kylinos.cn>
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
 drivers/media/usb/gspca/konica.c | 35 +++++++++++++++++---------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/media/usb/gspca/konica.c b/drivers/media/usb/gspca/konica.c
index 53db9a2895ea..930cb242a0fa 100644
--- a/drivers/media/usb/gspca/konica.c
+++ b/drivers/media/usb/gspca/konica.c
@@ -40,20 +40,21 @@ struct sd {
 };
 
 
-/* .priv is what goes to register 8 for this mode, known working values:
-   0x00 -> 176x144, cropped
-   0x01 -> 176x144, cropped
-   0x02 -> 176x144, cropped
-   0x03 -> 176x144, cropped
-   0x04 -> 176x144, binned
-   0x05 -> 320x240
-   0x06 -> 320x240
-   0x07 -> 160x120, cropped
-   0x08 -> 160x120, cropped
-   0x09 -> 160x120, binned (note has 136 lines)
-   0x0a -> 160x120, binned (note has 136 lines)
-   0x0b -> 160x120, cropped
-*/
+/*
+ * .priv is what goes to register 8 for this mode, known working values:
+ * 0x00 -> 176x144, cropped
+ * 0x01 -> 176x144, cropped
+ * 0x02 -> 176x144, cropped
+ * 0x03 -> 176x144, cropped
+ * 0x04 -> 176x144, binned
+ * 0x05 -> 320x240
+ * 0x06 -> 320x240
+ * 0x07 -> 160x120, cropped
+ * 0x08 -> 160x120, cropped
+ * 0x09 -> 160x120, binned (note has 136 lines)
+ * 0x0a -> 160x120, binned (note has 136 lines)
+ * 0x0b -> 160x120, cropped
+ */
 static const struct v4l2_pix_format vga_mode[] = {
 	{160, 120, V4L2_PIX_FMT_KONICA420, V4L2_FIELD_NONE,
 		.bytesperline = 160,
@@ -240,8 +241,10 @@ static void sd_stopN(struct gspca_dev *gspca_dev)
 
 	konica_stream_off(gspca_dev);
 #if IS_ENABLED(CONFIG_INPUT)
-	/* Don't keep the button in the pressed state "forever" if it was
-	   pressed when streaming is stopped */
+	/*
+	 * Don't keep the button in the pressed state "forever" if it was
+	 * pressed when streaming is stopped
+	 */
 	if (sd->snapshot_pressed) {
 		input_report_key(gspca_dev->input_dev, KEY_CAMERA, 0);
 		input_sync(gspca_dev->input_dev);
-- 
2.25.1

