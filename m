Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946221;
	b=Jl8+dpO5YscyDindEqsBo5MZWazOodyiLxb2fud/imOqiMFUKd/cAyGR31EZbnqL+fZO
	 ODimOOaxmtDWF1fdYuJZgjCGxXm4leEDLyu2nbX8HQ31x8Idbs8VK1Po4Yk2Z32VrL4Up
	 Px84TC2LjpnR4aXGijGw/nd3aqfMIqS7ZsV3kWjwRXl0qR6qnScdagPxFErhLYaGFPz3T
	 k6J7rR9Cu+f4DCw/SyBKW/s7snZbJBrePU7SAis9+UFgqx0w2Ds+eK+u6UqRUScHzi1Vv
	 F6l3ZAkqAVnAeIe9Ribkk5xG4AjFlmX0u10dbytG0k4TMwOzJXWIk9Gi3Qs7MjaNADw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946221;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=4NYaYldbirPssRZVT+OAgxyM3srfPHD9+pwWgKczAn8=;
	b=hwhFQ+/mT6Mvj0JRZWdMIAtjrmb++EXdMagcYccbj9SU3HcqxGVYUNCHzlt1331aDJcT
	 A21j9/E1aO0ZjZrZPMPedSF6tknKBwth2f5ozJK24rwbOpUTOMKTIwEtbL0OfNeo1IOgY
	 EQqNkS7t23xq0r9MJOik7lAu3kNKAvZGTXe8zErsxwS2nkh9r+GP4FrrbpVJGqnQuk+ma
	 v5x4mg5Xfq440jVc7FX51GiS1n12h0CHzjZBGuY0vt+d8tvEd6zIxMr2WndxCg1xRjCcK
	 X40BTL/S3zcjCvgBbvaV/akzOnFDfwZ4n+xMK7RtziUWUc81FGSmHQmoHz6jI+pmphg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=cBjS1ii8;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCC7606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DCC7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=cBjS1ii8
X-UUID: 84236b16d9aa11f1b1788b6acf885367-20261106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=4NYaYldbirPssRZVT+OAgxyM3srfPHD9+pwWgKczAn8=;
	b=cBjS1ii8wHzMfy5vpoRaW2+oYp77iwwOFV2s7TcFjeVZXov8ba1hW2Q5npatIQVcLxOKzqMyAJfT5MUcPwkBdxIdX0PBzPA2Olm+K1U6pB3FpXvhnPaSyTI/70nr+VEcCVEYWZjJARpKjHCTHUvre6/f+kUcE8eA/8EGXZsXxIU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:a9078839-c0fe-40b0-9a3e-180139990c3b,IP:-32
	768,URL:-32768,TC:-32768,Content:-32768,EDM:-32768,RT:-32768,SF:-32768,FIL
	E:-32768,BULK:-32768,RULE:Release_Ham,ACTION:release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:nil,BulkID:nil,BulkQuantity:0,SF:nil,T
	C:nil,Content:nil,EDM:nil,IP:nil,URL:nil,File:nil,RT:nil,Bulk:nil,QS:nil,B
	EC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 84236b16d9aa11f1b1788b6acf885367-20261106
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <defa.li@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 755885021; Fri, 06 Nov 2026 14:23:00 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 6 Nov 2026 14:22:59 +0800
Received: from mbjsdccf07.gcn.mediatek.inc (10.15.20.246) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 6 Nov 2026 14:22:58 +0800
From: Defa Li <defa.li@mediatek.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<wsd_upstream@mediatek.com>, <mingchang.jia@mediatek.com>,
	<yuhan.wei@mediatek.com>, <hao.lin@mediatek.com>, Defa Li
	<defa.li@mediatek.com>
Subject: [PATCH] i3c: master: Disable slave events before RSTDAA
Date: Fri, 6 Nov 2026 14:22:10 +0800
Message-ID: <20261106062236.564607-1-defa.li@mediatek.com>
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

Bus initialization sends RSTDAA before disabling slave events. A hot-join
or other slave event may occur after RSTDAA and interfere with the
following DISEC command or the remaining initialization.

Send broadcast DISEC before RSTDAA to disable SIR, master request, and
hot-join events before resetting dynamic addresses. This prevents slave
events from disrupting bus initialization.

Signed-off-by: Defa Li <defa.li@mediatek.com>
---
 drivers/i3c/master.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 01e05bad8661..4fdc8f721364 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2571,10 +2571,12 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
 	}
 
 	/*
-	 * Reset all dynamic address that may have been assigned before
-	 * (assigned by the bootloader for example).
+	 * Disable all slave events before starting DAA. When no active device
+	 * is on the bus, returns Mx error code M2, this error is ignored.
 	 */
-	ret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
+	ret = i3c_master_enec_disec_locked(master, I3C_BROADCAST_ADDR, false,
+					   I3C_CCC_EVENT_SIR | I3C_CCC_EVENT_MR |
+					   I3C_CCC_EVENT_HJ, true);
 	if (ret)
 		goto err_bus_cleanup;
 
@@ -2585,12 +2587,10 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
 	}
 
 	/*
-	 * Disable all slave events before starting DAA. When no active device
-	 * is on the bus, returns Mx error code M2, this error is ignored.
+	 * Reset all dynamic address that may have been assigned before
+	 * (assigned by the bootloader for example).
 	 */
-	ret = i3c_master_enec_disec_locked(master, I3C_BROADCAST_ADDR, false,
-					   I3C_CCC_EVENT_SIR | I3C_CCC_EVENT_MR |
-					   I3C_CCC_EVENT_HJ, true);
+	ret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
 	if (ret)
 		goto err_bus_cleanup;
 
-- 
2.43.0

