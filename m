Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794918689;
	b=rLObBxSUrx9VQdSrzaaDLnPGrhnyH397WYsuXu8SCi4wJyz5f2o/NpQB4OT58faWD00F
	 4ZRRUhp9WBeFhwlTZQVK8qkcQflQ67JE8Q+lco8ZcHnK9nWI6bF1d9sunJYFXi+5vxYJu
	 zsIRLUHTWmZcg9PXfuiPGIXZQuBng7iNe87sxTobeZso0t56hxs1pg103BRR6yjQJb/cH
	 LbknUxVpuk6lIRfNh32WjckdWC5SPfxucECcOwEci65d1wqz1Uwv4F9WEJw7JVHqRWWTE
	 cKeMn+kg8kNPEmELMFTW0CODeAhH4dfIBmyUr0hUxYAl/zMCH4cN4bShCGXiH4R1OgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918689;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=2YE/RceU1BDrUGj03KVYMBZ/+cla8lPDeG78rZvZ+NI=;
	b=EkCKTlhDsCjWEP11TfoK4kwq6hi8MKqcXMss1S1TWV2tzkHjlfc6dVS2XXsaR4VBzzjR
	 y9fW76OdJMrn9iSnJQH91zc9VlQgaPt/K/iX68ZuU3+T8ZfCc/Ryywzx/ngZ3S14qPseO
	 oJYIHJ2h65mQKWdNl17MtdyhslI6CP20O3Cc8p3BqlD6Z5fODoLERF6bUQF6OWt6lmkr9
	 HWeLlXNhfstnaVwf2IVZk2M2MjtnyuuQrBZqqEUMyGyK5AWoSdtKNyTxeZ53vBLuJ6Ga1
	 fIdVjJfEalaIqgiTCwS+O6Vgq0WmMK3DszLsWpJHtcO+rgXVJ9PnSUc7ErwSXlYw+pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=6OI71rL0;
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802F1606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 802F1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=6OI71rL0
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2YE/RceU1BDrUGj03KVYMBZ/+cla8lPDeG78rZvZ+NI=;
	b=6OI71rL0RN45D+2CBfhLv98JGQUKCc2nx0isLeQRxf8r6ERJPK+ReoiY+L05GjMXiuloDCk8r
	ea+ImJUJDiRuvvdQKO1ukQWNPFOShOGOdRnPQ1xlSOTdyUkDS/TtYYFusHwWf2pGqYA81+sFbZx
	kt70sEGchJoGC8EoaCPVq3U=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jTPGk56JZzRhXK;
	Tue, 17 Nov 2026 20:31:10 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id BD320203AB;
	Tue, 17 Nov 2026 20:31:24 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 20:31:24 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <maz@kernel.org>, <tglx@kernel.org>, <radu@rendec.net>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2] irqchip/gic-v3-its: Size the collection table for all possible CPUs
Date: Tue, 17 Nov 2026 20:31:16 +0800
Message-ID: <20261117123116.591621-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
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
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)

The collection table is currently sized at a single ITS page size,
and the driver's allocation policy is to allocate a single collection
per CPU. On systems with more CPUs that the ITS can fit in a single
page, no LPI can be routed to the CPUs that don't have an allocated
collection, and the system grinds to a halt.

Change the allocation policy to allow two-level tables, similarly to
the other tables.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v1 -> v2:
- Cleanup the similar calls of its_parse_indirect_baser() (Marc).
- Simplfy the commit message (Marc).
- Drop fix tag and comment (Marc).
- Give nr_ids a default for unrecognised BASER types.
---
 drivers/irqchip/irq-gic-v3-its.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index c952c069f937..41cd359e52a7 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -2682,7 +2682,7 @@ static int its_alloc_tables(struct its_node *its)
 		u64 val = its_read_baser(its, baser);
 		u64 type = GITS_BASER_TYPE(val);
 		bool indirect = false;
-		u32 order;
+		u32 order, nr_ids;
 
 		if (type == GITS_BASER_TYPE_NONE)
 			continue;
@@ -2696,8 +2696,7 @@ static int its_alloc_tables(struct its_node *its)
 
 		switch (type) {
 		case GITS_BASER_TYPE_DEVICE:
-			indirect = its_parse_indirect_baser(its, baser, &order,
-							    device_ids(its));
+			nr_ids = device_ids(its);
 			break;
 
 		case GITS_BASER_TYPE_VCPU:
@@ -2713,11 +2712,19 @@ static int its_alloc_tables(struct its_node *its)
 				}
 			}
 
-			indirect = its_parse_indirect_baser(its, baser, &order,
-							    ITS_MAX_VPEID_BITS);
+			nr_ids = ITS_MAX_VPEID_BITS;
+			break;
+
+		case GITS_BASER_TYPE_COLLECTION:
+			nr_ids = order_base_2(num_possible_cpus());
+			break;
+
+		default:
+			nr_ids = 0;
 			break;
 		}
 
+		indirect = its_parse_indirect_baser(its, baser, &order, nr_ids);
 		err = its_setup_baser(its, baser, cache, shr, order, indirect);
 		if (err < 0) {
 			its_free_tables(its);
-- 
2.34.1

