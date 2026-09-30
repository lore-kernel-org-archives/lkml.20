Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271064657C2;
	Wed, 30 Sep 2026 08:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758681; cv=none; b=oDs1aXfH+VHOPEuvcNLqWOEEVZ67XP0ECQJdm1KVLS3GS7MXhwro6g71WdNbNclvQELrHmY/jjZ0zoZ9RpaKcbKZyMxHwDGQZC0m5/j9gTNHzRLRJZFG/E79Tbw1vqh75nntTqzMH38IR2A6m7jRTWgrXRinhneuEi6wEUYKvy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758681; c=relaxed/simple;
	bh=GwelRtNnWFC8OLYY3Ls9JaxXU1iLvO083FB7r4eyQuc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s4pnQH0Jyc1Vrs4LMvhjbZgGqCkfXIICDLOTJVtdeVJanQrPBMOQMVczbziXYtT/zS2/XCJHfzyVAwM6pGT6XXQajIidriVIazEwPnG1zZBX38Oo/5DVZhSU0l95bZeV+oA+JawBfYi63OQJwVPeQ0Jw1HbTnbZaXQKFZ50md6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 03107c40bcad11f19a56ed5b684f684d-20260930
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:35b9d3a3-babb-4573-b8c2-be54b64cd409,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:e5e69d7248e0514a478218bfa2bf805a,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|123|136|850|865|898,TC:nil,Content:0|15|
	50|99,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 03107c40bcad11f19a56ed5b684f684d-20260930
X-User: fengchenguang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <fengchenguang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 602346005; Wed, 30 Sep 2026 16:57:49 +0800
From: fengchenguang@kylinos.cn
To: linux-media@vger.kernel.org
Cc: hverkuil@kernel.org,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	Chenguang Feng <fengchenguang@kylinos.cn>
Subject: [PATCH 04/10] media: gspca: mars: Drop commented-out code
Date: Wed, 30 Sep 2026 16:57:32 +0800
Message-Id: <20260930085738.239952-4-fengchenguang@kylinos.cn>
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

Remove the commented-out 1280-width frame size setting left over from
an old version of the driver. This also silences the checkpatch.pl
warning about misaligned '*' in block comments.

No functional changes.

Signed-off-by: Chenguang Feng <fengchenguang@kylinos.cn>
---
 drivers/media/usb/gspca/mars.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/usb/gspca/mars.c b/drivers/media/usb/gspca/mars.c
index cc00c45c36e0..f04241cc878a 100644
--- a/drivers/media/usb/gspca/mars.c
+++ b/drivers/media/usb/gspca/mars.c
@@ -281,11 +281,6 @@ static int sd_start(struct gspca_dev *gspca_dev)
 	reg_w(gspca_dev, 2);
 
 	data[0] = 0x3c;		/* address */
-/*	if (gspca_dev->width == 1280) */
-/*		data[1] = 200;	 * reg 60, pc-cam frame size
-				 *	(unit: 4KB) 800KB
-				 */
-/*	else */
 	data[1] = 50;		/* 50 reg 60, pc-cam frame size
 				 *	(unit: 4KB) 200KB
 				 */
-- 
2.25.1

