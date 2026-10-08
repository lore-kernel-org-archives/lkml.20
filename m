Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.155.198.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5174E47ACEF;
	Thu,  8 Oct 2026 09:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.155.198.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450072; cv=none; b=igdXglhOQdRomYBu0o9goPsgiXE6wbQoBZ/zMMsBdagugRucxlGVwsP4t1tLceK2zE/sIqnAgVBG2QZ1Adk0r2JbLqMJdLYbpZtVSsQJnDuTokANHtkH1WIhVk2LsPGlThboJytMsBeWUeDtnys9AcwWRGhsE1q+b74Lpe0IagA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450072; c=relaxed/simple;
	bh=GcmQpf/1REpWeQxRqgmj9fd8dYr23hbdcZm0H2AcfXM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z/6VMC9uhNSsm2mHnxQl8mFGCd7722zO2gmX6yj3E4q3W56ciKN0Jp1EdlvvC+rI3OcZY+jeSS6HWx/P7d4C3y9cxEpcuOCB6myTHe6jz4XpHtUEWNdWeCMDqpUC2xuxgFpsDhQLwe1kYdzOEhokx9L7O2EbAIRb1fAEjmrs2Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=sDqBLWQ6; arc=none smtp.client-ip=35.155.198.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="sDqBLWQ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791450071; x=1822986071;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d/Wkuk4bWmsSIGTkbdryY1t5OvCdVG3ce5Kjp3RVnLQ=;
  b=sDqBLWQ6jxWyJUTYyr3fT6AS+pBBb3Yn8GzfVb+tiFjy6PBHPBSUYWck
   6nrNd0bn3DnkU7xWI8g1iY8ryaEpAo1p/k16IujOZ98dubQB3WANZtb0S
   aS6uw5AKjPjxHXs0O7wsRpSfM/emHIjl4fS4OCggEKjbc8tPpFEiKWwqE
   VJ0dEvA5VUfD1sNCD1w+PcWRZuRgM1NtNltExTKdJE2NG6yz1NDtldRG1
   u7iNhTAQFCHaVCWpvrdWkjnSnDaF9Lf/tIW+l/UxZCxBGxKCzz2F59+BF
   ppXcMgo7Zs0mvsL4jsnTnSkLdB1S6Dh36F39ROthmcAF/9A08Kn2kyUO5
   A==;
X-CSE-ConnectionGUID: 8/FgtzAETm20SMi9u4tVEA==
X-CSE-MsgGUID: GRyyrgqrTZuc+nP/66+rDA==
X-IronPort-AV: E=Sophos;i="6.27,146,1787011200"; 
   d="scan'208";a="30623819"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 09:01:08 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:23825]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.45.50:2525] with esmtp (Farcaster)
 id d4b862fe-9e72-4d7a-a621-67d7a0ea47a0; Thu, 8 Oct 2026 09:01:08 +0000 (UTC)
X-Farcaster-Flow-ID: d4b862fe-9e72-4d7a-a621-67d7a0ea47a0
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Thu, 8 Oct 2026 09:01:08 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Thu, 8 Oct 2026
 09:01:06 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v4 2/8] irqchip/al-fic: use %pOF and raise init log level
Date: Thu, 8 Oct 2026 09:00:52 +0000
Message-ID: <20261008090058.38591-3-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261008090058.38591-1-farbere@amazon.com>
References: <20261008090058.38591-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC001.ant.amazon.com (10.13.139.241) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Use %pOF in the driver's log messages, so that both the success and the
error paths identify the specific FIC instance by its full devicetree
path rather than by its bare node name, e.g.:

  /soc/interrupt-controller@fd803000 initialized successfully in Legacy mode (parent-irq=3)

A single controller is described by several FIC nodes that share the same
bare node name (e.g. "interrupt-controller"), so the bare name cannot tell
one instance from another. The full path includes the unit address and
keeps the instances distinguishable.

While converting the parent-missing message, fix a grammar typo in it
("device require a parent" -> "device requires a parent").

Raise the successful-initialization message from pr_debug to pr_info, as
this single boot-time printout is useful when dynamic debug is not enabled
at this stage of boot.

Signed-off-by: Eliav Farber <farbere@amazon.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
---
v4: no change.

v3: no change. Added Reviewed-by: Radu Rendec.

v2: reworded to explain why %pOF matters (several nodes of one controller
    share the same bare node name, so only the full path with the unit
    address distinguishes them). Also switched from full_name string to
    %pOF. No functional change from v1's "use full node name" patch beyond
    the log level and the grammar fix.

 drivers/irqchip/irq-al-fic.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index 35581332b40e..760bd08dcff4 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -216,8 +216,8 @@ static struct al_fic *al_fic_wire_init(struct device_node *node,
 		goto err_free;
 	}
 
-	pr_debug("%s initialized successfully in Legacy mode (parent-irq=%u)\n",
-		 fic->name, parent_irq);
+	pr_info("%pOF initialized successfully in Legacy mode (parent-irq=%u)\n",
+		node, parent_irq);
 
 	return fic;
 
@@ -235,20 +235,19 @@ static int __init al_fic_init_dt(struct device_node *node,
 	struct al_fic *fic;
 
 	if (!parent) {
-		pr_err("%s: unsupported - device require a parent\n",
-		       node->name);
+		pr_err("%pOF: unsupported - device requires a parent\n", node);
 		return -EINVAL;
 	}
 
 	base = of_iomap(node, 0);
 	if (!base) {
-		pr_err("%s: fail to map memory\n", node->name);
+		pr_err("%pOF: fail to map memory\n", node);
 		return -ENOMEM;
 	}
 
 	parent_irq = irq_of_parse_and_map(node, 0);
 	if (!parent_irq) {
-		pr_err("%s: fail to map irq\n", node->name);
+		pr_err("%pOF: fail to map irq\n", node);
 		ret = -EINVAL;
 		goto err_unmap;
 	}
@@ -258,9 +257,8 @@ static int __init al_fic_init_dt(struct device_node *node,
 			       node->name,
 			       parent_irq);
 	if (IS_ERR(fic)) {
-		pr_err("%s: fail to initialize irqchip (%lu)\n",
-		       node->name,
-		       PTR_ERR(fic));
+		pr_err("%pOF: fail to initialize irqchip (%lu)\n",
+		       node, PTR_ERR(fic));
 		ret = PTR_ERR(fic);
 		goto err_irq_dispose;
 	}
-- 
2.47.3

