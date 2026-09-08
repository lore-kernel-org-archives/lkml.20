Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB3B3769EA;
	Tue,  8 Sep 2026 06:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788847425; cv=none; b=S+toyYKcA8IvJeNlqoLWjME6+bAVWnpy9mXGLCflaYfRSSq3TuS9/S8v/1oZZAZQDH8FVUmTdqnq9RgaqSzFdsDeYko9pvB0AQOQQivBMOVNYHsHczDGvPBIGsLV5g7prDrRpzL5BoDattpPZqL60LLYS09bechtPkvc2ItlNfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788847425; c=relaxed/simple;
	bh=pAnemLBfOGyA8zn0kwdrz6hT46wy+5pJg6Z4NcTsCl8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iGo6SOpyfmpaabZ9hMNd7H7bfymlsbpivEtJyX4t+dCKdIQ3I8zp5+CZ3FvphbRDamnIzb/GjCz7UaYf2gIANs07rIGgVxvCqeUjOgS3xdSknKEtJcBGprQ/9FVxx7lHbtDDY/pwEsf5tsZYIad1tJCCUwGbGqQFJjrI9dxU80k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 078c1a68ab4b11f19a56ed5b684f684d-20260908
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:c258c444-b87b-44ab-8e2a-f15c3bec0735,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:e605581771a18821707bcc8ecc1f6b05,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|136|850|865|898,TC:nil,Content:0|15|50|9
	9,EDM:5|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 078c1a68ab4b11f19a56ed5b684f684d-20260908
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1423981881; Tue, 08 Sep 2026 14:03:36 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Xin Ji <xji@analogixsemi.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: typec: anx7411 - stop the IRQ before destroying the workqueue
Date: Tue,  8 Sep 2026 14:03:33 +0800
Message-Id: <20260908060333.4097219-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260903082254.1540271-1-gonglinkai@kylinos.cn>
References: <20260903082254.1540271-1-gonglinkai@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IRQ is devm-managed, so it can still queue plat->work while
remove() is tearing the queue down. Disable it first.

Fixes: fe6d8a9c8e64 ("usb: typec: anx7411: Add Analogix PD ANX7411 support")
Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
---
v2:
- keep the minimal remove() race fix; drop the workqueue later if wanted

 drivers/usb/typec/anx7411.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
index 41df115912b9..c3d36da692e4 100644
--- a/drivers/usb/typec/anx7411.c
+++ b/drivers/usb/typec/anx7411.c
@@ -1566,8 +1566,11 @@ static void anx7411_i2c_remove(struct i2c_client *client)
 	anx7411_partner_unregister_altmode(plat);
 	anx7411_unregister_partner(plat);
 
-	if (plat->workqueue)
+	if (plat->workqueue) {
+		disable_irq(plat->intp_irq);
+		cancel_work_sync(&plat->work);
 		destroy_workqueue(plat->workqueue);
+	}
 
 	i2c_unregister_device(plat->spi_client);
 
-- 
2.25.1
