Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163FA472062;
	Wed, 30 Sep 2026 08:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758682; cv=none; b=J69hNhIER+t4fJhuryIe4a4rgy5yQv6jBAgYFkBKR7zw4tP5mMQJsZ/pUGm1lcO86vr9r/8wV3somNDPwTdpjLblEyvwsVZKEwGI1AMgWIH/yZzSDD3NLKXds1+TuPEXeEXGGG1UQ+LuhRwYw6tIk/k9rHcnNM+RB4JTBs495j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758682; c=relaxed/simple;
	bh=sS1E3w4CAhrIW5XQcXGw1YJACXQHnSi6SaOOYPzTD90=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VQJQhx4LrbPve935ZV2tRk37tpgjVieLtFfCZggjyJcE650Fd4VqUFiTaI84YDV0W99IAneZP62KERbudlZXVcgP3e1/o3ci7sB6kConZiRuGfZPyKXEKqq/y6QnOThaB1l3pp4oPKmIlj74qKxXoeIaqtZlDcsblrg1pwG6auM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 06350a80bcad11f19a56ed5b684f684d-20260930
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:b590be8a-24a9-4fd5-bde3-ecba10ba8ebc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:0ffa42750661849f550c90e8de0c972b,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|123|136|850|865|898,TC:nil,Content:0|15|
	50|99,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 06350a80bcad11f19a56ed5b684f684d-20260930
X-User: fengchenguang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <fengchenguang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 284603382; Wed, 30 Sep 2026 16:57:54 +0800
From: fengchenguang@kylinos.cn
To: linux-media@vger.kernel.org
Cc: hverkuil@kernel.org,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	Chenguang Feng <fengchenguang@kylinos.cn>
Subject: [PATCH 10/10] media: gspca: pac207: Fix block comment style
Date: Wed, 30 Sep 2026 16:57:38 +0800
Message-Id: <20260930085738.239952-10-fengchenguang@kylinos.cn>
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
 drivers/media/usb/gspca/pac207.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/gspca/pac207.c b/drivers/media/usb/gspca/pac207.c
index 34127114c99b..5044bc39d59e 100644
--- a/drivers/media/usb/gspca/pac207.c
+++ b/drivers/media/usb/gspca/pac207.c
@@ -69,8 +69,10 @@ static const struct v4l2_pix_format sif_mode[] = {
 		.priv = 1},
 	{352, 288, V4L2_PIX_FMT_PAC207, V4L2_FIELD_NONE,
 		.bytesperline = 352,
-			/* compressed, but only when needed (not compressed
-			   when the framerate is low) */
+			/*
+			 * compressed, but only when needed (not compressed
+			 * when the framerate is low)
+			 */
 		.sizeimage = (352 + 2) * 288,
 		.colorspace = V4L2_COLORSPACE_SRGB,
 		.priv = 0},
@@ -207,10 +209,12 @@ static int sd_s_ctrl(struct v4l2_ctrl *ctrl)
 	gspca_dev->usb_err = 0;
 
 	if (ctrl->id == V4L2_CID_AUTOGAIN && ctrl->is_new && ctrl->val) {
-		/* when switching to autogain set defaults to make sure
-		   we are on a valid point of the autogain gain /
-		   exposure knee graph, and give this change time to
-		   take effect before doing autogain. */
+		/*
+		 * when switching to autogain set defaults to make sure
+		 * we are on a valid point of the autogain gain /
+		 * exposure knee graph, and give this change time to
+		 * take effect before doing autogain.
+		 */
 		gspca_dev->exposure->val    = PAC207_EXPOSURE_DEFAULT;
 		gspca_dev->gain->val        = PAC207_GAIN_DEFAULT;
 		sd->autogain_ignore_frames  = PAC_AUTOGAIN_IGNORE_FRAMES;
-- 
2.25.1

