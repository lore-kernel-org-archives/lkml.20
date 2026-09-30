Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF0D472F8C;
	Wed, 30 Sep 2026 08:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758681; cv=none; b=fLEIE05txTxYTsm4XgUvbUVEpSZ6fjXGppRFqaGhNW00Vn10dEOb6pCf227Y+6yUDudKwrezmtJUzA9aLANho0VPzFDJni/NGr9Qny3zcL/ap/I4+L9mljQ6xY43A9xEoeT/ZsLxCFzpak73jUw+zvWpLDf1wncPhB8BKzScWEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758681; c=relaxed/simple;
	bh=bCQ6HAPn2+iLgk36qlqUURpRHpY3mD2AZUFph2541UU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZCHq6fn7FE6uIhHXW+kP7L1WrRe5kE+GfyvNfw/jCexShkqeJgqa4QCTSbmFoDt1Z5QbihbUtPZDApyGKwkOdXEh/G6gLDU6hrdq9ahANfSY42TW3ERNfVjayjn+pFZTH46gEKsUbNNJi0HnwZpJzKh0fgAyBpFk4golRpq8Ea4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 038a41f6bcad11f19a56ed5b684f684d-20260930
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:b5113972-426f-468a-8703-c4ca84ea4b60,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:f32e9d277eb876c9ca79c38d73b20a1e,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|123|136|850|865|898,TC:nil,Content:0|15|
	50|99,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 038a41f6bcad11f19a56ed5b684f684d-20260930
X-User: fengchenguang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <fengchenguang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1376588200; Wed, 30 Sep 2026 16:57:49 +0800
From: fengchenguang@kylinos.cn
To: linux-media@vger.kernel.org
Cc: hverkuil@kernel.org,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	Chenguang Feng <fengchenguang@kylinos.cn>
Subject: [PATCH 05/10] media: gspca: spca500: Fix block comment style
Date: Wed, 30 Sep 2026 16:57:33 +0800
Message-Id: <20260930085738.239952-5-fengchenguang@kylinos.cn>
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
 drivers/media/usb/gspca/spca500.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/gspca/spca500.c b/drivers/media/usb/gspca/spca500.c
index b9ce5e35f52f..8e10f0a7e6d2 100644
--- a/drivers/media/usb/gspca/spca500.c
+++ b/drivers/media/usb/gspca/spca500.c
@@ -583,7 +583,8 @@ static int sd_init(struct gspca_dev *gspca_dev)
 	if (sd->subtype == LogitechClickSmart310)
 		spca500_clksmart310_init(gspca_dev);
 /*	else
-		spca500_initialise(gspca_dev); */
+ *	spca500_initialise(gspca_dev);
+ */
 	gspca_dbg(gspca_dev, D_STREAM, "SPCA500 init done\n");
 	return 0;
 }
@@ -673,7 +674,8 @@ static int sd_start(struct gspca_dev *gspca_dev)
 	case CreativePCCam300:		/* Creative PC-CAM 300 640x480 CCD */
 	case IntelPocketPCCamera:	/* FIXME: Temporary fix for
 					 *	Intel Pocket PC Camera
-					 *	- NWG (Sat 29th March 2003) */
+					 *	- NWG (Sat 29th March 2003)
+					 */
 
 		/* do a full reset */
 		err = spca500_full_reset(gspca_dev);
-- 
2.25.1

