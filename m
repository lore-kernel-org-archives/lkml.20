Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA313E49C0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 02:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788748861; cv=none; b=tsbfzfvVMEf/cNR5H4CGJlbt0wqR7iblqOOWP8SIUqy+adnlCujiL/EMx4SWNh181CiIY9Uyrvd9Q0N8BaWL6YgcjIXXQK898gvst6C3PT8CjSnXmvB4e54qOxbLt+sQw9T5ilvNM4uPoEmCgO4qwY5ks/G7WZKVmXqvwwNG2+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788748861; c=relaxed/simple;
	bh=+Mb1O26rBbSqz5Oa4kr8XWRn4WHk7eEvSCts6JtaOyQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BSygjPOMfKXic81y2j/14CRRyQjKSn29hfp+GyVrPQ+YX/Ni6VBOCAAuJy/5HzWMnKT26MqG9M0QbZEk4yZyBS9ci6IEPzoTG0MHS0NwOsterGwRSfFD/rSZ/lIPzBVK4OUU7cpC3WzpoJE6+uMQ4oYCKZFq+7Tu89RH9MQOSfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8ac0e2ceaa6511f19a56ed5b684f684d-20260907
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:1900a1f1-dc7f-49e0-bc04-b3dab80855c7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:905e73429250bfe6c59d302a82bc3125,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50|99,ED
	M:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8ac0e2ceaa6511f19a56ed5b684f684d-20260907
X-User: fuqingshuang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <fuqingshuang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 867524744; Mon, 07 Sep 2026 10:40:52 +0800
From: Qingshuang Fu <fuqingshuang@kylinos.cn>
To: Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>
Subject: [PATCH v3 3/3] soc/fsl/qe: qe_ports_ic: Drop redundant IRQ_DOMAIN_FLAG_DESTROY_GC
Date: Mon,  7 Sep 2026 10:40:46 +0800
Message-Id: <20260907024046.28845-4-fuqingshuang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260907024046.28845-1-fuqingshuang@kylinos.cn>
References: <20260907024046.28845-1-fuqingshuang@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that __irq_domain_instantiate() automatically sets
IRQ_DOMAIN_FLAG_DESTROY_GC when dgc_info is provided, the explicit
flag in the irq_domain_info is redundant.  Remove it.

Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
---
 drivers/soc/fsl/qe/qe_ports_ic.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
index 7375f92f528b..fb3b92039547 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -140,7 +140,6 @@ static int qepic_probe(struct platform_device *pdev)
 	};
 	struct irq_domain_info d_info = {
 		.fwnode = of_fwnode_handle(pdev->dev.of_node),
-		.domain_flags = IRQ_DOMAIN_FLAG_DESTROY_GC,
 		.size = 32,
 		.hwirq_max = 32,
 		.ops = &irq_generic_chip_ops,
-- 
2.25.1

