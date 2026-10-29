Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793258151;
	b=N1VwBbfPmSOX+eie4VwPVcVpeN4JktGHP10sQQQGqC2XFwpYk5PnO/RJJ9LrRf6sdh+D
	 wNPYgXQ9BOGsP58Bfg+rGj4FaiIVe6JK0Vz35iXt+tkT4MaP45bhyu2n5fWfazElHT4CL
	 27/Oo06E8W7qbMvgCZZ8OzypqcnYRHpCCNAsBPKck7z4z7oX0u+TFV7dS7ocLGhlgZd2e
	 LD0agmdz+zUBymfIdDxlASwq2Wm+a+XwUYT9fWTCLKNonFXGKaU88NTGdoM8cIN+gLe7j
	 uLd7y8/+v4PVNBQSMnaceHaSjoBYgaUP7MvB3/VfXKoIebqRJxswvGfV+AOI//NyJaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793258151;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bvWZLy9g7KOLN83oax/3KQpxauUHOmhI+XerJotVa/I=;
	b=WWI6HUrYSUcUrgv0p6hJbsRA1RiUN8UYJonSRifeUwINs5cpu7gcm42HIlFh0zq+JpvK
	 t/exUA2DENm2aCvHvUltgAgiGYPyyktwaxZgw0Q+YmEGyzvUtBhr+TXxp5jVmDfUjkVUX
	 yRpux+7o1mvowJHk5qlW1WpSsrCDNYHph+aCbMFTeRkvvJzIWz6FQQucQxdFpK1aLNqEV
	 FnjdFLADZzqimgtSLD658nX8Dr+EyO4M3eZ8aiZp2s4wjseZSSqkpwD0VF9tVeTTHNyTW
	 vYxQCtx8TmIrWqKMceGjkEhM7FMrUkThefKlaEbhZvMYZ8rngJp6ivOF+5UZ8vzpnbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=DuzECotV;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E631606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E631606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=DuzECotV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=DuzECotVW1XnZSqhbu2Ry91xkqUntPUxGlCc/W9ATcKJoi3Qp5l4duBsyQ14wf10+fYhrogWjuSoU
	 WwkKXkyKRj4LDtb3ZgulLcWpfjrufsQk7eFo11Y1uSl6yVZUFxHOb1KCTJCqDjCTwOpp7XFyf6xV/y
	 UnNAVrKj6f2PBb28=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86ae2f29ddf8-07650;
	Thu, 29 Oct 2026 15:15:41 +0800 (CST)
X-RM-TRANSID:2ee86ae2f29ddf8-07650
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from Z04181454368174 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36ae2f29942f-24253;
	Thu, 29 Oct 2026 15:15:40 +0800 (CST)
X-RM-TRANSID:2ee36ae2f29942f-24253
From: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
To: Frank.Li@nxp.com
Cc: alexandre.belloni@bootlin.com,
	adrian.hunter@intel.com,
	jorge.marques@analog.com,
	tze.yee.ng@altera.com,
	adrian.ho.yin.ng@altera.com,
	linux-kernel@vger.kernel.org,
	trivial@kernel.org,
	zhang jiao <zhangjiao2@cmss.chinamobile.com>
Subject: [PATCH] i3c: master: cdns: Fix IBI FIFO buffer overflow
Date: Thu, 29 Oct 2026 15:15:32 +0800
Message-ID: <20261029071533.715-1-zhangjiao2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: zhang jiao <zhangjiao2@cmss.chinamobile.com>

The cdns_i3c_master_handle_ibi() function reads the IBI payload length
from the hardware register field IBIR_XFER_BYTES(ibir) (0-31 bytes) and
uses it directly as the FIFO read length into slot->data, which is a
buffer of size dev->ibi->max_payload_len.

The slot->len is clamped with min_t() to max_payload_len AFTER the
i3c_readl_fifo() call has already written the data. If the hardware
reports more bytes than max_payload_len, the FIFO read overflows the
heap buffer before the clamp takes effect.

This can be triggered by a malfunctioning or malicious I3C device on
the bus that sends an IBI payload larger than the agreed-upon
max_payload_len, leading to kernel heap corruption.

Fix this by checking nbytes against max_payload_len BEFORE reading the
FIFO. If the payload exceeds the buffer, recycle the slot and let the
existing out path drain the FIFO. This matches the approach already
used in dw-i3c-master.c and svc-i3c-master.c.

Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
---
 drivers/i3c/master/i3c-master-cdns.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 2d98c1ce9b12..b5ffea1e6a4c 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -1318,13 +1318,18 @@ static void cdns_i3c_master_handle_ibi(struct cdns_i3c_master *master,
 	if (!slot)
 		goto out_unlock;
 
-	buf = slot->data;
-
 	nbytes = IBIR_XFER_BYTES(ibir);
-	i3c_readl_fifo(master->regs + IBI_DATA_FIFO, buf, nbytes);
+	if (nbytes > dev->ibi->max_payload_len) {
+		dev_dbg_ratelimited(&master->base.dev,
+				    "IBI payload %zu bytes exceeds max %u, dropping\n",
+				    nbytes, dev->ibi->max_payload_len);
+		i3c_generic_ibi_recycle_slot(data->ibi_pool, slot);
+		goto out_unlock;
+	}
 
-	slot->len = min_t(unsigned int, IBIR_XFER_BYTES(ibir),
-			  dev->ibi->max_payload_len);
+	buf = slot->data;
+	i3c_readl_fifo(master->regs + IBI_DATA_FIFO, buf, nbytes);
+	slot->len = nbytes;
 	i3c_master_queue_ibi(dev, slot);
 	data_consumed = true;
 
-- 
2.33.0



