Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BAB472075;
	Wed, 30 Sep 2026 08:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758678; cv=none; b=Tk5VfKL+VDnYT+Dt/BXBv+VJTcplTggN+I6G/1Sdq9fhKVfuwQu/P9qZ7LZuWoIth9JYRs4L8yhMKON1lhbtcxi8LQb2SYsPx/5iT5+lBjXa53FghXgLyR2pKfPRqYmUXh1j6PG3RR0ADYIVatDopz3u6Ddle/06BJ6J88ikuvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758678; c=relaxed/simple;
	bh=K+bs49V95VZvR3fAIPfY5xR7b3mCt2Vd02J+dRapOlM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gTtH75exv2kbT3uw9WGaIhLHhfURsM/J/SSqapTwPQKPnXfmiI9wOhujb1TvYXoD8hn4x1aBTE0rMSyVCtUVQDa7ZcAS9Xo+xHdfhDjGgKmSVGyQGr1dhst7FLN4rYY6xbRvTot+SuNeSsY0C0ZCzQTVqBy77XrB99BlVQH7Vzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 020260d4bcad11f19a56ed5b684f684d-20260930
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:f2dd3ffb-6e3b-4538-8381-3f8829ef565a,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:43c4e6b78342eefa8c0a530d0bdb0e63,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|123|850|865|898,TC:nil,Content:0|15|50|9
	9,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 020260d4bcad11f19a56ed5b684f684d-20260930
X-User: fengchenguang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <fengchenguang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1223474301; Wed, 30 Sep 2026 16:57:47 +0800
From: fengchenguang@kylinos.cn
To: linux-media@vger.kernel.org
Cc: hverkuil@kernel.org,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	Chenguang Feng <fengchenguang@kylinos.cn>
Subject: [PATCH 02/10] media: gspca: finepix: Use __func__ instead of hardcoded function name
Date: Wed, 30 Sep 2026 16:57:30 +0800
Message-Id: <20260930085738.239952-2-fengchenguang@kylinos.cn>
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
replace hardcoded 'dostream' with __func__ in gspca_dbg messages.

No functional changes.

Signed-off-by: Chenguang Feng <fengchenguang@kylinos.cn>
---
 drivers/media/usb/gspca/finepix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/gspca/finepix.c b/drivers/media/usb/gspca/finepix.c
index 282698e2aa8b..470c31317ed3 100644
--- a/drivers/media/usb/gspca/finepix.c
+++ b/drivers/media/usb/gspca/finepix.c
@@ -82,7 +82,7 @@ static void dostream(struct work_struct *work)
 	int ret = 0;
 	int len;
 
-	gspca_dbg(gspca_dev, D_STREAM, "dostream started\n");
+	gspca_dbg(gspca_dev, D_STREAM, "%s started\n", __func__);
 
 	/* loop reading a frame */
 again:
@@ -156,7 +156,7 @@ static void dostream(struct work_struct *work)
 	}
 
 out:
-	gspca_dbg(gspca_dev, D_STREAM, "dostream stopped\n");
+	gspca_dbg(gspca_dev, D_STREAM, "%s stopped\n", __func__);
 }
 
 /* this function is called at probe time */
-- 
2.25.1

