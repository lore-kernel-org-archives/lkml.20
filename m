Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D0F3B42F8;
	Sun, 11 Oct 2026 05:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.1.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791695104; cv=none; b=nprWVqMZffOWU2aEaTGG8T6q00glYfd+l6Z71TXNYIICOlhCG9LOaYMzGtTfLLzsECcXPWR8fklO3Oq+Rf8GSt0qcdfsg1tbyCyooG4HnaclagF1+zLAqlQwgPC83Rr2T+VJW2zqxAGacvLh4nDnpK2Qw+rrC0L1vd1wvPyMpdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791695104; c=relaxed/simple;
	bh=N7fAQJRKI3SXTHEC+hYZXT1iUtOYctYf8a9+hCVbLeo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O1by1wt/R6cynsKXeuv6ukyFlUsKYiuD979uf6YE3cI9UL6qGw0yZBNr9a5qvdMy7XrSDgbI+R2FSbxn7BKnbUFdeOtiVbOkoC2AV+fv4qgZOYExt0ni0Sf8Pc00VLLeY3c4F4A2UzOP5DUScyLC6tm1/ILMgNdzTN3r6KEaXfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=C0+DHInx; arc=none smtp.client-ip=44.246.1.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="C0+DHInx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791695103; x=1823231103;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0pUoHv5LtxBK5bTRvVKaLHWtlej1LOxKWKP3lwg/R2o=;
  b=C0+DHInxa4CGtZwApTi19YvNFf5gYkgbtrdv/mxPR8U6OldgZsl4e8Ie
   5DbS6WYnaPY2aHhIurob38R1FirVDhQaeHLZCtIsTs7nIFBWQ4WiEp8ED
   yPWP1V567Yh1I0OS7WM/OyoLDjExs/o2uyqC1kKKhKJxkPXXSXtX+yyIK
   veorD8bECMYkxTjkSXUOcNGIuGBmHEfjw148kjWjyJWQu41ZbBZEW1f9v
   +tc8fNMOZY2BxkltRKBlxMQKhyewq+7452Km8FDTp97LjaRUy5WGfjGMp
   OJeVHYqRnzRop7LNPf+gsh3qsvCKWjx4jYEpQitMOkR95dUkFBi3p70Qz
   A==;
X-CSE-ConnectionGUID: ugZkIlOkRpiBk1xwENVEgg==
X-CSE-MsgGUID: uhDcth95S5+Gdk/zBLuU5A==
X-IronPort-AV: E=Sophos;i="6.27,151,1787011200"; 
   d="scan'208";a="30950507"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 05:05:00 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:15221]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.74:2525] with esmtp (Farcaster)
 id 79a2ee7e-9fd4-46a3-be85-1448b597aaf4; Sun, 11 Oct 2026 05:05:00 +0000 (UTC)
X-Farcaster-Flow-ID: 79a2ee7e-9fd4-46a3-be85-1448b597aaf4
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sun, 11 Oct 2026 05:04:59 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53; Sun, 11 Oct 2026
 05:04:58 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v5 3/9] irqchip/al-fic: use %pOF and raise init log level
Date: Sun, 11 Oct 2026 05:04:42 +0000
Message-ID: <20261011050449.41903-4-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011050449.41903-1-farbere@amazon.com>
References: <20261011050449.41903-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC002.ant.amazon.com (10.13.139.212) To
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
v5: no functional change. The hunk touching the init-failure message
    now has %pe and fic on both sides, because the new patch 2 ahead of
    this one fixed that argument first. This patch still only converts %s
    and node->name to %pOF and node, as reviewed.

v4: no change.

v3: no change. Added Reviewed-by: Radu Rendec.

v2: reworded to explain why %pOF matters (several nodes of one controller
    share the same bare node name, so only the full path with the unit
    address distinguishes them). Also switched from full_name string to
    %pOF. No functional change from v1's "use full node name" patch beyond
    the log level and the grammar fix.

 drivers/irqchip/irq-al-fic.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index 41f7a8390328..1a7f851731b2 100644
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
@@ -258,8 +257,8 @@ static int __init al_fic_init_dt(struct device_node *node,
 			       node->name,
 			       parent_irq);
 	if (IS_ERR(fic)) {
-		pr_err("%s: fail to initialize irqchip (%pe)\n",
-		       node->name, fic);
+		pr_err("%pOF: fail to initialize irqchip (%pe)\n",
+		       node, fic);
 		ret = PTR_ERR(fic);
 		goto err_irq_dispose;
 	}
-- 
2.47.3

