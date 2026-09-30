Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8EF472064;
	Wed, 30 Sep 2026 08:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758692; cv=none; b=NukberJxRMqCOZlig+9uGdBqQKh5fu6DxH5GSywVeaGXokIcn4SEiCNV3epHlXF+QO96zyQg2UCF92EU7wfdLc9Jgs74iK6v4sW9D86bI5XJ1mJrGErULtgiW2/GH/Twlm+Vq9YQLFlksrFLByNhaLkax6Rs4w1BkukIyIBRMyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758692; c=relaxed/simple;
	bh=8unlvy1dKGJQgNSYlcOPTpxt4TFiUgkkviBqGdo3ldM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XZOO/jXV2bnUJQUVF+lLm653zGsBMqD7JLF/VITSJYwVGYCvs79QJf9m1HdNxyMbOSPfI//c/tuUbd/+QbIo0e8rG30uopWB3pKbKZmjwSstyeSwVuXkhi/6rMpPacGQrLzIMCAIl4MUcY/46h/OdguzYeTedF4uifQYPgJNlFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 05b9d5c2bcad11f19a56ed5b684f684d-20260930
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:0b7599ce-cb3b-4536-bc4d-43a24e4c1781,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:e1e3abda8d4ea5e0cf29eb187c146ec7,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|123|136|850|865|898,TC:nil,Content:0|15|
	50|99,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 05b9d5c2bcad11f19a56ed5b684f684d-20260930
X-User: fengchenguang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <fengchenguang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1216003785; Wed, 30 Sep 2026 16:57:53 +0800
From: fengchenguang@kylinos.cn
To: linux-media@vger.kernel.org
Cc: hverkuil@kernel.org,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	Chenguang Feng <fengchenguang@kylinos.cn>
Subject: [PATCH 09/10] media: gspca: spca501: Fix block comment style
Date: Wed, 30 Sep 2026 16:57:37 +0800
Message-Id: <20260930085738.239952-9-fengchenguang@kylinos.cn>
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
 drivers/media/usb/gspca/spca501.c | 32 ++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/media/usb/gspca/spca501.c b/drivers/media/usb/gspca/spca501.c
index f7c75d7535c4..464e8b5d5187 100644
--- a/drivers/media/usb/gspca/spca501.c
+++ b/drivers/media/usb/gspca/spca501.c
@@ -187,19 +187,19 @@ static const __u16 spca501_open_data[][3] = {
 };
 
 /*
-   The SPCAxxx docs from Sunplus document these values
-   in tables, one table per register number.  In the data
-   below, dmRequest is the register number, index is the Addr,
-   and value is a combination of Bit values.
-   Bit  Value (hex)
-   0    01
-   1    02
-   2    04
-   3    08
-   4    10
-   5    20
-   6    40
-   7    80
+ * The SPCAxxx docs from Sunplus document these values
+ * in tables, one table per register number.  In the data
+ * below, dmRequest is the register number, index is the Addr,
+ * and value is a combination of Bit values.
+ * Bit  Value (hex)
+ * 0    01
+ * 1    02
+ * 2    04
+ * 3    08
+ * 4    10
+ * 5    20
+ * 6    40
+ * 7    80
  */
 
 /* Data for chip initialization (set default values) */
@@ -1876,7 +1876,8 @@ static int sd_start(struct gspca_dev *gspca_dev)
 	mode = gspca_dev->cam.cam_mode[(int) gspca_dev->curr_mode].priv;
 
 	/* Enable ISO packet machine CTRL reg=2,
-	 * index=1 bitmask=0x2 (bit ordinal 1) */
+	 * index=1 bitmask=0x2 (bit ordinal 1)
+	 */
 	reg_write(gspca_dev, SPCA50X_REG_USB, 0x6, 0x94);
 	switch (mode) {
 	case 0: /* 640x480 */
@@ -1898,7 +1899,8 @@ static int sd_start(struct gspca_dev *gspca_dev)
 static void sd_stopN(struct gspca_dev *gspca_dev)
 {
 	/* Disable ISO packet
-	 * machine CTRL reg=2, index=1 bitmask=0x0 (bit ordinal 1) */
+	 * machine CTRL reg=2, index=1 bitmask=0x0 (bit ordinal 1)
+	 */
 	reg_write(gspca_dev, SPCA501_REG_CTLRL, 0x01, 0x00);
 }
 
-- 
2.25.1

