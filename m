Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5703F5BE4;
	Wed, 30 Sep 2026 08:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758677; cv=none; b=aqWFeNm73V1MEo5s/KEBryYm2j4fKyDrZgjB7ZhdB4n5aUjvdcONdxKQMc4iITz527h4n32T79jEaqP58Z/alb9lrR58iO81daopXdEhjr5W1J+oc830/78eroaw4qjQ7iPhNqrBNJX5hnjCLu/Vy0TjPUBz/yZjokIURiyBNGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758677; c=relaxed/simple;
	bh=8ImmuVdzW8knjEXZ4SQGzOTWg6eH00cCid5xh6+lyOY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U2zkNLGKsJC5g+6B25ZQ8wtc5ORGa8OFpgDZJnrnWw+KqruboKfwqeN4hZ0DfNsYDT+SQhdjCXuZRiuK36goXTKkHdjYTSi6wLrah8OGtN6WE7ASpdHG5A/8uklZQK75ZZg+93MiERTrvot+1qjp9phpQ4HTAnYTwkE17nxxjtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ffb4a076bcac11f19a56ed5b684f684d-20260930
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:b7668538-cd55-411e-ba63-46dcf9da51cb,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:b50ba0e079029fa6dd5ebb2611e5b4f7,BulkI
	D:nil,BulkQuantity:0,SF:102|123|136|850|865|898,TC:nil,Content:0|15|50|99,
	EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ffb4a076bcac11f19a56ed5b684f684d-20260930
X-User: fengchenguang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <fengchenguang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 650873442; Wed, 30 Sep 2026 16:57:43 +0800
From: fengchenguang@kylinos.cn
To: linux-media@vger.kernel.org
Cc: hverkuil@kernel.org,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	Chenguang Feng <fengchenguang@kylinos.cn>
Subject: [PATCH 01/10] media: gspca: finepix: Fix block comment trailing */ style
Date: Wed, 30 Sep 2026 16:57:29 +0800
Message-Id: <20260930085738.239952-1-fengchenguang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chenguang Feng <fengchenguang@kylinos.cn>

Fix coding style issues reported by checkpatch.pl:
move the closing */ of block comments to a separate line.

No functional changes.

Signed-off-by: Chenguang Feng <fengchenguang@kylinos.cn>
---
 drivers/media/usb/gspca/finepix.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/gspca/finepix.c b/drivers/media/usb/gspca/finepix.c
index bc6133b525e3..282698e2aa8b 100644
--- a/drivers/media/usb/gspca/finepix.c
+++ b/drivers/media/usb/gspca/finepix.c
@@ -20,7 +20,8 @@ MODULE_LICENSE("GPL");
 
 /* Maximum transfer size to use. The windows driver reads by chunks of
  * 0x2000 bytes, so do the same. Note: reading more seems to work
- * too. */
+ * too.
+ */
 #define FPIX_MAX_TRANSFER 0x2000
 
 /* Structure to hold all of our device specific stuff */
@@ -33,7 +34,8 @@ struct usb_fpix {
 /* Delay after which claim the next frame. If the delay is too small,
  * the camera will return old frames. On the 4800Z, 20ms is bad, 25ms
  * will fail every 4 or 5 frames, but 30ms is perfect. On the A210,
- * 30ms is bad while 35ms is perfect. */
+ * 30ms is bad while 35ms is perfect.
+ */
 #define NEXT_FRAME_DELAY 35
 
 /* These cameras only support 320x200. */
@@ -112,7 +114,8 @@ static void dostream(struct work_struct *work)
 					&len, FPIX_TIMEOUT);
 			if (ret < 0) {
 				/* Most of the time we get a timeout
-				 * error. Just restart. */
+				 * error. Just restart.
+				 */
 				goto again;
 			}
 #ifdef CONFIG_PM
@@ -130,7 +133,8 @@ static void dostream(struct work_struct *work)
 				 * frame. Sometimes the jpeg is not complete,
 				 * but there's nothing we can do. We also end
 				 * here if the jpeg ends right at the end
-				 * of the frame. */
+				 * of the frame.
+				 */
 				gspca_frame_add(gspca_dev, LAST_PACKET,
 						data, len);
 				break;
@@ -146,7 +150,8 @@ static void dostream(struct work_struct *work)
 
 		/* We must wait before trying reading the next
 		 * frame. If we don't, or if the delay is too short,
-		 * the camera will disconnect. */
+		 * the camera will disconnect.
+		 */
 		msleep(NEXT_FRAME_DELAY);
 	}
 
@@ -191,7 +196,8 @@ static int sd_start(struct gspca_dev *gspca_dev)
 	}
 
 	/* Read the result of the command. Ignore the result, for it
-	 * varies with the device. */
+	 * varies with the device.
+	 */
 	ret = usb_bulk_msg(gspca_dev->dev,
 			gspca_dev->urb[0]->pipe,
 			gspca_dev->urb[0]->transfer_buffer,
-- 
2.25.1

