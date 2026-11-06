Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793944631;
	b=40CfTcUHPQcmBzeNf9gMqidnddtmZsf9NIWgxWuYQUVMHIByHLnCfs/IL1HYWd+0d0e2
	 T8B1sQa9lmsvApnL9ykJRZGeE/72ym7kBl1AfOAmeTCiCHOOfHXiKzAL4cDde2ZTSNqws
	 11NVzmsIe3hLQkNYt0GX6B3tm3PXqgTvA2mcLdj9ekjhY6nTFw6Sid6WqCjK9UVzvnloJ
	 oY8GhuSQdpBZ5RyB7gjj2k6W+v+qb1tEQLlNjbNtzIi3iv0ox5mg9qxsTzYu9ukBGpElf
	 Ac7FHEaJarylgO1k2/2cLwxnvOTEXU7LgkUloSJxGOOisx/WJojcv1BAjSF9BEnJcDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793944631;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=Tsu+gAVEuAMnH3kYpDNWmVxw4qxUdbX2SZHDcTmg//0=;
	b=OnGUM1G/+6bVtDrDSRk9OPdcWrlIgL5iNhYi4DcLrXL/FdWyn3djxpSGjCQXorGfpuYO
	 cn3Pc1dnh35TurYcfCJxLP6PvaKN7ohJ34L21XUwFQipZFml0qXa2uif6ZnUCHUnOBo/Z
	 Byca138T72LRa5jYzilqBBWeYH8+a3FT+3C/X99gYPfuMlxDjNMhHMnUr1NGb13u5d0DY
	 Gyf3c2OXGfuZteBhWA2Wx6Yb7ozViufyFVOf0HJPs42zMPDAGScf6W4cAumuDtcFdC4/s
	 SAZnfUBvYkRk3cFPU/0mqVA8g4WWPGSVp6a6vACVCzV5aDoQQVf+D8kKOoaZODx4dkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=jmhID6ig;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87816606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87816606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=jmhID6ig
X-UUID: e3acb2dad9a611f1b1788b6acf885367-20261106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Tsu+gAVEuAMnH3kYpDNWmVxw4qxUdbX2SZHDcTmg//0=;
	b=jmhID6ig9at7V3GbNuu2+5kUY2hCvYVnDVr1Yzlnt+Sqehf+1DE8AP/NNSLHMqbgIfx11AUDZXGKFkl4paTTWW8UjoIvuAwoh33qwd5CezR0OMFhBC0miM6OmKKtgZkp/pmmodg9mlRjj23FDWKJrCYUqMi2l3qprbwNqsTlQTo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:7721e0fa-5a63-4599-94cc-5daab96e3ca3,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:1eeea04d-35c8-4347-8495-7f71032f956e,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e3acb2dad9a611f1b1788b6acf885367-20261106
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <defa.li@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 87421592; Fri, 06 Nov 2026 13:57:03 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 6 Nov 2026 13:57:01 +0800
Received: from mbjsdccf07.gcn.mediatek.inc (10.15.20.246) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 6 Nov 2026 13:57:00 +0800
From: Defa Li <defa.li@mediatek.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<wsd_upstream@mediatek.com>, <mingchang.jia@mediatek.com>,
	<yuhan.wei@mediatek.com>, <hao.lin@mediatek.com>, Defa Li
	<defa.li@mediatek.com>
Subject: [PATCH] i3c: master: Set I2C client for dynamically attached devices
Date: Fri, 6 Nov 2026 13:56:10 +0800
Message-ID: <20261106055637.563626-1-defa.li@mediatek.com>
X-Mailer: git-send-email 2.43.0
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
Content-Type: text/plain

The I2C attach callback allocates a descriptor for clients added after
the adapter is registered. Store the client in the descriptor after
attaching it, matching the setup used for board-info devices.

Signed-off-by: Defa Li <defa.li@mediatek.com>
---
 drivers/i3c/master.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 01e05bad8661..690a045bffa0 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -3467,6 +3467,8 @@ static int i3c_master_i2c_attach(struct i2c_adapter *adap, struct i2c_client *cl
 	if (ret)
 		goto out_free_dev;
 
+	i2cdev->dev = client;
+
 	return 0;
 
 out_free_dev:
-- 
2.43.0

