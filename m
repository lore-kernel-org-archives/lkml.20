Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348761;
	b=lLL0eJXikQoBZHjNoXic4Yj5dWNUuVVHwZn0r+Mu3pgjOyd/TAZZITXBTS8yKJPMmNfd
	 /eYeQ0fAcCqOaDVgtlRExasYcmDN7kT6auNPSomti/i1hioxvkx6Gu6bdmkR/qEtKPGhY
	 oHZU8PuILLtmwR8M3CzgPlmyuTWHLvhx2sT7QrMfu3WBj7fUDcuhUaZIStJ5lXrLEzM8X
	 2CJ1ep+YH3jlvYp36gCY9uYL0hpLArP8B7WLAv/dS9zqqOoqIUhZ0WrqKuTl8g5hmU65t
	 BFB9WNBApdunGW+gx1wcYp48N4zRSDvqfqZOLtjv98Ra7S9+kztfgkMLqP1viIzXgFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348761;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=gE0ScmYrFjCj2XqU/NIHxN+a7VmHwGx/vJD1+r3XhrQ=;
	b=ucypHmqA9H7nTeZcnssJ7zGu+RUG4IF4XG05D3Lum4T14qJgrnu/rGB+7d7JCer1E11s
	 NTti6UGRssm6kQTampM2mo4TkATNcOO6+AEBotaQKW2+vbfhK1tsbCU9i9Du7kglOfAWB
	 CBS+zgYa9J5cWaV0dsU2+6nCD6s2d55ciEHG5994r4UAob+x4Ujg3q0wpV1qmU/b7wbzr
	 t7nxOH0cudQbR/9gdBJGzxSizZUABsIQyeyFdcel78VPUStfIl4Oz/rRw4jY/2C2dvR0U
	 BtLrMF1f3P0VFWjwxG/Mkk7ITpLxkGvABi5N/TnTcqc9qHmMpqXgb7MsCdW4s6XeBPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b="I/rotX00";
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE35606A333;
	Fri, 30 Oct 2026 08:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CE35606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=I/rotX00
X-UUID: 85f05568d43b11f18dc8c9802ae25ab1-20261030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gE0ScmYrFjCj2XqU/NIHxN+a7VmHwGx/vJD1+r3XhrQ=;
	b=I/rotX00GWSuUiJXTi+V0A/nAzeVoW2vVMEWP2rtmHuHM4ki0LtMEfgqCF7FKSzLn973n9gFPKZ7zq/+Yh9drc8enuxpaCwj8qZs4R5/NhLh416pTUSt2cUkrMisoDHyTJDihmnvLd19dyrZvVLzpcsHdXsUBmljP5gXisZa65Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:ddef2bd6-ca91-40d7-bdc3-df112c748416,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:48805093-992d-41bc-b618-62c5d111cc67,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 85f05568d43b11f18dc8c9802ae25ab1-20261030
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 571707546; Fri, 30 Oct 2026 16:25:54 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 30 Oct 2026 16:25:52 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 30 Oct 2026 16:25:52 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mika Westerberg <westeri@kernel.org>
CC: Andreas Noever <andreas.noever@gmail.com>, Yehezkel Bernat
	<YehezkelShB@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>
Subject: [PATCH 2/4] thunderbolt: add support optional dedicated wakeup irq
Date: Fri, 30 Oct 2026 16:25:37 +0800
Message-ID: <20261030082539.1208733-3-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
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
X-MTK: N

There is a dedicated wakeup irq on nvidia n1/n2 SoCs.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/thunderbolt/plat.c  | 16 ++++++++++++++++
 include/linux/thunderbolt.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/thunderbolt/plat.c b/drivers/thunderbolt/plat.c
index 85a00cd391d4..8d83b484d942 100644
--- a/drivers/thunderbolt/plat.c
+++ b/drivers/thunderbolt/plat.c
@@ -11,6 +11,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/slab.h>
 
 #include "nhi.h"
@@ -46,6 +47,15 @@ static int nhi_plat_init_irq(struct tb_nhi *nhi)
 	if (ret)
 		return dev_err_probe(nhi->dev, ret, "request irq failed\n");
 
+	if (nhi->wake_irq) {
+		ret = dev_pm_set_dedicated_wake_irq(nhi->dev, nhi->wake_irq);
+		if (ret) {
+			dev_err_probe(nhi->dev, ret, "set wake irq %d failed\n", nhi->wake_irq);
+			return ret;
+		}
+		dev_info(nhi->dev, "wake irq %d\n", nhi->wake_irq);
+	}
+
 	return 0;
 }
 
@@ -53,6 +63,7 @@ static void nhi_plat_exit(struct tb_nhi *nhi)
 {
 	devm_free_irq(nhi->dev, nhi->irq, nhi);
 	flush_work(&nhi->interrupt_work);
+	dev_pm_clear_wake_irq(nhi->dev);
 
 	pm_runtime_put_noidle(nhi->dev);
 	pm_runtime_disable(nhi->dev);
@@ -85,6 +96,11 @@ static int nhi_plat_probe(struct platform_device *pdev)
 	if (nhi->irq < 0)
 		return dev_err_probe(dev, nhi->irq, "get irq failed\n");
 
+	/* ignore error */
+	nhi->wake_irq = platform_get_irq_optional(pdev, 1);
+	if (nhi->wake_irq < 0)
+		nhi->wake_irq = 0;
+
 	return nhi_probe(nhi);
 }
 
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 212c8fea6571..06b90d452ee2 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -533,6 +533,7 @@ struct tb_nhi {
 	bool going_away;
 	bool iommu_dma_protection;
 	int irq;
+	int wake_irq;
 	struct work_struct interrupt_work;
 	u32 hop_count;
 	unsigned long quirks;
-- 
2.43.0

