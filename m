Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794795843;
	b=3jjCQlDOt84Mu3tQ2vcYRtqCZCZn2bddm4IDvUbbyJ9ddRjasg0A1tNZuxW+LwY0Ytk6
	 WdLBR3ax1LMSauWP1hWFMtN3c3gfc+CX0tvxec1yPKu5s0zbl/wBJYPlkTQhB3rLsFzSf
	 0xLSQrSdp+apeHCpWJElGICdVd+cRG16FWJdsf5alY/153MkZv8/H5MK0VXm6zWFcw0AU
	 U9xUZiQNkVvpgCfCojyWwPJ/gfVoe++jxauP/dEPGhmA9kZi+QKbwerHeyXjuf5g2NbBz
	 yu3tT0pVrfA/ofxKTccXcffaGdrV9mUByK677jCY3NHRWAd27rO2O+r8cqbXRjpPajg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794795843;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=ZkR5ltf4EA92amxJ4UvX2REcvWhX9X9ctWCrFGNdh74=;
	b=Nl/8YqbFmX+mzZkx2Ue40tG03sszMG8LkOdH+rUHhFIfQZrYLagDtFnJZ6pHZGgeGY5I
	 HqRzSbfFC7zi4CKFIN+EGpr8hzhiOx4zIp2jjETfWTiK9Hy/wYTm6HPGuJR12mkIM5WRz
	 qFR/eCgahpftsvBKYhrYGLtimkAKoViv8ojQeFuVYCN/b0aBAFGmV6pvrRYcxeW+26j/n
	 DHaVkDRUhI298xBqkKMm51YhC10Tmy/SRGajESZEgZPFU5mvof6G0DJfS6RbVKOyyj5Vf
	 SlUA4Pu1R8pan1sv52MZr2PL8qFvaYc8auN8JYxsUUFREtRnMt1dIN82DfwEbILyN4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=CnY6IYo7;
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDC4606A321
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEDC4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=CnY6IYo7
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ZkR5ltf4EA92amxJ4UvX2REcvWhX9X9ctWCrFGNdh74=;
	b=CnY6IYo7feReTTm3+150hWXDoFEnHqfHvrhP1qU6jOyVsi+mbRRzj2amG0eC6UnTb4JzGp9MK
	IyOo47sQC2NwPNhDf/JWRpT7a1ZlS8XuR6nOTVzwfU5XZ1pTm6cHW3CBFSXLk7JorWaiPpgt9vf
	oehjQFag6QAGyYe2bmN8i90=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jSWr82GMSzLlYQ;
	Mon, 16 Nov 2026 10:23:36 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 743AE4048B;
	Mon, 16 Nov 2026 10:23:54 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 10:23:53 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <maz@kernel.org>, <tglx@kernel.org>, <radu@rendec.net>,
	<jason@lakedaemon.net>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] irqchip/gic-v3-its: Size the collection table for all possible CPUs
Date: Mon, 16 Nov 2026 10:23:30 +0800
Message-ID: <20261116022330.273840-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)

The ITS collection table is sized from the hardware default described by
GITS_BASER: a single ITS page holding entry-size objects.  With the usual
16-byte collection entry and a 4K ITS page that is 256 collections.

its_cpu_init_collections() installs one collection per CPU using MAPC with
the CPU number as the collection ID, so on a system with more than 256
possible CPUs the MAPC commands for the remaining CPUs fail with
E_ITS_MAPC_COLLECTION_OOR (0x010903) and their redistributors end up
without a valid collection.  LPIs targeted at those CPUs, which is where
managed MSI/MSI-X affinity places a large part of the device interrupts,
are then dropped by the hardware: the DMA completes but the completion
interrupt never arrives, so drivers fall back to polling and time out.

On a 384-CPU HiSilicon HIP12 system running v7.4-rc2 every ITS reported

  ITS@0x488000000: allocated 256 Interrupt Collections (flat, esz 16, psz 4K, shr 1)

and all four NVMe controllers logged repeated

  nvme nvme0: I/O tag 256 (1100) QID 182 timeout, completion polled

while the hinic driver failed to probe with -EIO.  With the table sized
for num_possible_cpus() it holds 512 entries and both symptoms are gone.

Handle GITS_BASER_TYPE_COLLECTION in its_alloc_tables() the same way as
the device and VCPU tables, requesting order_base_2(num_possible_cpus())
IDs.

Fixes: 1ac19ca6bf97 ("irqchip: GICv3: ITS: tables allocators")
Cc: stable@vger.kernel.org
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index c952c069f937..319b6edefd37 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -2716,6 +2716,21 @@ static int its_alloc_tables(struct its_node *its)
 			indirect = its_parse_indirect_baser(its, baser, &order,
 							    ITS_MAX_VPEID_BITS);
 			break;
+
+		case GITS_BASER_TYPE_COLLECTION:
+			/*
+			 * Size the collection table for every possible CPU.
+			 * One collection per CPU is installed via MAPC with
+			 * col_id == cpu, so a table sized only for the
+			 * hardware default page (e.g. 256 entries with
+			 * esz 16 / psz 4K) is too small on systems with more
+			 * CPUs than that: MAPC for the remaining CPUs fails
+			 * with E_ITS_MAPC_COLLECTION_OOR and LPIs targeted at
+			 * those CPUs are never delivered.
+			 */
+			indirect = its_parse_indirect_baser(its, baser, &order,
+							    order_base_2(num_possible_cpus()));
+			break;
 		}
 
 		err = its_setup_baser(its, baser, cache, shr, order, indirect);
-- 
2.34.1

