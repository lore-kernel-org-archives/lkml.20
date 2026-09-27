Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760B33CBE97;
	Sun, 27 Sep 2026 08:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.162.73.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790496411; cv=none; b=uMYiLhheaeHoO+B2trTOZAxEeInqHtwxUsgE/C2o/b/VPhIIsl5l+L43m2X/F4D00dg0TvwyL4jN0EwTcso+jTGFy8HBVIKTxEpTEjmDK41fgG0GjOgCGmxzkPLbrwRjewCuVqQcHeOEpVOgtU/m0PkW96jK6ET4YKD6SWfuBNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790496411; c=relaxed/simple;
	bh=n4Ti3toCK3Mo9csXImSZ9zo9KSxFJ8M6UjeDTJUFXjs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DACzc+28A/TuJ+5AzS43OvwGU477sWmMgbSvMpuFeb2A1l9magO1YvUzwVD71wB9AFv6Xv1fMwzqqzkXv5GwlSOcrJa1w1nhTynMkczhwBZBL5b9wMHnZvRZFlYXG3N89fYt0HHkstGF5OEScq8W79224drAQXG4WZkAQGr9U0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=WdMMAEHI; arc=none smtp.client-ip=35.162.73.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="WdMMAEHI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790496410; x=1822032410;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9/ow9ml5Fm/EgPLDRTdSQt0I3osdRyedjZOA+aj43xg=;
  b=WdMMAEHI5TfZk86gM6FQZlCuAPpw6VIBLHYd/65pc8Z/HIP6nYL/dUsi
   /hgwZuN6gGlp6SA0PV/36CMJyudXraPxKkK5EGQajVB0yy5Zg2vMjtark
   167Ixt2UQ4XycaSLxyjOCROoXKbhVUvJ8KuzvV3li3wzGMkKsCmYBuDhi
   Xd6NWMsim6IfJrk9C78alpLSUReAE9dlQH10sTYtw3CXFgKZ5H65a+7Q3
   hpdzBVBWR8cLW6NbITacaqM0ZdoDqmP5Ng3o150g2bFcMvj+W+ivnkP/o
   edH1Ij1xpBX62DZpMxyYlAEjULAFa0V/t183kTcUES1eLF8+lklugytJ/
   Q==;
X-CSE-ConnectionGUID: XRdkvEV+R8OlevuiXd+Y0w==
X-CSE-MsgGUID: CiPG5G5PSiGGEgYqtDnrfA==
X-IronPort-AV: E=Sophos;i="6.27,126,1787011200"; 
   d="scan'208";a="29551032"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 08:06:47 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:23299]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.53.187:2525] with esmtp (Farcaster)
 id 3b72f75d-38c9-4438-8d51-9a3d17a00744; Sun, 27 Sep 2026 08:06:47 +0000 (UTC)
X-Farcaster-Flow-ID: 3b72f75d-38c9-4438-8d51-9a3d17a00744
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sun, 27 Sep 2026 08:06:46 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Sun, 27 Sep 2026
 08:06:45 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/8] irqchip/al-fic: use %pOF and raise init log level
Date: Sun, 27 Sep 2026 08:06:31 +0000
Message-ID: <20260927080637.27285-3-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927080637.27285-1-farbere@amazon.com>
References: <20260927080637.27285-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D038UWC003.ant.amazon.com (10.13.139.209) To
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
---
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

