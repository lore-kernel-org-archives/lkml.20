Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5354E46C4C8;
	Wed, 30 Sep 2026 08:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758680; cv=none; b=hxTw1b2ghTQWYDIBgU09ymi9BY/JJIozocJVvKcQgaP3UQE8h3NfkHYLcWV/QekCgELOdZXoMVqtT0k0TItFoyhph6a8TgoOqaWR/aZTFmD2MqMT9Rap6PEcd+VbmWvyFvtjEnFgFCiEkTsX/I2bXBcx4by6SJLvJGH/7jp+Fyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758680; c=relaxed/simple;
	bh=YWUcafKwBt0OMYnKvZjtcp0m+MjzZE8sWP5Sp4Qr84A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KDuRsM4Wk+X3zOluMYkM88rfQwQUlKcLmbCcJ+a767Gtu3yNBVT6B1CwliI+rGnzUMCJ2sLFbP/hjLoS0V1gc5fkDA+g/8MFslnQj4y5PDFQ+OrRZhaxrM1IhuzMmaF9xRvl0TXl+QvEYlw7pd/YC14VpEo+L15nkWy52GU09oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 049070acbcad11f19a56ed5b684f684d-20260930
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:7bb7a5a2-9189-4b03-b44e-53912ea81246,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:85e890f18d34f01235c21c4d0e1caa5e,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|123|136|850|865|898,TC:nil,Content:0|15|
	50|99,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 049070acbcad11f19a56ed5b684f684d-20260930
X-User: fengchenguang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <fengchenguang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1499438477; Wed, 30 Sep 2026 16:57:51 +0800
From: fengchenguang@kylinos.cn
To: linux-media@vger.kernel.org
Cc: hverkuil@kernel.org,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	Chenguang Feng <fengchenguang@kylinos.cn>
Subject: [PATCH 07/10] media: gspca: spca506: Fix block comment style
Date: Wed, 30 Sep 2026 16:57:35 +0800
Message-Id: <20260930085738.239952-7-fengchenguang@kylinos.cn>
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
 drivers/media/usb/gspca/spca506.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/gspca/spca506.c b/drivers/media/usb/gspca/spca506.c
index 0886587dc89c..13de6b0d9307 100644
--- a/drivers/media/usb/gspca/spca506.c
+++ b/drivers/media/usb/gspca/spca506.c
@@ -154,8 +154,10 @@ static void spca506_GetNormeInput(struct gspca_dev *gspca_dev,
 {
 	struct sd *sd = (struct sd *) gspca_dev;
 
-	/* Read the register is not so good value change so
-	   we use your own copy in spca50x struct */
+	/*
+	 * Read the register is not so good value change so
+	 * we use your own copy in spca50x struct
+	 */
 	*norme = sd->norme;
 	*channel = sd->channel;
 	gspca_dbg(gspca_dev, D_STREAM, "Get Norme: %d Channel %d\n",
-- 
2.25.1

