Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EC4360EE9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359599; cv=none; b=on+Ef4ZIW/Hgg/GLblYRFWKjXRR95Je6+IFQrCTlHF3JEdu5zcQRra8Xh8BlRbKoQHV/AwBTyUUBsoXWNt724ZEksC5HNoT0acC+vo32K7313eH9MwVDY/Rl4dJ2jwlEtrODE8AoabA+8VNLL8pgDV6H8BpPNkj9EkWaAAyAs2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359599; c=relaxed/simple;
	bh=TlZ1dDAZp3G0xEz2phJAKCAitPv2w7xkzVzVylQ1NEc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JSv/ulUrmHH+Og952Lxgtsm0OVleZNM3LRRVfqilReIS6lOyga77aI6M2cdqfmDVZu3tSoWuknsKIIX3FCCfMY/z333L9gJp5LTsRtEurKXld3fH/xSizSiASUSFv1bzQWs28szupLK24Qd7TIg8FCJIe/8CXtzHhK+k6cUt2RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 33f6ea20a6db11f19a56ed5b684f684d-20260902
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_UNTRUSTED, SRC_UNTRUSTED, IP_UNFAMILIAR, SRC_UNFAMILIAR
	DN_TRUSTED, SRC_TRUSTED, SA_TRUSTED, SA_EXISTED, SN_TRUSTED
	SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD
	CIE_GOOD_SPF, CIE_UNKNOWN, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU
	AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:ca505616-d3c9-4786-86f7-e0b21795fe5d,IP:20,
	URL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:45
X-CID-INFO: VERSION:1.3.19,REQID:ca505616-d3c9-4786-86f7-e0b21795fe5d,IP:20,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:45
X-CID-META: VersionHash:7db8b62,CLOUDID:8f583ca6c1d2d7f08dbacca7cb9b78d8,BulkI
	D:260902223307NS5NBL2S,BulkQuantity:0,SF:10|66|78|102|127|850|865|898,TC:n
	il,Content:0|15|50,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 33f6ea20a6db11f19a56ed5b684f684d-20260902
X-User: yijiangshan@kylinos.cn
Received: from localhost.localdomain [(120.227.38.246)] by mailgw.kylinos.cn
	(envelope-from <yijiangshan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 310101398; Wed, 02 Sep 2026 22:33:02 +0800
From: Jiangshan Yi <yijiangshan@kylinos.cn>
To: lpieralisi@kernel.org,
	maz@kernel.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	13667453960@163.com,
	Jiangshan Yi <yijiangshan@kylinos.cn>
Subject: [PATCH] irqchip/gic-v5: Install root IRQ handler last in gicv5_init_common()
Date: Wed,  2 Sep 2026 22:32:55 +0800
Message-Id: <20260902143255.182786-1-yijiangshan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

set_handle_irq() is irreversible: once installed, handle_arch_irq
points at gicv5_handle_irq, which dereferences the PPI/SPI/LPI
irqdomains.  If gicv5_irs_enable() fails afterwards, the error path
calls gicv5_free_domains() while handle_arch_irq still references
those domains.

Move set_handle_irq() after gicv5_irs_enable() so the handler is
only installed once all fallible steps have succeeded.  Drop the
no-op set_handle_irq(NULL) in the error path, which never worked
because set_handle_irq() returns -EBUSY once a handler is set.

Fixes: 183750b276c2 ("irqchip/gic-v5: Fix gicv5_init_common() error paths")
Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
---
 drivers/irqchip/irq-gic-v5.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index ac2d423b1723..37184942dc11 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -1166,21 +1166,19 @@ static int __init gicv5_init_common(struct fwnode_handle *parent_domain)
 	if (ret)
 		goto out_int;
 
-	ret = set_handle_irq(gicv5_handle_irq);
+	ret = gicv5_irs_enable();
 	if (ret)
 		goto out_int;
 
-	ret = gicv5_irs_enable();
+	ret = set_handle_irq(gicv5_handle_irq);
 	if (ret)
-		goto out_handle;
+		goto out_int;
 
 	gicv5_smp_init();
 
 	gicv5_irs_its_probe();
 	return 0;
 
-out_handle:
-	set_handle_irq(NULL);
 out_int:
 	gicv5_cpu_disable_interrupts();
 	gicv5_free_domains();
-- 
2.25.1

