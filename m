Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94922414408;
	Thu, 24 Sep 2026 06:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.68.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790231002; cv=none; b=pIAWuLq21RQXXbyiq6+xYcYMgS+rpgWafOCV2cNC/DJYP9sAfZ/MSWYyIgCFhDgiL80dZ5FR7PeVRUVUMSxJjQ6Y9Bs/YEzuUmNrliuLF/pBjj6zJdIfaedshC8k4t1FMWSDk6NT5BiTaG3jo+zt5iIjMgSc6m1mk/apmQKcbyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790231002; c=relaxed/simple;
	bh=6GBlanERVLIJM9BsO08gyrthTJ1VsmMHL3tWKofFR5g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jW+veCKcLSQuLdpXDLb/U15ZHFjOhkK3cxroWQi5zyXSjMpd5hOD6FVZvqY2mKSYGnaHq6pnQP/fzaXtUrww0Ru0v+o5hP8sII74FlCLOBo21ItROX7TxZsf/x63T2WUkHo5wmRjZ4xrsJdxmMN39JWGJp9JHxXbU6ThWTLIXzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=NUb8tY1j; arc=none smtp.client-ip=44.246.68.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="NUb8tY1j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790231001; x=1821767001;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vsTz5PCaQL5vfDJVm7aRxZ+wwym//s+fYilKj90Bl0A=;
  b=NUb8tY1jjCmUY6l7RRCJZU8X9PIl75uodhA1wkuSOBzex2Ir1fAZbbmY
   JS8eqKB+r2UgQgSK/kuUkEDMr4GDwWDVYAvuk4y9te0rSkk+qJJMcxuee
   xgInugC+5QvNupoHTEIArrbRCMRzylQCO7Xbwx9s839GJskPLQ8pQysBI
   Wm50MJt/uIqsCII2aAt18dKNanz/Y/hEWzPYfMsPp1NpRu+42ZTFQ46tk
   hsk3+IkD1yo3MSECkX1IJGnC9/YLLtWZBdEsf7dOZTPCe+fEzv6+Ts6Kx
   3i4wBW8xiryqz8ZKDraZvnp2c0yjUNS1l5glQ3lvwXM8GfrPDeOCuNqGN
   A==;
X-CSE-ConnectionGUID: ipNPjCfSRwWnMEErxcszmw==
X-CSE-MsgGUID: ZEELeq37SWCJ8lXuf1wQWQ==
X-IronPort-AV: E=Sophos;i="6.27,120,1787011200"; 
   d="scan'208";a="29420513"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 06:23:19 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:4714]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.45.34:2525] with esmtp (Farcaster)
 id 3828038e-b35c-4b61-865f-3f44f483573b; Thu, 24 Sep 2026 06:23:18 +0000 (UTC)
X-Farcaster-Flow-ID: 3828038e-b35c-4b61-865f-3f44f483573b
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Thu, 24 Sep 2026 06:23:18 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Thu, 24 Sep 2026
 06:23:16 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 1/6] irqchip/al-fic: use full node name and raise init log level
Date: Thu, 24 Sep 2026 06:23:06 +0000
Message-ID: <20260924062311.37308-2-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924062311.37308-1-farbere@amazon.com>
References: <20260924062311.37308-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D040UWB002.ant.amazon.com (10.13.138.89) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Use node->full_name instead of node->name in the driver's log messages
so that they identify the specific FIC instance, e.g.:

  interrupt-controller@fd803000 initialized successfully in Legacy mode (parent-irq=3)

Raise the successful-initialization message from pr_debug to pr_info, as
this single boot-time printout is useful when dynamic debug is not
enabled at this stage of boot. While here, fix a small typo in the
al_fic_wire_init() comment.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 drivers/irqchip/irq-al-fic.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index d10ac9b63c99..efa7f2b62d00 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -180,7 +180,7 @@ static int al_fic_register(struct device_node *node,
  * @name: name of the fic
  * @parent_irq: interrupt of parent
  *
- * This API will configure the fic hardware to to work in wire mode.
+ * This API will configure the fic hardware to work in wire mode.
  * In wire mode, fic hardware is generating a wire ("wired") interrupt.
  * Interrupt can be generated based on positive edge or level - configuration is
  * to be determined based on connected hardware to this fic.
@@ -216,8 +216,8 @@ static struct al_fic *al_fic_wire_init(struct device_node *node,
 		goto err_free;
 	}
 
-	pr_debug("%s initialized successfully in Legacy mode (parent-irq=%u)\n",
-		 fic->name, parent_irq);
+	pr_info("%s initialized successfully in Legacy mode (parent-irq=%u)\n",
+		fic->name, parent_irq);
 
 	return fic;
 
@@ -236,30 +236,30 @@ static int __init al_fic_init_dt(struct device_node *node,
 
 	if (!parent) {
 		pr_err("%s: unsupported - device require a parent\n",
-		       node->name);
+		       node->full_name);
 		return -EINVAL;
 	}
 
 	base = of_iomap(node, 0);
 	if (!base) {
-		pr_err("%s: fail to map memory\n", node->name);
+		pr_err("%s: fail to map memory\n", node->full_name);
 		return -ENOMEM;
 	}
 
 	parent_irq = irq_of_parse_and_map(node, 0);
 	if (!parent_irq) {
-		pr_err("%s: fail to map irq\n", node->name);
+		pr_err("%s: fail to map irq\n", node->full_name);
 		ret = -EINVAL;
 		goto err_unmap;
 	}
 
 	fic = al_fic_wire_init(node,
 			       base,
-			       node->name,
+			       node->full_name,
 			       parent_irq);
 	if (IS_ERR(fic)) {
 		pr_err("%s: fail to initialize irqchip (%lu)\n",
-		       node->name,
+		       node->full_name,
 		       PTR_ERR(fic));
 		ret = PTR_ERR(fic);
 		goto err_irq_dispose;
-- 
2.47.3

